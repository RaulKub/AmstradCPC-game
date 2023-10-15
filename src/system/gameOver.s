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
.include "system/pintarUnidadesDecenas.h.s"
.globl _main

FinJuego: .asciz "Game Over"
PressAnyKeyFin: .asciz "Press Any Key to Play Again"
Score: .asciz "Score: "
centenas: .db #0

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

GameOver::

   ld    d, #1         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #24                  ;; B = y coordinate (24 = 0x18)
   ld    c, #28                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #FinJuego    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm


   ;;///////////////////////////////////////////////Pintar SCORE/////////////////

   ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #10                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Score    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld ix, #wallIPos
   ld a, entity_estado(ix)
   ld b, entity_vy(ix)

   inc b 
   dec b 
   jr nz, sumarAereos
   jr scoreEnA
   sumarAereos:
   inc a
   inc a
   inc a
   inc a
   inc a
   dec b
   jr nz, sumarAereos
   scoreEnA:
   ld d, #0  ;;decenas
   ld c, #0  ;;unidades

   inc a 
   dec a
   jr nz, obtenerUnidades
   call pintarCeroDecenas
   call pintarCeroUnidades
   jp finscore
   obtenerUnidades:
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc d
   ld c, #0
   dec c
   jr obtenerUnidades2

   obtenerUnidades2:
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc c 
   dec a 
   jr z, descuentoFin
   inc d
   ld c, #0
   dec c
   jr obtenerUnidades2



   
   descuentoFin:
   inc d 
   dec d 
   jr z, pintarCeroDecenasBucle
   dec d 
   jr z, pintarUnoDecenasBucle
   dec d 
   jr z, pintarDosDecenasBucle
   dec d 
   jr z, pintarTresDecenasBucle
   dec d 
   jr z, pintarCuatroDecenasBucle
   dec d 
   jr z, pintarCincoDecenasBucle
   dec d 
   jr z, pintarSeisDecenasBucle
   dec d 
   jr z, pintarSieteDecenasBucle
   dec d 
   jr z, pintarOchoDecenasBucle
   dec d
   ;;añadimos centenas
   jr z, pintarNueveDecenasBucle
    ld ix, #centenas 
    inc 0(ix)
    dec d
   jr descuentoFin


   pintarNueveDecenasBucle:
   push bc
   call pintarNueveDecenas
   pop bc
   jr pintarUnidades

   pintarOchoDecenasBucle:
   push bc
   call pintarOchoDecenas
   pop bc
   jr pintarUnidades
   pintarSieteDecenasBucle:
   push bc
   call pintarSieteDecenas
   pop bc
   jr pintarUnidades
   pintarSeisDecenasBucle:
   push bc
   call pintarSeisDecenas
   pop bc
   jr pintarUnidades
   pintarCincoDecenasBucle:
   push bc
   call pintarCincoDecenas
   pop bc
   jr pintarUnidades
   pintarCuatroDecenasBucle:
   push bc
   call pintarCuatroDecenas
   pop bc
   jr pintarUnidades
   pintarTresDecenasBucle:
   push bc
   call pintarTresDecenas
   pop bc
   jr pintarUnidades
   pintarDosDecenasBucle:
   push bc
   call pintarDosDecenas
   pop bc
   jr pintarUnidades
   pintarUnoDecenasBucle:
   push bc
   call pintarUnoDecenas
   pop bc
   jr pintarUnidades
   pintarCeroDecenasBucle:
   push bc
   call pintarCeroDecenas
   pop bc
   jr pintarUnidades


   pintarUnidades:
   inc c 
   dec c 
   jr z, pintarCeroUnidadesBucle
   dec c 
   jr z, pintarUnoUnidadesBucle
   dec c 
   jr z, pintarDosUnidadesBucle
   dec c 
   jr z, pintarTresUnidadesBucle
   dec c 
   jr z, pintarCuatroUnidadesBucle
   dec c 
   jr z, pintarCincoUnidadesBucle
   dec c 
   jr z, pintarSeisUnidadesBucle
   dec c 
   jr z, pintarSieteUnidadesBucle
   dec c 
   jr z, pintarOchoUnidadesBucle
   call pintarNueveUnidades
   jr finscore

   pintarOchoUnidadesBucle:
   call pintarOchoUnidades
   jr finscore
   pintarSieteUnidadesBucle:
   call pintarSieteUnidades
   jr finscore
   pintarSeisUnidadesBucle:
   call pintarSeisUnidades
   jr finscore
   pintarCincoUnidadesBucle:
   call pintarCincoUnidades
   jr finscore
   pintarCuatroUnidadesBucle:
   call pintarCuatroUnidades
   jr finscore
   pintarTresUnidadesBucle:
   call pintarTresUnidades
   jr finscore
   pintarDosUnidadesBucle:
   call pintarDosUnidades
   jr finscore
   pintarUnoUnidadesBucle:
   call pintarUnoUnidades
   jr finscore
   pintarCeroUnidadesBucle:
   call pintarCeroUnidades
   jr finscore


   finscore:
   ld ix, #centenas
   inc 0(ix) 
   dec 0(ix)
   jp z, ceroCentenas
   dec 0(ix)
   jp z, unoCentenas
   dec 0(ix)
   jp z, dosCentenas
   dec 0(ix)
   jp z, tresCentenas
   dec 0(ix)
   jp z, cuatroCentenas
   dec 0(ix)
   jp z, cincoCentenas
   dec 0(ix)
   jp z, seisCentenas
   dec 0(ix)
   jp z, sieteCentenas
   dec 0(ix)
   jp z, ochoCentenas
   jp  nueveCentenas

    ceroCentenas:
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #23                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir0    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros
   unoCentenas:
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #23                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir1    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros

   dosCentenas:
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #23                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir2    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros

   tresCentenas:
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #23                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir3    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros

    cuatroCentenas:
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #23                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir4    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros

   cincoCentenas:
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #23                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir5    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros

    seisCentenas:
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #23                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir6    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros

   sieteCentenas:
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #23                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir7    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros

   ochoCentenas:
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #23                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir8    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros

   nueveCentenas:
    ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #23                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir9    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros








    pintarCeros:

   ;;///Pintar 3 Ceros mas

   ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #29                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir0    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #31                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir0    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
   ld    c, #33                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir0    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm




   ld a, #400
   esperafin:
   halt
   dec a 
   jr nz, esperafin

   ;;//Pintar pulsar any key

   ld    d, #1         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #44                  ;; B = y coordinate (24 = 0x18)
   ld    c, #10                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #PressAnyKeyFin    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   fin:
   call cpct_scanKeyboard_f_asm
   call cpct_isAnyKeyPressed_f_asm
   inc a
   dec a
   jr  z, fin


   borrarFondo:

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0         ;;Coordenada X (tamaño en ancho)
    ld      b,  #0        ;;Coordenada Y (tamaño en alto)
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x00         ;;Color (en la posición de la entidad)
    ld      c,  #0x40          ;;Ancho (en la posición de la entidad)
    ld      b,  #0x100        ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm 

    ld      de, #0xC040        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0         ;;Coordenada X (tamaño en ancho)
    ld      b,  #0        ;;Coordenada Y (tamaño en alto)
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x00         ;;Color (en la posición de la entidad)
    ld      c,  #0x15          ;;Ancho (en la posición de la entidad)
    ld      b,  #0x100        ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm 
   
   ;;;ld hl, #0x4123 ;;Reset X
   ;;;ld a, (hl)
   ;;;;;//Reseteamos Player//
   ;;;ld hl, #0x4126 ;;Reset X
   ;;;ld (hl), #20
   ;;;ld hl, #0x412A ;;Reset estado
   ;;;ld (hl), #0
   ;;;ld hl, #0x412B ;;Reset vy
   ;;;ld (hl), #0
;;;
   ;;;;;//Reseteamos Espada//
   ;;;ld hl, #0x412D ;;Reset X
   ;;;ld (hl), #22
   ;;;ld hl, #0x4132 ;;Reset estado
   ;;;ld (hl), #0
   ;;;ld hl, #0x4133 ;;Reset vy
   ;;;ld (hl), #1

   ;;//Reseteamos wallI//
   ;;;ld hl, #0x4134 ;;Reset X
   ;;;ld (hl), #20
   ;;;ld hl, #0x4139 ;;Reset asesinatos suelo
   ;;;ld (hl), #0
   ;;;ld hl, #0x413A ;;Reset asesinatos aereos
   ;;;ld (hl), #0
;;;
   ;;;;;//Reseteamos wallD//
   ;;;ld hl, #0x413B ;;Reset X
   ;;;ld (hl), #20
   ;;;ld hl, #0x4140 ;;Nivel
   ;;;ld (hl), #1
   ;;;ld hl, #0x4141 ;;Asesinatos necesarios
   ;;;ld (hl), #2
;;;
   ;;;ld hl, #0x413F ;;Reset nivel
   ;;;ld (hl), #1
   ;;;
   ;;;;;//Reseteamos Enemigos//
   ;;;;;Enemigo Derecha 1
   ;;;ld hl, #0x4142
   ;;;ld (hl), #72
   ;;;ld hl, #0x4147
   ;;;ld (hl), #0
   ;;;ld hl, #0x4148
   ;;;ld (hl), #0
;;;
   ;;;;;ld a, #3
   ;;;;;ld hl, #0x4142
   ;;;dec a 
   ;;;dec a 
   ;;;dec a 
   ;;;dec a 
   ;;;dec a 
   ;;;jr nz, borrarEnemigoIzq1
   ;;;jr finReseteo
   ;;;borrarEnemigoIzq1:
   ;;;ld hl, #0x4149
   ;;;ld (hl), #5
   ;;;ld hl, #0x414E
   ;;;ld (hl), #0
   ;;;ld hl, #0x414F
   ;;;ld (hl), #0
;;;
   ;;;dec a 
   ;;;jr nz, borrarEnemigoIzq2
   ;;;jr finReseteo
   ;;;borrarEnemigoIzq2:
   ;;;ld hl, #0x4150
   ;;;ld (hl), #5
   ;;;ld hl, #0x4155
   ;;;ld (hl), #0
   ;;;ld hl, #0x4156
   ;;;ld (hl), #0
   ;;inc l 
   ;;inc l 
   ;;inc l 
   ;;inc l 
   ;;inc l 
   ;;inc l 
   ;;inc l 
   ;;dec a 
   ;;jr nz, borrarEntidades
   finReseteo:
   call reset
   
   call _main