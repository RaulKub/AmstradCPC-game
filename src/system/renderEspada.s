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
;;Funciones Globales
        pintarEspadaDerecha::
            call pintarPrimerPixeld
            call pintarSegundoPixeld
            call pintarTercerPixeld
            call pintarCuartoPixeld
            call pintarQuintoPixeld
            call pintarSextoPixeld
            call pintarSeptimoPixeld

        
            ret
        
        borrarEspadaDerecha::
            call borrarPrimerPixeld
            call borrarSegundoPixeld
            call borrarTercerPixeld
            call borrarCuartoPixeld
            call borrarQuintoPixeld
            call borrarSextoPixeld
            call borrarSeptimoPixeld
            ret
        
        
        
        pintarEspadaIzquierda::
            call pintarPrimerPixeli
            call pintarSegundoPixeli
            call pintarTercerPixeli
            call pintarCuartoPixeli
            call pintarQuintoPixeli
            call pintarSextoPixeli
            call pintarSeptimoPixeli
            ret
        borrarEspadaIzquierda::
            call borrarPrimerPixeli
            call borrarSegundoPixeli
            call borrarTercerPixeli
            call borrarCuartoPixeli
            call borrarQuintoPixeli
            call borrarSextoPixeli
            call borrarSeptimoPixeli
            ret
        
        
;;Funciones locales       
        cargarDatos:
        
            ld ix, #espadaPos
            ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
            ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
            ld      b,  entity_y(ix)  
            ret

        
    ;;Der
        pintarPrimerPixeld:
            call cargarDatos
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0x00
            inc l
            ld (hl), #0x06;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            ret 
        pintarSegundoPixeld:
            call cargarDatos
            inc b  
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0xF8
            inc l
            ld (hl), #0x25
            inc l
            ld (hl), #0x0F
            inc l
            ld (hl), #0x0F
            inc l
            ld (hl), #0x08
            
            ret
        pintarTercerPixeld:
            call cargarDatos
            inc b
            inc b  
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0xDA
            inc l
            ld (hl), #0xA5;;ld (hl), #0x0F
            inc l
            ld (hl), #0x0F;;ld (hl), #0x08
            inc l
            ld (hl), #0x7F;;ld (hl), #0x0F
            inc l
            ld (hl), #0x0E;;ld (hl), #0x08
            ret 
        pintarCuartoPixeld:
            call cargarDatos
            inc b
            inc b
            inc b  
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0x8F
            inc l
            ld (hl), #0x2D
            inc l
            ld (hl), #0xEF
            inc l
            ld (hl), #0xFD
            inc l
            ld (hl), #0x8F
            ret 
        pintarQuintoPixeld:
            call cargarDatos
            inc b
            inc b
            inc b 
            inc b 
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0xDA
            inc l
            ld (hl), #0xA5;;ld (hl), #0x0F
            inc l
            ld (hl), #0x0F;;ld (hl), #0x08
            inc l
            ld (hl), #0x7F;;ld (hl), #0x0F
            inc l
            ld (hl), #0x0E;;ld (hl), #0x08
            ret 
        pintarSextoPixeld:
            call cargarDatos
            inc b
            inc b
            inc b 
            inc b 
            inc b
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0xF8
            inc l
            ld (hl), #0x25
            inc l
            ld (hl), #0x0F
            inc l
            ld (hl), #0x0F
            inc l
            ld (hl), #0x08
            ret 
        pintarSeptimoPixeld:
            call cargarDatos
            inc b
            inc b
            inc b
            inc b
            inc b 
            inc b 
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0x00
            inc l
            ld (hl), #0x06;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            ret 
        

        borrarPrimerPixeld:
            call cargarDatos
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0xEE
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            ret 
        borrarSegundoPixeld:
            call cargarDatos
            inc b  
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0x8E
            inc l
            ld (hl), #0x00
            inc l
            ld (hl), #0x00
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            ret
        borrarTercerPixeld:
            call cargarDatos
            inc b
            inc b  
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0xCC
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            ret 
        borrarCuartoPixeld:
            call cargarDatos
            inc b
            inc b  
            inc b
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0xEE
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            ret 
        borrarQuintoPixeld:
            call cargarDatos
            inc b
            inc b  
            inc b
            inc b
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0x2E
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            ret 
        borrarSextoPixeld:
            call cargarDatos
            inc b
            inc b
            inc b  
            inc b
            inc b
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0x28
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            ret 
        borrarSeptimoPixeld:
            call cargarDatos
            inc b
            inc b
            inc b
            inc b
            inc b
            inc b
            call cpct_getScreenPtr_asm
            dec l
            ld (hl), #0x42
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            inc l
            ld (hl), #0x00;;ld (hl), #0x0F
            inc l
            ld (hl), #0x00;;ld (hl), #0x08
            ret 
    ;;IZQ
        pintarPrimerPixeli: 

            call cargarDatos
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0x00
            dec l
            ld (hl), #0x06;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            ret 
        pintarSegundoPixeli:
            call cargarDatos
            inc b  
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0xF0
            dec l
            ld (hl), #0x4A
            dec l
            ld (hl), #0x0F
            dec l
            ld (hl), #0x0F
            dec l
            ld (hl), #0x01
            ret
        pintarTercerPixeli:

            call cargarDatos
            inc b
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0xB5
            dec l
            ld (hl), #0x5A
            dec l
            ld (hl), #0x0F
            dec l
            ld (hl), #0xEF
            dec l
            ld (hl), #0x07
            ret

        pintarCuartoPixeli:
            call cargarDatos
            inc b
            inc b
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0x1F
            dec l
            ld (hl), #0x4B
            dec l
            ld (hl), #0x7F
            dec l
            ld (hl), #0xFB
            dec l
            ld (hl), #0x1F
            ret
        pintarQuintoPixeli:
            call cargarDatos
            inc b
            inc b
            inc b
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0xB5
            dec l
            ld (hl), #0x5A
            dec l
            ld (hl), #0x0F
            dec l
            ld (hl), #0xEF
            dec l
            ld (hl), #0x07
            ret
        pintarSextoPixeli:
            call cargarDatos
            inc b
            inc b
            inc b
            inc b
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0xF0
            dec l
            ld (hl), #0x4A
            dec l
            ld (hl), #0x0F
            dec l
            ld (hl), #0x0F
            dec l
            ld (hl), #0x01
            ret
        pintarSeptimoPixeli:
            call cargarDatos
            inc b
            inc b
            inc b
            inc b
            inc b
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0x00
            dec l
            ld (hl), #0x06;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            ret
        borrarPrimerPixeli:
            call cargarDatos
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0x77
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            ret
        borrarSegundoPixeli:
            call cargarDatos
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0x17
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            ret
        borrarTercerPixeli:
            call cargarDatos
            inc b
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0x33
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            ret
        borrarCuartoPixeli:
            call cargarDatos
            inc b
            inc b
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0x77
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            ret
        borrarQuintoPixeli:
            call cargarDatos
            inc b
            inc b
            inc b
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0x47
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            ret
        borrarSextoPixeli:
            call cargarDatos
            inc b
            inc b
            inc b
            inc b
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0x41
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            ret
        borrarSeptimoPixeli:
            call cargarDatos
            inc b
            inc b
            inc b
            inc b
            inc b
            inc b
            call cpct_getScreenPtr_asm
            inc l
            inc l
            ld (hl), #0x24
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            dec l
            ld (hl), #0x00;;ld (hl), #0x0F
            dec l
            ld (hl), #0x00;;ld (hl), #0x08
            ret