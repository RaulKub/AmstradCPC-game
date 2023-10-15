ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;This file is part of Kubso.
                              2 ;;
                              3 ;;Kubso is free software: you can redistribute it and/or modify
                              4 ;;it under the terms of the GNU General Public License as published by
                              5 ;;the Free Software Foundation, either version 3 of the License, or
                              6 ;;(at your option) any later version.
                              7 ;;
                              8 ;;Kubso is distributed in the hope that it will be useful,
                              9 ;;but WITHOUT ANY WARRANTY; without even the implied warranty of
                             10 ;;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             11 ;;GNU General Public License for more details.
                             12 ;;
                             13 ;;You should have received a copy of the GNU General Public License
                             14 ;;along with Kubso.  If not, see <https://www.gnu.org/licenses/>.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             15 .include "cpcfunciones.h.s"
                              1 ;;This file is part of Kubso.
                              2 ;;
                              3 ;;Kubso is free software: you can redistribute it and/or modify
                              4 ;;it under the terms of the GNU General Public License as published by
                              5 ;;the Free Software Foundation, either version 3 of the License, or
                              6 ;;(at your option) any later version.
                              7 ;;
                              8 ;;Kubso is distributed in the hope that it will be useful,
                              9 ;;but WITHOUT ANY WARRANTY; without even the implied warranty of
                             10 ;;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             11 ;;GNU General Public License for more details.
                             12 ;;
                             13 ;;You should have received a copy of the GNU General Public License
                             14 ;;along with Kubso.  If not, see <https://www.gnu.org/licenses/>.
                             15 .globl cpct_disableFirmware_asm
                             16 .globl cpct_getScreenPtr_asm
                             17 .globl cpct_setDrawCharM1_asm
                             18 .globl cpct_drawStringM1_asm
                             19 .globl cpct_waitVSYNC_asm
                             20 .globl cpct_isAnyKeyPressed_f_asm
                             21 .globl cpct_scanKeyboard_f_asm
                             22 .globl cpct_drawSolidBox_asm
                             23 .globl cpct_isKeyPressed_asm
                             24 .globl cpct_waitVSYNC_asm
                             25 .globl cpct_setVideoMode_asm
                             26 .globl cpct_setPalette_asm
                             27 .globl cpct_getHWColour_asm
                             28 .globl cpct_drawSprite_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             16 .include "manager/entity_manager.h.s"
                              1 ;;This file is part of Kubso.
                              2 ;;
                              3 ;;Kubso is free software: you can redistribute it and/or modify
                              4 ;;it under the terms of the GNU General Public License as published by
                              5 ;;the Free Software Foundation, either version 3 of the License, or
                              6 ;;(at your option) any later version.
                              7 ;;
                              8 ;;Kubso is distributed in the hope that it will be useful,
                              9 ;;but WITHOUT ANY WARRANTY; without even the implied warranty of
                             10 ;;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             11 ;;GNU General Public License for more details.
                             12 ;;
                             13 ;;You should have received a copy of the GNU General Public License
                             14 ;;along with Kubso.  If not, see <https://www.gnu.org/licenses/>.
                             15 .globl entityman_init
                             16 .globl entityman_create
                             17 .globl _num_entities
                             18 .globl _entity_array
                             19 .globl entity_size
                             20 .globl entityman_getNumEntities_A
                             21 .globl entityman_getEntityArray_IX
                             22 .globl reset
                             23 
                             24 .macro  DefineEntity _name, _x, _y, _w, _h, _vx, _vy, _color
                             25 _name::
                             26    .db  _x
                             27    .db  _y
                             28    .db  _w
                             29    .db  _h
                             30    .db  _vx
                             31    .db  _vy
                             32    .db  _color
                             33 .endm
                             34 
                     0000    35 entity_x = 0
                     0001    36 entity_y = 1
                     0002    37 entity_w = 2
                     0003    38 entity_h = 3
                     0004    39 entity_estado = 4
                     0005    40 entity_vy = 5
                     0006    41 entity_color = 6
                     0007    42 sizeof_entity = 7
                             43 
                             44 
                             45 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             17 .include "system/mainJuego.h.s"
                              1 ;;This file is part of Kubso.
                              2 ;;
                              3 ;;Kubso is free software: you can redistribute it and/or modify
                              4 ;;it under the terms of the GNU General Public License as published by
                              5 ;;the Free Software Foundation, either version 3 of the License, or
                              6 ;;(at your option) any later version.
                              7 ;;
                              8 ;;Kubso is distributed in the hope that it will be useful,
                              9 ;;but WITHOUT ANY WARRANTY; without even the implied warranty of
                             10 ;;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             11 ;;GNU General Public License for more details.
                             12 ;;
                             13 ;;You should have received a copy of the GNU General Public License
                             14 ;;along with Kubso.  If not, see <https://www.gnu.org/licenses/>.
                             15 .globl GameStart
                             16 .globl colision
                             17 .globl Mina
                             18 .globl Inicio
                             19 .globl letrasborradas
                             20 .globl cooldownEnemigo1
                             21 .globl cooldownEnemigo2
                             22 .globl cooldownMisil
                             23 .globl letrasborradas
                             24 .globl nivelactual
                             25 .globl cargaNivel
                             26 .globl vidas
                             27 
                             28 
                             29 
                     4003    30 playerPos = #0x4003
                     400A    31 espadaPos = #0x400A
                     4011    32 wallIPos = #0x4011
                     4018    33 wallDPos = #0x4018
                     401F    34 enemyPos = #0x401F
                     4026    35 crocodile = #0x4026
                     402D    36 enemyIzqPos = #0x402D
                     4034    37 enemyIzqPos2 = #0x4034
                     403B    38 enemyUp1Pos = #0x403B
                     4042    39 enemyUp2Pos = #0x4042
                     4049    40 enemyUp3Pos = #0x4049
                     4050    41 enemyDerPos2 = #0x4050
                     4057    42 enemyUp4Pos = #0x4057
                     405E    43 enemyIzqPos3 = #0x405E
                     4065    44 enemyUp5Pos = #0x4065
                             45 ;;crocodile = #0x4178
                     406C    46 enemyDerPos3 = #0x406C
                             47 ;;croco = #0x417F
                             48 
                             49 
                             50 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             18 
   83F4                      19 pintarEnemigo3::
   83F4 DD 21 34 40   [14]   20     ld ix, #enemyIzqPos2
   83F8 DD 7E 04      [19]   21     ld a, entity_estado(ix)
   83FB 3D            [ 4]   22     dec a
   83FC CA 42 85      [10]   23     jp z, renderPos1
   83FF 3D            [ 4]   24     dec a
   8400 CA 7E 86      [10]   25     jp z, renderPos2
                             26 
   8403                      27     renderPos0:
   8403 DD 36 04 01   [19]   28     ld entity_estado(ix), #1
                             29     
   8407 11 00 C0      [10]   30    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   840A DD 4E 00      [19]   31     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   840D DD 46 01      [19]   32     ld      b,  entity_y(ix)  
   8410 04            [ 4]   33     inc b       
   8411 04            [ 4]   34     inc b
   8412 04            [ 4]   35     inc b 
   8413 04            [ 4]   36     inc b
   8414 04            [ 4]   37     inc b
   8415 04            [ 4]   38     inc b 
   8416 04            [ 4]   39     inc b
   8417 CD 6C B0      [17]   40     call cpct_getScreenPtr_asm 
   841A 36 EE         [10]   41     ld (hl), #0xEE
   841C 2C            [ 4]   42     inc l
   841D 36 00         [10]   43    ld (hl), #0x00
                             44 
                             45 
                             46    ;;-----------
   841F 11 00 C0      [10]   47    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8422 DD 4E 00      [19]   48     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8425 DD 46 01      [19]   49     ld      b,  entity_y(ix)  
   8428 04            [ 4]   50     inc b       
   8429 04            [ 4]   51     inc b
   842A 04            [ 4]   52     inc b 
   842B 04            [ 4]   53     inc b
   842C 04            [ 4]   54     inc b 
   842D 04            [ 4]   55     inc b
   842E CD 6C B0      [17]   56     call cpct_getScreenPtr_asm 
   8431 36 3F         [10]   57     ld (hl), #0x3F
   8433 2C            [ 4]   58     inc l
   8434 36 55         [10]   59    ld (hl), #0x55
                             60 
                             61    ;;-------------
   8436 11 00 C0      [10]   62    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8439 DD 4E 00      [19]   63     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   843C DD 46 01      [19]   64     ld      b,  entity_y(ix)  
   843F 04            [ 4]   65     inc b       
   8440 04            [ 4]   66     inc b
   8441 04            [ 4]   67     inc b 
   8442 04            [ 4]   68     inc b
   8443 04            [ 4]   69     inc b 
   8444 CD 6C B0      [17]   70     call cpct_getScreenPtr_asm 
   8447 36 1F         [10]   71     ld (hl), #0x1F
   8449 2C            [ 4]   72     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   844A 36 A0         [10]   73    ld (hl), #0xA0
                             74 
                             75    ;;---------------------
   844C 11 00 C0      [10]   76    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   844F DD 4E 00      [19]   77     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8452 DD 46 01      [19]   78     ld      b,  entity_y(ix)  
   8455 04            [ 4]   79     inc b       
   8456 04            [ 4]   80     inc b
   8457 04            [ 4]   81     inc b 
   8458 04            [ 4]   82     inc b
   8459 CD 6C B0      [17]   83     call cpct_getScreenPtr_asm 
   845C 36 1F         [10]   84     ld (hl), #0x1F
   845E 2C            [ 4]   85     inc l
   845F 36 A0         [10]   86    ld (hl), #0xA0
                             87 
                             88    ;;-----------
   8461 11 00 C0      [10]   89    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8464 DD 4E 00      [19]   90     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8467 DD 46 01      [19]   91     ld      b,  entity_y(ix)  
   846A 04            [ 4]   92     inc b       
   846B 04            [ 4]   93     inc b
   846C 04            [ 4]   94     inc b
   846D CD 6C B0      [17]   95     call cpct_getScreenPtr_asm 
   8470 36 1F         [10]   96     ld (hl), #0x1F
   8472 2C            [ 4]   97     inc l
   8473 36 EC         [10]   98    ld (hl), #0xEC
                             99 
                            100    ;;-----------
   8475 11 00 C0      [10]  101    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8478 DD 4E 00      [19]  102     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   847B DD 46 01      [19]  103     ld      b,  entity_y(ix)  
   847E 04            [ 4]  104     inc b       
   847F 04            [ 4]  105     inc b
   8480 CD 6C B0      [17]  106     call cpct_getScreenPtr_asm 
   8483 36 1F         [10]  107     ld (hl), #0x1F
   8485 2C            [ 4]  108     inc l
   8486 36 D2         [10]  109    ld (hl), #0xD2
                            110 
                            111    ;;-----------
   8488 11 00 C0      [10]  112    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   848B DD 4E 00      [19]  113     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   848E DD 46 01      [19]  114     ld      b,  entity_y(ix)  
   8491 04            [ 4]  115     inc b 
   8492 CD 6C B0      [17]  116     call cpct_getScreenPtr_asm
   8495 36 1F         [10]  117     ld (hl), #0x1F
   8497 2C            [ 4]  118     inc l 
   8498 36 FC         [10]  119    ld (hl), #0xFC
                            120 
                            121    ;;-----------
   849A 11 00 C0      [10]  122    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   849D DD 4E 00      [19]  123     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   84A0 DD 46 01      [19]  124     ld      b,  entity_y(ix)  
   84A3 CD 6C B0      [17]  125     call cpct_getScreenPtr_asm 
   84A6 36 1F         [10]  126     ld (hl), #0x1F
   84A8 2C            [ 4]  127     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   84A9 36 D2         [10]  128    ld (hl), #0xD2
                            129 
                            130    ;;-----------
   84AB 11 00 C0      [10]  131    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   84AE DD 4E 00      [19]  132     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   84B1 DD 46 01      [19]  133     ld      b,  entity_y(ix)  
   84B4 05            [ 4]  134     dec b
   84B5 CD 6C B0      [17]  135     call cpct_getScreenPtr_asm
   84B8 36 1F         [10]  136     ld (hl), #0x1F
   84BA 2C            [ 4]  137     inc l 
   84BB 36 EC         [10]  138    ld (hl), #0xEC
                            139 
                            140    ;;-----------
   84BD 11 00 C0      [10]  141    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   84C0 DD 4E 00      [19]  142     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   84C3 DD 46 01      [19]  143     ld      b,  entity_y(ix)  
   84C6 05            [ 4]  144     dec b       
   84C7 05            [ 4]  145     dec b
   84C8 CD 6C B0      [17]  146     call cpct_getScreenPtr_asm
   84CB 36 1F         [10]  147     ld (hl), #0x1F
   84CD 2C            [ 4]  148     inc l 
   84CE 36 A0         [10]  149    ld (hl), #0xA0
                            150 
                            151    ;;-----------
   84D0 11 00 C0      [10]  152    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   84D3 DD 4E 00      [19]  153     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   84D6 DD 46 01      [19]  154     ld      b,  entity_y(ix)  
   84D9 05            [ 4]  155     dec b       
   84DA 05            [ 4]  156     dec b
   84DB 05            [ 4]  157     dec b
   84DC CD 6C B0      [17]  158     call cpct_getScreenPtr_asm 
   84DF 36 3F         [10]  159     ld (hl), #0x3F
   84E1 2C            [ 4]  160     inc l
   84E2 36 55         [10]  161    ld (hl), #0x55
                            162    ;;-----------
   84E4 11 00 C0      [10]  163    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   84E7 DD 4E 00      [19]  164     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   84EA DD 46 01      [19]  165     ld      b,  entity_y(ix)  
   84ED 05            [ 4]  166     dec b       
   84EE 05            [ 4]  167     dec b
   84EF 05            [ 4]  168     dec b
   84F0 05            [ 4]  169     dec b
   84F1 CD 6C B0      [17]  170     call cpct_getScreenPtr_asm 
   84F4 36 EE         [10]  171     ld (hl), #0xEE
   84F6 2C            [ 4]  172     inc l
   84F7 36 00         [10]  173    ld (hl), #0x00
                            174 ;;-----------
   84F9 11 00 C0      [10]  175    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   84FC DD 4E 00      [19]  176     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   84FF DD 46 01      [19]  177     ld      b,  entity_y(ix)  
   8502 05            [ 4]  178     dec b       
   8503 05            [ 4]  179     dec b
   8504 05            [ 4]  180     dec b
   8505 05            [ 4]  181     dec b
   8506 05            [ 4]  182     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   8507 CD 6C B0      [17]  183     call cpct_getScreenPtr_asm 
   850A 36 00         [10]  184     ld (hl), #0x00
   850C 2C            [ 4]  185     inc l
   850D 36 00         [10]  186    ld (hl), #0x00
                            187 ;;-----------
   850F 11 00 C0      [10]  188    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8512 DD 4E 00      [19]  189     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8515 DD 46 01      [19]  190     ld      b,  entity_y(ix)  
   8518 05            [ 4]  191     dec b       
   8519 05            [ 4]  192     dec b
   851A 05            [ 4]  193     dec b
   851B 05            [ 4]  194     dec b
   851C 05            [ 4]  195     dec b
   851D 05            [ 4]  196     dec b
   851E CD 6C B0      [17]  197     call cpct_getScreenPtr_asm 
   8521 36 00         [10]  198     ld (hl), #0x00
   8523 2C            [ 4]  199     inc l
   8524 36 00         [10]  200    ld (hl), #0x00
                            201 ;;-----------
   8526 11 00 C0      [10]  202    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8529 DD 4E 00      [19]  203     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   852C DD 46 01      [19]  204     ld      b,  entity_y(ix)  
   852F 05            [ 4]  205     dec b       
   8530 05            [ 4]  206     dec b
   8531 05            [ 4]  207     dec b
   8532 05            [ 4]  208     dec b
   8533 05            [ 4]  209     dec b
   8534 05            [ 4]  210     dec b
   8535 05            [ 4]  211     dec b
   8536 CD 6C B0      [17]  212     call cpct_getScreenPtr_asm 
   8539 36 00         [10]  213     ld (hl), #0x00
   853B 2C            [ 4]  214     inc l
   853C 36 00         [10]  215    ld (hl), #0x00
                            216 
   853E DD 34 00      [23]  217    inc entity_x(ix)
                            218 
   8541 C9            [10]  219 ret
                            220 
                            221 
   8542                     222     renderPos1:
   8542 DD 36 04 02   [19]  223     ld entity_estado(ix), #2
   8546 11 00 C0      [10]  224      ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8549 DD 4E 00      [19]  225     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   854C DD 46 01      [19]  226     ld      b,  entity_y(ix)  
   854F 04            [ 4]  227     inc b       
   8550 04            [ 4]  228     inc b
   8551 04            [ 4]  229     inc b 
   8552 04            [ 4]  230     inc b
   8553 04            [ 4]  231     inc b
   8554 04            [ 4]  232     inc b 
   8555 04            [ 4]  233     inc b
   8556 CD 6C B0      [17]  234     call cpct_getScreenPtr_asm 
   8559 36 11         [10]  235     ld (hl), #0x11
   855B 2C            [ 4]  236     inc l
   855C 36 55         [10]  237    ld (hl), #0x55
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                            238 
                            239 
                            240    ;;-----------
   855E 11 00 C0      [10]  241    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8561 DD 4E 00      [19]  242     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8564 DD 46 01      [19]  243     ld      b,  entity_y(ix)  
   8567 04            [ 4]  244     inc b       
   8568 04            [ 4]  245     inc b
   8569 04            [ 4]  246     inc b 
   856A 04            [ 4]  247     inc b
   856B 04            [ 4]  248     inc b 
   856C 04            [ 4]  249     inc b
   856D CD 6C B0      [17]  250     call cpct_getScreenPtr_asm 
   8570 36 20         [10]  251     ld (hl), #0x20
   8572 2C            [ 4]  252     inc l
   8573 36 A0         [10]  253    ld (hl), #0xA0
                            254 
                            255    ;;-------------
   8575 11 00 C0      [10]  256    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8578 DD 4E 00      [19]  257     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   857B DD 46 01      [19]  258     ld      b,  entity_y(ix)  
   857E 04            [ 4]  259     inc b       
   857F 04            [ 4]  260     inc b
   8580 04            [ 4]  261     inc b 
   8581 04            [ 4]  262     inc b
   8582 04            [ 4]  263     inc b 
   8583 CD 6C B0      [17]  264     call cpct_getScreenPtr_asm 
   8586 36 BB         [10]  265     ld (hl), #0xBB
   8588 2C            [ 4]  266     inc l
   8589 36 EC         [10]  267    ld (hl), #0xEC
                            268 
                            269    ;;---------------------
   858B 11 00 C0      [10]  270    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   858E DD 4E 00      [19]  271     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8591 DD 46 01      [19]  272     ld      b,  entity_y(ix)  
   8594 04            [ 4]  273     inc b       
   8595 04            [ 4]  274     inc b
   8596 04            [ 4]  275     inc b 
   8597 04            [ 4]  276     inc b
   8598 CD 6C B0      [17]  277     call cpct_getScreenPtr_asm 
   859B 36 70         [10]  278     ld (hl), #0x70
   859D 2C            [ 4]  279     inc l
   859E 36 D2         [10]  280    ld (hl), #0xD2
                            281 
                            282    ;;-----------
   85A0 11 00 C0      [10]  283    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   85A3 DD 4E 00      [19]  284     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   85A6 DD 46 01      [19]  285     ld      b,  entity_y(ix)  
   85A9 04            [ 4]  286     inc b       
   85AA 04            [ 4]  287     inc b
   85AB 04            [ 4]  288     inc b
   85AC CD 6C B0      [17]  289     call cpct_getScreenPtr_asm 
   85AF 36 77         [10]  290     ld (hl), #0x77
   85B1 2C            [ 4]  291     inc l
   85B2 36 FC         [10]  292    ld (hl), #0xFC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            293 
                            294    ;;-----------
   85B4 11 00 C0      [10]  295    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   85B7 DD 4E 00      [19]  296     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   85BA DD 46 01      [19]  297     ld      b,  entity_y(ix)  
   85BD 04            [ 4]  298     inc b       
   85BE 04            [ 4]  299     inc b
   85BF CD 6C B0      [17]  300     call cpct_getScreenPtr_asm 
   85C2 36 70         [10]  301     ld (hl), #0x70
   85C4 2C            [ 4]  302     inc l
   85C5 36 D2         [10]  303    ld (hl), #0xD2
                            304 
                            305    ;;-----------
   85C7 11 00 C0      [10]  306    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   85CA DD 4E 00      [19]  307     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   85CD DD 46 01      [19]  308     ld      b,  entity_y(ix)  
   85D0 04            [ 4]  309     inc b 
   85D1 CD 6C B0      [17]  310     call cpct_getScreenPtr_asm
   85D4 36 BB         [10]  311     ld (hl), #0xBB
   85D6 2C            [ 4]  312     inc l 
   85D7 36 EC         [10]  313    ld (hl), #0xEC
                            314 
                            315    ;;-----------
   85D9 11 00 C0      [10]  316    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   85DC DD 4E 00      [19]  317     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   85DF DD 46 01      [19]  318     ld      b,  entity_y(ix)  
   85E2 CD 6C B0      [17]  319     call cpct_getScreenPtr_asm 
   85E5 36 20         [10]  320     ld (hl), #0x20
   85E7 2C            [ 4]  321     inc l
   85E8 36 A0         [10]  322    ld (hl), #0xA0
                            323 
                            324    ;;-----------
   85EA 11 00 C0      [10]  325    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   85ED DD 4E 00      [19]  326     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   85F0 DD 46 01      [19]  327     ld      b,  entity_y(ix)  
   85F3 05            [ 4]  328     dec b
   85F4 CD 6C B0      [17]  329     call cpct_getScreenPtr_asm
   85F7 36 11         [10]  330     ld (hl), #0x11
   85F9 2C            [ 4]  331     inc l 
   85FA 36 55         [10]  332    ld (hl), #0x55
                            333 
                            334    ;;-----------
   85FC 11 00 C0      [10]  335    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   85FF DD 4E 00      [19]  336     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8602 DD 46 01      [19]  337     ld      b,  entity_y(ix)  
   8605 05            [ 4]  338     dec b       
   8606 05            [ 4]  339     dec b
   8607 CD 6C B0      [17]  340     call cpct_getScreenPtr_asm
   860A 36 00         [10]  341     ld (hl), #0x00
   860C 2C            [ 4]  342     inc l 
   860D 36 00         [10]  343    ld (hl), #0x00
                            344 
                            345    ;;-----------
   860F 11 00 C0      [10]  346    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8612 DD 4E 00      [19]  347     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   8615 DD 46 01      [19]  348     ld      b,  entity_y(ix)  
   8618 05            [ 4]  349     dec b       
   8619 05            [ 4]  350     dec b
   861A 05            [ 4]  351     dec b
   861B CD 6C B0      [17]  352     call cpct_getScreenPtr_asm 
   861E 36 00         [10]  353     ld (hl), #0x00
   8620 2C            [ 4]  354     inc l
   8621 36 00         [10]  355    ld (hl), #0x00
                            356    ;;-----------
   8623 11 00 C0      [10]  357    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8626 DD 4E 00      [19]  358     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8629 DD 46 01      [19]  359     ld      b,  entity_y(ix)  
   862C 05            [ 4]  360     dec b       
   862D 05            [ 4]  361     dec b
   862E 05            [ 4]  362     dec b
   862F 05            [ 4]  363     dec b
   8630 CD 6C B0      [17]  364     call cpct_getScreenPtr_asm 
   8633 36 00         [10]  365     ld (hl), #0x00
   8635 2C            [ 4]  366     inc l
   8636 36 00         [10]  367    ld (hl), #0x00
                            368 ;;-----------
   8638 11 00 C0      [10]  369    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   863B DD 4E 00      [19]  370     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   863E DD 46 01      [19]  371     ld      b,  entity_y(ix)  
   8641 05            [ 4]  372     dec b       
   8642 05            [ 4]  373     dec b
   8643 05            [ 4]  374     dec b
   8644 05            [ 4]  375     dec b
   8645 05            [ 4]  376     dec b
   8646 CD 6C B0      [17]  377     call cpct_getScreenPtr_asm 
   8649 36 00         [10]  378     ld (hl), #0x00
   864B 2C            [ 4]  379     inc l
   864C 36 00         [10]  380    ld (hl), #0x00
                            381 ;;-----------
   864E 11 00 C0      [10]  382    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8651 DD 4E 00      [19]  383     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8654 DD 46 01      [19]  384     ld      b,  entity_y(ix)  
   8657 05            [ 4]  385     dec b       
   8658 05            [ 4]  386     dec b
   8659 05            [ 4]  387     dec b
   865A 05            [ 4]  388     dec b
   865B 05            [ 4]  389     dec b
   865C 05            [ 4]  390     dec b
   865D CD 6C B0      [17]  391     call cpct_getScreenPtr_asm 
   8660 36 00         [10]  392     ld (hl), #0x00
   8662 2C            [ 4]  393     inc l
   8663 36 00         [10]  394    ld (hl), #0x00
                            395 ;;-----------
   8665 11 00 C0      [10]  396    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8668 DD 4E 00      [19]  397     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   866B DD 46 01      [19]  398     ld      b,  entity_y(ix)  
   866E 05            [ 4]  399     dec b       
   866F 05            [ 4]  400     dec b
   8670 05            [ 4]  401     dec b
   8671 05            [ 4]  402     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   8672 05            [ 4]  403     dec b
   8673 05            [ 4]  404     dec b
   8674 05            [ 4]  405     dec b
   8675 CD 6C B0      [17]  406     call cpct_getScreenPtr_asm 
   8678 36 00         [10]  407     ld (hl), #0x00
   867A 2C            [ 4]  408     inc l
   867B 36 00         [10]  409    ld (hl), #0x00
                            410 
   867D C9            [10]  411 ret
                            412 
   867E                     413     renderPos2:
   867E DD 36 04 01   [19]  414     ld entity_estado(ix), #1
   8682 11 00 C0      [10]  415     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8685 DD 4E 00      [19]  416     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8688 DD 46 01      [19]  417     ld      b,  entity_y(ix)  
   868B 04            [ 4]  418     inc b       
   868C 04            [ 4]  419     inc b
   868D 04            [ 4]  420     inc b 
   868E 04            [ 4]  421     inc b
   868F 04            [ 4]  422     inc b
   8690 04            [ 4]  423     inc b 
   8691 04            [ 4]  424     inc b
   8692 CD 6C B0      [17]  425     call cpct_getScreenPtr_asm 
   8695 36 55         [10]  426     ld (hl), #0x55
   8697 2C            [ 4]  427     inc l
   8698 36 44         [10]  428    ld (hl), #0x44
                            429 
                            430 
                            431    ;;-----------
   869A 11 00 C0      [10]  432    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   869D DD 4E 00      [19]  433     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   86A0 DD 46 01      [19]  434     ld      b,  entity_y(ix)  
   86A3 04            [ 4]  435     inc b       
   86A4 04            [ 4]  436     inc b
   86A5 04            [ 4]  437     inc b 
   86A6 04            [ 4]  438     inc b
   86A7 04            [ 4]  439     inc b 
   86A8 04            [ 4]  440     inc b
   86A9 CD 6C B0      [17]  441     call cpct_getScreenPtr_asm 
   86AC 36 20         [10]  442     ld (hl), #0x20
   86AE 2C            [ 4]  443     inc l
   86AF 36 A0         [10]  444    ld (hl), #0xA0
                            445 
                            446    ;;-------------
   86B1 11 00 C0      [10]  447    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   86B4 DD 4E 00      [19]  448     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   86B7 DD 46 01      [19]  449     ld      b,  entity_y(ix)  
   86BA 04            [ 4]  450     inc b       
   86BB 04            [ 4]  451     inc b
   86BC 04            [ 4]  452     inc b 
   86BD 04            [ 4]  453     inc b
   86BE 04            [ 4]  454     inc b 
   86BF CD 6C B0      [17]  455     call cpct_getScreenPtr_asm 
   86C2 36 BB         [10]  456     ld (hl), #0xBB
   86C4 2C            [ 4]  457     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   86C5 36 EC         [10]  458    ld (hl), #0xEC
                            459 
                            460    ;;---------------------
   86C7 11 00 C0      [10]  461    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   86CA DD 4E 00      [19]  462     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   86CD DD 46 01      [19]  463     ld      b,  entity_y(ix)  
   86D0 04            [ 4]  464     inc b       
   86D1 04            [ 4]  465     inc b
   86D2 04            [ 4]  466     inc b 
   86D3 04            [ 4]  467     inc b
   86D4 CD 6C B0      [17]  468     call cpct_getScreenPtr_asm 
   86D7 36 70         [10]  469     ld (hl), #0x70
   86D9 2C            [ 4]  470     inc l
   86DA 36 D2         [10]  471    ld (hl), #0xD2
                            472 
                            473    ;;-----------
   86DC 11 00 C0      [10]  474    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   86DF DD 4E 00      [19]  475     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   86E2 DD 46 01      [19]  476     ld      b,  entity_y(ix)  
   86E5 04            [ 4]  477     inc b       
   86E6 04            [ 4]  478     inc b
   86E7 04            [ 4]  479     inc b
   86E8 CD 6C B0      [17]  480     call cpct_getScreenPtr_asm 
   86EB 36 77         [10]  481     ld (hl), #0x77
   86ED 2C            [ 4]  482     inc l
   86EE 36 FC         [10]  483    ld (hl), #0xFC
                            484 
                            485    ;;-----------
   86F0 11 00 C0      [10]  486    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   86F3 DD 4E 00      [19]  487     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   86F6 DD 46 01      [19]  488     ld      b,  entity_y(ix)  
   86F9 04            [ 4]  489     inc b       
   86FA 04            [ 4]  490     inc b
   86FB CD 6C B0      [17]  491     call cpct_getScreenPtr_asm 
   86FE 36 70         [10]  492     ld (hl), #0x70
   8700 2C            [ 4]  493     inc l
   8701 36 D2         [10]  494    ld (hl), #0xD2
                            495 
                            496    ;;-----------
   8703 11 00 C0      [10]  497    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8706 DD 4E 00      [19]  498     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8709 DD 46 01      [19]  499     ld      b,  entity_y(ix)  
   870C 04            [ 4]  500     inc b 
   870D CD 6C B0      [17]  501     call cpct_getScreenPtr_asm
   8710 36 BB         [10]  502     ld (hl), #0xBB
   8712 2C            [ 4]  503     inc l 
   8713 36 EC         [10]  504    ld (hl), #0xEC
                            505 
                            506    ;;-----------
   8715 11 00 C0      [10]  507    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8718 DD 4E 00      [19]  508     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   871B DD 46 01      [19]  509     ld      b,  entity_y(ix)  
   871E CD 6C B0      [17]  510     call cpct_getScreenPtr_asm 
   8721 36 20         [10]  511     ld (hl), #0x20
   8723 2C            [ 4]  512     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   8724 36 A0         [10]  513    ld (hl), #0xA0
                            514 
                            515    ;;-----------
   8726 11 00 C0      [10]  516    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8729 DD 4E 00      [19]  517     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   872C DD 46 01      [19]  518     ld      b,  entity_y(ix)  
   872F 05            [ 4]  519     dec b
   8730 CD 6C B0      [17]  520     call cpct_getScreenPtr_asm
   8733 36 55         [10]  521     ld (hl), #0x55
   8735 2C            [ 4]  522     inc l 
   8736 36 44         [10]  523    ld (hl), #0x44
                            524 
                            525    ;;-----------
   8738 11 00 C0      [10]  526    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   873B DD 4E 00      [19]  527     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   873E DD 46 01      [19]  528     ld      b,  entity_y(ix)  
   8741 05            [ 4]  529     dec b       
   8742 05            [ 4]  530     dec b
   8743 CD 6C B0      [17]  531     call cpct_getScreenPtr_asm
   8746 36 00         [10]  532     ld (hl), #0x00
   8748 2C            [ 4]  533     inc l 
   8749 36 00         [10]  534    ld (hl), #0x00
                            535 
                            536    ;;-----------
   874B 11 00 C0      [10]  537    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   874E DD 4E 00      [19]  538     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8751 DD 46 01      [19]  539     ld      b,  entity_y(ix)  
   8754 05            [ 4]  540     dec b       
   8755 05            [ 4]  541     dec b
   8756 05            [ 4]  542     dec b
   8757 CD 6C B0      [17]  543     call cpct_getScreenPtr_asm 
   875A 36 00         [10]  544     ld (hl), #0x00
   875C 2C            [ 4]  545     inc l
   875D 36 00         [10]  546    ld (hl), #0x00
                            547    ;;-----------
   875F 11 00 C0      [10]  548    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8762 DD 4E 00      [19]  549     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8765 DD 46 01      [19]  550     ld      b,  entity_y(ix)  
   8768 05            [ 4]  551     dec b       
   8769 05            [ 4]  552     dec b
   876A 05            [ 4]  553     dec b
   876B 05            [ 4]  554     dec b
   876C CD 6C B0      [17]  555     call cpct_getScreenPtr_asm 
   876F 36 00         [10]  556     ld (hl), #0x00
   8771 2C            [ 4]  557     inc l
   8772 36 00         [10]  558    ld (hl), #0x00
                            559 ;;-----------
   8774 11 00 C0      [10]  560    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8777 DD 4E 00      [19]  561     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   877A DD 46 01      [19]  562     ld      b,  entity_y(ix)  
   877D 05            [ 4]  563     dec b       
   877E 05            [ 4]  564     dec b
   877F 05            [ 4]  565     dec b
   8780 05            [ 4]  566     dec b
   8781 05            [ 4]  567     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   8782 CD 6C B0      [17]  568     call cpct_getScreenPtr_asm 
   8785 36 00         [10]  569     ld (hl), #0x00
   8787 2C            [ 4]  570     inc l
   8788 36 00         [10]  571    ld (hl), #0x00
                            572 ;;-----------
   878A 11 00 C0      [10]  573    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   878D DD 4E 00      [19]  574     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8790 DD 46 01      [19]  575     ld      b,  entity_y(ix)  
   8793 05            [ 4]  576     dec b       
   8794 05            [ 4]  577     dec b
   8795 05            [ 4]  578     dec b
   8796 05            [ 4]  579     dec b
   8797 05            [ 4]  580     dec b
   8798 05            [ 4]  581     dec b
   8799 CD 6C B0      [17]  582     call cpct_getScreenPtr_asm 
   879C 36 00         [10]  583     ld (hl), #0x00
   879E 2C            [ 4]  584     inc l
   879F 36 00         [10]  585    ld (hl), #0x00
                            586 ;;-----------
   87A1 11 00 C0      [10]  587    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   87A4 DD 4E 00      [19]  588     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   87A7 DD 46 01      [19]  589     ld      b,  entity_y(ix)  
   87AA 05            [ 4]  590     dec b       
   87AB 05            [ 4]  591     dec b
   87AC 05            [ 4]  592     dec b
   87AD 05            [ 4]  593     dec b
   87AE 05            [ 4]  594     dec b
   87AF 05            [ 4]  595     dec b
   87B0 05            [ 4]  596     dec b
   87B1 CD 6C B0      [17]  597     call cpct_getScreenPtr_asm 
   87B4 36 00         [10]  598     ld (hl), #0x00
   87B6 2C            [ 4]  599     inc l
   87B7 36 00         [10]  600    ld (hl), #0x00
                            601 
   87B9 C9            [10]  602 ret
                            603 
                            604 
   87BA                     605 borrarEnemigo3::
                            606 
   87BA 11 00 C0      [10]  607 ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   87BD DD 4E 00      [19]  608     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   87C0 DD 46 01      [19]  609     ld      b,  entity_y(ix)  
   87C3 04            [ 4]  610     inc b       
   87C4 04            [ 4]  611     inc b
   87C5 04            [ 4]  612     inc b 
   87C6 04            [ 4]  613     inc b
   87C7 04            [ 4]  614     inc b
   87C8 04            [ 4]  615     inc b 
   87C9 04            [ 4]  616     inc b
   87CA CD 6C B0      [17]  617     call cpct_getScreenPtr_asm 
   87CD 36 00         [10]  618     ld (hl), #0x00
   87CF 2C            [ 4]  619     inc l
   87D0 36 00         [10]  620    ld (hl), #0x00
                            621 
                            622 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



                            623    ;;-----------
   87D2 11 00 C0      [10]  624    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   87D5 DD 4E 00      [19]  625     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   87D8 DD 46 01      [19]  626     ld      b,  entity_y(ix)  
   87DB 04            [ 4]  627     inc b       
   87DC 04            [ 4]  628     inc b
   87DD 04            [ 4]  629     inc b 
   87DE 04            [ 4]  630     inc b
   87DF 04            [ 4]  631     inc b 
   87E0 04            [ 4]  632     inc b
   87E1 CD 6C B0      [17]  633     call cpct_getScreenPtr_asm 
   87E4 36 00         [10]  634     ld (hl), #0x00
   87E6 2C            [ 4]  635     inc l
   87E7 36 00         [10]  636    ld (hl), #0x00
                            637 
                            638    ;;-------------
   87E9 11 00 C0      [10]  639    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   87EC DD 4E 00      [19]  640     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   87EF DD 46 01      [19]  641     ld      b,  entity_y(ix)  
   87F2 04            [ 4]  642     inc b       
   87F3 04            [ 4]  643     inc b
   87F4 04            [ 4]  644     inc b 
   87F5 04            [ 4]  645     inc b
   87F6 04            [ 4]  646     inc b 
   87F7 CD 6C B0      [17]  647     call cpct_getScreenPtr_asm 
   87FA 36 00         [10]  648     ld (hl), #0x00
   87FC 2C            [ 4]  649     inc l
   87FD 36 00         [10]  650    ld (hl), #0x00
                            651 
                            652    ;;---------------------
   87FF 11 00 C0      [10]  653    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8802 DD 4E 00      [19]  654     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8805 DD 46 01      [19]  655     ld      b,  entity_y(ix)  
   8808 04            [ 4]  656     inc b       
   8809 04            [ 4]  657     inc b
   880A 04            [ 4]  658     inc b 
   880B 04            [ 4]  659     inc b
   880C CD 6C B0      [17]  660     call cpct_getScreenPtr_asm 
   880F 36 00         [10]  661     ld (hl), #0x00
   8811 2C            [ 4]  662     inc l
   8812 36 00         [10]  663    ld (hl), #0x00
                            664 
                            665    ;;-----------
   8814 11 00 C0      [10]  666    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8817 DD 4E 00      [19]  667     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   881A DD 46 01      [19]  668     ld      b,  entity_y(ix)  
   881D 04            [ 4]  669     inc b       
   881E 04            [ 4]  670     inc b
   881F 04            [ 4]  671     inc b
   8820 CD 6C B0      [17]  672     call cpct_getScreenPtr_asm 
   8823 36 00         [10]  673     ld (hl), #0x00
   8825 2C            [ 4]  674     inc l
   8826 36 00         [10]  675    ld (hl), #0x00
                            676 
                            677    ;;-----------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   8828 11 00 C0      [10]  678    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   882B DD 4E 00      [19]  679     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   882E DD 46 01      [19]  680     ld      b,  entity_y(ix)  
   8831 04            [ 4]  681     inc b       
   8832 04            [ 4]  682     inc b
   8833 CD 6C B0      [17]  683     call cpct_getScreenPtr_asm 
   8836 36 00         [10]  684     ld (hl), #0x00
   8838 2C            [ 4]  685     inc l
   8839 36 00         [10]  686    ld (hl), #0x00
                            687 
                            688    ;;-----------
   883B 11 00 C0      [10]  689    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   883E DD 4E 00      [19]  690     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8841 DD 46 01      [19]  691     ld      b,  entity_y(ix)  
   8844 04            [ 4]  692     inc b 
   8845 CD 6C B0      [17]  693     call cpct_getScreenPtr_asm
   8848 36 00         [10]  694     ld (hl), #0x00
   884A 2C            [ 4]  695     inc l 
   884B 36 00         [10]  696    ld (hl), #0x00
                            697 
                            698    ;;-----------
   884D 11 00 C0      [10]  699    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8850 DD 4E 00      [19]  700     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8853 DD 46 01      [19]  701     ld      b,  entity_y(ix)  
   8856 CD 6C B0      [17]  702     call cpct_getScreenPtr_asm 
   8859 36 00         [10]  703     ld (hl), #0x00
   885B 2C            [ 4]  704     inc l
   885C 36 00         [10]  705    ld (hl), #0x00
                            706 
                            707    ;;-----------
   885E 11 00 C0      [10]  708    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8861 DD 4E 00      [19]  709     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8864 DD 46 01      [19]  710     ld      b,  entity_y(ix)  
   8867 05            [ 4]  711     dec b
   8868 CD 6C B0      [17]  712     call cpct_getScreenPtr_asm
   886B 36 00         [10]  713     ld (hl), #0x00
   886D 2C            [ 4]  714     inc l 
   886E 36 00         [10]  715    ld (hl), #0x00
                            716 
                            717    ;;-----------
   8870 11 00 C0      [10]  718    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8873 DD 4E 00      [19]  719     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8876 DD 46 01      [19]  720     ld      b,  entity_y(ix)  
   8879 05            [ 4]  721     dec b       
   887A 05            [ 4]  722     dec b
   887B CD 6C B0      [17]  723     call cpct_getScreenPtr_asm
   887E 36 00         [10]  724     ld (hl), #0x00
   8880 2C            [ 4]  725     inc l 
   8881 36 00         [10]  726    ld (hl), #0x00
                            727 
                            728    ;;-----------
   8883 11 00 C0      [10]  729    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8886 DD 4E 00      [19]  730     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8889 DD 46 01      [19]  731     ld      b,  entity_y(ix)  
   888C 05            [ 4]  732     dec b       
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   888D 05            [ 4]  733     dec b
   888E 05            [ 4]  734     dec b
   888F CD 6C B0      [17]  735     call cpct_getScreenPtr_asm 
   8892 36 00         [10]  736     ld (hl), #0x00
   8894 2C            [ 4]  737     inc l
   8895 36 00         [10]  738    ld (hl), #0x00
                            739    ;;-----------
   8897 11 00 C0      [10]  740    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   889A DD 4E 00      [19]  741     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   889D DD 46 01      [19]  742     ld      b,  entity_y(ix)  
   88A0 05            [ 4]  743     dec b       
   88A1 05            [ 4]  744     dec b
   88A2 05            [ 4]  745     dec b
   88A3 05            [ 4]  746     dec b
   88A4 CD 6C B0      [17]  747     call cpct_getScreenPtr_asm 
   88A7 36 00         [10]  748     ld (hl), #0x00
   88A9 2C            [ 4]  749     inc l
   88AA 36 00         [10]  750    ld (hl), #0x00
                            751 ;;-----------
   88AC 11 00 C0      [10]  752    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   88AF DD 4E 00      [19]  753     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   88B2 DD 46 01      [19]  754     ld      b,  entity_y(ix)  
   88B5 05            [ 4]  755     dec b       
   88B6 05            [ 4]  756     dec b
   88B7 05            [ 4]  757     dec b
   88B8 05            [ 4]  758     dec b
   88B9 05            [ 4]  759     dec b
   88BA CD 6C B0      [17]  760     call cpct_getScreenPtr_asm 
   88BD 36 00         [10]  761     ld (hl), #0x00
   88BF 2C            [ 4]  762     inc l
   88C0 36 00         [10]  763    ld (hl), #0x00
                            764 ;;-----------
   88C2 11 00 C0      [10]  765    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   88C5 DD 4E 00      [19]  766     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   88C8 DD 46 01      [19]  767     ld      b,  entity_y(ix)  
   88CB 05            [ 4]  768     dec b       
   88CC 05            [ 4]  769     dec b
   88CD 05            [ 4]  770     dec b
   88CE 05            [ 4]  771     dec b
   88CF 05            [ 4]  772     dec b
   88D0 05            [ 4]  773     dec b
   88D1 CD 6C B0      [17]  774     call cpct_getScreenPtr_asm 
   88D4 36 00         [10]  775     ld (hl), #0x00
   88D6 2C            [ 4]  776     inc l
   88D7 36 00         [10]  777    ld (hl), #0x00
                            778 ;;-----------
   88D9 11 00 C0      [10]  779    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   88DC DD 4E 00      [19]  780     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   88DF DD 46 01      [19]  781     ld      b,  entity_y(ix)  
   88E2 05            [ 4]  782     dec b       
   88E3 05            [ 4]  783     dec b
   88E4 05            [ 4]  784     dec b
   88E5 05            [ 4]  785     dec b
   88E6 05            [ 4]  786     dec b
   88E7 05            [ 4]  787     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   88E8 05            [ 4]  788     dec b
   88E9 CD 6C B0      [17]  789     call cpct_getScreenPtr_asm 
   88EC 36 00         [10]  790     ld (hl), #0x00
   88EE 2C            [ 4]  791     inc l
   88EF 36 00         [10]  792    ld (hl), #0x00
                            793 
   88F1 C9            [10]  794 ret
