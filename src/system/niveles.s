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
.include "manager/entity_manager.h.s"
.include "system/render_system.h.s"
.include "system/niveles.h.s"
.include "system/mainJuego.h.s"



CompruebaNivel::
ld ix, #wallDPos
ld a, entity_estado(ix)

dec a
jr z, Nivel1
dec a
jr z, Nivel2
dec a
jr z, Nivel3
dec a
jr z, Nivel4
dec a
jr z, Nivel5
dec a
jr z, Nivel6
nivel7:
ld a, #7
ret

Nivel6:
ld a, #6
ret
Nivel5:

ld a, #5
ret
Nivel4:

ld a, #4

ret
Nivel3:

    ld a, #3

    ret

Nivel2:

    ld a, #2

    ret

Nivel1:

    ld a, #1

    ret