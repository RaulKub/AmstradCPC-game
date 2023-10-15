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

   .include "system/mainJuego.h.s"
   .include "cpcfunciones.h.s"
   .include "manager/entity_manager.h.s"
   .include "system/render_system.h.s"
   .include "system/renderEnemigo5A.h.s"
actualizarEnemigoAereo3::
    push ix
    ld a, entity_estado(ix)
    dec a 
    jr z, estavivo
    dec a 
    jr z, estavivo
    jp noestavivo


    estavivo:
        ld entity_color(ix), #0x00
        call  borrarEnemigo5
        ;;call  entityman_getEntityArray_IX
        ;;call  entityman_getNumEntities_A
        ;;call  rendersys_update
        pop ix
        ;;ld  ix, ix  
        push ix
        ld entity_color(ix), #0xF0
        ld a, entity_y(ix)
        inc a
        inc a
        inc a
        inc a
        ld entity_y(ix), a
        call  pintarEnemigo5
        ;;call  entityman_getEntityArray_IX
        ;;call  entityman_getNumEntities_A
        ;;call  rendersys_update

        comprobarY:
        pop ix
        ;;ld  ix, ix  
        push ix
        ld a, entity_y(ix)
        ld  ix, #playerPos  
        ld b, entity_y(ix)

        restaY:
        dec b
        jr z, playerSuelo
        dec a
        jr restaY
        playerSuelo:
        dec a
        jr z, colisionConSuelo
        inc a
        inc a
        jr z, comprobarColisionX
        inc a
        jr z, comprobarColisionX
        inc a
        jr z, comprobarColisionX
        inc a
        jr z, comprobarColisionX
        inc a
        jr z, comprobarColisionX
        inc a
        jr z, comprobarColisionX
        inc a
        jr z, comprobarColisionX
        pop ix
        ret

        colisionConSuelo:
        pop ix
        ;;ld  ix, ix  
        push ix
        ld entity_estado(ix), #0
        ld entity_color(ix), #0xFA
        call pintarEnemigo5
        ld entity_estado(ix), #0
        ;;call  entityman_getEntityArray_IX
        ;;call  entityman_getNumEntities_A
        ;;call  rendersys_update
        pop ix
        ret



        comprobarColisionX:
        pop ix
        ;;ld  ix, ix  
        push ix
        ld a, entity_x(ix)
        ld  ix, #playerPos  
        ld b, entity_x(ix)

        ComprobacionX:
        dec a
        jr z, enemigoACero
        dec b
        jr nz, ComprobacionX
        dec a
        jr z, colisionEnemigo
        pop ix
        ret
        enemigoACero:
        dec b
        jr z, colisionEnemigo
        dec b
        jr z, colisionEnemigo
        pop ix
        ret

        colisionEnemigo:
        pop ix
        call colision

    
    
    noestavivo:
        pop ix
        ;;ld  ix, ix  
        push ix
        ld entity_color(ix), #0x00
        ;; call  entityman_getEntityArray_IX
       ;; call  entityman_getNumEntities_A
       ;; call  rendersys_update
        call  borrarEnemigo5
        
        ld ix, #playerPos
        ld b, entity_x(ix)
        dec b 
        dec b 
        dec b 
        pop ix
        ;;ld  ix, ix  
        push ix
        ld entity_estado(ix), #1
        ld entity_color(ix), #0xF0
        ld entity_y(ix), #0x40
        ld entity_x(ix), b
        call  pintarEnemigo5
       ;; call  entityman_getEntityArray_IX
       ;; call  entityman_getNumEntities_A
       ;; call  rendersys_update
        pop ix
        ret
        
