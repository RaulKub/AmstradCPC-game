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
.include "cpcfunciones.h.s"
.include "manager/entity_manager.h.s"
.include "mainJuego.h.s"
.include "system/render_system.h.s"
.include "system/renderPersonaje.h.s"
.include "system/renderEnemigo5A.h.s"


ataqueAereo::
    ld ix, #playerPos
    ld c, entity_x(ix)
    ld b, entity_y(ix)
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    push bc

    ;;ld      de, #0xC000        
    ;;call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
;;
    ;;ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ;;ld      a,  #0xAF         ;;Color (en la posición de la entidad)
    ;;ld      c,  #1         ;;Ancho (en la posición de la entidad)
    ;;ld      b,  #6        ;;Alto (en la posición de la entidad)
    ;;call cpct_drawSolidBox_asm

    ld ix, #playerPos
    ld a, entity_estado(ix)
    dec a 
    jr z, ataqueAereoIzq
    jr ataqueAereoDer


    ataqueAereoIzq:
    call ataqueAereoIzquierda

    ld a, #10
    bucleizq:
    halt
    dec a
    jr nz, bucleizq

    call ataqueAereoIzquierda2

    ld a, #10
    bucleizq2:
    halt
    dec a
    jr nz, bucleizq2

    ld a, #10
    bucleizq3:
    halt
    dec a
    jr nz, bucleizq3

    call ataqueAereoIzquierda

    ld a, #10
    bucleizq4:
    halt
    dec a
    jr nz, bucleizq4

    call ataqueAereoIzquierda2

    ;;borrar
    pop bc

    ld      de, #0xC000  
    dec b     
    dec b
    dec b 
    call cpct_getScreenPtr_asm 

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x00         ;;Color (en la posición de la entidad)
    ld      c,  #2        ;;Ancho (en la posición de la entidad)
    ld      b,  #8        ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm

    call pintarPersonajePos1

    jr continua

    ataqueAereoDer:
    call ataqueAereoDerecha

    ld a, #10
    bucleder:
    halt
    dec a
    jr nz, bucleder

    call ataqueAereoDerecha2

    ld a, #10
    bucleder2:
    halt
    dec a
    jr nz, bucleder2

    call ataqueAereoDerecha

    ld a, #10
    bucleder3:
    halt
    dec a
    jr nz, bucleder3

    call ataqueAereoDerecha2

    ld a, #10
    bucleder4:
    halt
    dec a
    jr nz, bucleder4

    ;;borrar
    pop bc

    ld      de, #0xC000  
    dec b      
    dec b
    dec b
    call cpct_getScreenPtr_asm 

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x00         ;;Color (en la posición de la entidad)
    ld      c,  #2        ;;Ancho (en la posición de la entidad)
    ld      b,  #8        ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm

    call pintarPersonajePos0



    continua:
    


    deteccionEnemigo:
    ld ix, #playerPos
    ld a, entity_x(ix)
    ld ix, #enemyUp1Pos
    ld b, entity_x(ix)

    compruebaX1:
    dec a
    jr z, playerXCero1
    dec b
    jr z, enemyUp1Cero
    jr compruebaX1
    playerXCero1:
    dec b
    jr z, mismaX1
    dec b
    jr z, mismaX1
    jp deteccionEnemigo2
    enemyUp1Cero:
    dec a
    jr z, mismaX1
    jp deteccionEnemigo2

    mismaX1:
    ld ix, #playerPos
    ld a, entity_y(ix)
    ld ix, #enemyUp1Pos
    ld b, entity_y(ix)

    compruebaY1:
    dec b
    jr z, enemyUp1YCero
    dec a
    jp z, deteccionEnemigo2
    jr compruebaY1
    enemyUp1YCero:
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    dec a
    jr z, mataUp1
    jr deteccionEnemigo2

    mataUp1:
    ld  ix, #enemyUp1Pos
    ld entity_color(ix), #0xF0
    call pintarEnemigo5
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    ld a, #50
    muere1bucle:
    halt
    dec a 
    jr nz, muere1bucle


    ld  ix, #enemyUp1Pos
    ld entity_color(ix), #0x00
    call borrarEnemigo5
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    ld ix, #wallIPos
    ld a, entity_vy(ix)
    inc a 
    ld entity_vy(ix), a

    ld ix, #playerPos
    ld b, entity_x(ix)
    
    ld  ix, #enemyUp1Pos
    ld entity_estado(ix), #0
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    ld entity_x(ix), b
    call pintarEnemigo5
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update


    ;;----------------------------------------------
    deteccionEnemigo2:
    ld ix, #playerPos
    ld a, entity_x(ix)
    ld ix, #enemyUp2Pos
    ld b, entity_x(ix)

    compruebaX2:
    dec a
    jr z, playerXCero2
    dec b
    jr z, enemyUp2Cero
    jr compruebaX2
    playerXCero2:
    dec b
    jr z, mismaX2
    dec b
    jr z, mismaX2
    jp deteccionEnemigo3
    enemyUp2Cero:
    dec a
    jr z, mismaX2
    jp deteccionEnemigo3

    mismaX2:
    ld ix, #playerPos
    ld a, entity_y(ix)
    ld ix, #enemyUp2Pos
    ld b, entity_y(ix)

    compruebaY2:
    dec b
    jr z, enemyUp2YCero
    dec a
    jp z, deteccionEnemigo3
    jr compruebaY2
    enemyUp2YCero:
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    dec a
    jr z, mataUp2
    jr deteccionEnemigo3

    mataUp2:
    ld  ix, #enemyUp2Pos
    ld entity_color(ix), #0xF0
    call pintarEnemigo5
    ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update

    ld a, #50
    muere2bucle:
    halt
    dec a 
    jr nz, muere2bucle


    ld  ix, #enemyUp2Pos
    ld entity_color(ix), #0x00
    call borrarEnemigo5
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    ld ix, #wallIPos
    ld a, entity_vy(ix)
    inc a 
    ld entity_vy(ix), a

    ld ix, #playerPos
    ld b, entity_x(ix)
    
    ld  ix, #enemyUp2Pos
    ld entity_estado(ix), #0
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    inc b 
    inc b 
    inc b
    ld entity_x(ix), b
    call pintarEnemigo5
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    ;;------------------------
    deteccionEnemigo3:
    ld ix, #playerPos
    ld a, entity_x(ix)
    ld ix, #enemyUp3Pos
    ld b, entity_x(ix)

    compruebaX3:
    dec a
    jr z, playerXCero3
    dec b
    jr z, enemyUp3Cero
    jr compruebaX3
    playerXCero3:
    dec b
    jr z, mismaX3
    dec b
    jr z, mismaX3
    jp nomata
    enemyUp3Cero:
    dec a
    jr z, mismaX3
    jp nomata

    mismaX3:
    ld ix, #playerPos
    ld a, entity_y(ix)
    ld ix, #enemyUp3Pos
    ld b, entity_y(ix)

    compruebaY3:
    dec b
    jr z, enemyUp3YCero
    dec a
    jp z, nomata
    jr compruebaY3
    enemyUp3YCero:
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    dec a
    jr z, mataUp3
    jr nomata

    mataUp3:
    ld  ix, #enemyUp3Pos
    ld entity_color(ix), #0xF0
    call pintarEnemigo5
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    ld a, #50
    muere3bucle:
    halt
    dec a 
    jr nz, muere3bucle


    ld  ix, #enemyUp3Pos
    ld entity_color(ix), #0x00
    call borrarEnemigo5
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    ld ix, #wallIPos
    ld a, entity_vy(ix)
    inc a 
    ld entity_vy(ix), a

    ld ix, #playerPos
    ld b, entity_x(ix)
    
    ld  ix, #enemyUp3Pos
    ld entity_estado(ix), #0
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    inc b 
    inc b 
    inc b
    ld entity_x(ix), b
    call pintarEnemigo5
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    nomata:
    ret