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

pintarCrocoPos1::
;;COCODRILO ABIERTO 
    ;;Linea ultima
    
    
    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #3
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x0F
    inc l   
    ld      (hl),  #0x0F
    inc l
    ld      (hl),  #0x0F

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #2
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0xFF

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #1
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x0F
    inc l   
    ld      (hl),  #0x3F
    inc l
    ld      (hl),  #0xFF

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      b,  entity_y(ix)    
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x0F
    inc l   
    ld      (hl),  #0x0F
    inc l
    ld      (hl),  #0x0F

    ret


    pintarCrocoPos2::
;;COCODRILO ABIERTO 
    

   

    ;;Linea 12
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #3
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x22
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x31

    ;;Linea 13
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #2
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0xC0
    inc l
    ld      (hl),  #0x11
    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #1
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x31

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0xF1

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #1
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x33
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x62

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)
    ld b, #2
    sub b
    ld b, a     
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x11
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x66

    ret

    pintarCrocoPos3::
;;COCODRILO ABIERTO 
    
    ;;Linea 7
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #3
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xF2
    inc l   
    ld      (hl),  #0xD0
    inc l
    ld      (hl),  #0xE2

    ;;Linea 8
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #2
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xA2
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x62

    ;;Linea 9
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #1
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x11

    ;;Linea 10
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x31

    ;;Linea 11
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #1
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x71

    ;;Linea 12
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #2
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x22
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x31

    ;;Linea 13
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #3
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0xC0
    inc l
    ld      (hl),  #0x11
    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #4
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x31

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #5
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0xF1

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #6
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x33
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x62

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #7
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x11
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x66

    ret

    pintarCrocoPos4::
;;COCODRILO ABIERTO 
    ;;Linea ultima
    ld      de, #0xC000       ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld ix, #crocodile 
    ld      c,  entity_x(ix)        ;;Coordenada X (tamaño en ancho)
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #3
    ld b, a
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea penultima
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #2
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea 3
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #1
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea 4
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x66
    inc l   
    ld      (hl),  #0x11
    inc l
    ld      (hl),  #0x00

    ;;Linea 5
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #1
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x88

    ;;Linea 6
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #2
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0xC4

    ;;Linea 7
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #3
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xF2
    inc l   
    ld      (hl),  #0xD0
    inc l
    ld      (hl),  #0xE2

    ;;Linea 8
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #4
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xA2
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x62

    ;;Linea 9
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #5
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x11

    ;;Linea 10
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #6
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x31

    ;;Linea 11
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #7
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x71

    ;;Linea 12
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #8
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x22
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x31

    ;;Linea 13
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #9
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0xC0
    inc l
    ld      (hl),  #0x11
    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #10
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x31

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #11
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0xF1

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #12
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x33
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x62

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #13
    sub b
    ld b, a     
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x11
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x66

    ret

    pintarCrocoPos5::
;;COCODRILO CERRADO    
    ;;Linea ultima
    ld ix, #crocodile 
    ld      de, #0xC000       ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    add a, #3
    ld b, a
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea penultima
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    add a, #2
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea 3
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    add a, #1
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea 4
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x66
    inc l   
    ld      (hl),  #0x11
    inc l
    ld      (hl),  #0x00

    ;;Linea 5
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #1
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x88

    ;;Linea 6
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #2
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x88

    ;;Linea 7
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #3
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xF2
    inc l   
    ld      (hl),  #0xD0
    inc l
    ld      (hl),  #0x88

    ;;Linea 8
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #4
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xB2
    inc l   
    ld      (hl),  #0xB0
    inc l
    ld      (hl),  #0x88

    ;;Linea 9
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #5
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x70
    inc l
    ld      (hl),  #0x88

    ;;Linea 10
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #6
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x22
    inc l   
    ld      (hl),  #0x30
    inc l
    ld      (hl),  #0x88

    ;;Linea 11
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #7
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0x10
    inc l
    ld      (hl),  #0x88

    ;;Linea 12
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #8
    sub b
    ld b, a   
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x88

    ;;Linea 13
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #9
    sub b
    ld b, a   
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0xD0
    inc l
    ld      (hl),  #0x88

    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #10
    sub b
    ld b, a   
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0xB0
    inc l
    ld      (hl),  #0x88

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #11
    sub b
    ld b, a   
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x70
    inc l
    ld      (hl),  #0x88

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #12
    sub b
    ld b, a   
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x33
    inc l   
    ld      (hl),  #0x31
    inc l
    ld      (hl),  #0x00

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #13
    sub b
    ld b, a       
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x11
    inc l   
    ld      (hl),  #0x33
    inc l
    ld      (hl),  #0x00

    ret

    pintarCrocoPos6::
;;COCODRILO ABIERTO 
    ;;Linea ultima
    ld      de, #0xC000       ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld ix, #crocodile 
    ld      c,  entity_x(ix)        ;;Coordenada X (tamaño en ancho)
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #16
    ld b, a
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea penultima
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #15
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea 3
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #14
    ld b, a
    ;;sub   #2
    ;;ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea 4
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #13
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x66
    inc l   
    ld      (hl),  #0x11
    inc l
    ld      (hl),  #0x00

    ;;Linea 5
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #12
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x88

    ;;Linea 6
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #11
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0xC4

    ;;Linea 7
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #10
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xF2
    inc l   
    ld      (hl),  #0xD0
    inc l
    ld      (hl),  #0xE2

    ;;Linea 8
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #9
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xA2
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x62

    ;;Linea 9
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #8
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x11

    ;;Linea 10
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #7
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x31

    ;;Linea 11
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #6
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x71

    ;;Linea 12
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #5
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x22
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x31

    ;;Linea 13
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #4
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0xC0
    inc l
    ld      (hl),  #0x11
    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #3
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x31

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #2
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0xF1

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #1
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x33
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x62

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      b,  entity_y(ix)    
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x11
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x66

    ret

    pintarCrocoPos7::
;;COCODRILO ABIERTO 
    ;;Linea ultima
    ld      de, #0xC000       ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
    ld ix, #crocodile 
    ld      c,  entity_x(ix)        ;;Coordenada X (tamaño en ancho)
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #16
    ld b, a
    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea penultima
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #15
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea 3
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #14
    ld b, a
    ;;sub   #2
    ;;ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xFF
    inc l   
    ld      (hl),  #0xFF
    inc l
    ld      (hl),  #0x00

    ;;Linea 4
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #13
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x66
    inc l   
    ld      (hl),  #0x11
    inc l
    ld      (hl),  #0x00

    ;;Linea 5
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #12
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x88

    ;;Linea 6
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #11
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0xC4

    ;;Linea 7
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #10
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xF2
    inc l   
    ld      (hl),  #0xD0
    inc l
    ld      (hl),  #0xE2

    ;;Linea 8
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #9
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0xA2
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x62

    ;;Linea 9
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #8
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x11

    ;;Linea 10
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #7
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x31

    ;;Linea 11
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #6
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x71

    ;;Linea 12
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #5
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x22
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x31

    ;;Linea 13
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #4
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x32
    inc l   
    ld      (hl),  #0xC0
    inc l
    ld      (hl),  #0x11
    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #3
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x80
    inc l
    ld      (hl),  #0x31

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #2
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x76
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0xF1

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #1
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x33
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x62

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      b,  entity_y(ix)    
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x11
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x66

    ret









    ;;Borrar
    borrarCrocoPos1::
;;COCODRILO ABIERTO 
    ;;Linea ultima
    
    
    ;;Linea 13
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #4
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x0F
    inc l   
    ld      (hl),  #0x0F
    inc l
    ld      (hl),  #0x0F
    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #3
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x0F
    inc l   
    ld      (hl),  #0x0F
    inc l
    ld      (hl),  #0x0F

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #2
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x0F
    inc l   
    ld      (hl),  #0x0F
    inc l
    ld      (hl),  #0x0F

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #1
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x0F
    inc l   
    ld      (hl),  #0x0F
    inc l
    ld      (hl),  #0x0F

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      b,  entity_y(ix)    
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x0F
    inc l   
    ld      (hl),  #0x0F
    inc l
    ld      (hl),  #0x0F

    ret

    borrarCrocoPos2::


    ret

    borrarCrocoPos3::

    ret


    borrarCrocoPos4::

    ret


    borrarCrocoPos5::

    ;;Linea 12
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #8
    sub b
    ld b, a   
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 13
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #9
    sub b
    ld b, a   
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #10
    sub b
    ld b, a   
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #11
    sub b
    ld b, a   
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #12
    sub b
    ld b, a   
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix) 
    ld b, #13
    sub b
    ld b, a       
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00


    

    ret


    borrarCrocoPos6::
    ;;Linea 12
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #2
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00
;;Linea 13
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #3
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x0F
    inc l   
    ld      (hl),  #0x0F
    inc l
    ld      (hl),  #0x0F
    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #4
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #5
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #6
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #7
    sub b
    ld b, a  
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ret


    borrarCrocoPos7::
;;Linea 12
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #3
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 13
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #2
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00
    ;;Linea 14
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    add a, #1
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 15
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, a
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 16
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
    ld b, #1
    sub b
    ld b, a 
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ;;Linea 17
    ld      de, #0xC000      
    ld      c,  entity_x(ix)        
    ld      a,  entity_y(ix)
    ld b, #2
    sub b
    ld b, a     
    call cpct_getScreenPtr_asm
    ld      (hl),  #0x00
    inc l   
    ld      (hl),  #0x00
    inc l
    ld      (hl),  #0x00

    ret