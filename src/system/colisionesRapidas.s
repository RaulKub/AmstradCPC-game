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
.include "system/render_system.h.s"
.include "system/mainJuego.h.s"
.include "system/renderEnemigo3.h.s"
.include "system/renderEnemigo4.h.s"
.include "system/renderEspada.h.s"

colisionRapida::

  ld  ix, #espadaPos
  ld  a,  entity_x(ix)
  ld  ix, #enemyDerPos2
  ld  b,  entity_x(ix)

  colisionEspadaDer:
    dec a
    jr z, espadaCero
    dec b
    jr z, enemigoCero
    jr colisionEspadaDer
  espadaCero:
    dec b
    jp z, enemigoDerAsesinado
    dec b
    jp z, enemigoDerAsesinado
    dec b
    jp z, enemigoDerAsesinado
    dec b
    jp z, enemigoDerAsesinado
    dec b
    jp z, enemigoDerAsesinado
    jr noColisionDer
  enemigoCero:
    dec a
    jp z, enemigoDerAsesinado

  noColisionDer:
    ld  ix, #espadaPos
    ld  a,  entity_x(ix)
    ld  ix, #enemyIzqPos2
    ld  b,  entity_x(ix)

;;------------------------------

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
    dec a
    jr z, enemigoIzqAsesinado
    ret
  espadaCeroI:
    ret





  enemigoIzqAsesinado:
    ;;lo cambiamos a color azul
    ld  ix, #enemyIzqPos2
    ld  entity_color(ix), #0x0F
    
    call borrarEnemigo3
    call borrarEspadaIzquierda
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3

    ld  ix, #wallIPos
    ld  a, entity_estado(ix)
    inc a
    inc a
    ld  entity_estado(ix), a
    ret

  enemigoDerAsesinado:

    ;;lo cambiamos a color azul
    ld  ix, #enemyDerPos2
    ld  entity_color(ix), #0x0F
    call borrarEnemigo4
    call borrarEspadaDerecha

    ld  ix, #enemyDerPos2
    ld  entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo4

    ld  ix, #wallDPos
    ld  a, entity_vy(ix)
    dec a
    ld  entity_vy(ix), a

    ld  ix, #wallIPos
    ld  a, entity_estado(ix)
    inc a
    inc a
    ld  entity_estado(ix), a

    ret