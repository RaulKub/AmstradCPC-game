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
   A5AC                      19 pintarEnemigo4::
   A5AC DD 21 50 40   [14]   20     ld ix, #enemyDerPos2
   A5B0 DD 7E 04      [19]   21     ld a, entity_estado(ix)
   A5B3 3D            [ 4]   22     dec a
   A5B4 CA FA A6      [10]   23     jp z, renderPos1
   A5B7 3D            [ 4]   24     dec a
   A5B8 CA 36 A8      [10]   25     jp z, renderPos2
                             26 
   A5BB                      27     renderPos0:
   A5BB DD 36 04 01   [19]   28     ld entity_estado(ix), #1
                             29 
   A5BF 11 00 C0      [10]   30     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A5C2 DD 4E 00      [19]   31     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A5C5 DD 46 01      [19]   32     ld      b,  entity_y(ix)  
   A5C8 04            [ 4]   33     inc b       
   A5C9 04            [ 4]   34     inc b
   A5CA 04            [ 4]   35     inc b 
   A5CB 04            [ 4]   36     inc b
   A5CC 04            [ 4]   37     inc b
   A5CD 04            [ 4]   38     inc b 
   A5CE 04            [ 4]   39     inc b
   A5CF CD 6C B0      [17]   40     call cpct_getScreenPtr_asm 
   A5D2 36 00         [10]   41     ld (hl), #0x00
   A5D4 2C            [ 4]   42     inc l
   A5D5 36 77         [10]   43    ld (hl), #0x77
                             44 
                             45 
                             46    ;;-----------
   A5D7 11 00 C0      [10]   47    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A5DA DD 4E 00      [19]   48     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A5DD DD 46 01      [19]   49     ld      b,  entity_y(ix)  
   A5E0 04            [ 4]   50     inc b       
   A5E1 04            [ 4]   51     inc b
   A5E2 04            [ 4]   52     inc b 
   A5E3 04            [ 4]   53     inc b
   A5E4 04            [ 4]   54     inc b 
   A5E5 04            [ 4]   55     inc b
   A5E6 CD 6C B0      [17]   56     call cpct_getScreenPtr_asm 
   A5E9 36 AA         [10]   57     ld (hl), #0xAA
   A5EB 2C            [ 4]   58     inc l
   A5EC 36 CF         [10]   59    ld (hl), #0xCF
                             60 
                             61    ;;-------------
   A5EE 11 00 C0      [10]   62    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A5F1 DD 4E 00      [19]   63     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A5F4 DD 46 01      [19]   64     ld      b,  entity_y(ix)  
   A5F7 04            [ 4]   65     inc b       
   A5F8 04            [ 4]   66     inc b
   A5F9 04            [ 4]   67     inc b 
   A5FA 04            [ 4]   68     inc b
   A5FB 04            [ 4]   69     inc b 
   A5FC CD 6C B0      [17]   70     call cpct_getScreenPtr_asm 
   A5FF 36 05         [10]   71     ld (hl), #0x05
   A601 2C            [ 4]   72     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   A602 36 8F         [10]   73    ld (hl), #0x8F
                             74 
                             75    ;;---------------------
   A604 11 00 C0      [10]   76    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A607 DD 4E 00      [19]   77     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A60A DD 46 01      [19]   78     ld      b,  entity_y(ix)  
   A60D 04            [ 4]   79     inc b       
   A60E 04            [ 4]   80     inc b
   A60F 04            [ 4]   81     inc b 
   A610 04            [ 4]   82     inc b
   A611 CD 6C B0      [17]   83     call cpct_getScreenPtr_asm 
   A614 36 07         [10]   84     ld (hl), #0x07
   A616 2C            [ 4]   85     inc l
   A617 36 8F         [10]   86    ld (hl), #0x8F
                             87 
                             88    ;;-----------
   A619 11 00 C0      [10]   89    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A61C DD 4E 00      [19]   90     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A61F DD 46 01      [19]   91     ld      b,  entity_y(ix)  
   A622 04            [ 4]   92     inc b       
   A623 04            [ 4]   93     inc b
   A624 04            [ 4]   94     inc b
   A625 CD 6C B0      [17]   95     call cpct_getScreenPtr_asm 
   A628 36 5B         [10]   96     ld (hl), #0x5B
   A62A 2C            [ 4]   97     inc l
   A62B 36 8F         [10]   98    ld (hl), #0x8F
                             99 
                            100    ;;-----------
   A62D 11 00 C0      [10]  101    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A630 DD 4E 00      [19]  102     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A633 DD 46 01      [19]  103     ld      b,  entity_y(ix)  
   A636 04            [ 4]  104     inc b       
   A637 04            [ 4]  105     inc b
   A638 CD 6C B0      [17]  106     call cpct_getScreenPtr_asm 
   A63B 36 0F         [10]  107     ld (hl), #0x0F
   A63D 2C            [ 4]  108     inc l
   A63E 36 8F         [10]  109    ld (hl), #0x8F
                            110 
                            111    ;;-----------
   A640 11 00 C0      [10]  112    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A643 DD 4E 00      [19]  113     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A646 DD 46 01      [19]  114     ld      b,  entity_y(ix)  
   A649 04            [ 4]  115     inc b 
   A64A CD 6C B0      [17]  116     call cpct_getScreenPtr_asm
   A64D 36 5B         [10]  117     ld (hl), #0x5B
   A64F 2C            [ 4]  118     inc l 
   A650 36 8F         [10]  119    ld (hl), #0x8F
                            120 
                            121    ;;-----------
   A652 11 00 C0      [10]  122    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A655 DD 4E 00      [19]  123     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A658 DD 46 01      [19]  124     ld      b,  entity_y(ix)  
   A65B CD 6C B0      [17]  125     call cpct_getScreenPtr_asm 
   A65E 36 07         [10]  126     ld (hl), #0x07
   A660 2C            [ 4]  127     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   A661 36 8F         [10]  128    ld (hl), #0x8F
                            129 
                            130    ;;-----------
   A663 11 00 C0      [10]  131    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A666 DD 4E 00      [19]  132     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A669 DD 46 01      [19]  133     ld      b,  entity_y(ix)  
   A66C 05            [ 4]  134     dec b
   A66D CD 6C B0      [17]  135     call cpct_getScreenPtr_asm
   A670 36 05         [10]  136     ld (hl), #0x05
   A672 2C            [ 4]  137     inc l 
   A673 36 8F         [10]  138    ld (hl), #0x8F
                            139 
                            140    ;;-----------
   A675 11 00 C0      [10]  141    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A678 DD 4E 00      [19]  142     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A67B DD 46 01      [19]  143     ld      b,  entity_y(ix)  
   A67E 05            [ 4]  144     dec b       
   A67F 05            [ 4]  145     dec b
   A680 CD 6C B0      [17]  146     call cpct_getScreenPtr_asm
   A683 36 AA         [10]  147     ld (hl), #0xAA
   A685 2C            [ 4]  148     inc l 
   A686 36 CF         [10]  149    ld (hl), #0xCF
                            150 
                            151    ;;-----------
   A688 11 00 C0      [10]  152    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A68B DD 4E 00      [19]  153     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A68E DD 46 01      [19]  154     ld      b,  entity_y(ix)  
   A691 05            [ 4]  155     dec b       
   A692 05            [ 4]  156     dec b
   A693 05            [ 4]  157     dec b
   A694 CD 6C B0      [17]  158     call cpct_getScreenPtr_asm 
   A697 36 00         [10]  159     ld (hl), #0x00
   A699 2C            [ 4]  160     inc l
   A69A 36 77         [10]  161    ld (hl), #0x77
                            162    ;;-----------
   A69C 11 00 C0      [10]  163    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A69F DD 4E 00      [19]  164     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A6A2 DD 46 01      [19]  165     ld      b,  entity_y(ix)  
   A6A5 05            [ 4]  166     dec b       
   A6A6 05            [ 4]  167     dec b
   A6A7 05            [ 4]  168     dec b
   A6A8 05            [ 4]  169     dec b
   A6A9 CD 6C B0      [17]  170     call cpct_getScreenPtr_asm 
   A6AC 36 00         [10]  171     ld (hl), #0x00
   A6AE 2C            [ 4]  172     inc l
   A6AF 36 00         [10]  173    ld (hl), #0x00
                            174 ;;-----------
   A6B1 11 00 C0      [10]  175    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A6B4 DD 4E 00      [19]  176     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A6B7 DD 46 01      [19]  177     ld      b,  entity_y(ix)  
   A6BA 05            [ 4]  178     dec b       
   A6BB 05            [ 4]  179     dec b
   A6BC 05            [ 4]  180     dec b
   A6BD 05            [ 4]  181     dec b
   A6BE 05            [ 4]  182     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   A6BF CD 6C B0      [17]  183     call cpct_getScreenPtr_asm 
   A6C2 36 00         [10]  184     ld (hl), #0x00
   A6C4 2C            [ 4]  185     inc l
   A6C5 36 00         [10]  186    ld (hl), #0x00
                            187 ;;-----------
   A6C7 11 00 C0      [10]  188    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A6CA DD 4E 00      [19]  189     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A6CD DD 46 01      [19]  190     ld      b,  entity_y(ix)  
   A6D0 05            [ 4]  191     dec b       
   A6D1 05            [ 4]  192     dec b
   A6D2 05            [ 4]  193     dec b
   A6D3 05            [ 4]  194     dec b
   A6D4 05            [ 4]  195     dec b
   A6D5 05            [ 4]  196     dec b
   A6D6 CD 6C B0      [17]  197     call cpct_getScreenPtr_asm 
   A6D9 36 00         [10]  198     ld (hl), #0x00
   A6DB 2C            [ 4]  199     inc l
   A6DC 36 00         [10]  200    ld (hl), #0x00
                            201 ;;-----------
   A6DE 11 00 C0      [10]  202    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A6E1 DD 4E 00      [19]  203     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A6E4 DD 46 01      [19]  204     ld      b,  entity_y(ix)  
   A6E7 05            [ 4]  205     dec b       
   A6E8 05            [ 4]  206     dec b
   A6E9 05            [ 4]  207     dec b
   A6EA 05            [ 4]  208     dec b
   A6EB 05            [ 4]  209     dec b
   A6EC 05            [ 4]  210     dec b
   A6ED 05            [ 4]  211     dec b
   A6EE CD 6C B0      [17]  212     call cpct_getScreenPtr_asm 
   A6F1 36 00         [10]  213     ld (hl), #0x00
   A6F3 2C            [ 4]  214     inc l
   A6F4 36 00         [10]  215    ld (hl), #0x00
                            216 
   A6F6 DD 35 00      [23]  217    dec entity_x(ix)
                            218 
   A6F9 C9            [10]  219 ret
                            220 
                            221    
                            222 
                            223 
                            224 
                            225 
   A6FA                     226     renderPos1:
   A6FA DD 36 04 02   [19]  227     ld entity_estado(ix), #2
   A6FE 11 00 C0      [10]  228      ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A701 DD 4E 00      [19]  229     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A704 DD 46 01      [19]  230     ld      b,  entity_y(ix)  
   A707 04            [ 4]  231     inc b       
   A708 04            [ 4]  232     inc b
   A709 04            [ 4]  233     inc b 
   A70A 04            [ 4]  234     inc b
   A70B 04            [ 4]  235     inc b
   A70C 04            [ 4]  236     inc b 
   A70D 04            [ 4]  237     inc b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   A70E CD 6C B0      [17]  238     call cpct_getScreenPtr_asm 
   A711 36 AA         [10]  239     ld (hl), #0xAA
   A713 2C            [ 4]  240     inc l
   A714 36 88         [10]  241    ld (hl), #0x88
                            242 
                            243 
                            244    ;;-----------
   A716 11 00 C0      [10]  245    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A719 DD 4E 00      [19]  246     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A71C DD 46 01      [19]  247     ld      b,  entity_y(ix)  
   A71F 04            [ 4]  248     inc b       
   A720 04            [ 4]  249     inc b
   A721 04            [ 4]  250     inc b 
   A722 04            [ 4]  251     inc b
   A723 04            [ 4]  252     inc b 
   A724 04            [ 4]  253     inc b
   A725 CD 6C B0      [17]  254     call cpct_getScreenPtr_asm 
   A728 36 05         [10]  255     ld (hl), #0x05
   A72A 2C            [ 4]  256     inc l
   A72B 36 04         [10]  257    ld (hl), #0x04
                            258 
                            259    ;;-------------
   A72D 11 00 C0      [10]  260    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A730 DD 4E 00      [19]  261     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A733 DD 46 01      [19]  262     ld      b,  entity_y(ix)  
   A736 04            [ 4]  263     inc b       
   A737 04            [ 4]  264     inc b
   A738 04            [ 4]  265     inc b 
   A739 04            [ 4]  266     inc b
   A73A 04            [ 4]  267     inc b 
   A73B CD 6C B0      [17]  268     call cpct_getScreenPtr_asm 
   A73E 36 07         [10]  269     ld (hl), #0x07
   A740 2C            [ 4]  270     inc l
   A741 36 1D         [10]  271    ld (hl), #0x1D
                            272 
                            273    ;;---------------------
   A743 11 00 C0      [10]  274    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A746 DD 4E 00      [19]  275     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A749 DD 46 01      [19]  276     ld      b,  entity_y(ix)  
   A74C 04            [ 4]  277     inc b       
   A74D 04            [ 4]  278     inc b
   A74E 04            [ 4]  279     inc b 
   A74F 04            [ 4]  280     inc b
   A750 CD 6C B0      [17]  281     call cpct_getScreenPtr_asm 
   A753 36 5B         [10]  282     ld (hl), #0x5B
   A755 2C            [ 4]  283     inc l
   A756 36 EE         [10]  284    ld (hl), #0xEE
                            285 
                            286    ;;-----------
   A758 11 00 C0      [10]  287    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A75B DD 4E 00      [19]  288     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A75E DD 46 01      [19]  289     ld      b,  entity_y(ix)  
   A761 04            [ 4]  290     inc b       
   A762 04            [ 4]  291     inc b
   A763 04            [ 4]  292     inc b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   A764 CD 6C B0      [17]  293     call cpct_getScreenPtr_asm 
   A767 36 0F         [10]  294     ld (hl), #0x0F
   A769 2C            [ 4]  295     inc l
   A76A 36 0E         [10]  296    ld (hl), #0x0E
                            297 
                            298    ;;-----------
   A76C 11 00 C0      [10]  299    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A76F DD 4E 00      [19]  300     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A772 DD 46 01      [19]  301     ld      b,  entity_y(ix)  
   A775 04            [ 4]  302     inc b       
   A776 04            [ 4]  303     inc b
   A777 CD 6C B0      [17]  304     call cpct_getScreenPtr_asm 
   A77A 36 5B         [10]  305     ld (hl), #0x5B
   A77C 2C            [ 4]  306     inc l
   A77D 36 EE         [10]  307    ld (hl), #0xEE
                            308 
                            309    ;;-----------
   A77F 11 00 C0      [10]  310    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A782 DD 4E 00      [19]  311     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A785 DD 46 01      [19]  312     ld      b,  entity_y(ix)  
   A788 04            [ 4]  313     inc b 
   A789 CD 6C B0      [17]  314     call cpct_getScreenPtr_asm
   A78C 36 07         [10]  315     ld (hl), #0x07
   A78E 2C            [ 4]  316     inc l 
   A78F 36 1D         [10]  317    ld (hl), #0x1D
                            318 
                            319    ;;-----------
   A791 11 00 C0      [10]  320    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A794 DD 4E 00      [19]  321     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A797 DD 46 01      [19]  322     ld      b,  entity_y(ix)  
   A79A CD 6C B0      [17]  323     call cpct_getScreenPtr_asm 
   A79D 36 05         [10]  324     ld (hl), #0x05
   A79F 2C            [ 4]  325     inc l
   A7A0 36 04         [10]  326    ld (hl), #0x04
                            327 
                            328    ;;-----------
   A7A2 11 00 C0      [10]  329    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A7A5 DD 4E 00      [19]  330     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A7A8 DD 46 01      [19]  331     ld      b,  entity_y(ix)  
   A7AB 05            [ 4]  332     dec b
   A7AC CD 6C B0      [17]  333     call cpct_getScreenPtr_asm
   A7AF 36 AA         [10]  334     ld (hl), #0xAA
   A7B1 2C            [ 4]  335     inc l 
   A7B2 36 88         [10]  336    ld (hl), #0x88
                            337 
                            338    ;;-----------
   A7B4 11 00 C0      [10]  339    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A7B7 DD 4E 00      [19]  340     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A7BA DD 46 01      [19]  341     ld      b,  entity_y(ix)  
   A7BD 05            [ 4]  342     dec b       
   A7BE 05            [ 4]  343     dec b
   A7BF CD 6C B0      [17]  344     call cpct_getScreenPtr_asm
   A7C2 36 00         [10]  345     ld (hl), #0x00
   A7C4 2C            [ 4]  346     inc l 
   A7C5 36 00         [10]  347    ld (hl), #0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                            348 
                            349    ;;-----------
   A7C7 11 00 C0      [10]  350    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A7CA DD 4E 00      [19]  351     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A7CD DD 46 01      [19]  352     ld      b,  entity_y(ix)  
   A7D0 05            [ 4]  353     dec b       
   A7D1 05            [ 4]  354     dec b
   A7D2 05            [ 4]  355     dec b
   A7D3 CD 6C B0      [17]  356     call cpct_getScreenPtr_asm 
   A7D6 36 00         [10]  357     ld (hl), #0x00
   A7D8 2C            [ 4]  358     inc l
   A7D9 36 00         [10]  359    ld (hl), #0x00
                            360    ;;-----------
   A7DB 11 00 C0      [10]  361    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A7DE DD 4E 00      [19]  362     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A7E1 DD 46 01      [19]  363     ld      b,  entity_y(ix)  
   A7E4 05            [ 4]  364     dec b       
   A7E5 05            [ 4]  365     dec b
   A7E6 05            [ 4]  366     dec b
   A7E7 05            [ 4]  367     dec b
   A7E8 CD 6C B0      [17]  368     call cpct_getScreenPtr_asm 
   A7EB 36 00         [10]  369     ld (hl), #0x00
   A7ED 2C            [ 4]  370     inc l
   A7EE 36 00         [10]  371    ld (hl), #0x00
                            372 ;;-----------
   A7F0 11 00 C0      [10]  373    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A7F3 DD 4E 00      [19]  374     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A7F6 DD 46 01      [19]  375     ld      b,  entity_y(ix)  
   A7F9 05            [ 4]  376     dec b       
   A7FA 05            [ 4]  377     dec b
   A7FB 05            [ 4]  378     dec b
   A7FC 05            [ 4]  379     dec b
   A7FD 05            [ 4]  380     dec b
   A7FE CD 6C B0      [17]  381     call cpct_getScreenPtr_asm 
   A801 36 00         [10]  382     ld (hl), #0x00
   A803 2C            [ 4]  383     inc l
   A804 36 00         [10]  384    ld (hl), #0x00
                            385 ;;-----------
   A806 11 00 C0      [10]  386    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A809 DD 4E 00      [19]  387     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A80C DD 46 01      [19]  388     ld      b,  entity_y(ix)  
   A80F 05            [ 4]  389     dec b       
   A810 05            [ 4]  390     dec b
   A811 05            [ 4]  391     dec b
   A812 05            [ 4]  392     dec b
   A813 05            [ 4]  393     dec b
   A814 05            [ 4]  394     dec b
   A815 CD 6C B0      [17]  395     call cpct_getScreenPtr_asm 
   A818 36 00         [10]  396     ld (hl), #0x00
   A81A 2C            [ 4]  397     inc l
   A81B 36 00         [10]  398    ld (hl), #0x00
                            399 ;;-----------
   A81D 11 00 C0      [10]  400    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A820 DD 4E 00      [19]  401     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A823 DD 46 01      [19]  402     ld      b,  entity_y(ix)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   A826 05            [ 4]  403     dec b       
   A827 05            [ 4]  404     dec b
   A828 05            [ 4]  405     dec b
   A829 05            [ 4]  406     dec b
   A82A 05            [ 4]  407     dec b
   A82B 05            [ 4]  408     dec b
   A82C 05            [ 4]  409     dec b
   A82D CD 6C B0      [17]  410     call cpct_getScreenPtr_asm 
   A830 36 00         [10]  411     ld (hl), #0x00
   A832 2C            [ 4]  412     inc l
   A833 36 00         [10]  413    ld (hl), #0x00
                            414 
   A835 C9            [10]  415 ret
                            416 
   A836                     417     renderPos2:
   A836 DD 36 04 01   [19]  418     ld entity_estado(ix), #1
                            419     
   A83A 11 00 C0      [10]  420     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A83D DD 4E 00      [19]  421     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A840 DD 46 01      [19]  422     ld      b,  entity_y(ix)  
   A843 04            [ 4]  423     inc b       
   A844 04            [ 4]  424     inc b
   A845 04            [ 4]  425     inc b 
   A846 04            [ 4]  426     inc b
   A847 04            [ 4]  427     inc b
   A848 04            [ 4]  428     inc b 
   A849 04            [ 4]  429     inc b
   A84A CD 6C B0      [17]  430     call cpct_getScreenPtr_asm 
   A84D 36 22         [10]  431     ld (hl), #0x22
   A84F 2C            [ 4]  432     inc l
   A850 36 AA         [10]  433    ld (hl), #0xAA
                            434 
                            435 
                            436    ;;-----------
   A852 11 00 C0      [10]  437    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A855 DD 4E 00      [19]  438     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A858 DD 46 01      [19]  439     ld      b,  entity_y(ix)  
   A85B 04            [ 4]  440     inc b       
   A85C 04            [ 4]  441     inc b
   A85D 04            [ 4]  442     inc b 
   A85E 04            [ 4]  443     inc b
   A85F 04            [ 4]  444     inc b 
   A860 04            [ 4]  445     inc b
   A861 CD 6C B0      [17]  446     call cpct_getScreenPtr_asm 
   A864 36 05         [10]  447     ld (hl), #0x05
   A866 2C            [ 4]  448     inc l
   A867 36 04         [10]  449    ld (hl), #0x04
                            450 
                            451    ;;-------------
   A869 11 00 C0      [10]  452    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A86C DD 4E 00      [19]  453     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A86F DD 46 01      [19]  454     ld      b,  entity_y(ix)  
   A872 04            [ 4]  455     inc b       
   A873 04            [ 4]  456     inc b
   A874 04            [ 4]  457     inc b 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   A875 04            [ 4]  458     inc b
   A876 04            [ 4]  459     inc b 
   A877 CD 6C B0      [17]  460     call cpct_getScreenPtr_asm 
   A87A 36 07         [10]  461     ld (hl), #0x07
   A87C 2C            [ 4]  462     inc l
   A87D 36 1D         [10]  463    ld (hl), #0x1D
                            464 
                            465    ;;---------------------
   A87F 11 00 C0      [10]  466    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A882 DD 4E 00      [19]  467     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A885 DD 46 01      [19]  468     ld      b,  entity_y(ix)  
   A888 04            [ 4]  469     inc b       
   A889 04            [ 4]  470     inc b
   A88A 04            [ 4]  471     inc b 
   A88B 04            [ 4]  472     inc b
   A88C CD 6C B0      [17]  473     call cpct_getScreenPtr_asm 
   A88F 36 5B         [10]  474     ld (hl), #0x5B
   A891 2C            [ 4]  475     inc l
   A892 36 EE         [10]  476    ld (hl), #0xEE
                            477 
                            478    ;;-----------
   A894 11 00 C0      [10]  479    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A897 DD 4E 00      [19]  480     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A89A DD 46 01      [19]  481     ld      b,  entity_y(ix)  
   A89D 04            [ 4]  482     inc b       
   A89E 04            [ 4]  483     inc b
   A89F 04            [ 4]  484     inc b
   A8A0 CD 6C B0      [17]  485     call cpct_getScreenPtr_asm 
   A8A3 36 0F         [10]  486     ld (hl), #0x0F
   A8A5 2C            [ 4]  487     inc l
   A8A6 36 0E         [10]  488    ld (hl), #0x0E
                            489 
                            490    ;;-----------
   A8A8 11 00 C0      [10]  491    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A8AB DD 4E 00      [19]  492     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A8AE DD 46 01      [19]  493     ld      b,  entity_y(ix)  
   A8B1 04            [ 4]  494     inc b       
   A8B2 04            [ 4]  495     inc b
   A8B3 CD 6C B0      [17]  496     call cpct_getScreenPtr_asm 
   A8B6 36 5B         [10]  497     ld (hl), #0x5B
   A8B8 2C            [ 4]  498     inc l
   A8B9 36 EE         [10]  499    ld (hl), #0xEE
                            500 
                            501    ;;-----------
   A8BB 11 00 C0      [10]  502    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A8BE DD 4E 00      [19]  503     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A8C1 DD 46 01      [19]  504     ld      b,  entity_y(ix)  
   A8C4 04            [ 4]  505     inc b 
   A8C5 CD 6C B0      [17]  506     call cpct_getScreenPtr_asm
   A8C8 36 07         [10]  507     ld (hl), #0x07
   A8CA 2C            [ 4]  508     inc l 
   A8CB 36 1D         [10]  509    ld (hl), #0x1D
                            510 
                            511    ;;-----------
   A8CD 11 00 C0      [10]  512    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   A8D0 DD 4E 00      [19]  513     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A8D3 DD 46 01      [19]  514     ld      b,  entity_y(ix)  
   A8D6 CD 6C B0      [17]  515     call cpct_getScreenPtr_asm 
   A8D9 36 05         [10]  516     ld (hl), #0x05
   A8DB 2C            [ 4]  517     inc l
   A8DC 36 04         [10]  518    ld (hl), #0x04
                            519 
                            520    ;;-----------
   A8DE 11 00 C0      [10]  521    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A8E1 DD 4E 00      [19]  522     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A8E4 DD 46 01      [19]  523     ld      b,  entity_y(ix)  
   A8E7 05            [ 4]  524     dec b
   A8E8 CD 6C B0      [17]  525     call cpct_getScreenPtr_asm
   A8EB 36 22         [10]  526     ld (hl), #0x22
   A8ED 2C            [ 4]  527     inc l 
   A8EE 36 AA         [10]  528    ld (hl), #0xAA
                            529 
                            530    ;;-----------
   A8F0 11 00 C0      [10]  531    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A8F3 DD 4E 00      [19]  532     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A8F6 DD 46 01      [19]  533     ld      b,  entity_y(ix)  
   A8F9 05            [ 4]  534     dec b       
   A8FA 05            [ 4]  535     dec b
   A8FB CD 6C B0      [17]  536     call cpct_getScreenPtr_asm
   A8FE 36 00         [10]  537     ld (hl), #0x00
   A900 2C            [ 4]  538     inc l 
   A901 36 00         [10]  539    ld (hl), #0x00
                            540 
                            541    ;;-----------
   A903 11 00 C0      [10]  542    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A906 DD 4E 00      [19]  543     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A909 DD 46 01      [19]  544     ld      b,  entity_y(ix)  
   A90C 05            [ 4]  545     dec b       
   A90D 05            [ 4]  546     dec b
   A90E 05            [ 4]  547     dec b
   A90F CD 6C B0      [17]  548     call cpct_getScreenPtr_asm 
   A912 36 00         [10]  549     ld (hl), #0x00
   A914 2C            [ 4]  550     inc l
   A915 36 00         [10]  551    ld (hl), #0x00
                            552    ;;-----------
   A917 11 00 C0      [10]  553    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A91A DD 4E 00      [19]  554     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A91D DD 46 01      [19]  555     ld      b,  entity_y(ix)  
   A920 05            [ 4]  556     dec b       
   A921 05            [ 4]  557     dec b
   A922 05            [ 4]  558     dec b
   A923 05            [ 4]  559     dec b
   A924 CD 6C B0      [17]  560     call cpct_getScreenPtr_asm 
   A927 36 00         [10]  561     ld (hl), #0x00
   A929 2C            [ 4]  562     inc l
   A92A 36 00         [10]  563    ld (hl), #0x00
                            564 ;;-----------
   A92C 11 00 C0      [10]  565    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A92F DD 4E 00      [19]  566     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A932 DD 46 01      [19]  567     ld      b,  entity_y(ix)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   A935 05            [ 4]  568     dec b       
   A936 05            [ 4]  569     dec b
   A937 05            [ 4]  570     dec b
   A938 05            [ 4]  571     dec b
   A939 05            [ 4]  572     dec b
   A93A CD 6C B0      [17]  573     call cpct_getScreenPtr_asm 
   A93D 36 00         [10]  574     ld (hl), #0x00
   A93F 2C            [ 4]  575     inc l
   A940 36 00         [10]  576    ld (hl), #0x00
                            577 ;;-----------
   A942 11 00 C0      [10]  578    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A945 DD 4E 00      [19]  579     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A948 DD 46 01      [19]  580     ld      b,  entity_y(ix)  
   A94B 05            [ 4]  581     dec b       
   A94C 05            [ 4]  582     dec b
   A94D 05            [ 4]  583     dec b
   A94E 05            [ 4]  584     dec b
   A94F 05            [ 4]  585     dec b
   A950 05            [ 4]  586     dec b
   A951 CD 6C B0      [17]  587     call cpct_getScreenPtr_asm 
   A954 36 00         [10]  588     ld (hl), #0x00
   A956 2C            [ 4]  589     inc l
   A957 36 00         [10]  590    ld (hl), #0x00
                            591 ;;-----------
   A959 11 00 C0      [10]  592    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A95C DD 4E 00      [19]  593     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A95F DD 46 01      [19]  594     ld      b,  entity_y(ix)  
   A962 05            [ 4]  595     dec b       
   A963 05            [ 4]  596     dec b
   A964 05            [ 4]  597     dec b
   A965 05            [ 4]  598     dec b
   A966 05            [ 4]  599     dec b
   A967 05            [ 4]  600     dec b
   A968 05            [ 4]  601     dec b
   A969 CD 6C B0      [17]  602     call cpct_getScreenPtr_asm 
   A96C 36 00         [10]  603     ld (hl), #0x00
   A96E 2C            [ 4]  604     inc l
   A96F 36 00         [10]  605    ld (hl), #0x00
                            606 
   A971 C9            [10]  607 ret
                            608 
                            609 
   A972                     610 borrarEnemigo4::
                            611 
                            612 
   A972 11 00 C0      [10]  613     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A975 DD 4E 00      [19]  614     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A978 DD 46 01      [19]  615     ld      b,  entity_y(ix)  
   A97B 04            [ 4]  616     inc b       
   A97C 04            [ 4]  617     inc b
   A97D 04            [ 4]  618     inc b 
   A97E 04            [ 4]  619     inc b
   A97F 04            [ 4]  620     inc b
   A980 04            [ 4]  621     inc b 
   A981 04            [ 4]  622     inc b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   A982 CD 6C B0      [17]  623     call cpct_getScreenPtr_asm 
   A985 36 00         [10]  624     ld (hl), #0x00
   A987 2C            [ 4]  625     inc l
   A988 36 00         [10]  626    ld (hl), #0x00
                            627 
                            628 
                            629    ;;-----------
   A98A 11 00 C0      [10]  630    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A98D DD 4E 00      [19]  631     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A990 DD 46 01      [19]  632     ld      b,  entity_y(ix)  
   A993 04            [ 4]  633     inc b       
   A994 04            [ 4]  634     inc b
   A995 04            [ 4]  635     inc b 
   A996 04            [ 4]  636     inc b
   A997 04            [ 4]  637     inc b 
   A998 04            [ 4]  638     inc b
   A999 CD 6C B0      [17]  639     call cpct_getScreenPtr_asm 
   A99C 36 00         [10]  640     ld (hl), #0x00
   A99E 2C            [ 4]  641     inc l
   A99F 36 00         [10]  642    ld (hl), #0x00
                            643 
                            644    ;;-------------
   A9A1 11 00 C0      [10]  645    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A9A4 DD 4E 00      [19]  646     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A9A7 DD 46 01      [19]  647     ld      b,  entity_y(ix)  
   A9AA 04            [ 4]  648     inc b       
   A9AB 04            [ 4]  649     inc b
   A9AC 04            [ 4]  650     inc b 
   A9AD 04            [ 4]  651     inc b
   A9AE 04            [ 4]  652     inc b 
   A9AF CD 6C B0      [17]  653     call cpct_getScreenPtr_asm 
   A9B2 36 00         [10]  654     ld (hl), #0x00
   A9B4 2C            [ 4]  655     inc l
   A9B5 36 00         [10]  656    ld (hl), #0x00
                            657 
                            658    ;;---------------------
   A9B7 11 00 C0      [10]  659    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A9BA DD 4E 00      [19]  660     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A9BD DD 46 01      [19]  661     ld      b,  entity_y(ix)  
   A9C0 04            [ 4]  662     inc b       
   A9C1 04            [ 4]  663     inc b
   A9C2 04            [ 4]  664     inc b 
   A9C3 04            [ 4]  665     inc b
   A9C4 CD 6C B0      [17]  666     call cpct_getScreenPtr_asm 
   A9C7 36 00         [10]  667     ld (hl), #0x00
   A9C9 2C            [ 4]  668     inc l
   A9CA 36 00         [10]  669    ld (hl), #0x00
                            670 
                            671    ;;-----------
   A9CC 11 00 C0      [10]  672    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A9CF DD 4E 00      [19]  673     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A9D2 DD 46 01      [19]  674     ld      b,  entity_y(ix)  
   A9D5 04            [ 4]  675     inc b       
   A9D6 04            [ 4]  676     inc b
   A9D7 04            [ 4]  677     inc b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   A9D8 CD 6C B0      [17]  678     call cpct_getScreenPtr_asm 
   A9DB 36 00         [10]  679     ld (hl), #0x00
   A9DD 2C            [ 4]  680     inc l
   A9DE 36 00         [10]  681    ld (hl), #0x00
                            682 
                            683    ;;-----------
   A9E0 11 00 C0      [10]  684    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A9E3 DD 4E 00      [19]  685     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A9E6 DD 46 01      [19]  686     ld      b,  entity_y(ix)  
   A9E9 04            [ 4]  687     inc b       
   A9EA 04            [ 4]  688     inc b
   A9EB CD 6C B0      [17]  689     call cpct_getScreenPtr_asm 
   A9EE 36 00         [10]  690     ld (hl), #0x00
   A9F0 2C            [ 4]  691     inc l
   A9F1 36 00         [10]  692    ld (hl), #0x00
                            693 
                            694    ;;-----------
   A9F3 11 00 C0      [10]  695    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A9F6 DD 4E 00      [19]  696     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   A9F9 DD 46 01      [19]  697     ld      b,  entity_y(ix)  
   A9FC 04            [ 4]  698     inc b 
   A9FD CD 6C B0      [17]  699     call cpct_getScreenPtr_asm
   AA00 36 00         [10]  700     ld (hl), #0x00
   AA02 2C            [ 4]  701     inc l 
   AA03 36 00         [10]  702    ld (hl), #0x00
                            703 
                            704    ;;-----------
   AA05 11 00 C0      [10]  705    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   AA08 DD 4E 00      [19]  706     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   AA0B DD 46 01      [19]  707     ld      b,  entity_y(ix)  
   AA0E CD 6C B0      [17]  708     call cpct_getScreenPtr_asm 
   AA11 36 00         [10]  709     ld (hl), #0x00
   AA13 2C            [ 4]  710     inc l
   AA14 36 00         [10]  711    ld (hl), #0x00
                            712 
                            713    ;;-----------
   AA16 11 00 C0      [10]  714    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   AA19 DD 4E 00      [19]  715     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   AA1C DD 46 01      [19]  716     ld      b,  entity_y(ix)  
   AA1F 05            [ 4]  717     dec b
   AA20 CD 6C B0      [17]  718     call cpct_getScreenPtr_asm
   AA23 36 00         [10]  719     ld (hl), #0x00
   AA25 2C            [ 4]  720     inc l 
   AA26 36 00         [10]  721    ld (hl), #0x00
                            722 
                            723    ;;-----------
   AA28 11 00 C0      [10]  724    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   AA2B DD 4E 00      [19]  725     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   AA2E DD 46 01      [19]  726     ld      b,  entity_y(ix)  
   AA31 05            [ 4]  727     dec b       
   AA32 05            [ 4]  728     dec b
   AA33 CD 6C B0      [17]  729     call cpct_getScreenPtr_asm
   AA36 36 00         [10]  730     ld (hl), #0x00
   AA38 2C            [ 4]  731     inc l 
   AA39 36 00         [10]  732    ld (hl), #0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



                            733 
                            734    ;;-----------
   AA3B 11 00 C0      [10]  735    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   AA3E DD 4E 00      [19]  736     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   AA41 DD 46 01      [19]  737     ld      b,  entity_y(ix)  
   AA44 05            [ 4]  738     dec b       
   AA45 05            [ 4]  739     dec b
   AA46 05            [ 4]  740     dec b
   AA47 CD 6C B0      [17]  741     call cpct_getScreenPtr_asm 
   AA4A 36 00         [10]  742     ld (hl), #0x00
   AA4C 2C            [ 4]  743     inc l
   AA4D 36 00         [10]  744    ld (hl), #0x00
                            745    ;;-----------
   AA4F 11 00 C0      [10]  746    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   AA52 DD 4E 00      [19]  747     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   AA55 DD 46 01      [19]  748     ld      b,  entity_y(ix)  
   AA58 05            [ 4]  749     dec b       
   AA59 05            [ 4]  750     dec b
   AA5A 05            [ 4]  751     dec b
   AA5B 05            [ 4]  752     dec b
   AA5C CD 6C B0      [17]  753     call cpct_getScreenPtr_asm 
   AA5F 36 00         [10]  754     ld (hl), #0x00
   AA61 2C            [ 4]  755     inc l
   AA62 36 00         [10]  756    ld (hl), #0x00
                            757 ;;-----------
   AA64 11 00 C0      [10]  758    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   AA67 DD 4E 00      [19]  759     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   AA6A DD 46 01      [19]  760     ld      b,  entity_y(ix)  
   AA6D 05            [ 4]  761     dec b       
   AA6E 05            [ 4]  762     dec b
   AA6F 05            [ 4]  763     dec b
   AA70 05            [ 4]  764     dec b
   AA71 05            [ 4]  765     dec b
   AA72 CD 6C B0      [17]  766     call cpct_getScreenPtr_asm 
   AA75 36 00         [10]  767     ld (hl), #0x00
   AA77 2C            [ 4]  768     inc l
   AA78 36 00         [10]  769    ld (hl), #0x00
                            770 ;;-----------
   AA7A 11 00 C0      [10]  771    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   AA7D DD 4E 00      [19]  772     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   AA80 DD 46 01      [19]  773     ld      b,  entity_y(ix)  
   AA83 05            [ 4]  774     dec b       
   AA84 05            [ 4]  775     dec b
   AA85 05            [ 4]  776     dec b
   AA86 05            [ 4]  777     dec b
   AA87 05            [ 4]  778     dec b
   AA88 05            [ 4]  779     dec b
   AA89 CD 6C B0      [17]  780     call cpct_getScreenPtr_asm 
   AA8C 36 00         [10]  781     ld (hl), #0x00
   AA8E 2C            [ 4]  782     inc l
   AA8F 36 00         [10]  783    ld (hl), #0x00
                            784 ;;-----------
   AA91 11 00 C0      [10]  785    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   AA94 DD 4E 00      [19]  786     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   AA97 DD 46 01      [19]  787     ld      b,  entity_y(ix)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   AA9A 05            [ 4]  788     dec b       
   AA9B 05            [ 4]  789     dec b
   AA9C 05            [ 4]  790     dec b
   AA9D 05            [ 4]  791     dec b
   AA9E 05            [ 4]  792     dec b
   AA9F 05            [ 4]  793     dec b
   AAA0 05            [ 4]  794     dec b
   AAA1 CD 6C B0      [17]  795     call cpct_getScreenPtr_asm 
   AAA4 36 00         [10]  796     ld (hl), #0x00
   AAA6 2C            [ 4]  797     inc l
   AAA7 36 00         [10]  798    ld (hl), #0x00
                            799 
   AAA9 C9            [10]  800 ret
