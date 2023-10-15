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



fondo::

ld      a, #0x49
buclesuelo:
    push af
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x90         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc
    
    pop af
    dec a
    jr nz, buclesuelo



;;AQUI ESTAMOS PINTANDO EL CUADRADO ROJO DE ARRIBA---------------------
    ld a, #0x02
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x01         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0xFF          ;;Color (en la posición de la entidad)
    ld      c,  #64        ;;Ancho (en la posición de la entidad)
    ld      b,  #22         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

;;AQUI EL SEGUNDO CUADRADO PARA QUE LLEGUE HASTA EL FINAL -------------
    ld a, #0x040
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x01         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0xFF          ;;Color (en la posición de la entidad)
    ld      c,  #14        ;;Ancho (en la posición de la entidad)
    ld      b,  #22         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


;;AQUI LOS CUADRADOS AZULES A MODO DE LADRILLOS--------------------
    ld a, #0xF7 ;;0xDF
techo:
    push af
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x02         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x00          ;;Color (en la posición de la entidad)
    ld      c,  #2        ;;Ancho (en la posición de la entidad)
    ld      b,  #4         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    pop af
    dec a
    jr z, fin
    dec a
    jr z, fin
    dec a
    jr z, fin
    dec a
    jr nz, techo
fin:

;;DIBUJANDO LAS TUBERIAS----------------

;;IZQUIERDA
ld a, #0x03
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x50         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
    ld      c,  #2        ;;Ancho (en la posición de la entidad)
    ld      b,  #64         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    ld a, #0x00
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x50         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
    ld      c,  #3        ;;Ancho (en la posición de la entidad)
    ld      b,  #6         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


;;AQUI ESTAMOS DIBUJANDO EL TROZO DE TUBERIA POR EL QUE SALE EL ENEMIGO---------
    ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x85         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0xEE          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x86         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x3F          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x87         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x1F          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x88         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x1F          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x89         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x1F          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x8A         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x1F          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x8B         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x1F          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x8C         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x1F          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x8D         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x1F          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x8E         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x3F          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


ld a, #0x05
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x8F         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0xEE          ;;Color (en la posición de la entidad)
    ld      c,  #1        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

;;DERECHA

ld a, #0x4A
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x50         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
    ld      c,  #2        ;;Ancho (en la posición de la entidad)
    ld      b,  #64         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    ld a, #0x4C
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x50         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
    ld      c,  #4        ;;Ancho (en la posición de la entidad)
    ld      b,  #6         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc


;;AQUI DIBUJAMOS LAS OLAS

;;AQUI LA LINEA DE ABAJO DE LAS OLAS QUE HAY QUE HACER 2 PORQUE CON 1 NO LLEGAMOS HASTA EL FINAL-----
ld a, #0x01

    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x9E         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
    ld      c,  #64        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

;; SEGUNDA LINEA MAS CORTA
    ld a, #0x40
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  a              ;;Coordenada X 
    ld      b,  #0x9E         ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
    ld      c,  #10        ;;Ancho (en la posición de la entidad)
    ld      b,  #1         ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

;;EMPIEZAN LAS OLAS
olas::
    ld a, #0x4B
olas1:
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
olas2:
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
    jr nz, olas2
final2:

ld a, #0x49
olas3:
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
    jr nz, olas3
final3:

ld a, #0x48
olas4:
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
    ld      b,  #0x94         ;;Coordenada Y 
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
    ld      b,  #0x95         ;;Coordenada Y 
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
    ld      b,  #0x96         ;;Coordenada Y 
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
    ld      b,  #0x97         ;;Coordenada Y 
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



;;BORRAR OLAS PARA REDIBUJARLAS
borrarOlas::

ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0x0              ;;Coordenada X 
    ld      b,  #0x92        ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x00         ;;Color (en la posición de la entidad)
    ld      c,  #60      ;;Ancho (en la posición de la entidad)
    ld      b,  #9        ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #60              ;;Coordenada X 
    ld      b,  #0x92        ;;Coordenada Y 
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros

    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
    ld      a,  #0x00         ;;Color (en la posición de la entidad)
    ld      c,  #20      ;;Ancho (en la posición de la entidad)
    ld      b,  #9        ;;Alto (en la posición de la entidad)
    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

    ret