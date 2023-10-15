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
.include "system/mainJuego.h.s"
.include "manager/entity_manager.h.s"

enemigoDerChoque::
    ld ix, #enemyPos
    ld  b, entity_x(ix)  ;;ix contendra el enemigo
    ld  ix, #playerPos  ;;(player)
    ld  a, entity_x(ix)
    
    inc a   ;;incremento a para que choque cuando coincide la mitad del cuadrado (misma X menos uno)
    derRestaAZ:
    dec a
    jr  nz, derRestaBZ
    dec b
    ret  nz
    call colision
    derRestaBZ:
    dec b    
    jr  nz,  derRestaAZ

    ret


enemigoIzqChoque::
    ld ix, #enemyIzqPos
    ld  b, entity_x(ix)  ;;ix contendra el enemigo
    ld  ix, #playerPos  ;;(player)
    ld  a, entity_x(ix)
    
    inc b   ;;incremento a para que choque cuando coincide la mitad del cuadrado (misma X menos uno)
    izqRestaAZ:
    dec b
    jr  nz, izqRestaBZ
    dec a
    ;;dec a
    ret  nz
    ;;dec a 
    ;;ret nz
    call colision
    izqRestaBZ:
    dec a    
    jr  nz,  izqRestaAZ

    ret

    enemigoIzq2Choque::
    ld ix, #enemyIzqPos2
    ld  b, entity_x(ix)  ;;ix contendra el enemigo
    ld  ix, #playerPos  ;;(player)
    ld  a, entity_x(ix)
    
    inc b   ;;incremento a para que choque cuando coincide la mitad del cuadrado (misma X menos uno)
    izq2RestaAZ:
    dec b
    jr  nz, izq2RestaBZ
    dec a
    ret  nz
    call colision
    izq2RestaBZ:
    dec a    
    jr  nz,  izq2RestaAZ
    dec b
    ret nz
    call colision

    ret

    enemigoDer2Choque::
    ld ix, #enemyDerPos2
    ld  b, entity_x(ix)  ;;ix contendra el enemigo
    ld  ix, #playerPos  ;;(player)
    ld  a, entity_x(ix)
    
    inc a   ;;incremento a para que choque cuando coincide la mitad del cuadrado (misma X menos uno)
    der2RestaAZ:
    dec a
    jr  nz, der2RestaBZ
    dec b
    ret  nz
    call colision
    der2RestaBZ:
    dec b    
    jr  nz,  der2RestaAZ
    dec a
    ret nz
    call colision

    ret