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
   .include "system/colisiones.h.s"
   .include "cpcfunciones.h.s"
   .include "manager/entity_manager.h.s"
   .include "system/render_system.h.s"
   .include "system/actualizarEnemigoAereo.h.s"
   .include "system/renderEnemigo1.h.s"
   .include "system/renderEnemigo2.h.s"
   .include "system/renderEnemigo3.h.s"
   .include "system/renderEnemigo4.h.s"
   .include "system/renderEnemigo5A.h.s"
   .include "system/renderCroco.h.s"
   
   ;;actualizarEnemigos:: 
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;;  ld  ix, #enemyPos  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
   ;; ld  ix, #enemyPos  ;;(enemy)
   ;;  ld entity_color(ix), #0xF0
   ;;  ld a, entity_x(ix)
   ;;  dec a
   ;;  ld entity_x(ix), a
   ;;  call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
;;
   ;;  ld  ix, #enemyIzqPos  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
   ;; ld  ix, #enemyIzqPos  ;;(enemy)
   ;;  ld entity_color(ix), #0xF0
   ;;  ld a, entity_x(ix)
   ;;  inc  a
   ;;  ld entity_x(ix), a
   ;;  call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
;;
   ;;  ld  ix, #enemyUp1Pos  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
   ;; ld  ix, #enemyUp1Pos  ;;(enemy)
   ;;  ld entity_color(ix), #0xF0
   ;;  ld a, entity_y(ix)
   ;;  inc a
   ;;  ld entity_y(ix), a
   ;;  call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
;;
   ;;  ld  ix, #enemyUp2Pos  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
   ;; ld  ix, #enemyUp2Pos  ;;(enemy)
   ;;  ld entity_color(ix), #0xF0
   ;;  ld a, entity_y(ix)
   ;;  inc a
   ;;  ld entity_y(ix), a
   ;;  call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
;;
   ;;  ld  ix, #enemyUp3Pos  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
   ;; ld  ix, #enemyUp3Pos  ;;(enemy)
   ;;  ld entity_color(ix), #0xF0
   ;;  ld a, entity_y(ix)
   ;;  inc a
   ;;  ld entity_y(ix), a
   ;;  call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
;;
   ;;  ld  ix, #enemyUp4Pos  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
   ;; ld  ix, #enemyUp4Pos  ;;(enemy)
   ;;  ld entity_color(ix), #0xF0
   ;;  ld a, entity_y(ix)
   ;;  inc a
   ;;  ld entity_y(ix), a
   ;;  call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
;;
   ;;  ld  ix, #enemyUp5Pos  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
   ;; ld  ix, #enemyUp5Pos  ;;(enemy)
   ;;  ld entity_color(ix), #0xF0
   ;;  ld a, entity_y(ix)
   ;;  inc a
   ;;  ld entity_y(ix), a
   ;; call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
;;
   ;; 
   ;; call enemigoDerChoque
   ;; call enemigoIzqChoque
;;
   ;; ret

    actualizarEnemigos1:: 
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;//comentamos la espera del nivel 1
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ld ix, #cooldownEnemigo1
    dec 0(ix)
    jr z, seActualiza1
    ld 0(ix), #1
    jr noseActualiza1
    seActualiza1:
     ld  ix, #enemyPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo1
    ld  ix, #enemyPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     dec a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo1
    noseActualiza1:

    call enemigoDerChoque

    
    
    ret

    actualizarEnemigos2::
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;//DESDE AQUI
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ld ix, #cooldownEnemigo1
    dec 0(ix)
    jr z, seActualiza2
    ld 0(ix), #1
    jr noseActualiza2
    seActualiza2:
      ld  ix, #enemyPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo1
    ld  ix, #enemyPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     dec a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo1
    noseActualiza2:

    call enemigoDerChoque

   ld ix, #cooldownEnemigo2
    dec 0(ix)
    jr z, seActualiza21
    ld 0(ix), #1
    jr noseActualiza21
    seActualiza21:
     ld  ix, #enemyIzqPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo2
    ld  ix, #enemyIzqPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     inc a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo2
   noseActualiza21:
    call enemigoIzqChoque

    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;;ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;; ld entity_color(ix), #0xF0
    ;; ld a, entity_x(ix)
    ;; inc  a
    ;; ld entity_x(ix), a
    ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
;;
    ;;call enemigoIzqChoque

    ret

    actualizarEnemigos3:: 
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;//AQUI
    ;;call cpct_waitVSYNC_asm
    ld ix, #cooldownEnemigo1
    dec 0(ix)
    jr z, seActualiza3
    ld 0(ix), #1
    jr noseActualiza3
    seActualiza3:
      ld  ix, #enemyPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo1
    ld  ix, #enemyPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     dec a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo1
   noseActualiza3:
    call enemigoDerChoque

ld ix, #cooldownEnemigo2
    dec 0(ix)
    jr z, seActualiza22
    ld 0(ix), #1
    jr noseActualiza22
    seActualiza22:
     ld  ix, #enemyIzqPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo2
    ld  ix, #enemyIzqPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     inc a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo2
   noseActualiza22:
    call enemigoIzqChoque

    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;;ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;; ld entity_color(ix), #0xF0
    ;; ld a, entity_x(ix)
    ;; inc  a
    ;; ld entity_x(ix), a
    ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
;;
    ;;call enemigoIzqChoque

    ld  ix, #enemyIzqPos2  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2  ;;(enemy)
     ld entity_color(ix), #0xFF
     ld a, entity_x(ix)
     inc  a
     ld entity_x(ix), a
     ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo3
    ;AQUI
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;AQUI
    ;call cpct_waitVSYNC_asm
    ;halt 
    ;halt
    ;halt
    ;;;;QUITAMOS LAS 2 VELOCIDADES

  ;;  ld  ix, #enemyIzqPos2  ;;(enemy)
  ;;   ld entity_color(ix), #0x00
  ;;  ;;call  entityman_getEntityArray_IX
  ;;  ;;call  entityman_getNumEntities_A
  ;;  ;;call  rendersys_update
  ;;  call borrarEnemigo3
  ;;  ld  ix, #enemyIzqPos2  ;;(enemy)
  ;;   ld entity_color(ix), #0xFF
  ;;   ld a, entity_x(ix)
  ;;   inc  a
  ;;   ld entity_x(ix), a
  ;;   call pintarEnemigo3
    ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    call enemigoIzq2Choque

    ;;ld  ix, #enemyDerPos2  ;;(enemy)
     ;;ld entity_color(ix), #0x00
    ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld  ix, #enemyDerPos2  ;;(enemy)
     ;ld entity_color(ix), #0x0F
     ;ld a, entity_x(ix)
    ; dec  a
    ; ld entity_x(ix), a
    ; call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld  ix, #enemyDerPos2  ;;(enemy)
    ; ld entity_color(ix), #0x00
   ; call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld  ix, #enemyDerPos2  ;;(enemy)
     ;ld entity_color(ix), #0x0F
     ;ld a, entity_x(ix)
     ;dec  a
    ; ld entity_x(ix), a
     ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update

     ;call enemigoDer2Choque

    
    
    

    ret

     actualizarEnemigos4:: 
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;AQUI
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ld ix, #cooldownEnemigo1
    dec 0(ix)
    jr z, seActualiza4
    ld 0(ix), #1
    jr noseActualiza4
    seActualiza4:
      ld  ix, #enemyPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo1
    ld  ix, #enemyPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     dec a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo1
    noseActualiza4:

    call enemigoDerChoque

ld ix, #cooldownEnemigo2
    dec 0(ix)
    jr z, seActualiza23
    ld 0(ix), #1
    jr noseActualiza23
    seActualiza23:
     ld  ix, #enemyIzqPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo2
    ld  ix, #enemyIzqPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     inc a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo2
   noseActualiza23:
    call enemigoIzqChoque

    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;;ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;; ld entity_color(ix), #0xF0
    ;; ld a, entity_x(ix)
    ;; inc  a
    ;; ld entity_x(ix), a
    ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
;;
    ;;call enemigoIzqChoque

    ld  ix, #enemyIzqPos2  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2  ;;(enemy)
     ld entity_color(ix), #0xFF
     ld a, entity_x(ix)
     inc  a
     ld entity_x(ix), a
     ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo3
    ;;AQUI
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;;;QUITAMOS LAS 2 VELOCIDADES
   ;; ld  ix, #enemyIzqPos2  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; ;;call  entityman_getEntityArray_IX
   ;; ;;call  entityman_getNumEntities_A
   ;; ;;call  rendersys_update
   ;; call borrarEnemigo3
   ;; ld  ix, #enemyIzqPos2  ;;(enemy)
   ;;  ld entity_color(ix), #0xFF
   ;;  ld a, entity_x(ix)
   ;;  inc  a
   ;;  ld entity_x(ix), a
   ;;  call pintarEnemigo3
    ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    call enemigoIzq2Choque

    ;;ld  ix, #enemyDerPos2  ;;(enemy)
     ;;ld entity_color(ix), #0x00
    ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld  ix, #enemyDerPos2  ;;(enemy)
     ;ld entity_color(ix), #0x0F
     ;ld a, entity_x(ix)
    ; dec  a
    ; ld entity_x(ix), a
    ; call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld  ix, #enemyDerPos2  ;;(enemy)
    ; ld entity_color(ix), #0x00
   ; call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld  ix, #enemyDerPos2  ;;(enemy)
     ;ld entity_color(ix), #0x0F
     ;ld a, entity_x(ix)
     ;dec  a
    ; ld entity_x(ix), a
     ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update

     ;call enemigoDer2Choque


   ld ix, #enemyUp1Pos
   call actualizarEnemigoAereo
    ret


    actualizarEnemigos5:: 
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;AQUI
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ld ix, #cooldownEnemigo1
    dec 0(ix)
    jr z, seActualiza5
    ld 0(ix), #1
    jr noseActualiza5
    seActualiza5:
      ld  ix, #enemyPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo1
    ld  ix, #enemyPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     dec a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo1
   noseActualiza5:
    call enemigoDerChoque

   ld ix, #cooldownEnemigo2
    dec 0(ix)
    jr z, seActualiza24
    ld 0(ix), #1
    jr noseActualiza24
    seActualiza24:
     ld  ix, #enemyIzqPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo2
    ld  ix, #enemyIzqPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     inc a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo2
   noseActualiza24:
    call enemigoIzqChoque

    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;;ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;; ld entity_color(ix), #0xF0
    ;; ld a, entity_x(ix)
    ;; inc  a
    ;; ld entity_x(ix), a
    ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
;;
    ;;call enemigoIzqChoque

    ld  ix, #enemyIzqPos2  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2  ;;(enemy)
     ld entity_color(ix), #0xFF
     ld a, entity_x(ix)
     inc  a
     ld entity_x(ix), a
     ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo3
    ;AQUI
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;;;QUITAMOS LAS 2 VELOCIDADES
   ;; ld  ix, #enemyIzqPos2  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; ;;call  entityman_getEntityArray_IX
   ;; ;;call  entityman_getNumEntities_A
   ;; ;;call  rendersys_update
   ;; call borrarEnemigo3
   ;; ld  ix, #enemyIzqPos2  ;;(enemy)
   ;;  ld entity_color(ix), #0xFF
   ;;  ld a, entity_x(ix)
   ;;  inc  a
   ;;  ld entity_x(ix), a
   ;;  call pintarEnemigo3
   ;; ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    call enemigoIzq2Choque


    ;;ld  ix, #enemyDerPos2  ;;(enemy)
     ;;ld entity_color(ix), #0x00
    ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld  ix, #enemyDerPos2  ;;(enemy)
     ;ld entity_color(ix), #0x0F
     ;ld a, entity_x(ix)
    ; dec  a
    ; ld entity_x(ix), a
    ; call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld  ix, #enemyDerPos2  ;;(enemy)
    ; ld entity_color(ix), #0x00
   ; call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld  ix, #enemyDerPos2  ;;(enemy)
     ;ld entity_color(ix), #0x0F
     ;ld a, entity_x(ix)
     ;dec  a
    ; ld entity_x(ix), a
     ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update

     ;call enemigoDer2Choque

   ld ix, #enemyUp1Pos
   call actualizarEnemigoAereo
   ;;ld ix, #enemyUp2Pos
   ;;call actualizarEnemigoAereo2
   ;;ld ix, #enemyUp3Pos
   ;;call actualizarEnemigoAereo3


   ld  ix, #crocodile  ;;(enemy)
    ld a, entity_estado(ix)
    dec a
    jp z, crocoPos1
    dec a 
    jr z, crocoPos2
    dec a 
    jr z, crocoPos3
    dec a 
    jr z, crocoPos4
    dec a 
    jr z, crocoPos5
    dec a 
    jr z, crocoPos6
    dec a 
    jr z, crocoPos7
    ;;Estado 8, estado de cooldown
    dec entity_vy(ix)
   jr z, finCDCroco
   jp seguirActualizacion5
   finCDCroco:
   ld entity_estado(ix), #1
   jp seguirActualizacion5
    crocoPos2:
    ld entity_estado(ix), #3
    call borrarCrocoPos2
    call pintarCrocoPos3
    jp seguirActualizacion5
    crocoPos3:
    ld entity_estado(ix), #4
    call borrarCrocoPos3
    call pintarCrocoPos4
    ld b,  entity_x(ix)
    ld ix, #playerPos
    ld a, entity_x(ix)
    sub b
    jr z, colisionCroco
    jp seguirActualizacion5
    colisionCroco:
   call colision
    crocoPos4:
    ld entity_estado(ix), #5
    call borrarCrocoPos4
    call pintarCrocoPos5
    ld b,  entity_x(ix)
    ld ix, #playerPos
    ld a, entity_x(ix)
    sub b
    jr z, colisionCroco2
    dec a
    jr z, colisionCroco2
    jp seguirActualizacion5
    colisionCroco2:
   call colision

    crocoPos5:
    ld entity_estado(ix), #6
    call borrarCrocoPos5
    call pintarCrocoPos3
    jp seguirActualizacion5
    crocoPos6:
    ld entity_estado(ix), #7
    call borrarCrocoPos6
    call pintarCrocoPos2
    jp seguirActualizacion5
    crocoPos7:
    ld entity_estado(ix), #8
    call borrarCrocoPos7
    call pintarCrocoPos1
    ld  ix, #crocodile
    ld entity_x(ix), #0
    ld entity_vy(ix), #5
    jp seguirActualizacion5
    crocoPos1:
    call borrarCrocoPos1
    ld  ix, #playerPos
    ld a, entity_x(ix)
    ld  ix, #crocodile
    ld b, entity_x(ix)
    sub b
    jr nz, saltaCroco

    encuentraEnemigo:
    inc entity_estado(ix)
    call pintarCrocoPos2 
    jp seguirActualizacion5
    saltaCroco:
    dec a
    jr z, encuentraEnemigo
    ;;dec a
    ;;jr z, encuentraEnemigo
     inc b
     ld entity_x(ix), b
     call pintarCrocoPos1
   ;;ld entity_color(ix), #0x00

   seguirActualizacion5:
  ;;  ld  ix, #enemyDerPos2  ;;(enemy)
  ;;   ld entity_color(ix), #0x00
  ;;   call borrarEnemigo4
  ;; ;; call  entityman_getEntityArray_IX
  ;; ;; call  entityman_getNumEntities_A
  ;; ;; call  rendersys_update
  ;;  ld  ix, #enemyDerPos2  ;;(enemy)
  ;;   ld entity_color(ix), #0x0F
  ;;   ld a, entity_x(ix)
  ;;   dec  a
  ;;   ld entity_x(ix), a
  ;;   call pintarEnemigo4
  ;;   call enemigoDer2Choque
    ret

    actualizarEnemigos6:: 
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;AQUI
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ld ix, #cooldownEnemigo1
    dec 0(ix)
    jr z, seActualiza6
    ld 0(ix), #1
    jr noseActualiza6
    seActualiza6:
      ld  ix, #enemyPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo1
    ld  ix, #enemyPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     dec a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo1
   noseActualiza6:
    call enemigoDerChoque

ld ix, #cooldownEnemigo2
    dec 0(ix)
    jr z, seActualiza25
    ld 0(ix), #1
    jr noseActualiza25
    seActualiza25:
     ld  ix, #enemyIzqPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo2
    ld  ix, #enemyIzqPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     inc a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo2
   noseActualiza25:
    call enemigoIzqChoque

    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;;ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;; ld entity_color(ix), #0xF0
    ;; ld a, entity_x(ix)
    ;; inc  a
    ;; ld entity_x(ix), a
    ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
;;
    ;;call enemigoIzqChoque

    ld  ix, #enemyIzqPos2  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2  ;;(enemy)
     ld entity_color(ix), #0xFF
     ld a, entity_x(ix)
     inc  a
     ld entity_x(ix), a
     ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo3
    ;AQUI
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;;;QUITAMOS LAS 2 VELOCIDADES
   ;; ld  ix, #enemyIzqPos2  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; ;;call  entityman_getEntityArray_IX
   ;; ;;call  entityman_getNumEntities_A
   ;; ;;call  rendersys_update
   ;; call borrarEnemigo3
   ;; ld  ix, #enemyIzqPos2  ;;(enemy)
   ;;  ld entity_color(ix), #0xFF
   ;;  ld a, entity_x(ix)
   ;;  inc  a
   ;;  ld entity_x(ix), a
   ;;  call pintarEnemigo3
   ;; ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    call enemigoIzq2Choque


    ld  ix, #enemyDerPos2  ;;(enemy)
     ld entity_color(ix), #0x00
     call borrarEnemigo4
   ;; call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
    ld  ix, #enemyDerPos2  ;;(enemy)
     ld entity_color(ix), #0x0F
     ld a, entity_x(ix)
     dec  a
     ld entity_x(ix), a
     call pintarEnemigo4
    ;AQUI
   ;;  call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;;  call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
   ;;BAJAR VELOCIDAD
 ;;   ld  ix, #enemyDerPos2  ;;(enemy)
 ;;    ld entity_color(ix), #0x00
 ;;    call borrarEnemigo4
 ;;   ;;call  entityman_getEntityArray_IX
 ;;   ;;call  entityman_getNumEntities_A
 ;;   ;;call  rendersys_update
 ;;   ld  ix, #enemyDerPos2  ;;(enemy)
 ;;    ld entity_color(ix), #0x0F
 ;;    ld a, entity_x(ix)
 ;;    dec  a
 ;;    ld entity_x(ix), a
 ;;    call pintarEnemigo4
    ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

     call enemigoDer2Choque

     ld  ix, #crocodile  ;;(enemy)
    ld a, entity_estado(ix)
    dec a
    jp z, crocoPos1N6
    dec a 
    jr z, crocoPos2N6
    dec a 
    jr z, crocoPos3N6
    dec a 
    jr z, crocoPos4N6
    dec a 
    jr z, crocoPos5N6
    dec a 
    jr z, crocoPos6N6
    dec a 
    jr z, crocoPos7N6
    ;;Estado 8, estado de cooldown
    dec entity_vy(ix)
   jr z, finCDCrocoN6
   jp seguirActualizacion6
   finCDCrocoN6:
   ld entity_estado(ix), #1
   jp seguirActualizacion6
    crocoPos2N6:
    ld entity_estado(ix), #3
    call borrarCrocoPos2
    call pintarCrocoPos3
    jp seguirActualizacion6
    crocoPos3N6:
    ld entity_estado(ix), #4
    call borrarCrocoPos3
    call pintarCrocoPos4
    ld b,  entity_x(ix)
    ld ix, #playerPos
    ld a, entity_x(ix)
    sub b
    jr z, colisionCrocoN6
    jp seguirActualizacion6
    colisionCrocoN6:
   call colision
    crocoPos4N6:
    ld entity_estado(ix), #5
    call borrarCrocoPos4
    call pintarCrocoPos5
    ld b,  entity_x(ix)
    ld ix, #playerPos
    ld a, entity_x(ix)
    sub b
    jr z, colisionCroco2N6
    dec a
    jr z, colisionCroco2N6
    jp seguirActualizacion6
    colisionCroco2N6:
   call colision

    crocoPos5N6:
    ld entity_estado(ix), #6
    call borrarCrocoPos5
    call pintarCrocoPos3
    jp seguirActualizacion6
    crocoPos6N6:
    ld entity_estado(ix), #7
    call borrarCrocoPos6
    call pintarCrocoPos2
    jp seguirActualizacion6
    crocoPos7N6:
    ld entity_estado(ix), #8
    call borrarCrocoPos7
    call pintarCrocoPos1
    ld  ix, #crocodile
    ld entity_x(ix), #0
    ld entity_vy(ix), #5
    jp seguirActualizacion6
    crocoPos1N6:
    call borrarCrocoPos1
    ld  ix, #playerPos
    ld a, entity_x(ix)
    ld  ix, #crocodile
    ld b, entity_x(ix)
    sub b
    jr nz, saltaCrocoN6
    encuentraEnemigoN6:
    inc entity_estado(ix)
    call pintarCrocoPos2 
    jp seguirActualizacion6
    saltaCrocoN6:
    dec a
    jr z, encuentraEnemigoN6
    ;;dec a
    ;;jr z, encuentraEnemigoN6
     inc b
     ld entity_x(ix), b
     call pintarCrocoPos1
   ;;ld entity_color(ix), #0x00
   seguirActualizacion6:

   ld ix, #enemyUp1Pos
  call actualizarEnemigoAereo
  ;; call borrarEnemigo5
  ;; ld ix, #enemyUp2Pos
  ;; call borrarEnemigo5
  ;; ;call actualizarEnemigoAereo2
  ;; ld ix, #enemyUp3Pos
  ;; call actualizarEnemigoAereo3
 ;; ld ix, #enemyUp1Pos
 ;;  call actualizarEnemigoAereo
 ;;  ld ix, #enemyUp2Pos
 ;;  call actualizarEnemigoAereo2
 ;;  ld ix, #enemyUp3Pos
 ;;  call actualizarEnemigoAereo3
    ret



    actualizarEnemigos7:: 
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;AQUI
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ld ix, #cooldownEnemigo1
    dec 0(ix)
    jr z, seActualiza7
    ld 0(ix), #1
    jr noseActualiza7
    seActualiza7:
      ld  ix, #enemyPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo1
    ld  ix, #enemyPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     dec a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo1
   noseActualiza7:
    call enemigoDerChoque

ld ix, #cooldownEnemigo2
    dec 0(ix)
    jr z, seActualiza26
    ld 0(ix), #1
    jr noseActualiza26
    seActualiza26:
     ld  ix, #enemyIzqPos  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo2
    ld  ix, #enemyIzqPos  ;;(enemy)
     ;;ld entity_color(ix), #0xF0
     ld a, entity_x(ix)
     inc a
     ld entity_x(ix), a
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo2
   noseActualiza26:
    call enemigoIzqChoque

    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;;ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    ;;ld  ix, #enemyIzqPos  ;;(enemy)
    ;; ld entity_color(ix), #0xF0
    ;; ld a, entity_x(ix)
    ;; inc  a
    ;; ld entity_x(ix), a
    ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
;;
    ;;call enemigoIzqChoque

    ld  ix, #enemyIzqPos2  ;;(enemy)
     ld entity_color(ix), #0x00
    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2  ;;(enemy)
     ld entity_color(ix), #0xFF
     ld a, entity_x(ix)
     inc  a
     ld entity_x(ix), a
     ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call pintarEnemigo3
    ;AQUI
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;call cpct_waitVSYNC_asm
    ;;halt 
    ;;halt
    ;;halt
    ;;;;QUITAMOS LAS 2 VELOCIDADES
   ;; ld  ix, #enemyIzqPos2  ;;(enemy)
   ;;  ld entity_color(ix), #0x00
   ;; ;;call  entityman_getEntityArray_IX
   ;; ;;call  entityman_getNumEntities_A
   ;; ;;call  rendersys_update
   ;; call borrarEnemigo3
   ;; ld  ix, #enemyIzqPos2  ;;(enemy)
   ;;  ld entity_color(ix), #0xFF
   ;;  ld a, entity_x(ix)
   ;;  inc  a
   ;;  ld entity_x(ix), a
   ;;  call pintarEnemigo3
   ;; ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    call enemigoIzq2Choque


    ld  ix, #enemyDerPos2  ;;(enemy)
     ld entity_color(ix), #0x00
     call borrarEnemigo4
   ;; call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
    ld  ix, #enemyDerPos2  ;;(enemy)
     ld entity_color(ix), #0x0F
     ld a, entity_x(ix)
     dec  a
     ld entity_x(ix), a
     call pintarEnemigo4
    ;AQUI
   ;;  call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;; call cpct_waitVSYNC_asm
   ;; halt 
   ;; halt
   ;; halt
   ;;  call  entityman_getEntityArray_IX
   ;; call  entityman_getNumEntities_A
   ;; call  rendersys_update
   ;;BAJAR VELOCIDAD
 ;;   ld  ix, #enemyDerPos2  ;;(enemy)
 ;;    ld entity_color(ix), #0x00
 ;;    call borrarEnemigo4
 ;;   ;;call  entityman_getEntityArray_IX
 ;;   ;;call  entityman_getNumEntities_A
 ;;   ;;call  rendersys_update
 ;;   ld  ix, #enemyDerPos2  ;;(enemy)
 ;;    ld entity_color(ix), #0x0F
 ;;    ld a, entity_x(ix)
 ;;    dec  a
 ;;    ld entity_x(ix), a
 ;;    call pintarEnemigo4
    ;; call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

     call enemigoDer2Choque

     ld  ix, #crocodile  ;;(enemy)
    ld a, entity_estado(ix)
    dec a
    jp z, crocoPos1N7
    dec a 
    jr z, crocoPos2N7
    dec a 
    jr z, crocoPos3N7
    dec a 
    jr z, crocoPos4N7
    dec a 
    jr z, crocoPos5N7
    dec a 
    jr z, crocoPos6N7
    dec a 
    jr z, crocoPos7N7
    ;;Estado 8, estado de cooldown
    dec entity_vy(ix)
   jr z, finCDCrocoN7
   jp seguirActualizacion7
   finCDCrocoN7:
   ld entity_estado(ix), #1
   jp seguirActualizacion7
    crocoPos2N7:
    ld entity_estado(ix), #3
    call borrarCrocoPos2
    call pintarCrocoPos3
    jp seguirActualizacion7
    crocoPos3N7:
    ld entity_estado(ix), #4
    call borrarCrocoPos3
    call pintarCrocoPos4
    ld b,  entity_x(ix)
    ld ix, #playerPos
    ld a, entity_x(ix)
    sub b
    jr z, colisionCrocoN7
    jp seguirActualizacion7
    colisionCrocoN7:
   call colision
    crocoPos4N7:
    ld entity_estado(ix), #5
    call borrarCrocoPos4
    call pintarCrocoPos5
    ld b,  entity_x(ix)
    ld ix, #playerPos
    ld a, entity_x(ix)
    sub b
    jr z, colisionCroco2N7
    dec a
    jr z, colisionCroco2N7
    jp seguirActualizacion7
    colisionCroco2N7:
   call colision

    crocoPos5N7:
    ld entity_estado(ix), #6
    call borrarCrocoPos5
    call pintarCrocoPos3
    jp seguirActualizacion7
    crocoPos6N7:
    ld entity_estado(ix), #7
    call borrarCrocoPos6
    call pintarCrocoPos2
    jp seguirActualizacion7
    crocoPos7N7:
    ld entity_estado(ix), #8
    call borrarCrocoPos7
    call pintarCrocoPos1
    ld  ix, #crocodile
    ld entity_x(ix), #0
    ld entity_vy(ix), #5
    jp seguirActualizacion7
    crocoPos1N7:
    call borrarCrocoPos1
    ld  ix, #playerPos
    ld a, entity_x(ix)
    ld  ix, #crocodile
    ld b, entity_x(ix)
    sub b
    jr nz, saltaCrocoN7
    
    encuentraEnemigoN7:
    inc entity_estado(ix)
    call pintarCrocoPos2 
    jp seguirActualizacion7
    saltaCrocoN7:
    dec a
    jr z, encuentraEnemigoN7
    ;;dec a
    ;;jr z, encuentraEnemigoN7
     inc b
     ld entity_x(ix), b
     call pintarCrocoPos1
   ;;ld entity_color(ix), #0x00
   seguirActualizacion7:

   ld ix, #enemyUp1Pos
  call actualizarEnemigoAereo
  ;; call borrarEnemigo5
   ld ix, #enemyUp2Pos
  ;; call borrarEnemigo5
  call actualizarEnemigoAereo2
   ld ix, #enemyUp3Pos
   call actualizarEnemigoAereo3
 ;; ld ix, #enemyUp1Pos
 ;;  call actualizarEnemigoAereo
 ;;  ld ix, #enemyUp2Pos
 ;;  call actualizarEnemigoAereo2
 ;;  ld ix, #enemyUp3Pos
 ;;  call actualizarEnemigoAereo3
    ret