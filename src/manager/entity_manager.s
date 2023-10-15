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
.include "main.h.s"
.include "entity_manager.h.s"

;;
;;  ENTITY MANAGER
;;
;;max_entities == 16
;;    entity_size == 7
;;
;;    _num_entities::     .db 0
;;    _last_elem_ptr::    .dw _entity_array
;;    _entity_array::
;;        .ds max_entities*entity_size
        
entityman_init::
    xor		a 
	ld 		(_num_entities), a

	ld 		hl, #_entity_array
	ld 		(_last_elem_ptr), hl

	ret

    


entityman_getEntityArray_IX::
    ld  ix, #_entity_array
    ret

entityman_getNumEntities_A::
    ld  a, (_num_entities)
    ret

;; INPUt
;; HL: Pointer to entity initializer bytes
entityman_create::
    ld      de, (_last_elem_ptr)
    ld      bc, #entity_size
    ldir    

    ld      a, (_num_entities)
    inc     a
    ld      (_num_entities), a

    ld      hl, (_last_elem_ptr)
    ld      bc, #entity_size
    add     hl, bc
    ld      (_last_elem_ptr), hl

    ret

    reset::
    ld a, #0
        ld (_num_entities), a
        ld hl, #playerPos
    ld (_last_elem_ptr), hl
    ld ix, #cooldownMisil ;;cooldownMisil
    ld 0(ix), #1
    ld ix, #letrasborradas ;;letrasborradas
    ld 0(ix), #0
    ld ix, #nivelactual ;;nivelactual
    ld 0(ix), #1
    ld ix, #cargaNivel ;;cargaNivel
    ld 0(ix), #1
    ld ix, #cooldownEnemigo1 ;;cooldownEnemigo1
    ld 0(ix), #0
    ld ix, #cooldownEnemigo2 ;;cooldownEnemigo2
    ld 0(ix), #0
    ld ix, #vidas ;;vidas
    ld 0(ix), #3

    ld ix, #Mina ;;Mina
    ld 0(ix), #0
    ld ix, #Mina ;;Mina
    ld 1(ix), #0
    ld ix, #Mina ;;Mina
    ld 2(ix), #0
    ld ix, #Mina ;;Mina
    ld 3(ix), #0

    ld ix, #Inicio ;;Mina
    ld 0(ix), #30
    ld ix, #Inicio ;;Mina
    ld 1(ix), #1
    ld ix, #Inicio ;;Mina
    ld 2(ix), #2

    ld ix, #wallDPos
    ld entity_estado(ix), #1
    ld entity_vy(ix), #2
   ret






















