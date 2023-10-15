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
   424D                      19 pintarEnemigo5::
   424D DD 7E 04      [19]   20     ld a, entity_estado(ix)
                             21     
   4250 3D            [ 4]   22     dec a
   4251 CA 94 43      [10]   23     jp z, renderPos1
   4254 3D            [ 4]   24     dec a
   4255 CA D0 44      [10]   25     jp z, renderPos2
                             26 
   4258                      27     renderPos0:
   4258 DD 36 04 01   [19]   28     ld entity_estado(ix), #1
                             29 
   425C 11 00 C0      [10]   30    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   425F DD 4E 00      [19]   31     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4262 DD 46 01      [19]   32     ld      b,  entity_y(ix)  
   4265 04            [ 4]   33     inc b       
   4266 04            [ 4]   34     inc b
   4267 04            [ 4]   35     inc b 
   4268 04            [ 4]   36     inc b
   4269 04            [ 4]   37     inc b
   426A 04            [ 4]   38     inc b 
   426B 04            [ 4]   39     inc b
   426C CD 6C B0      [17]   40     call cpct_getScreenPtr_asm 
   426F 36 DF         [10]   41     ld (hl), #0xDF
   4271 2C            [ 4]   42     inc l
   4272 36 DF         [10]   43    ld (hl), #0xDF
                             44 
                             45 
                             46    ;;-----------
   4274 11 00 C0      [10]   47    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4277 DD 4E 00      [19]   48     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   427A DD 46 01      [19]   49     ld      b,  entity_y(ix)  
   427D 04            [ 4]   50     inc b       
   427E 04            [ 4]   51     inc b
   427F 04            [ 4]   52     inc b 
   4280 04            [ 4]   53     inc b
   4281 04            [ 4]   54     inc b 
   4282 04            [ 4]   55     inc b
   4283 CD 6C B0      [17]   56     call cpct_getScreenPtr_asm 
   4286 36 77         [10]   57     ld (hl), #0x77
   4288 2C            [ 4]   58     inc l
   4289 36 6E         [10]   59    ld (hl), #0x6E
                             60 
                             61    ;;-------------
   428B 11 00 C0      [10]   62    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   428E DD 4E 00      [19]   63     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4291 DD 46 01      [19]   64     ld      b,  entity_y(ix)  
   4294 04            [ 4]   65     inc b       
   4295 04            [ 4]   66     inc b
   4296 04            [ 4]   67     inc b 
   4297 04            [ 4]   68     inc b
   4298 04            [ 4]   69     inc b 
   4299 CD 6C B0      [17]   70     call cpct_getScreenPtr_asm 
   429C 36 00         [10]   71     ld (hl), #0x00
   429E 2C            [ 4]   72     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   429F 36 00         [10]   73    ld (hl), #0x0
                             74 
                             75    ;;---------------------
   42A1 11 00 C0      [10]   76    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   42A4 DD 4E 00      [19]   77     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   42A7 DD 46 01      [19]   78     ld      b,  entity_y(ix)  
   42AA 04            [ 4]   79     inc b       
   42AB 04            [ 4]   80     inc b
   42AC 04            [ 4]   81     inc b 
   42AD 04            [ 4]   82     inc b
   42AE CD 6C B0      [17]   83     call cpct_getScreenPtr_asm 
   42B1 36 00         [10]   84     ld (hl), #0x00
   42B3 2C            [ 4]   85     inc l
   42B4 36 00         [10]   86    ld (hl), #0x00
                             87 
                             88    ;;-----------
   42B6 11 00 C0      [10]   89    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   42B9 DD 4E 00      [19]   90     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   42BC DD 46 01      [19]   91     ld      b,  entity_y(ix)  
   42BF 04            [ 4]   92     inc b       
   42C0 04            [ 4]   93     inc b
   42C1 04            [ 4]   94     inc b
   42C2 CD 6C B0      [17]   95     call cpct_getScreenPtr_asm 
   42C5 36 00         [10]   96     ld (hl), #0x00
   42C7 2C            [ 4]   97     inc l
   42C8 36 00         [10]   98    ld (hl), #0x00
                             99 
                            100    ;;-----------
   42CA 11 00 C0      [10]  101    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   42CD DD 4E 00      [19]  102     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   42D0 DD 46 01      [19]  103     ld      b,  entity_y(ix)  
   42D3 04            [ 4]  104     inc b       
   42D4 04            [ 4]  105     inc b
   42D5 CD 6C B0      [17]  106     call cpct_getScreenPtr_asm 
   42D8 36 00         [10]  107     ld (hl), #0x00
   42DA 2C            [ 4]  108     inc l
   42DB 36 00         [10]  109    ld (hl), #0x00
                            110 
                            111    ;;-----------
   42DD 11 00 C0      [10]  112    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   42E0 DD 4E 00      [19]  113     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   42E3 DD 46 01      [19]  114     ld      b,  entity_y(ix)  
   42E6 04            [ 4]  115     inc b 
   42E7 CD 6C B0      [17]  116     call cpct_getScreenPtr_asm
   42EA 36 00         [10]  117     ld (hl), #0x00
   42EC 2C            [ 4]  118     inc l 
   42ED 36 00         [10]  119    ld (hl), #0x00
                            120 
                            121    ;;-----------
   42EF 11 00 C0      [10]  122    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   42F2 DD 4E 00      [19]  123     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   42F5 DD 46 01      [19]  124     ld      b,  entity_y(ix)  
   42F8 CD 6C B0      [17]  125     call cpct_getScreenPtr_asm 
   42FB 36 00         [10]  126     ld (hl), #0x00
   42FD 2C            [ 4]  127     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   42FE 36 00         [10]  128    ld (hl), #0x00
                            129 
                            130    ;;-----------
   4300 11 00 C0      [10]  131    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4303 DD 4E 00      [19]  132     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4306 DD 46 01      [19]  133     ld      b,  entity_y(ix)  
   4309 05            [ 4]  134     dec b
   430A CD 6C B0      [17]  135     call cpct_getScreenPtr_asm
   430D 36 00         [10]  136     ld (hl), #0x00
   430F 2C            [ 4]  137     inc l 
   4310 36 00         [10]  138    ld (hl), #0x00
                            139 
                            140    ;;-----------
   4312 11 00 C0      [10]  141    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4315 DD 4E 00      [19]  142     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4318 DD 46 01      [19]  143     ld      b,  entity_y(ix)  
   431B 05            [ 4]  144     dec b       
   431C 05            [ 4]  145     dec b
   431D CD 6C B0      [17]  146     call cpct_getScreenPtr_asm
   4320 36 00         [10]  147     ld (hl), #0x00
   4322 2C            [ 4]  148     inc l 
   4323 36 00         [10]  149    ld (hl), #0x00
                            150 
                            151    ;;-----------
   4325 11 00 C0      [10]  152    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4328 DD 4E 00      [19]  153     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   432B DD 46 01      [19]  154     ld      b,  entity_y(ix)  
   432E 05            [ 4]  155     dec b       
   432F 05            [ 4]  156     dec b
   4330 05            [ 4]  157     dec b
   4331 CD 6C B0      [17]  158     call cpct_getScreenPtr_asm 
   4334 36 00         [10]  159     ld (hl), #0x00
   4336 2C            [ 4]  160     inc l
   4337 36 00         [10]  161    ld (hl), #0x00
                            162    ;;-----------
   4339 11 00 C0      [10]  163    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   433C DD 4E 00      [19]  164     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   433F DD 46 01      [19]  165     ld      b,  entity_y(ix)  
   4342 05            [ 4]  166     dec b       
   4343 05            [ 4]  167     dec b
   4344 05            [ 4]  168     dec b
   4345 05            [ 4]  169     dec b
   4346 CD 6C B0      [17]  170     call cpct_getScreenPtr_asm 
   4349 36 00         [10]  171     ld (hl), #0x00
   434B 2C            [ 4]  172     inc l
   434C 36 00         [10]  173    ld (hl), #0x00
                            174 ;;-----------
   434E 11 00 C0      [10]  175    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4351 DD 4E 00      [19]  176     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4354 DD 46 01      [19]  177     ld      b,  entity_y(ix)  
   4357 05            [ 4]  178     dec b       
   4358 05            [ 4]  179     dec b
   4359 05            [ 4]  180     dec b
   435A 05            [ 4]  181     dec b
   435B 05            [ 4]  182     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   435C CD 6C B0      [17]  183     call cpct_getScreenPtr_asm 
   435F 36 00         [10]  184     ld (hl), #0x00
   4361 2C            [ 4]  185     inc l
   4362 36 00         [10]  186    ld (hl), #0x00
                            187 ;;-----------
   4364 11 00 C0      [10]  188    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4367 DD 4E 00      [19]  189     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   436A DD 46 01      [19]  190     ld      b,  entity_y(ix)  
   436D 05            [ 4]  191     dec b       
   436E 05            [ 4]  192     dec b
   436F 05            [ 4]  193     dec b
   4370 05            [ 4]  194     dec b
   4371 05            [ 4]  195     dec b
   4372 05            [ 4]  196     dec b
   4373 CD 6C B0      [17]  197     call cpct_getScreenPtr_asm 
   4376 36 00         [10]  198     ld (hl), #0x00
   4378 2C            [ 4]  199     inc l
   4379 36 00         [10]  200    ld (hl), #0x00
                            201 ;;-----------
   437B 11 00 C0      [10]  202    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   437E DD 4E 00      [19]  203     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4381 DD 46 01      [19]  204     ld      b,  entity_y(ix)  
   4384 05            [ 4]  205     dec b       
   4385 05            [ 4]  206     dec b
   4386 05            [ 4]  207     dec b
   4387 05            [ 4]  208     dec b
   4388 05            [ 4]  209     dec b
   4389 05            [ 4]  210     dec b
   438A 05            [ 4]  211     dec b
   438B CD 6C B0      [17]  212     call cpct_getScreenPtr_asm 
   438E 36 00         [10]  213     ld (hl), #0x00
   4390 2C            [ 4]  214     inc l
   4391 36 00         [10]  215    ld (hl), #0x00
                            216 
   4393 C9            [10]  217 ret
                            218 
                            219    
                            220 
                            221 
                            222 
                            223 
   4394                     224     renderPos1:
   4394 DD 36 04 02   [19]  225     ld entity_estado(ix), #2
                            226 
   4398 11 00 C0      [10]  227     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   439B DD 4E 00      [19]  228     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   439E DD 46 01      [19]  229     ld      b,  entity_y(ix)  
   43A1 04            [ 4]  230     inc b       
   43A2 04            [ 4]  231     inc b
   43A3 04            [ 4]  232     inc b 
   43A4 04            [ 4]  233     inc b
   43A5 04            [ 4]  234     inc b
   43A6 04            [ 4]  235     inc b 
   43A7 04            [ 4]  236     inc b
   43A8 CD 6C B0      [17]  237     call cpct_getScreenPtr_asm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   43AB 36 07         [10]  238     ld (hl), #0x07
   43AD 2C            [ 4]  239     inc l
   43AE 36 08         [10]  240    ld (hl), #0x08
                            241 
                            242 
                            243    ;;-----------
   43B0 11 00 C0      [10]  244    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   43B3 DD 4E 00      [19]  245     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   43B6 DD 46 01      [19]  246     ld      b,  entity_y(ix)  
   43B9 04            [ 4]  247     inc b       
   43BA 04            [ 4]  248     inc b
   43BB 04            [ 4]  249     inc b 
   43BC 04            [ 4]  250     inc b
   43BD 04            [ 4]  251     inc b 
   43BE 04            [ 4]  252     inc b
   43BF CD 6C B0      [17]  253     call cpct_getScreenPtr_asm 
   43C2 36 4C         [10]  254     ld (hl), #0x4C
   43C4 2C            [ 4]  255     inc l
   43C5 36 8C         [10]  256    ld (hl), #0x8C
                            257 
                            258    ;;-------------
   43C7 11 00 C0      [10]  259    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   43CA DD 4E 00      [19]  260     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   43CD DD 46 01      [19]  261     ld      b,  entity_y(ix)  
   43D0 04            [ 4]  262     inc b       
   43D1 04            [ 4]  263     inc b
   43D2 04            [ 4]  264     inc b 
   43D3 04            [ 4]  265     inc b
   43D4 04            [ 4]  266     inc b 
   43D5 CD 6C B0      [17]  267     call cpct_getScreenPtr_asm 
   43D8 36 08         [10]  268     ld (hl), #0x08
   43DA 2C            [ 4]  269     inc l
   43DB 36 04         [10]  270    ld (hl), #0x04
                            271 
                            272    ;;---------------------
   43DD 11 00 C0      [10]  273    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   43E0 DD 4E 00      [19]  274     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   43E3 DD 46 01      [19]  275     ld      b,  entity_y(ix)  
   43E6 04            [ 4]  276     inc b       
   43E7 04            [ 4]  277     inc b
   43E8 04            [ 4]  278     inc b 
   43E9 04            [ 4]  279     inc b
   43EA CD 6C B0      [17]  280     call cpct_getScreenPtr_asm 
   43ED 36 4C         [10]  281     ld (hl), #0x4C
   43EF 2C            [ 4]  282     inc l
   43F0 36 8C         [10]  283    ld (hl), #0x8C
                            284 
                            285    ;;-----------
   43F2 11 00 C0      [10]  286    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   43F5 DD 4E 00      [19]  287     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   43F8 DD 46 01      [19]  288     ld      b,  entity_y(ix)  
   43FB 04            [ 4]  289     inc b       
   43FC 04            [ 4]  290     inc b
   43FD 04            [ 4]  291     inc b
   43FE CD 6C B0      [17]  292     call cpct_getScreenPtr_asm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   4401 36 04         [10]  293     ld (hl), #0x04
   4403 2C            [ 4]  294     inc l
   4404 36 08         [10]  295    ld (hl), #0x08
                            296 
                            297    ;;-----------
   4406 11 00 C0      [10]  298    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4409 DD 4E 00      [19]  299     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   440C DD 46 01      [19]  300     ld      b,  entity_y(ix)  
   440F 04            [ 4]  301     inc b       
   4410 04            [ 4]  302     inc b
   4411 CD 6C B0      [17]  303     call cpct_getScreenPtr_asm 
   4414 36 03         [10]  304     ld (hl), #0x03
   4416 2C            [ 4]  305     inc l
   4417 36 08         [10]  306    ld (hl), #0x08
                            307 
                            308    ;;-----------
   4419 11 00 C0      [10]  309    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   441C DD 4E 00      [19]  310     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   441F DD 46 01      [19]  311     ld      b,  entity_y(ix)  
   4422 04            [ 4]  312     inc b 
   4423 CD 6C B0      [17]  313     call cpct_getScreenPtr_asm
   4426 36 01         [10]  314     ld (hl), #0x01
   4428 2C            [ 4]  315     inc l 
   4429 36 0C         [10]  316    ld (hl), #0x0C
                            317 
                            318    ;;-----------
   442B 11 00 C0      [10]  319    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   442E DD 4E 00      [19]  320     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4431 DD 46 01      [19]  321     ld      b,  entity_y(ix)  
   4434 CD 6C B0      [17]  322     call cpct_getScreenPtr_asm 
   4437 36 03         [10]  323     ld (hl), #0x03
   4439 2C            [ 4]  324     inc l
   443A 36 08         [10]  325    ld (hl), #0x08
                            326 
                            327    ;;-----------
   443C 11 00 C0      [10]  328    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   443F DD 4E 00      [19]  329     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4442 DD 46 01      [19]  330     ld      b,  entity_y(ix)  
   4445 05            [ 4]  331     dec b
   4446 CD 6C B0      [17]  332     call cpct_getScreenPtr_asm
   4449 36 07         [10]  333     ld (hl), #0x07
   444B 2C            [ 4]  334     inc l 
   444C 36 00         [10]  335    ld (hl), #0x00
                            336 
                            337    ;;-----------
   444E 11 00 C0      [10]  338    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4451 DD 4E 00      [19]  339     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4454 DD 46 01      [19]  340     ld      b,  entity_y(ix)  
   4457 05            [ 4]  341     dec b       
   4458 05            [ 4]  342     dec b
   4459 CD 6C B0      [17]  343     call cpct_getScreenPtr_asm
   445C 36 03         [10]  344     ld (hl), #0x03
   445E 2C            [ 4]  345     inc l 
   445F 36 08         [10]  346    ld (hl), #0x08
                            347 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                            348    ;;-----------
   4461 11 00 C0      [10]  349    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4464 DD 4E 00      [19]  350     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4467 DD 46 01      [19]  351     ld      b,  entity_y(ix)  
   446A 05            [ 4]  352     dec b       
   446B 05            [ 4]  353     dec b
   446C 05            [ 4]  354     dec b
   446D CD 6C B0      [17]  355     call cpct_getScreenPtr_asm 
   4470 36 01         [10]  356     ld (hl), #0x01
   4472 2C            [ 4]  357     inc l
   4473 36 00         [10]  358    ld (hl), #0x00
                            359    ;;-----------
   4475 11 00 C0      [10]  360    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4478 DD 4E 00      [19]  361     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   447B DD 46 01      [19]  362     ld      b,  entity_y(ix)  
   447E 05            [ 4]  363     dec b       
   447F 05            [ 4]  364     dec b
   4480 05            [ 4]  365     dec b
   4481 05            [ 4]  366     dec b
   4482 CD 6C B0      [17]  367     call cpct_getScreenPtr_asm 
   4485 36 00         [10]  368     ld (hl), #0x00
   4487 2C            [ 4]  369     inc l
   4488 36 00         [10]  370    ld (hl), #0x00
                            371 ;;-----------
   448A 11 00 C0      [10]  372    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   448D DD 4E 00      [19]  373     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4490 DD 46 01      [19]  374     ld      b,  entity_y(ix)  
   4493 05            [ 4]  375     dec b       
   4494 05            [ 4]  376     dec b
   4495 05            [ 4]  377     dec b
   4496 05            [ 4]  378     dec b
   4497 05            [ 4]  379     dec b
   4498 CD 6C B0      [17]  380     call cpct_getScreenPtr_asm 
   449B 36 00         [10]  381     ld (hl), #0x00
   449D 2C            [ 4]  382     inc l
   449E 36 00         [10]  383    ld (hl), #0x00
                            384 ;;-----------
   44A0 11 00 C0      [10]  385    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   44A3 DD 4E 00      [19]  386     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   44A6 DD 46 01      [19]  387     ld      b,  entity_y(ix)  
   44A9 05            [ 4]  388     dec b       
   44AA 05            [ 4]  389     dec b
   44AB 05            [ 4]  390     dec b
   44AC 05            [ 4]  391     dec b
   44AD 05            [ 4]  392     dec b
   44AE 05            [ 4]  393     dec b
   44AF CD 6C B0      [17]  394     call cpct_getScreenPtr_asm 
   44B2 36 00         [10]  395     ld (hl), #0x00
   44B4 2C            [ 4]  396     inc l
   44B5 36 00         [10]  397    ld (hl), #0x00
                            398 ;;-----------
   44B7 11 00 C0      [10]  399    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   44BA DD 4E 00      [19]  400     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   44BD DD 46 01      [19]  401     ld      b,  entity_y(ix)  
   44C0 05            [ 4]  402     dec b       
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   44C1 05            [ 4]  403     dec b
   44C2 05            [ 4]  404     dec b
   44C3 05            [ 4]  405     dec b
   44C4 05            [ 4]  406     dec b
   44C5 05            [ 4]  407     dec b
   44C6 05            [ 4]  408     dec b
   44C7 CD 6C B0      [17]  409     call cpct_getScreenPtr_asm 
   44CA 36 00         [10]  410     ld (hl), #0x00
   44CC 2C            [ 4]  411     inc l
   44CD 36 00         [10]  412    ld (hl), #0x00
                            413 
   44CF C9            [10]  414 ret
                            415 
   44D0                     416     renderPos2:
   44D0 DD 36 04 01   [19]  417     ld entity_estado(ix), #1
                            418     
   44D4 11 00 C0      [10]  419     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   44D7 DD 4E 00      [19]  420     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   44DA DD 46 01      [19]  421     ld      b,  entity_y(ix)  
   44DD 04            [ 4]  422     inc b       
   44DE 04            [ 4]  423     inc b
   44DF 04            [ 4]  424     inc b 
   44E0 04            [ 4]  425     inc b
   44E1 04            [ 4]  426     inc b
   44E2 04            [ 4]  427     inc b 
   44E3 04            [ 4]  428     inc b
   44E4 CD 6C B0      [17]  429     call cpct_getScreenPtr_asm 
   44E7 36 07         [10]  430     ld (hl), #0x07
   44E9 2C            [ 4]  431     inc l
   44EA 36 08         [10]  432    ld (hl), #0x08
                            433 
                            434 
                            435    ;;-----------
   44EC 11 00 C0      [10]  436    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   44EF DD 4E 00      [19]  437     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   44F2 DD 46 01      [19]  438     ld      b,  entity_y(ix)  
   44F5 04            [ 4]  439     inc b       
   44F6 04            [ 4]  440     inc b
   44F7 04            [ 4]  441     inc b 
   44F8 04            [ 4]  442     inc b
   44F9 04            [ 4]  443     inc b 
   44FA 04            [ 4]  444     inc b
   44FB CD 6C B0      [17]  445     call cpct_getScreenPtr_asm 
   44FE 36 4C         [10]  446     ld (hl), #0x4C
   4500 2C            [ 4]  447     inc l
   4501 36 8C         [10]  448    ld (hl), #0x8C
                            449 
                            450    ;;-------------
   4503 11 00 C0      [10]  451    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4506 DD 4E 00      [19]  452     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4509 DD 46 01      [19]  453     ld      b,  entity_y(ix)  
   450C 04            [ 4]  454     inc b       
   450D 04            [ 4]  455     inc b
   450E 04            [ 4]  456     inc b 
   450F 04            [ 4]  457     inc b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   4510 04            [ 4]  458     inc b 
   4511 CD 6C B0      [17]  459     call cpct_getScreenPtr_asm 
   4514 36 08         [10]  460     ld (hl), #0x08
   4516 2C            [ 4]  461     inc l
   4517 36 04         [10]  462    ld (hl), #0x04
                            463 
                            464    ;;---------------------
   4519 11 00 C0      [10]  465    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   451C DD 4E 00      [19]  466     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   451F DD 46 01      [19]  467     ld      b,  entity_y(ix)  
   4522 04            [ 4]  468     inc b       
   4523 04            [ 4]  469     inc b
   4524 04            [ 4]  470     inc b 
   4525 04            [ 4]  471     inc b
   4526 CD 6C B0      [17]  472     call cpct_getScreenPtr_asm 
   4529 36 4C         [10]  473     ld (hl), #0x4C
   452B 2C            [ 4]  474     inc l
   452C 36 8C         [10]  475    ld (hl), #0x8C
                            476 
                            477    ;;-----------
   452E 11 00 C0      [10]  478    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4531 DD 4E 00      [19]  479     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4534 DD 46 01      [19]  480     ld      b,  entity_y(ix)  
   4537 04            [ 4]  481     inc b       
   4538 04            [ 4]  482     inc b
   4539 04            [ 4]  483     inc b
   453A CD 6C B0      [17]  484     call cpct_getScreenPtr_asm 
   453D 36 04         [10]  485     ld (hl), #0x04
   453F 2C            [ 4]  486     inc l
   4540 36 08         [10]  487    ld (hl), #0x08
                            488 
                            489    ;;-----------
   4542 11 00 C0      [10]  490    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4545 DD 4E 00      [19]  491     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4548 DD 46 01      [19]  492     ld      b,  entity_y(ix)  
   454B 04            [ 4]  493     inc b       
   454C 04            [ 4]  494     inc b
   454D CD 6C B0      [17]  495     call cpct_getScreenPtr_asm 
   4550 36 03         [10]  496     ld (hl), #0x03
   4552 2C            [ 4]  497     inc l
   4553 36 08         [10]  498    ld (hl), #0x08
                            499 
                            500    ;;-----------
   4555 11 00 C0      [10]  501    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4558 DD 4E 00      [19]  502     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   455B DD 46 01      [19]  503     ld      b,  entity_y(ix)  
   455E 04            [ 4]  504     inc b 
   455F CD 6C B0      [17]  505     call cpct_getScreenPtr_asm
   4562 36 07         [10]  506     ld (hl), #0x07
   4564 2C            [ 4]  507     inc l 
   4565 36 00         [10]  508    ld (hl), #0x00
                            509 
                            510    ;;-----------
   4567 11 00 C0      [10]  511    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   456A DD 4E 00      [19]  512     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   456D DD 46 01      [19]  513     ld      b,  entity_y(ix)  
   4570 CD 6C B0      [17]  514     call cpct_getScreenPtr_asm 
   4573 36 03         [10]  515     ld (hl), #0x03
   4575 2C            [ 4]  516     inc l
   4576 36 08         [10]  517    ld (hl), #0x08
                            518 
                            519    ;;-----------
   4578 11 00 C0      [10]  520    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   457B DD 4E 00      [19]  521     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   457E DD 46 01      [19]  522     ld      b,  entity_y(ix)  
   4581 05            [ 4]  523     dec b
   4582 CD 6C B0      [17]  524     call cpct_getScreenPtr_asm
   4585 36 01         [10]  525     ld (hl), #0x01
   4587 2C            [ 4]  526     inc l 
   4588 36 0C         [10]  527    ld (hl), #0x0C
                            528 
                            529    ;;-----------
   458A 11 00 C0      [10]  530    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   458D DD 4E 00      [19]  531     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4590 DD 46 01      [19]  532     ld      b,  entity_y(ix)  
   4593 05            [ 4]  533     dec b       
   4594 05            [ 4]  534     dec b
   4595 CD 6C B0      [17]  535     call cpct_getScreenPtr_asm
   4598 36 03         [10]  536     ld (hl), #0x03
   459A 2C            [ 4]  537     inc l 
   459B 36 08         [10]  538    ld (hl), #0x08
                            539 
                            540    ;;-----------
   459D 11 00 C0      [10]  541    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   45A0 DD 4E 00      [19]  542     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   45A3 DD 46 01      [19]  543     ld      b,  entity_y(ix)  
   45A6 05            [ 4]  544     dec b       
   45A7 05            [ 4]  545     dec b
   45A8 05            [ 4]  546     dec b
   45A9 CD 6C B0      [17]  547     call cpct_getScreenPtr_asm 
   45AC 36 01         [10]  548     ld (hl), #0x01
   45AE 2C            [ 4]  549     inc l
   45AF 36 00         [10]  550    ld (hl), #0x00
                            551    ;;-----------
   45B1 11 00 C0      [10]  552    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   45B4 DD 4E 00      [19]  553     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   45B7 DD 46 01      [19]  554     ld      b,  entity_y(ix)  
   45BA 05            [ 4]  555     dec b       
   45BB 05            [ 4]  556     dec b
   45BC 05            [ 4]  557     dec b
   45BD 05            [ 4]  558     dec b
   45BE CD 6C B0      [17]  559     call cpct_getScreenPtr_asm 
   45C1 36 00         [10]  560     ld (hl), #0x00
   45C3 2C            [ 4]  561     inc l
   45C4 36 00         [10]  562    ld (hl), #0x00
                            563 ;;-----------
   45C6 11 00 C0      [10]  564    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   45C9 DD 4E 00      [19]  565     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   45CC DD 46 01      [19]  566     ld      b,  entity_y(ix)  
   45CF 05            [ 4]  567     dec b       
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   45D0 05            [ 4]  568     dec b
   45D1 05            [ 4]  569     dec b
   45D2 05            [ 4]  570     dec b
   45D3 05            [ 4]  571     dec b
   45D4 CD 6C B0      [17]  572     call cpct_getScreenPtr_asm 
   45D7 36 00         [10]  573     ld (hl), #0x00
   45D9 2C            [ 4]  574     inc l
   45DA 36 00         [10]  575    ld (hl), #0x00
                            576 ;;-----------
   45DC 11 00 C0      [10]  577    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   45DF DD 4E 00      [19]  578     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   45E2 DD 46 01      [19]  579     ld      b,  entity_y(ix)  
   45E5 05            [ 4]  580     dec b       
   45E6 05            [ 4]  581     dec b
   45E7 05            [ 4]  582     dec b
   45E8 05            [ 4]  583     dec b
   45E9 05            [ 4]  584     dec b
   45EA 05            [ 4]  585     dec b
   45EB CD 6C B0      [17]  586     call cpct_getScreenPtr_asm 
   45EE 36 00         [10]  587     ld (hl), #0x00
   45F0 2C            [ 4]  588     inc l
   45F1 36 00         [10]  589    ld (hl), #0x00
                            590 ;;-----------
   45F3 11 00 C0      [10]  591    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   45F6 DD 4E 00      [19]  592     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   45F9 DD 46 01      [19]  593     ld      b,  entity_y(ix)  
   45FC 05            [ 4]  594     dec b       
   45FD 05            [ 4]  595     dec b
   45FE 05            [ 4]  596     dec b
   45FF 05            [ 4]  597     dec b
   4600 05            [ 4]  598     dec b
   4601 05            [ 4]  599     dec b
   4602 05            [ 4]  600     dec b
   4603 CD 6C B0      [17]  601     call cpct_getScreenPtr_asm 
   4606 36 00         [10]  602     ld (hl), #0x00
   4608 2C            [ 4]  603     inc l
   4609 36 00         [10]  604    ld (hl), #0x00
                            605 
   460B C9            [10]  606 ret
                            607 
                            608 
   460C                     609 borrarEnemigo5::
                            610 
                            611 
   460C 11 00 C0      [10]  612     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   460F DD 4E 00      [19]  613     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4612 DD 46 01      [19]  614     ld      b,  entity_y(ix)  
   4615 04            [ 4]  615     inc b       
   4616 04            [ 4]  616     inc b
   4617 04            [ 4]  617     inc b 
   4618 04            [ 4]  618     inc b
   4619 04            [ 4]  619     inc b
   461A 04            [ 4]  620     inc b 
   461B 04            [ 4]  621     inc b
   461C CD 6C B0      [17]  622     call cpct_getScreenPtr_asm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   461F 36 00         [10]  623     ld (hl), #0x00
   4621 2C            [ 4]  624     inc l
   4622 36 00         [10]  625    ld (hl), #0x00
                            626 
                            627 
                            628    ;;-----------
   4624 11 00 C0      [10]  629    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4627 DD 4E 00      [19]  630     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   462A DD 46 01      [19]  631     ld      b,  entity_y(ix)  
   462D 04            [ 4]  632     inc b       
   462E 04            [ 4]  633     inc b
   462F 04            [ 4]  634     inc b 
   4630 04            [ 4]  635     inc b
   4631 04            [ 4]  636     inc b 
   4632 04            [ 4]  637     inc b
   4633 CD 6C B0      [17]  638     call cpct_getScreenPtr_asm 
   4636 36 00         [10]  639     ld (hl), #0x00
   4638 2C            [ 4]  640     inc l
   4639 36 00         [10]  641    ld (hl), #0x00
                            642 
                            643    ;;-------------
   463B 11 00 C0      [10]  644    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   463E DD 4E 00      [19]  645     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4641 DD 46 01      [19]  646     ld      b,  entity_y(ix)  
   4644 04            [ 4]  647     inc b       
   4645 04            [ 4]  648     inc b
   4646 04            [ 4]  649     inc b 
   4647 04            [ 4]  650     inc b
   4648 04            [ 4]  651     inc b 
   4649 CD 6C B0      [17]  652     call cpct_getScreenPtr_asm 
   464C 36 00         [10]  653     ld (hl), #0x00
   464E 2C            [ 4]  654     inc l
   464F 36 00         [10]  655    ld (hl), #0x00
                            656 
                            657    ;;---------------------
   4651 11 00 C0      [10]  658    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4654 DD 4E 00      [19]  659     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4657 DD 46 01      [19]  660     ld      b,  entity_y(ix)  
   465A 04            [ 4]  661     inc b       
   465B 04            [ 4]  662     inc b
   465C 04            [ 4]  663     inc b 
   465D 04            [ 4]  664     inc b
   465E CD 6C B0      [17]  665     call cpct_getScreenPtr_asm 
   4661 36 00         [10]  666     ld (hl), #0x00
   4663 2C            [ 4]  667     inc l
   4664 36 00         [10]  668    ld (hl), #0x00
                            669 
                            670    ;;-----------
   4666 11 00 C0      [10]  671    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4669 DD 4E 00      [19]  672     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   466C DD 46 01      [19]  673     ld      b,  entity_y(ix)  
   466F 04            [ 4]  674     inc b       
   4670 04            [ 4]  675     inc b
   4671 04            [ 4]  676     inc b
   4672 CD 6C B0      [17]  677     call cpct_getScreenPtr_asm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   4675 36 00         [10]  678     ld (hl), #0x00
   4677 2C            [ 4]  679     inc l
   4678 36 00         [10]  680    ld (hl), #0x00
                            681 
                            682    ;;-----------
   467A 11 00 C0      [10]  683    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   467D DD 4E 00      [19]  684     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4680 DD 46 01      [19]  685     ld      b,  entity_y(ix)  
   4683 04            [ 4]  686     inc b       
   4684 04            [ 4]  687     inc b
   4685 CD 6C B0      [17]  688     call cpct_getScreenPtr_asm 
   4688 36 00         [10]  689     ld (hl), #0x00
   468A 2C            [ 4]  690     inc l
   468B 36 00         [10]  691    ld (hl), #0x00
                            692 
                            693    ;;-----------
   468D 11 00 C0      [10]  694    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4690 DD 4E 00      [19]  695     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4693 DD 46 01      [19]  696     ld      b,  entity_y(ix)  
   4696 04            [ 4]  697     inc b 
   4697 CD 6C B0      [17]  698     call cpct_getScreenPtr_asm
   469A 36 00         [10]  699     ld (hl), #0x00
   469C 2C            [ 4]  700     inc l 
   469D 36 00         [10]  701    ld (hl), #0x00
                            702 
                            703    ;;-----------
   469F 11 00 C0      [10]  704    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   46A2 DD 4E 00      [19]  705     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   46A5 DD 46 01      [19]  706     ld      b,  entity_y(ix)  
   46A8 CD 6C B0      [17]  707     call cpct_getScreenPtr_asm 
   46AB 36 00         [10]  708     ld (hl), #0x00
   46AD 2C            [ 4]  709     inc l
   46AE 36 00         [10]  710    ld (hl), #0x00
                            711 
                            712    ;;-----------
   46B0 11 00 C0      [10]  713    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   46B3 DD 4E 00      [19]  714     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   46B6 DD 46 01      [19]  715     ld      b,  entity_y(ix)  
   46B9 05            [ 4]  716     dec b
   46BA CD 6C B0      [17]  717     call cpct_getScreenPtr_asm
   46BD 36 00         [10]  718     ld (hl), #0x00
   46BF 2C            [ 4]  719     inc l 
   46C0 36 00         [10]  720    ld (hl), #0x00
                            721 
                            722    ;;-----------
   46C2 11 00 C0      [10]  723    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   46C5 DD 4E 00      [19]  724     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   46C8 DD 46 01      [19]  725     ld      b,  entity_y(ix)  
   46CB 05            [ 4]  726     dec b       
   46CC 05            [ 4]  727     dec b
   46CD CD 6C B0      [17]  728     call cpct_getScreenPtr_asm
   46D0 36 00         [10]  729     ld (hl), #0x00
   46D2 2C            [ 4]  730     inc l 
   46D3 36 00         [10]  731    ld (hl), #0x00
                            732 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



                            733    ;;-----------
   46D5 11 00 C0      [10]  734    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   46D8 DD 4E 00      [19]  735     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   46DB DD 46 01      [19]  736     ld      b,  entity_y(ix)  
   46DE 05            [ 4]  737     dec b       
   46DF 05            [ 4]  738     dec b
   46E0 05            [ 4]  739     dec b
   46E1 CD 6C B0      [17]  740     call cpct_getScreenPtr_asm 
   46E4 36 00         [10]  741     ld (hl), #0x00
   46E6 2C            [ 4]  742     inc l
   46E7 36 00         [10]  743    ld (hl), #0x00
                            744    ;;-----------
   46E9 11 00 C0      [10]  745    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   46EC DD 4E 00      [19]  746     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   46EF DD 46 01      [19]  747     ld      b,  entity_y(ix)  
   46F2 05            [ 4]  748     dec b       
   46F3 05            [ 4]  749     dec b
   46F4 05            [ 4]  750     dec b
   46F5 05            [ 4]  751     dec b
   46F6 CD 6C B0      [17]  752     call cpct_getScreenPtr_asm 
   46F9 36 00         [10]  753     ld (hl), #0x00
   46FB 2C            [ 4]  754     inc l
   46FC 36 00         [10]  755    ld (hl), #0x00
                            756 ;;-----------
   46FE 11 00 C0      [10]  757    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4701 DD 4E 00      [19]  758     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4704 DD 46 01      [19]  759     ld      b,  entity_y(ix)  
   4707 05            [ 4]  760     dec b       
   4708 05            [ 4]  761     dec b
   4709 05            [ 4]  762     dec b
   470A 05            [ 4]  763     dec b
   470B 05            [ 4]  764     dec b
   470C CD 6C B0      [17]  765     call cpct_getScreenPtr_asm 
   470F 36 00         [10]  766     ld (hl), #0x00
   4711 2C            [ 4]  767     inc l
   4712 36 00         [10]  768    ld (hl), #0x00
                            769 ;;-----------
   4714 11 00 C0      [10]  770    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   4717 DD 4E 00      [19]  771     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   471A DD 46 01      [19]  772     ld      b,  entity_y(ix)  
   471D 05            [ 4]  773     dec b       
   471E 05            [ 4]  774     dec b
   471F 05            [ 4]  775     dec b
   4720 05            [ 4]  776     dec b
   4721 05            [ 4]  777     dec b
   4722 05            [ 4]  778     dec b
   4723 CD 6C B0      [17]  779     call cpct_getScreenPtr_asm 
   4726 36 00         [10]  780     ld (hl), #0x00
   4728 2C            [ 4]  781     inc l
   4729 36 00         [10]  782    ld (hl), #0x00
                            783 ;;-----------
   472B 11 00 C0      [10]  784    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   472E DD 4E 00      [19]  785     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   4731 DD 46 01      [19]  786     ld      b,  entity_y(ix)  
   4734 05            [ 4]  787     dec b       
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   4735 05            [ 4]  788     dec b
   4736 05            [ 4]  789     dec b
   4737 05            [ 4]  790     dec b
   4738 05            [ 4]  791     dec b
   4739 05            [ 4]  792     dec b
   473A 05            [ 4]  793     dec b
   473B CD 6C B0      [17]  794     call cpct_getScreenPtr_asm 
   473E 36 00         [10]  795     ld (hl), #0x00
   4740 2C            [ 4]  796     inc l
   4741 36 00         [10]  797    ld (hl), #0x00
                            798 
   4743 C9            [10]  799 ret
