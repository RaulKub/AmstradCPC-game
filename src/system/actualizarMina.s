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
.include "mainJuego.h.s"
.include "system/render_system.h.s"
.include "system/renderEspada.h.s"
.include "system/renderEnemigo1.h.s"
.include "system/renderEnemigo2.h.s"
.include "system/renderEnemigo3.h.s"
.include "system/renderEnemigo4.h.s"

muerteporMina:: .db #0


actualizarMina::
    ld ix, #Mina
    ld a, 0(ix)
    dec a
    jr z, colocada
    ret

    colocada:
    ld a, 2(ix)
    dec a 
    jr z, Encendida
    dec a 
    jp z, Explotando
    ;;APAGADA:
    dec 3(ix)
    jr z, Encender
    ;;REDIBUJAR APAGADA
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF0  
    ret
    Encender:
    ld 2(ix), #1
    ;;REDIBUJAR ENCENDIDA
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF0 
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0x66 
    ret

    Encendida:
    ld b, 1(ix)
    ld ix, #playerPos
    ld a, entity_x(ix)
    sub b
    jp z, colisionMina
    ld ix, #enemyPos
    ld a, entity_x(ix)
    sub b
    jp z, colisionEnemigoDerecha1
    ld ix, #enemyIzqPos
    ld a, entity_x(ix)
    sub b
    jp z, colisionEnemigoIzquierda1
    ld ix, #enemyIzqPos2
    ld a, entity_x(ix)
    sub b
    jp z, colisionEnemigoIzquierda2
    dec a 
    jp z, colisionEnemigoIzquierda2  ;;Añadimos dos bytes para el enemigo rapido
    ld ix, #enemyDerPos2
    ld a, entity_x(ix)
    sub b
    jp z, colisionEnemigoDerecha2
    dec a 
    jp z, colisionEnemigoDerecha2  ;;Añadimos dos bytes para el enemigo rapido
    ;;REDIBUJAR ENCENDIDA
    ld ix, #Mina
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF0 
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0x66
    ret

    colisionMina:
    ;;PINTAR EXPLOSION PARTE 1
    ld ix, #Mina
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11
    ld a, #20
    esperaExp8:
    halt
    dec a 
    jr nz, esperaExp8
    ;;EXPLOSION GRANDE
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1 
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF3
    dec l
    ld (hl), #0xFC
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2 
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8B
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8A
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x89
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x88
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11
    ld ix, #muerteporMina
    ld 0(ix), #1
    jp colision

    colisionEnemigoDerecha1:
    ;;Eliminar el enemigo derecha
    call borrarEnemigo1
    ld ix, #Mina 
    ld 2(ix), #2
    ld  ix, #enemyPos
    ld  entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #wallDPos
    ld  a, entity_vy(ix)
    dec a
    ld  entity_vy(ix), a
    ld  ix, #wallIPos
    ld  a, entity_estado(ix)
    inc a
    ld  entity_estado(ix), a
    ;;PINTAR EXPLOSION PARTE 1
    ld ix, #Mina
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11
    ld a, #20
    esperaExp:
    halt
    dec a 
    jr nz, esperaExp
    ;;EXPLOSION GRANDE
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1 
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF3
    dec l
    ld (hl), #0xFC
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2 
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8B
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8A
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x89
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x88
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11
    ret
    colisionEnemigoIzquierda1:
    call borrarEnemigo2
    ld ix, #Mina 
    ld 2(ix), #2
    ;;Eliminar el enemigo izquierda
    
    ld  ix, #enemyIzqPos
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2

    ld  ix, #wallDPos
    ld  a, entity_vy(ix)
    dec a
    ld  entity_vy(ix), a
    ld  ix, #wallIPos
    ld  a, entity_estado(ix)
    inc a
    ld  entity_estado(ix), a
    ;;PINTAR EXPLOSION PARTE 1
    ld ix, #Mina
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11
    ld a, #20
    esperaExp2:
    halt
    dec a 
    jr nz, esperaExp2
    ;;EXPLOSION GRANDE
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1 
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF3
    dec l
    ld (hl), #0xFC
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2 
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8B
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8A
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x89
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x88
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11
    ret
    colisionEnemigoIzquierda2:
    call borrarEnemigo3
    ld ix, #Mina 
    ld 2(ix), #2
    ;;Eliminar el enemigo rapido
    
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3
    ld  ix, #wallIPos
    ld  a, entity_estado(ix)
    inc a
    inc a
    ld  entity_estado(ix), a
    ;;PINTAR EXPLOSION PARTE 1
    ld ix, #Mina
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11
    ld a, #20
    esperaExp3:
    halt
    dec a 
    jr nz, esperaExp3
    ;;EXPLOSION GRANDE
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1 
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF3
    dec l
    ld (hl), #0xFC
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2 
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8B
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8A
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x89
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x88
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11


    ret

    colisionEnemigoDerecha2:
    call borrarEnemigo4
    ld ix, #Mina 
    ld 2(ix), #2
    ;;Eliminar el enemigo rapido
    
    ld  ix, #enemyDerPos2
    ld  entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo4
    ld  ix, #wallIPos
    ld  a, entity_estado(ix)
    inc a
    inc a
    ld  entity_estado(ix), a
    ;;PINTAR EXPLOSION PARTE 1
    ld ix, #Mina
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11
    ld a, #20
    esperaExpDerecha:
    halt
    dec a 
    jr nz, esperaExpDerecha
    ;;EXPLOSION GRANDE
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1 
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF3
    dec l
    ld (hl), #0xFC
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2 
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8B
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8A
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x89
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x88
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11


    ret


    Explotando:
    ;;EXPLOSION GRANDE INVERTIDA
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xFE
    dec l
    ld (hl), #0xF7
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xFE
    dec l
    ld (hl), #0xF7
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xFC
    dec l
    ld (hl), #0xF3
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0xEC 
    dec l
    ld (hl), #0x73
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8B
    call cpct_getScreenPtr_asm 
    ld (hl), #0xEC
    dec l
    ld (hl), #0x73
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8A
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC8 
    dec l
    ld (hl), #0x31
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x89
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC8
    dec l
    ld (hl), #0x31
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x88
    call cpct_getScreenPtr_asm 
    ld (hl), #0x80 
    dec l
    ld (hl), #0x10
    ld a, #5
    esperaExp4:
    halt
    dec a 
    jr nz, esperaExp4
    ;;EXPLOSION GRANDE
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF1 
    dec l
    ld (hl), #0xF8
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF3
    dec l
    ld (hl), #0xFC
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2 
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8B
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8A
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x89
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x88
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11
    ld a, #5
    esperaExp5:
    halt
    dec a 
    jr nz, esperaExp5
    ;;EXPLOSION GRANDE INVERTIDA
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xFE
    dec l
    ld (hl), #0xF7
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xFE
    dec l
    ld (hl), #0xF7
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xFC
    dec l
    ld (hl), #0xF3
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0xEC 
    dec l
    ld (hl), #0x73
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8B
    call cpct_getScreenPtr_asm 
    ld (hl), #0xEC
    dec l
    ld (hl), #0x73
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8A
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC8 
    dec l
    ld (hl), #0x31
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x89
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC8
    dec l
    ld (hl), #0x31
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x88
    call cpct_getScreenPtr_asm 
    ld (hl), #0x80 
    dec l
    ld (hl), #0x10
    ld a, #5
    esperaExp6:
    halt
    dec a 
    jr nz, esperaExp6
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0xE2
    dec l
    ld (hl), #0x74
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4 
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0xC4
    dec l
    ld (hl), #0x32
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0x88 
    dec l
    ld (hl), #0x11
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8B
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8A
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00 
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x89
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x88
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00 
    dec l
    ld (hl), #0x00


    ld a, #5
    esperaExp7:
    halt
    dec a 
    jr nz, esperaExp7
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00 
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00 
    dec l
    ld (hl), #0x00
    ld ix, #Mina 
    ld 2(ix), #0
    ld 0(ix), #0
    ret

    borrarExplosion::
    ld ix, #Mina 
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8F
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8E
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8D
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8C
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x8B
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x8A
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00 
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)
    ld      b,  #0x89
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00
    dec l
    ld (hl), #0x00
    ld      de, #0xC000   
    ld      c,  1(ix)          
    ld      b,  #0x88
    call cpct_getScreenPtr_asm 
    ld (hl), #0x00 
    dec l
    ld (hl), #0x00
    
 
ret