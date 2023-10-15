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
.include "system/mainJuego.h.s"

pintarPersonajePos0::

    ld ix, #playerPos    ;;Si estado no es 0, se pinta la pos0 derecha, o si estaba en 0 estado y vy, sino, se pinta pos1 derecha
    ld a, entity_estado(ix)
    ld b, entity_vy(ix)
    inc a
    dec a 
    jr z, estabaCero
    jr pintarDerecha0
    estabaCero:
    dec b 
    jp z, pintarDerecha1
    jr pintarDerecha0


    pintarDerecha0:
        ;;Primero calculamos la dirección de memoria para pintar el objeto


            ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            inc b 
            inc b
            inc b
            inc b 
            inc b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x03
            inc l
        ld (hl), #0x0C


        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            inc b 
            inc b
            inc b 
            inc b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x24
            inc l
        ld (hl), #0x82

        ;;-------------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            inc b 
            inc b
            inc b 
            call cpct_getScreenPtr_asm 
            ld (hl), #0x14
            inc l
        ld (hl), #0x42

        ;;---------------------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            inc b 
            inc b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x47
            inc l
        ld (hl), #0x2E

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            inc b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x77
            inc l
        ld (hl), #0xEE

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x33
            inc l
        ld (hl), #0xCC

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b 
            call cpct_getScreenPtr_asm
            ld (hl), #0x77
            inc l 
        ld (hl), #0x8E

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            call cpct_getScreenPtr_asm 
            ld (hl), #0x77
            inc l
        ld (hl), #0xEE

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b
            call cpct_getScreenPtr_asm
            ld (hl), #0x33
            inc l 
        ld (hl), #0xCC

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            call cpct_getScreenPtr_asm
            ld (hl), #0x11
            inc l 
        ld (hl), #0x88

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            dec b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x11
            inc l
        ld (hl), #0x80
        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            dec b
            dec b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x11
            inc l
        ld (hl), #0x88
        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            dec b
            dec b
            dec b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x00
            inc l
        ld (hl), #0x00
        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            dec b
            dec b
            dec b
            dec b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x00
            inc l
        ld (hl), #0x00
        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            dec b
            dec b
            dec b
            dec b
            dec b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x00
            inc l
        ld (hl), #0x00

        ld ix, #playerPos
        ld entity_estado(ix), #0
        ld entity_vy(ix), #1

        ret

                pintarDerecha1:
                ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            inc b 
            inc b
            inc b
            inc b 
            inc b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x03
            inc l
        ld (hl), #0x0C


        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            inc b 
            inc b
            inc b 
            inc b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x14
            inc l
        ld (hl), #0x42

        ;;-------------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            inc b 
            inc b
            inc b 
            call cpct_getScreenPtr_asm 
            ld (hl), #0x24
            inc l
        ld (hl), #0x82

        ;;---------------------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            inc b 
            inc b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x47
            inc l
        ld (hl), #0x2E

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            inc b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x77
            inc l
        ld (hl), #0xEE

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b       
            inc b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x33
            inc l
        ld (hl), #0xCC

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            inc b 
            call cpct_getScreenPtr_asm
            ld (hl), #0x77
            inc l 
        ld (hl), #0x8E

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            call cpct_getScreenPtr_asm 
            ld (hl), #0x77
            inc l
        ld (hl), #0xEE

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b
            call cpct_getScreenPtr_asm
            ld (hl), #0x33
            inc l 
        ld (hl), #0xCC

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            call cpct_getScreenPtr_asm
            ld (hl), #0x11
            inc l 
        ld (hl), #0x88

        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            dec b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x11
            inc l
        ld (hl), #0x80
        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            dec b
            dec b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x11
            inc l
        ld (hl), #0x88
        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            dec b
            dec b
            dec b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x00
            inc l
        ld (hl), #0x00
        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            dec b
            dec b
            dec b
            dec b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x00
            inc l
        ld (hl), #0x00
        ;;-----------
        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            dec b       
            dec b
            dec b
            dec b
            dec b
            dec b
            dec b
            call cpct_getScreenPtr_asm 
            ld (hl), #0x00
            inc l
        ld (hl), #0x00

        ld ix, #playerPos
        ld entity_estado(ix), #0
        ld entity_vy(ix), #0

        ret




pintarPersonajePos1::

    ld ix, #playerPos    ;;Si estado no es 0, se pinta la pos0 derecha, o si estaba en 0 estado y vy, sino, se pinta pos1 derecha
    ld a, entity_estado(ix)
    ld b, entity_vy(ix)
    dec a 
    jr z, estabaCero1
    jr pintarIzquierda0
    estabaCero1:
    dec b 
    jp z, pintarIzquierda1
    jr pintarIzquierda0

pintarIzquierda0:

        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        inc b 
        inc b
        inc b
        inc b 
        inc b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x03
        inc l
    ld (hl), #0x0C


    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        inc b 
        inc b
        inc b 
        inc b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x14
        inc l
    ld (hl), #0x42

    ;;-------------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        inc b 
        inc b
        inc b 
        call cpct_getScreenPtr_asm 
        ld (hl), #0x24
        inc l
    ld (hl), #0x82

    ;;---------------------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        inc b 
        inc b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x47
        inc l
    ld (hl), #0x2E

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        inc b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x77
        inc l
    ld (hl), #0xEE

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x33
        inc l
    ld (hl), #0xCC

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b 
        call cpct_getScreenPtr_asm
        ld (hl), #0x17
        inc l 
    ld (hl), #0xEE

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        call cpct_getScreenPtr_asm 
        ld (hl), #0x77
        inc l
    ld (hl), #0xEE

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b
        call cpct_getScreenPtr_asm
        ld (hl), #0x33
        inc l 
    ld (hl), #0xCC

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        call cpct_getScreenPtr_asm
        ld (hl), #0x11
        inc l 
    ld (hl), #0x88

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        dec b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x10
        inc l
    ld (hl), #0x88
    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        dec b
        dec b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x11
        inc l
    ld (hl), #0x88
    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        dec b
        dec b
        dec b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x00
        inc l
    ld (hl), #0x00
    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        dec b
        dec b
        dec b
        dec b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x00
        inc l
    ld (hl), #0x00
    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        dec b
        dec b
        dec b
        dec b
        dec b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x00
        inc l
    ld (hl), #0x00

    ld ix, #playerPos
        ld entity_estado(ix), #1
        ld entity_vy(ix), #1

    ret

    pintarIzquierda1:

        ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        inc b 
        inc b
        inc b
        inc b 
        inc b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x03
        inc l
    ld (hl), #0x0C


    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        inc b 
        inc b
        inc b 
        inc b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x24
        inc l
    ld (hl), #0x82

    ;;-------------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        inc b 
        inc b
        inc b 
        call cpct_getScreenPtr_asm 
        ld (hl), #0x14
        inc l
    ld (hl), #0x42

    ;;---------------------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        inc b 
        inc b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x47
        inc l
    ld (hl), #0x2E

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        inc b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x77
        inc l
    ld (hl), #0xEE

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b       
        inc b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x33
        inc l
    ld (hl), #0xCC

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        inc b 
        call cpct_getScreenPtr_asm
        ld (hl), #0x17
        inc l 
    ld (hl), #0xEE

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        call cpct_getScreenPtr_asm 
        ld (hl), #0x77
        inc l
    ld (hl), #0xEE

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b
        call cpct_getScreenPtr_asm
        ld (hl), #0x33
        inc l 
    ld (hl), #0xCC

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        call cpct_getScreenPtr_asm
        ld (hl), #0x11
        inc l 
    ld (hl), #0x88

    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        dec b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x10
        inc l
    ld (hl), #0x88
    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        dec b
        dec b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x11
        inc l
    ld (hl), #0x88
    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        dec b
        dec b
        dec b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x00
        inc l
    ld (hl), #0x00
    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        dec b
        dec b
        dec b
        dec b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x00
        inc l
    ld (hl), #0x00
    ;;-----------
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
        ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
        ld      b,  entity_y(ix)  
        dec b       
        dec b
        dec b
        dec b
        dec b
        dec b
        dec b
        call cpct_getScreenPtr_asm 
        ld (hl), #0x00
        inc l
    ld (hl), #0x00
    ld ix, #playerPos
        ld entity_estado(ix), #1
        ld entity_vy(ix), #0

ret
















;;pintarPersonajePos0::
;;
;;;;Primero calculamos la dirección de memoria para pintar el objeto
;;
;;
;;    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    inc b       
;;    inc b
;;    inc b 
;;    inc b
;;    inc b
;;    inc b 
;;    inc b
;;    call cpct_getScreenPtr_asm 
;;    ld (hl), #0x01
;;    inc l
;;   ld (hl), #0x0E
;;   
;;   
;;   ;;-----------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    inc b       
;;    inc b
;;    inc b 
;;    inc b
;;    inc b 
;;    inc b
;;    call cpct_getScreenPtr_asm 
;;    ld (hl), #0x12
;;    inc l
;;   ld (hl), #0x41
;;   
;;   ;;-------------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    inc b       
;;    inc b
;;    inc b 
;;    inc b
;;    inc b 
;;    call cpct_getScreenPtr_asm 
;;    ld (hl), #0x02
;;    inc l
;;   ld (hl), #0xA1
;;   
;;   ;;---------------------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    inc b       
;;    inc b
;;    inc b 
;;    inc b
;;    call cpct_getScreenPtr_asm 
;;    ld (hl), #0x23
;;    inc l
;;   ld (hl), #0x1F
;;   
;;   ;;-----------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    inc b       
;;    inc b
;;    inc b
;;    call cpct_getScreenPtr_asm 
;;    ld (hl), #0x33
;;    inc l
;;   ld (hl), #0xFF
;;   
;;   ;;-----------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    inc b       
;;    inc b
;;    call cpct_getScreenPtr_asm 
;;    ld (hl), #0x11
;;    inc l
;;   ld (hl), #0xEE
;;   
;;   ;;-----------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    inc b 
;;    call cpct_getScreenPtr_asm
;;    ld (hl), #0x33
;;    inc l 
;;   ld (hl), #0xCF
;;   
;;   ;;-----------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    call cpct_getScreenPtr_asm 
;;    ld (hl), #0x33
;;    inc l
;;   ld (hl), #0xFF
;;   
;;   ;;-----------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    dec b
;;    call cpct_getScreenPtr_asm
;;    ld (hl), #0x11
;;    inc l 
;;   ld (hl), #0xEE
;;   
;;   ;;-----------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    dec b       
;;    dec b
;;    call cpct_getScreenPtr_asm
;;    ld (hl), #0x00
;;    inc l 
;;   ld (hl), #0xCC
;;   
;;   ;;-----------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    dec b       
;;    dec b
;;    dec b
;;    call cpct_getScreenPtr_asm 
;;    ld (hl), #0x00
;;    inc l
;;   ld (hl), #0xC8
;;   ;;-----------
;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
;;    ld      b,  entity_y(ix)  
;;    dec b       
;;    dec b
;;    dec b
;;    dec b
;;    call cpct_getScreenPtr_asm 
;;    ld (hl), #0x00
;;    inc l
;;   ld (hl), #0xCC
;;   
;;
;;ret
;;


ataqueAereoIzquierda::
ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x03
    inc l
   ld (hl), #0x0C


   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x24
    inc l
   ld (hl), #0x82

   ;;-------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    call cpct_getScreenPtr_asm 
    ld (hl), #0x14
    inc l
   ld (hl), #0x42

   ;;---------------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x47
    inc l
   ld (hl), #0x2E

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x33
    inc l
   ld (hl), #0xCC

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b 
    call cpct_getScreenPtr_asm
    ld (hl), #0x17
    inc l 
   ld (hl), #0xEE

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x33
    inc l 
   ld (hl), #0xCC

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x01
    inc l 
   ld (hl), #0x77

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x75
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x76
    inc l
   ld (hl), #0xE6

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x76
    inc l
   ld (hl), #0xE6
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE

ret


ataqueAereoIzquierda2::
ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x03
    inc l
   ld (hl), #0x0C


   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x24
    inc l
   ld (hl), #0x82

   ;;-------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    call cpct_getScreenPtr_asm 
    ld (hl), #0x14
    inc l
   ld (hl), #0x42

   ;;---------------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x47
    inc l
   ld (hl), #0x2E

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x33
    inc l
   ld (hl), #0xCC

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b 
    call cpct_getScreenPtr_asm
    ld (hl), #0x17
    inc l 
   ld (hl), #0xEE

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x33
    inc l 
   ld (hl), #0xCC

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x01
    inc l 
   ld (hl), #0x77

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x75
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x70
    inc l
   ld (hl), #0xE0
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x70
    inc l
   ld (hl), #0xE0
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x71
    inc l
   ld (hl), #0xE8

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x71
    inc l
   ld (hl), #0xE8
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x70
    inc l
   ld (hl), #0xE0
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x70
    inc l
   ld (hl), #0xE0

ret


ataqueAereoDerecha::

ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x03
    inc l
   ld (hl), #0x0C


   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x24
    inc l
   ld (hl), #0x82

   ;;-------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    call cpct_getScreenPtr_asm 
    ld (hl), #0x14
    inc l
   ld (hl), #0x42

   ;;---------------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x47
    inc l
   ld (hl), #0x2E

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x33
    inc l
   ld (hl), #0xCC

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b 
    call cpct_getScreenPtr_asm
    ld (hl), #0x77
    inc l 
   ld (hl), #0x8E

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x33
    inc l 
   ld (hl), #0xCC

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0xEE
    inc l 
   ld (hl), #0x08

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0xEA
    inc l
   ld (hl), #0x00
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x76
    inc l
   ld (hl), #0xE6

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x76
    inc l
   ld (hl), #0xE6
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE

ret

ataqueAereoDerecha2::


    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x03
    inc l
   ld (hl), #0x0C


   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x24
    inc l
   ld (hl), #0x82

   ;;-------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    call cpct_getScreenPtr_asm 
    ld (hl), #0x14
    inc l
   ld (hl), #0x42

   ;;---------------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x47
    inc l
   ld (hl), #0x2E

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x33
    inc l
   ld (hl), #0xCC

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b 
    call cpct_getScreenPtr_asm
    ld (hl), #0x77
    inc l 
   ld (hl), #0x8E

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0xEE

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x33
    inc l 
   ld (hl), #0xCC

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0xEE
    inc l 
   ld (hl), #0x08

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0xEA
    inc l
   ld (hl), #0x00
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x70
    inc l
   ld (hl), #0xE0
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x70
    inc l
   ld (hl), #0xE0
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x71
    inc l
   ld (hl), #0xE8

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x71
    inc l
   ld (hl), #0xE8
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x70
    inc l
   ld (hl), #0xE0
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x70
    inc l
   ld (hl), #0xE0

ret





borraPersonajePos0::

ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)          ;;Coordenada Y (tamaño en alto)
    dec b
    dec b 
    dec b
    dec b
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl  
               ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x00        ;;Color (en la posición de la entidad)
    ld      c,  #2        ;;Ancho (en la posición de la entidad)
    ld      b,  #12      ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

ret