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
;;
;; RENDER SYSTEM
;;

.include "cpcfunciones.h.s"
.include "manager/entity_manager.h.s"
.include "system/renderPersonaje.h.s"

rendersys_init::
    ret

;;  INPUT:
;;      IX: Puntero al primer elemento del render
;;      A:  Numero de entidades a renderizar
rendersys_update::

_renloop:
    push    af                  ;;Guardamos en la pila
    ld      bc, #entity_size    ;;sumamos 7 a la posicion donde empieza cada objeto
    add     ix, bc

    ;;Primero calculamos la dirección de memoria para pintar el objeto
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)          ;;Coordenada Y (tamaño en alto)
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  entity_color(ix)          ;;Color (en la posición de la entidad)
    ld      c,  entity_w(ix)          ;;Ancho (en la posición de la entidad)
    ld      b,  entity_h(ix)          ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    pop     af

    
    dec     a
    ret     z
    
    jr      _renloop