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

tresVidas::

ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #190
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x70
    inc l
   ld (hl), #0x70
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x70
    inc l
   ld (hl), #0x70
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x70
    inc l
   ld (hl), #0x70
   inc l
   ld (hl), #0x00

   ;;2

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #191
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xF7
   inc l
   ld (hl), #0x80
   ;;SegundoCorazon
   inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xF7
   inc l
   ld (hl), #0x80
    ;;TercerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xF7
   inc l
   ld (hl), #0x80

    ;3

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #192
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80
   ;;SegundoCorazon
   inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80
    ;;TercerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #193
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80
   ;;SegundoCorazon
   inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80
    ;;TercerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80


   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #194
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x73
    inc l
   ld (hl), #0x7FE
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x73
    inc l
   ld (hl), #0x7FE
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x73
    inc l
   ld (hl), #0x7FE
   inc l
   ld (hl), #0x00


   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #195
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x31
    inc l
   ld (hl), #0xEC
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x31
    inc l
   ld (hl), #0xEC
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x31
    inc l
   ld (hl), #0xEC
   inc l
   ld (hl), #0x00

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #196
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x10
    inc l
   ld (hl), #0xC8
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x10
    inc l
   ld (hl), #0xC8
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x10
    inc l
   ld (hl), #0xC8
   inc l
   ld (hl), #0x00


   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #197
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x00
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x00
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x00
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x00
   ret
   dosVidas::

ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #190
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x70
    inc l
   ld (hl), #0x70
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x70
    inc l
   ld (hl), #0x70
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x70
    inc l
   ld (hl), #0x70
   inc l
   ld (hl), #0x00

   ;;2

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #191
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xF7
   inc l
   ld (hl), #0x80
   ;;SegundoCorazon
   inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xF7
   inc l
   ld (hl), #0x80
    ;;TercerCorazon
    inc l
    ld (hl), #0x80
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x80

    ;3

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #192
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80
   ;;SegundoCorazon
   inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80
    ;;TercerCorazon
    inc l
    ld (hl), #0x80
    inc l
   ld (hl), #0x00
   inc l
   ld (hl), #0x80

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #193
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80
   ;;SegundoCorazon
   inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80
    ;;TercerCorazon
    inc l
    ld (hl), #0x80
    inc l
   ld (hl), #0x00
   inc l
   ld (hl), #0x80


   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #194
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x73
    inc l
   ld (hl), #0x7FE
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x73
    inc l
   ld (hl), #0x7FE
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x40
    inc l
   ld (hl), #0x10
   inc l
   ld (hl), #0x00


   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #195
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x31
    inc l
   ld (hl), #0xEC
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x31
    inc l
   ld (hl), #0xEC
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x20
    inc l
   ld (hl), #0x20
   inc l
   ld (hl), #0x00

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #196
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x10
    inc l
   ld (hl), #0xC8
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x10
    inc l
   ld (hl), #0xC8
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x10
    inc l
   ld (hl), #0x40
   inc l
   ld (hl), #0x00


   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #197
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x00
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x00
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x00
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x00
   ret

   unaVida::
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #190
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x70
    inc l
   ld (hl), #0x70
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x70
    inc l
   ld (hl), #0x70
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x70
    inc l
   ld (hl), #0x70
   inc l
   ld (hl), #0x00

   ;;2

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #191
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xF7
   inc l
   ld (hl), #0x80
   ;;SegundoCorazon
   inc l
    ld (hl), #0x80
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x80

    ;;TercerCorazon
    inc l
    ld (hl), #0x80
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x80

    ;3

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #192
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80
   ;;SegundoCorazon
   inc l
    ld (hl), #0x80
    inc l
   ld (hl), #0x00
   inc l
   ld (hl), #0x80
    ;;TercerCorazon
    inc l
    ld (hl), #0x80
    inc l
   ld (hl), #0x00
   inc l
   ld (hl), #0x80

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #193
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0xF7
    inc l
   ld (hl), #0xFF
   inc l
   ld (hl), #0x80
   ;;SegundoCorazon
   inc l
    ld (hl), #0x80
    inc l
   ld (hl), #0x00
   inc l
   ld (hl), #0x80
    ;;TercerCorazon
    inc l
    ld (hl), #0x80
    inc l
   ld (hl), #0x00
   inc l
   ld (hl), #0x80


   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #194
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x73
    inc l
   ld (hl), #0x7FE
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x40
    inc l
   ld (hl), #0x10
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x40
    inc l
   ld (hl), #0x10
   inc l
   ld (hl), #0x00


   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #195
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x31
    inc l
   ld (hl), #0xEC
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x20
    inc l
   ld (hl), #0x20
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x20
    inc l
   ld (hl), #0x20
   inc l
   ld (hl), #0x00

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #196
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x10
    inc l
   ld (hl), #0xC8
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x10
    inc l
   ld (hl), #0x40
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x10
    inc l
   ld (hl), #0x40
   inc l
   ld (hl), #0x00


   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  #0          ;;Coordenada X (tamaño en ancho)
    ld      b,  #197
    call cpct_getScreenPtr_asm 
    ;;PrimerCorazon
    inc l
    ld (hl), #0x00
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x00
   ;;SegundoCorazon
   inc l
    ld (hl), #0x00
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x00
    ;;TercerCorazon
    inc l
    ld (hl), #0x00
    inc l
   ld (hl), #0x80
   inc l
   ld (hl), #0x00
   ret