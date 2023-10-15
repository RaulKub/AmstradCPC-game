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
.globl entityman_init
.globl entityman_create
.globl _num_entities
.globl _entity_array
.globl entity_size
.globl entityman_getNumEntities_A
.globl entityman_getEntityArray_IX
.globl reset

.macro  DefineEntity _name, _x, _y, _w, _h, _vx, _vy, _color
_name::
   .db  _x
   .db  _y
   .db  _w
   .db  _h
   .db  _vx
   .db  _vy
   .db  _color
.endm

entity_x = 0
entity_y = 1
entity_w = 2
entity_h = 3
entity_estado = 4
entity_vy = 5
entity_color = 6
sizeof_entity = 7



