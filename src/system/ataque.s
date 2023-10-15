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
.include "manager/entity_manager.h.s"
.include "system/render_system.h.s"
.include "system/mainJuego.h.s"
.include "system/colisionesRapidas.h.s"
.include "system/renderEspada.h.s"
.include "system/renderEnemigo1.h.s"
.include "system/renderEnemigo2.h.s"

estadoEspadaPrevio:: .db #0

ataqueEspada::

    call  cpct_scanKeyboard_f_asm
    ld  hl, #Key_Space
    call cpct_isKeyPressed_asm
    ret z

    ld ix, #espadaPos
    ld a, entity_vy(ix)
    dec a
    ret z
    dec a
    ret z
    dec a
    ret z
    dec a
    ret z
    ld entity_vy(ix), #4

    ld  ix, #espadaPos ;;enemyPos
    ld  a, entity_estado(ix)
    dec a
    jr  z,   pintarIzquierda
    pintarDerecha:
        call pintarEspadaDerecha

        ;;halt 
        ;;halt
        call cpct_waitVSYNC_asm
        halt 
        halt
        call cpct_waitVSYNC_asm
        halt 
        halt
        call cpct_waitVSYNC_asm
        ;;ld a, #20
        ;;esperaEspada:
        ;;halt
        ;;dec a
        ;;jr nz, esperaEspada

        ;;call borrarEspadaDerecha
        ld ix, #estadoEspadaPrevio
        ld 0(ix), #0
        jr espadaPintada

    pintarIzquierda:
        call pintarEspadaIzquierda

        ;;halt 
        ;;halt
        call cpct_waitVSYNC_asm
        halt 
        halt
        call cpct_waitVSYNC_asm
        halt 
        halt
        call cpct_waitVSYNC_asm
        ;;ld a, #20
        ;;esperaEspadaIzq:
        ;;halt
        ;;dec a
        ;;jr nz, esperaEspadaIzq

        ;;call borrarEspadaIzquierda
        ld ix, #estadoEspadaPrevio
        ld 0(ix), #1


    espadaPintada:
        call colisionRapida
        ;;Comprobacion posicion del enemigo
        ld  ix, #espadaPos
        ld  a,  entity_x(ix)
        ld  ix, #enemyPos
        ld  b,  entity_x(ix)

    colisionEspadaDer:
        dec a
        jr z, espadaCero
        dec b
        jr z, enemigoCero
        jr colisionEspadaDer
    espadaCero:
        dec b
        jr z, enemigoDerAsesinado
        dec b
        jr z, enemigoDerAsesinado
        dec b
        jr z, enemigoDerAsesinado
        dec b
        jr z, enemigoDerAsesinado
        jr noColisionDer
    enemigoCero:
        dec a
        jr z, enemigoDerAsesinado

    noColisionDer:
        ld  ix, #espadaPos
        ld  a,  entity_x(ix)
        ld  ix, #enemyIzqPos
        ld  b,  entity_x(ix)
    colisionEspadaIzq:
        dec b
        jr z, enemigoCeroI
        dec a
        jr z, espadaCeroI
        jr colisionEspadaIzq
    enemigoCeroI:
        dec a
        jr z, enemigoIzqAsesinado
        dec a
        jr z, enemigoIzqAsesinado
        dec a
        jr z, enemigoIzqAsesinado
        dec a
        jr z, enemigoIzqAsesinado
        ret
    espadaCeroI:
        ret

        ;
    enemigoDerAsesinado:
        
        call borrarEnemigo1
        call borrarEspadaDerecha
        ld  ix, #enemyPos
        ld  entity_x(ix), #72
        ld  entity_estado(ix), #0
        call pintarEnemigo1
        ;
        ld  ix, #wallDPos
        ld  a, entity_vy(ix)
        dec a
        ld  entity_vy(ix), a

        ld  ix, #wallIPos
        ld  a, entity_estado(ix)
        inc a
        ld  entity_estado(ix), a

        ret



    enemigoIzqAsesinado:
        ;;;;lo cambiamos a color azul
        ;;ld  ix, #enemyIzqPos
        ;;ld  entity_color(ix), #0x0F
        ;; call  entityman_getEntityArray_IX
        ;;call  entityman_getNumEntities_A
        ;;call  rendersys_update
        ;;ld a, #20
        ;;esperaCambioColor1EnemigoI:
        ;;halt
        ;;dec a
        ;;jr nz, esperaCambioColor1EnemigoI
        ;;
        ;;;;lo cambiamos a color rojo
        ;;ld  ix, #enemyIzqPos
        ;;ld  entity_color(ix), #0x0F
        ;;call  entityman_getEntityArray_IX
        ;;call  entityman_getNumEntities_A
        ;;call  rendersys_update
        ;;ld a, #20
        ;;esperaCambioColor2EnemigoI:
        ;;halt
        ;;dec a
        ;;jr nz, esperaCambioColor2EnemigoI
        ;;
        ;; ;;lo borramos
        ;;ld  ix, #enemyIzqPos
        ;;ld  entity_color(ix), #0x00
        ;; call  entityman_getEntityArray_IX
        ;;call  entityman_getNumEntities_A
        ;;call  rendersys_update
        ;;ld a, #20
        ;;esperaCambioColor3EnemigoI:
        ;;halt
        ;;dec a
        ;;jr nz, esperaCambioColor3EnemigoI

        call borrarEnemigo2
        call borrarEspadaIzquierda
        ld  ix, #enemyIzqPos
        ld  entity_x(ix), #5
        ld  entity_estado(ix), #0
        call pintarEnemigo2

        ld  ix, #wallDPos
        ld  a, entity_vy(ix)
        dec a
        ld  entity_vy(ix), a

        ld  ix, #wallIPos
        ld  a, entity_estado(ix)
        inc a
        ld  entity_estado(ix), a
        ret
    mueveEspadaDerecha::

        ld  ix, #espadaPos ;;enemyPos
        ld  a, entity_estado(ix)
        dec a
        jr  z,   estabaizquierda  ;;(vx era 1)
        ld  a, entity_x(ix)
        inc a
        ld  entity_x(ix), a
        ld  entity_estado(ix), #0
        ;;call  entityman_getEntityArray_IX
        ;;call  entityman_getNumEntities_A
        ;;call  rendersys_update
        ret

    estabaizquierda:
        ld  ix, #playerPos
        ld  b, entity_x(ix)
        inc b
        inc b
        ld  ix, #espadaPos
        ld  entity_x(ix), b
        ld  entity_estado(ix), #0
        ;;call  entityman_getEntityArray_IX
        ;;call  entityman_getNumEntities_A
        ;;call  rendersys_update

        ret

    mueveEspadaIzquierda::

        ld  ix, #espadaPos
        ld  a, entity_estado(ix)
        dec a
        jr  nz,   estabaderecha ;;(vx era 1)
        ld  a, entity_x(ix)
        dec a
        ld  entity_x(ix), a
        ld  entity_estado(ix), #1
        ;;call  entityman_getEntityArray_IX
        ;;call  entityman_getNumEntities_A
        ;;call  rendersys_update
        ret

    estabaderecha:
        ld  ix, #playerPos
        ld  b, entity_x(ix)
        dec b
        dec b
        ld  ix, #espadaPos
        ld  entity_x(ix), b
        ld  entity_estado(ix), #1
        ;;call  entityman_getEntityArray_IX
        ;;call  entityman_getNumEntities_A
        ;;call  rendersys_update

        ret