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
.include "system/render_system.h.s"

;;DIBUJAMOS LAS OLAS EN POSICION MOVIDA PARA DAR EFECTO
olas3::
    ld a, #0x4B
olas1:
    push af
    
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x97         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0E          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #4         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    pop af
    dec a
    jr z, final
    dec a
    jr z, final
    dec a
    jr z, final
    dec a
    jr z, final
    dec a
    jr z, final
    dec a
    jr z, final
    jr nz, olas1
final:

ld a, #0x4A
olas22:
    push af
    
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x96         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0E          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #4         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    pop af
    dec a
    jr z, final2
    dec a
    jr z, final2
    dec a
    jr z, final2
    dec a
    jr z, final2
    dec a
    jr z, final2
    dec a
    jr z, final2
    jr nz, olas22
final2:

ld a, #0x49
olas33:
    push af
    
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x95         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0E          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #4         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    pop af
    dec a
    jr z, final3
    dec a
    jr z, final3
    dec a
    jr z, final3
     dec a
    jr z, final3
    dec a
    jr z, final3
    dec a
    jr z, final3
    jr nz, olas33
final3:

ld a, #0x48
olas4:
    push af
    
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x94         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0E          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #4         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    pop af
    dec a
    jr z, final4
    dec a
    jr z, final4
    dec a
    jr z, final4
    dec a
    jr z, final4
    dec a
    jr z, final4
    dec a
    jr z, final4
    jr nz, olas4
final4:



;;AQUI EMPIEZA LAS OLAS EN LA OTRA DIRECCION
ld a, #0x4C
olas7:
    push af
    
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x97         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0E          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #4         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    pop af
    dec a
    jr z, final7
    dec a
    jr z, final7
    dec a
    jr z, final7
    dec a
    jr z, final7
    dec a
    jr z, final7
    dec a
    jr z, final7
    jr nz, olas7
final7:

ld a, #0x4D
olas8:
    push af
    
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x96         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0E          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #4         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    pop af
    dec a
    jr z, final8
    dec a
    jr z, final8
    dec a
    jr z, final8
    dec a
    jr z, final8
    dec a
    jr z, final8
    dec a
    jr z, final8
    jr nz, olas8
final8:

ld a, #0x4E
olas9:
    push af
    
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x95         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0E          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #4         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    pop af
    dec a
    jr z, final9
    dec a
    jr z, final9
    dec a
    jr z, final9
     dec a
    jr z, final9
    dec a
    jr z, final9
    dec a
    jr z, final9
    jr nz, olas9
final9:

ld a, #0x4F
olas10:
    push af
    
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x94        ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0E          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #4         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    pop af
    dec a
    jr z, final10
    dec a
    jr z, final10
    dec a
    jr z, final10
    dec a
    jr z, final10
    dec a
    jr z, final10
    dec a
    jr z, final10
    jr nz, olas10
final10:

;;EMPIEZAN LAS OLAS DE DEBAJO
 


ret