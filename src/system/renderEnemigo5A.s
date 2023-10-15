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

pintarEnemigo5::
    ld a, entity_estado(ix)
    
    dec a
    jp z, renderPos1
    dec a
    jp z, renderPos2

    renderPos0:
    ld entity_estado(ix), #1

   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0xDF
    inc l
   ld (hl), #0xDF


   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x77
    inc l
   ld (hl), #0x6E

   ;;-------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x0

   ;;---------------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b 
    call cpct_getScreenPtr_asm
    ld (hl), #0x00
    inc l 
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x00
    inc l 
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x00
    inc l 
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

ret

   




    renderPos1:
    ld entity_estado(ix), #2

    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x07
    inc l
   ld (hl), #0x08


   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x4C
    inc l
   ld (hl), #0x8C

   ;;-------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    call cpct_getScreenPtr_asm 
    ld (hl), #0x08
    inc l
   ld (hl), #0x04

   ;;---------------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x4C
    inc l
   ld (hl), #0x8C

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x04
    inc l
   ld (hl), #0x08

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x03
    inc l
   ld (hl), #0x08

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b 
    call cpct_getScreenPtr_asm
    ld (hl), #0x01
    inc l 
   ld (hl), #0x0C

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    call cpct_getScreenPtr_asm 
    ld (hl), #0x03
    inc l
   ld (hl), #0x08

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x07
    inc l 
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x03
    inc l 
   ld (hl), #0x08

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x01
    inc l
   ld (hl), #0x00
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

ret

    renderPos2:
    ld entity_estado(ix), #1
    
    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x07
    inc l
   ld (hl), #0x08


   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x4C
    inc l
   ld (hl), #0x8C

   ;;-------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    call cpct_getScreenPtr_asm 
    ld (hl), #0x08
    inc l
   ld (hl), #0x04

   ;;---------------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x4C
    inc l
   ld (hl), #0x8C

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x04
    inc l
   ld (hl), #0x08

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x03
    inc l
   ld (hl), #0x08

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b 
    call cpct_getScreenPtr_asm
    ld (hl), #0x07
    inc l 
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    call cpct_getScreenPtr_asm 
    ld (hl), #0x03
    inc l
   ld (hl), #0x08

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x01
    inc l 
   ld (hl), #0x0C

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x03
    inc l 
   ld (hl), #0x08

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x01
    inc l
   ld (hl), #0x00
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

ret


borrarEnemigo5::


    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00


   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

   ;;-------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    inc b 
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

   ;;---------------------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b 
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b       
    inc b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    inc b 
    call cpct_getScreenPtr_asm
    ld (hl), #0x00
    inc l 
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x00
    inc l 
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    call cpct_getScreenPtr_asm
    ld (hl), #0x00
    inc l 
   ld (hl), #0x00

   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
   ;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00
;;-----------
   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
    ld      b,  entity_y(ix)  
    dec b       
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    inc l
   ld (hl), #0x00

ret