;;This file is part of Kubso.
;;
;;Kubso is free software: you can redistribute it and/or modify
;;it under the terms of the GNU General Public License as published by
;;the Free Software Foundation, either version 3 of the License, or
;;(at your option) any later version.
;;
;;Kubso is distributed in the hope that it will be useful,
;;but WITHOUT ANY WARRANTY; without even the implied warranty of
;;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;GNU General Public License for more details.
;;
;;You should have received a copy of the GNU General Public License
;;along with Kubso.  If not, see <https://www.gnu.org/licenses/>.
.include "cpctelera.h.s"
.include "cpcfunciones.h.s"
.include "mainJuego.h.s"
.include "manager/entity_manager.h.s"
Escribir0: .asciz "0"
Escribir1: .asciz "1"
Escribir2: .asciz "2"
Escribir3: .asciz "3"
Escribir4: .asciz "4"
Escribir5: .asciz "5"
Escribir6: .asciz "6"
Escribir7: .asciz "7"
Escribir8: .asciz "8"
Escribir9: .asciz "9"


   pintarCeroUnidades::
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #27                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir0    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   ret

   pintarUnoUnidades::
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #27                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir1    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   ret

   pintarDosUnidades::
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #27                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir2    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   ret
   pintarTresUnidades::
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #27                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir3    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   ret
   pintarCuatroUnidades::
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #27                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir4    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   ret
   pintarCincoUnidades::
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #27                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir5    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   ret
   pintarSeisUnidades::
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #27                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir6    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   ret
   pintarSieteUnidades::
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #27                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir7    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   ret
   pintarOchoUnidades::
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #27                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir8    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   ret
   pintarNueveUnidades::
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #27                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir9    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   ret