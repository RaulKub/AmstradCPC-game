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
.include "system/pintarUnidadesDecenasReal.h.s"

Score: .asciz "Score: "

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

ScoreReal::
;;    ld    d, #2         ;; D = Background PEN (0)
;;   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
;;
;;   call cpct_setDrawCharM1_asm   ;; Set draw char colours
;;
;;   ;; Calculate a video-memory location for printing a string
;;   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
;;   ld    b, #34                  ;; B = y coordinate (24 = 0x18)
;;   ld    c, #12                 ;; C = x coordinate (16 = 0x10)
;;
;;   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
;;
;;   ;; Print the string in video memory
;;   ;; HL already points to video memory, as it is the return
;;   ;; value from cpct_getScreenPtr_asm
;;   ld   iy, #Score    ;; IY = Pointer to the string 
;;   
;;   call cpct_drawStringM1_asm
;;
centenas: .db #0

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
   call pintarCeroDecenas2
   call pintarCeroUnidades2
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
   call pintarNueveDecenas2
   pop bc
   jr pintarUnidades

   pintarOchoDecenasBucle:
   push bc
   call pintarOchoDecenas2
   pop bc
   jr pintarUnidades
   pintarSieteDecenasBucle:
   push bc
   call pintarSieteDecenas2
   pop bc
   jr pintarUnidades
   pintarSeisDecenasBucle:
   push bc
   call pintarSeisDecenas2
   pop bc
   jr pintarUnidades
   pintarCincoDecenasBucle:
   push bc
   call pintarCincoDecenas2
   pop bc
   jr pintarUnidades
   pintarCuatroDecenasBucle:
   push bc
   call pintarCuatroDecenas2
   pop bc
   jr pintarUnidades
   pintarTresDecenasBucle:
   push bc
   call pintarTresDecenas2
   pop bc
   jr pintarUnidades
   pintarDosDecenasBucle:
   push bc
   call pintarDosDecenas2
   pop bc
   jr pintarUnidades
   pintarUnoDecenasBucle:
   push bc
   call pintarUnoDecenas2
   pop bc
   jr pintarUnidades
   pintarCeroDecenasBucle:
   push bc
   call pintarCeroDecenas2
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
   call pintarNueveUnidades2
   jr finscore

   pintarOchoUnidadesBucle:
   call pintarOchoUnidades2
   jr finscore
   pintarSieteUnidadesBucle:
   call pintarSieteUnidades2
   jr finscore
   pintarSeisUnidadesBucle:
   call pintarSeisUnidades2
   jr finscore
   pintarCincoUnidadesBucle:
   call pintarCincoUnidades2
   jr finscore
   pintarCuatroUnidadesBucle:
   call pintarCuatroUnidades2
   jr finscore
   pintarTresUnidadesBucle:
   call pintarTresUnidades2
   jr finscore
   pintarDosUnidadesBucle:
   call pintarDosUnidades2
   jr finscore
   pintarUnoUnidadesBucle:
   call pintarUnoUnidades2
   jr finscore
   pintarCeroUnidadesBucle:
   call pintarCeroUnidades2
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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #67                 ;; C = x coordinate (16 = 0x10)

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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #67                 ;; C = x coordinate (16 = 0x10)

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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #67                 ;; C = x coordinate (16 = 0x10)

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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #67                 ;; C = x coordinate (16 = 0x10)

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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #67                 ;; C = x coordinate (16 = 0x10)

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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #67                 ;; C = x coordinate (16 = 0x10)

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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #67                 ;; C = x coordinate (16 = 0x10)

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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #67                 ;; C = x coordinate (16 = 0x10)

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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #67                 ;; C = x coordinate (16 = 0x10)

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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #67                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir9    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   jp pintarCeros








    pintarCeros:
   ;;///Pintar 3 Ceros mas al final

   ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #73                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir0    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #2         ;; D = Background PEN (0)
   ld    e, #3        ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours

   ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #75                 ;; C = x coordinate (16 = 0x10)

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
   ld    b, #190                  ;; B = y coordinate (24 = 0x18)
   ld    c, #77                 ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Escribir0    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ret