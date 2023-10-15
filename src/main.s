;;-----------------------------LICENSE NOTICE------------------------------------
;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
;;
;;  This program is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU Lesser General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.
;;
;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU Lesser General Public License for more details.
;;
;;  You should have received a copy of the GNU Lesser General Public License
;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;-------------------------------------------------------------------------------
max_entities == 16
entity_size == 7
;;
_num_entities::     .db 0
_last_elem_ptr::    .dw _entity_array
_entity_array::
.ds max_entities*entity_size
;; Include all CPCtelera constant definitions, macros and variables
;;.include "manager/entity_manager.s"
.include "manager/entity_manager.h.s"
.include "cpctelera.h.s"
.include "cpcfunciones.h.s"
.include "system/render_system.h.s"
.include "system/mainJuego.h.s"

;;
;; Start of _DATA area 
;;  SDCC requires at least _DATA and _CODE areas to be declared, but you may use
;;  any one of them for any purpose. Usually, compiler puts _DATA area contents
;;  right after _CODE area contents.
;;


.area _DATA


;; Define one Zero-terminated string to be used later on


;;
;; Start of _CODE area
;; 
.area _CODE

;; 
;; Declare all function entry points as global symbols for the compiler.
;; (The linker will know what to do with them)
;; WARNING: Every global symbol declared will be linked, so DO NOT declare 
;; symbols for functions you do not use.
;;


;;
;; MAIN function. This is the entry point of the application.
;;    _main:: global symbol is required for correctly compiling and linking
;;
title: .asciz "Welcome to ARCADE TUBE!!";
flechasabajo: .asciz "\n\n\n";
pulsaparacontinuar: .asciz "Press any key to continue";



;;player:  .db 20, 20, 2, 8, 1, 1, 0xFF
;;enemy:  .db 40, 80, 2, 8, 1, 1, 0xF0

_main::
   ;; Disable firmware to prevent it from interfering with string drawing
   call cpct_disableFirmware_asm

   ;;call entityman_init

   ;;Init systems
   call  rendersys_init
   

   ;;//////////PINTAMOS PRIMERA LINEA DEL TITULO//////////

   ;; Set up draw char colours before calling draw string
   ld    d, #0         ;; D = Background PEN (0)
   ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #24                  ;; B = y coordinate (24 = 0x18)
   ld    c, #18                  ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #title    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ;;////////Esperamos////////
   ld a, #500
   espera:
   halt
   dec a
   jr nz, espera

   ;;//////////PINTAMOS SEGUNDA LINEA DEL TITULO (flechas)//////////
   ld    d, #0 
   ld    e, #1 
   call cpct_setDrawCharM1_asm
   ld   de, #CPCT_VMEM_START_ASM 
   ld    b, #40    
   ld    c, #0x25         
   call cpct_getScreenPtr_asm 
   ld   iy, #flechasabajo 
   call cpct_drawStringM1_asm 


   ;;//////////PINTAMOS TERCERA LINEA DEL TITULO (pulsar tecla)//////////
   teclanopulsada: ;;Bucle para repintar la linea para asi crear parpadeo

   ;;espera mientras detecta la tecla pulsada
   ld a, #100
   esperaVacio:
   push af
   call cpct_scanKeyboard_f_asm
   call cpct_isAnyKeyPressed_f_asm
   inc a
   dec a
   jr nz, detectadateclapulsada
   pop af
   halt
   dec a
   jr nz, esperaVacio

   ;;Se pinta
   ld    d, #2 
   ld    e, #3 
   call cpct_setDrawCharM1_asm 
   ld   de, #CPCT_VMEM_START_ASM 
   ld    b, #56               
   ld    c, #0x10     
   call cpct_getScreenPtr_asm 
   ld   iy, #pulsaparacontinuar 
   call cpct_drawStringM1_asm 

   ;;vuelta a esperar mientras se detecta la tecla pulsada
   ld a, #100
   esperaRelleno:
   push af
   call cpct_scanKeyboard_f_asm
   call cpct_isAnyKeyPressed_f_asm
   inc a
   dec a
   jr nz, detectadateclapulsada
   pop af
   halt
   dec a
   jr nz, esperaRelleno

   ;;Se borra el string pintado (repintando en color fondo) para el efecto de parapadeo
   ld    d, #0  
   ld    e, #0  
   call cpct_setDrawCharM1_asm 
   ld   de, #CPCT_VMEM_START_ASM 
   ld    b, #56         
   ld    c, #0x10     
   call cpct_getScreenPtr_asm
   ld   iy, #pulsaparacontinuar 
   call cpct_drawStringM1_asm

   ;;//////////BUCLE HASTA QUE UNA TECLA SE PULSE//////////
   
   call cpct_scanKeyboard_f_asm
   call cpct_isAnyKeyPressed_f_asm
   inc a
   dec a
   jr z, teclanopulsada


detectadateclapulsada:

   call cpct_waitVSYNC_asm
   halt 
   halt

   ;;Primero borramos las letras del titulo (reescribiendolas con color fondo)
   ;;Primera linea
   ld    d, #0 
   ld    e, #0  
   call cpct_setDrawCharM1_asm 
   ld   de, #CPCT_VMEM_START_ASM 
   ld    b, #24    
   ld    c, #18   
   call cpct_getScreenPtr_asm
   ld   iy, #title 
   call cpct_drawStringM1_asm
   
   ;; Segunda linea
   ld    d, #0 
   ld    e, #0  
   call cpct_setDrawCharM1_asm   
   ld   de, #CPCT_VMEM_START_ASM 
   ld    b, #40          
   ld    c, #0x25     
   call cpct_getScreenPtr_asm    
   ld   iy, #flechasabajo 
   call cpct_drawStringM1_asm  

   ;; Tercera linea
   ld    d, #0    
   ld    e, #0  
   call cpct_setDrawCharM1_asm 
   ld   de, #CPCT_VMEM_START_ASM 
   ld    b, #56   
   ld    c, #0x10  
   call cpct_getScreenPtr_asm  
   ld   iy, #pulsaparacontinuar 
   call cpct_drawStringM1_asm  


   call GameStart

   

   ;; Loop forever
loop:
   jr    loop