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
   7EF6                      19 pintarEnemigo1::
   7EF6 DD 21 1F 40   [14]   20     ld ix, #enemyPos
   7EFA DD 7E 04      [19]   21     ld a, entity_estado(ix)
   7EFD 3D            [ 4]   22     dec a
   7EFE CA 44 80      [10]   23     jp z, renderPos1
   7F01 3D            [ 4]   24     dec a
   7F02 CA 80 81      [10]   25     jp z, renderPos2
                             26 
   7F05                      27     renderPos0:
   7F05 DD 36 04 01   [19]   28     ld entity_estado(ix), #1
                             29 
   7F09 11 00 C0      [10]   30     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7F0C DD 4E 00      [19]   31     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7F0F DD 46 01      [19]   32     ld      b,  entity_y(ix)  
   7F12 04            [ 4]   33     inc b       
   7F13 04            [ 4]   34     inc b
   7F14 04            [ 4]   35     inc b 
   7F15 04            [ 4]   36     inc b
   7F16 04            [ 4]   37     inc b
   7F17 04            [ 4]   38     inc b 
   7F18 04            [ 4]   39     inc b
   7F19 CD 6C B0      [17]   40     call cpct_getScreenPtr_asm 
   7F1C 36 00         [10]   41     ld (hl), #0x00
   7F1E 2C            [ 4]   42     inc l
   7F1F 36 77         [10]   43    ld (hl), #0x77
                             44 
                             45 
                             46    ;;-----------
   7F21 11 00 C0      [10]   47    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7F24 DD 4E 00      [19]   48     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7F27 DD 46 01      [19]   49     ld      b,  entity_y(ix)  
   7F2A 04            [ 4]   50     inc b       
   7F2B 04            [ 4]   51     inc b
   7F2C 04            [ 4]   52     inc b 
   7F2D 04            [ 4]   53     inc b
   7F2E 04            [ 4]   54     inc b 
   7F2F 04            [ 4]   55     inc b
   7F30 CD 6C B0      [17]   56     call cpct_getScreenPtr_asm 
   7F33 36 A0         [10]   57     ld (hl), #0xA0
   7F35 2C            [ 4]   58     inc l
   7F36 36 CF         [10]   59    ld (hl), #0xCF
                             60 
                             61    ;;-------------
   7F38 11 00 C0      [10]   62    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7F3B DD 4E 00      [19]   63     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7F3E DD 46 01      [19]   64     ld      b,  entity_y(ix)  
   7F41 04            [ 4]   65     inc b       
   7F42 04            [ 4]   66     inc b
   7F43 04            [ 4]   67     inc b 
   7F44 04            [ 4]   68     inc b
   7F45 04            [ 4]   69     inc b 
   7F46 CD 6C B0      [17]   70     call cpct_getScreenPtr_asm 
   7F49 36 50         [10]   71     ld (hl), #0x50
   7F4B 2C            [ 4]   72     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   7F4C 36 8F         [10]   73    ld (hl), #0x8F
                             74 
                             75    ;;---------------------
   7F4E 11 00 C0      [10]   76    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7F51 DD 4E 00      [19]   77     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7F54 DD 46 01      [19]   78     ld      b,  entity_y(ix)  
   7F57 04            [ 4]   79     inc b       
   7F58 04            [ 4]   80     inc b
   7F59 04            [ 4]   81     inc b 
   7F5A 04            [ 4]   82     inc b
   7F5B CD 6C B0      [17]   83     call cpct_getScreenPtr_asm 
   7F5E 36 70         [10]   84     ld (hl), #0x70
   7F60 2C            [ 4]   85     inc l
   7F61 36 8F         [10]   86    ld (hl), #0x8F
                             87 
                             88    ;;-----------
   7F63 11 00 C0      [10]   89    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7F66 DD 4E 00      [19]   90     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7F69 DD 46 01      [19]   91     ld      b,  entity_y(ix)  
   7F6C 04            [ 4]   92     inc b       
   7F6D 04            [ 4]   93     inc b
   7F6E 04            [ 4]   94     inc b
   7F6F CD 6C B0      [17]   95     call cpct_getScreenPtr_asm 
   7F72 36 F4         [10]   96     ld (hl), #0xF4
   7F74 2C            [ 4]   97     inc l
   7F75 36 8F         [10]   98    ld (hl), #0x8F
                             99 
                            100    ;;-----------
   7F77 11 00 C0      [10]  101    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7F7A DD 4E 00      [19]  102     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7F7D DD 46 01      [19]  103     ld      b,  entity_y(ix)  
   7F80 04            [ 4]  104     inc b       
   7F81 04            [ 4]  105     inc b
   7F82 CD 6C B0      [17]  106     call cpct_getScreenPtr_asm 
   7F85 36 F0         [10]  107     ld (hl), #0xF0
   7F87 2C            [ 4]  108     inc l
   7F88 36 8F         [10]  109    ld (hl), #0x8F
                            110 
                            111    ;;-----------
   7F8A 11 00 C0      [10]  112    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7F8D DD 4E 00      [19]  113     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7F90 DD 46 01      [19]  114     ld      b,  entity_y(ix)  
   7F93 04            [ 4]  115     inc b 
   7F94 CD 6C B0      [17]  116     call cpct_getScreenPtr_asm
   7F97 36 F4         [10]  117     ld (hl), #0xF4
   7F99 2C            [ 4]  118     inc l 
   7F9A 36 8F         [10]  119    ld (hl), #0x8F
                            120 
                            121    ;;-----------
   7F9C 11 00 C0      [10]  122    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7F9F DD 4E 00      [19]  123     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7FA2 DD 46 01      [19]  124     ld      b,  entity_y(ix)  
   7FA5 CD 6C B0      [17]  125     call cpct_getScreenPtr_asm 
   7FA8 36 70         [10]  126     ld (hl), #0x70
   7FAA 2C            [ 4]  127     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   7FAB 36 8F         [10]  128    ld (hl), #0x8F
                            129 
                            130    ;;-----------
   7FAD 11 00 C0      [10]  131    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7FB0 DD 4E 00      [19]  132     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7FB3 DD 46 01      [19]  133     ld      b,  entity_y(ix)  
   7FB6 05            [ 4]  134     dec b
   7FB7 CD 6C B0      [17]  135     call cpct_getScreenPtr_asm
   7FBA 36 50         [10]  136     ld (hl), #0x50
   7FBC 2C            [ 4]  137     inc l 
   7FBD 36 8F         [10]  138    ld (hl), #0x8F
                            139 
                            140    ;;-----------
   7FBF 11 00 C0      [10]  141    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7FC2 DD 4E 00      [19]  142     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7FC5 DD 46 01      [19]  143     ld      b,  entity_y(ix)  
   7FC8 05            [ 4]  144     dec b       
   7FC9 05            [ 4]  145     dec b
   7FCA CD 6C B0      [17]  146     call cpct_getScreenPtr_asm
   7FCD 36 A0         [10]  147     ld (hl), #0xA0
   7FCF 2C            [ 4]  148     inc l 
   7FD0 36 CF         [10]  149    ld (hl), #0xCF
                            150 
                            151    ;;-----------
   7FD2 11 00 C0      [10]  152    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7FD5 DD 4E 00      [19]  153     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7FD8 DD 46 01      [19]  154     ld      b,  entity_y(ix)  
   7FDB 05            [ 4]  155     dec b       
   7FDC 05            [ 4]  156     dec b
   7FDD 05            [ 4]  157     dec b
   7FDE CD 6C B0      [17]  158     call cpct_getScreenPtr_asm 
   7FE1 36 00         [10]  159     ld (hl), #0x00
   7FE3 2C            [ 4]  160     inc l
   7FE4 36 77         [10]  161    ld (hl), #0x77
                            162    ;;-----------
   7FE6 11 00 C0      [10]  163    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7FE9 DD 4E 00      [19]  164     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7FEC DD 46 01      [19]  165     ld      b,  entity_y(ix)  
   7FEF 05            [ 4]  166     dec b       
   7FF0 05            [ 4]  167     dec b
   7FF1 05            [ 4]  168     dec b
   7FF2 05            [ 4]  169     dec b
   7FF3 CD 6C B0      [17]  170     call cpct_getScreenPtr_asm 
   7FF6 36 00         [10]  171     ld (hl), #0x00
   7FF8 2C            [ 4]  172     inc l
   7FF9 36 00         [10]  173    ld (hl), #0x00
                            174 ;;-----------
   7FFB 11 00 C0      [10]  175    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7FFE DD 4E 00      [19]  176     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8001 DD 46 01      [19]  177     ld      b,  entity_y(ix)  
   8004 05            [ 4]  178     dec b       
   8005 05            [ 4]  179     dec b
   8006 05            [ 4]  180     dec b
   8007 05            [ 4]  181     dec b
   8008 05            [ 4]  182     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   8009 CD 6C B0      [17]  183     call cpct_getScreenPtr_asm 
   800C 36 00         [10]  184     ld (hl), #0x00
   800E 2C            [ 4]  185     inc l
   800F 36 00         [10]  186    ld (hl), #0x00
                            187 ;;-----------
   8011 11 00 C0      [10]  188    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8014 DD 4E 00      [19]  189     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8017 DD 46 01      [19]  190     ld      b,  entity_y(ix)  
   801A 05            [ 4]  191     dec b       
   801B 05            [ 4]  192     dec b
   801C 05            [ 4]  193     dec b
   801D 05            [ 4]  194     dec b
   801E 05            [ 4]  195     dec b
   801F 05            [ 4]  196     dec b
   8020 CD 6C B0      [17]  197     call cpct_getScreenPtr_asm 
   8023 36 00         [10]  198     ld (hl), #0x00
   8025 2C            [ 4]  199     inc l
   8026 36 00         [10]  200    ld (hl), #0x00
                            201 ;;-----------
   8028 11 00 C0      [10]  202    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   802B DD 4E 00      [19]  203     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   802E DD 46 01      [19]  204     ld      b,  entity_y(ix)  
   8031 05            [ 4]  205     dec b       
   8032 05            [ 4]  206     dec b
   8033 05            [ 4]  207     dec b
   8034 05            [ 4]  208     dec b
   8035 05            [ 4]  209     dec b
   8036 05            [ 4]  210     dec b
   8037 05            [ 4]  211     dec b
   8038 CD 6C B0      [17]  212     call cpct_getScreenPtr_asm 
   803B 36 00         [10]  213     ld (hl), #0x00
   803D 2C            [ 4]  214     inc l
   803E 36 00         [10]  215    ld (hl), #0x00
                            216 
   8040 DD 35 00      [23]  217    dec entity_x(ix)
                            218 
   8043 C9            [10]  219 ret
                            220 
                            221 
   8044                     222     renderPos1:
   8044 DD 36 04 02   [19]  223     ld entity_estado(ix), #2
   8048 11 00 C0      [10]  224     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   804B DD 4E 00      [19]  225     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   804E DD 46 01      [19]  226     ld      b,  entity_y(ix)  
   8051 04            [ 4]  227     inc b       
   8052 04            [ 4]  228     inc b
   8053 04            [ 4]  229     inc b 
   8054 04            [ 4]  230     inc b
   8055 04            [ 4]  231     inc b
   8056 04            [ 4]  232     inc b 
   8057 04            [ 4]  233     inc b
   8058 CD 6C B0      [17]  234     call cpct_getScreenPtr_asm 
   805B 36 A0         [10]  235     ld (hl), #0xA0
   805D 2C            [ 4]  236     inc l
   805E 36 80         [10]  237    ld (hl), #0x80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                            238 
                            239 
                            240    ;;-----------
   8060 11 00 C0      [10]  241    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8063 DD 4E 00      [19]  242     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8066 DD 46 01      [19]  243     ld      b,  entity_y(ix)  
   8069 04            [ 4]  244     inc b       
   806A 04            [ 4]  245     inc b
   806B 04            [ 4]  246     inc b 
   806C 04            [ 4]  247     inc b
   806D 04            [ 4]  248     inc b 
   806E 04            [ 4]  249     inc b
   806F CD 6C B0      [17]  250     call cpct_getScreenPtr_asm 
   8072 36 50         [10]  251     ld (hl), #0x50
   8074 2C            [ 4]  252     inc l
   8075 36 40         [10]  253    ld (hl), #0x40
                            254 
                            255    ;;-------------
   8077 11 00 C0      [10]  256    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   807A DD 4E 00      [19]  257     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   807D DD 46 01      [19]  258     ld      b,  entity_y(ix)  
   8080 04            [ 4]  259     inc b       
   8081 04            [ 4]  260     inc b
   8082 04            [ 4]  261     inc b 
   8083 04            [ 4]  262     inc b
   8084 04            [ 4]  263     inc b 
   8085 CD 6C B0      [17]  264     call cpct_getScreenPtr_asm 
   8088 36 70         [10]  265     ld (hl), #0x70
   808A 2C            [ 4]  266     inc l
   808B 36 D0         [10]  267    ld (hl), #0xD0
                            268 
                            269    ;;---------------------
   808D 11 00 C0      [10]  270    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8090 DD 4E 00      [19]  271     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8093 DD 46 01      [19]  272     ld      b,  entity_y(ix)  
   8096 04            [ 4]  273     inc b       
   8097 04            [ 4]  274     inc b
   8098 04            [ 4]  275     inc b 
   8099 04            [ 4]  276     inc b
   809A CD 6C B0      [17]  277     call cpct_getScreenPtr_asm 
   809D 36 F4         [10]  278     ld (hl), #0xF4
   809F 2C            [ 4]  279     inc l
   80A0 36 E0         [10]  280    ld (hl), #0xE0
                            281 
                            282    ;;-----------
   80A2 11 00 C0      [10]  283    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   80A5 DD 4E 00      [19]  284     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   80A8 DD 46 01      [19]  285     ld      b,  entity_y(ix)  
   80AB 04            [ 4]  286     inc b       
   80AC 04            [ 4]  287     inc b
   80AD 04            [ 4]  288     inc b
   80AE CD 6C B0      [17]  289     call cpct_getScreenPtr_asm 
   80B1 36 F0         [10]  290     ld (hl), #0xF0
   80B3 2C            [ 4]  291     inc l
   80B4 36 E0         [10]  292    ld (hl), #0xE0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            293 
                            294    ;;-----------
   80B6 11 00 C0      [10]  295    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   80B9 DD 4E 00      [19]  296     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   80BC DD 46 01      [19]  297     ld      b,  entity_y(ix)  
   80BF 04            [ 4]  298     inc b       
   80C0 04            [ 4]  299     inc b
   80C1 CD 6C B0      [17]  300     call cpct_getScreenPtr_asm 
   80C4 36 F4         [10]  301     ld (hl), #0xF4
   80C6 2C            [ 4]  302     inc l
   80C7 36 E0         [10]  303    ld (hl), #0xE0
                            304 
                            305    ;;-----------
   80C9 11 00 C0      [10]  306    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   80CC DD 4E 00      [19]  307     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   80CF DD 46 01      [19]  308     ld      b,  entity_y(ix)  
   80D2 04            [ 4]  309     inc b 
   80D3 CD 6C B0      [17]  310     call cpct_getScreenPtr_asm
   80D6 36 70         [10]  311     ld (hl), #0x70
   80D8 2C            [ 4]  312     inc l 
   80D9 36 D0         [10]  313    ld (hl), #0xD0
                            314 
                            315    ;;-----------
   80DB 11 00 C0      [10]  316    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   80DE DD 4E 00      [19]  317     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   80E1 DD 46 01      [19]  318     ld      b,  entity_y(ix)  
   80E4 CD 6C B0      [17]  319     call cpct_getScreenPtr_asm 
   80E7 36 50         [10]  320     ld (hl), #0x50
   80E9 2C            [ 4]  321     inc l
   80EA 36 40         [10]  322    ld (hl), #0x40
                            323 
                            324    ;;-----------
   80EC 11 00 C0      [10]  325    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   80EF DD 4E 00      [19]  326     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   80F2 DD 46 01      [19]  327     ld      b,  entity_y(ix)  
   80F5 05            [ 4]  328     dec b
   80F6 CD 6C B0      [17]  329     call cpct_getScreenPtr_asm
   80F9 36 A0         [10]  330     ld (hl), #0xA0
   80FB 2C            [ 4]  331     inc l 
   80FC 36 80         [10]  332    ld (hl), #0x80
                            333 
                            334    ;;-----------
   80FE 11 00 C0      [10]  335    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8101 DD 4E 00      [19]  336     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8104 DD 46 01      [19]  337     ld      b,  entity_y(ix)  
   8107 05            [ 4]  338     dec b       
   8108 05            [ 4]  339     dec b
   8109 CD 6C B0      [17]  340     call cpct_getScreenPtr_asm
   810C 36 00         [10]  341     ld (hl), #0x00
   810E 2C            [ 4]  342     inc l 
   810F 36 00         [10]  343    ld (hl), #0x00
                            344 
                            345    ;;-----------
   8111 11 00 C0      [10]  346    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8114 DD 4E 00      [19]  347     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   8117 DD 46 01      [19]  348     ld      b,  entity_y(ix)  
   811A 05            [ 4]  349     dec b       
   811B 05            [ 4]  350     dec b
   811C 05            [ 4]  351     dec b
   811D CD 6C B0      [17]  352     call cpct_getScreenPtr_asm 
   8120 36 00         [10]  353     ld (hl), #0x00
   8122 2C            [ 4]  354     inc l
   8123 36 00         [10]  355    ld (hl), #0x00
                            356    ;;-----------
   8125 11 00 C0      [10]  357    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8128 DD 4E 00      [19]  358     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   812B DD 46 01      [19]  359     ld      b,  entity_y(ix)  
   812E 05            [ 4]  360     dec b       
   812F 05            [ 4]  361     dec b
   8130 05            [ 4]  362     dec b
   8131 05            [ 4]  363     dec b
   8132 CD 6C B0      [17]  364     call cpct_getScreenPtr_asm 
   8135 36 00         [10]  365     ld (hl), #0x00
   8137 2C            [ 4]  366     inc l
   8138 36 00         [10]  367    ld (hl), #0x00
                            368 ;;-----------
   813A 11 00 C0      [10]  369    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   813D DD 4E 00      [19]  370     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8140 DD 46 01      [19]  371     ld      b,  entity_y(ix)  
   8143 05            [ 4]  372     dec b       
   8144 05            [ 4]  373     dec b
   8145 05            [ 4]  374     dec b
   8146 05            [ 4]  375     dec b
   8147 05            [ 4]  376     dec b
   8148 CD 6C B0      [17]  377     call cpct_getScreenPtr_asm 
   814B 36 00         [10]  378     ld (hl), #0x00
   814D 2C            [ 4]  379     inc l
   814E 36 00         [10]  380    ld (hl), #0x00
                            381 ;;-----------
   8150 11 00 C0      [10]  382    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8153 DD 4E 00      [19]  383     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8156 DD 46 01      [19]  384     ld      b,  entity_y(ix)  
   8159 05            [ 4]  385     dec b       
   815A 05            [ 4]  386     dec b
   815B 05            [ 4]  387     dec b
   815C 05            [ 4]  388     dec b
   815D 05            [ 4]  389     dec b
   815E 05            [ 4]  390     dec b
   815F CD 6C B0      [17]  391     call cpct_getScreenPtr_asm 
   8162 36 00         [10]  392     ld (hl), #0x00
   8164 2C            [ 4]  393     inc l
   8165 36 00         [10]  394    ld (hl), #0x00
                            395 ;;-----------
   8167 11 00 C0      [10]  396    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   816A DD 4E 00      [19]  397     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   816D DD 46 01      [19]  398     ld      b,  entity_y(ix)  
   8170 05            [ 4]  399     dec b       
   8171 05            [ 4]  400     dec b
   8172 05            [ 4]  401     dec b
   8173 05            [ 4]  402     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   8174 05            [ 4]  403     dec b
   8175 05            [ 4]  404     dec b
   8176 05            [ 4]  405     dec b
   8177 CD 6C B0      [17]  406     call cpct_getScreenPtr_asm 
   817A 36 00         [10]  407     ld (hl), #0x00
   817C 2C            [ 4]  408     inc l
   817D 36 00         [10]  409    ld (hl), #0x00
                            410 
   817F C9            [10]  411 ret
                            412 
   8180                     413     renderPos2:
   8180 DD 36 04 01   [19]  414     ld entity_estado(ix), #1
   8184 11 00 C0      [10]  415     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8187 DD 4E 00      [19]  416     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   818A DD 46 01      [19]  417     ld      b,  entity_y(ix)  
   818D 04            [ 4]  418     inc b       
   818E 04            [ 4]  419     inc b
   818F 04            [ 4]  420     inc b 
   8190 04            [ 4]  421     inc b
   8191 04            [ 4]  422     inc b
   8192 04            [ 4]  423     inc b 
   8193 04            [ 4]  424     inc b
   8194 CD 6C B0      [17]  425     call cpct_getScreenPtr_asm 
   8197 36 20         [10]  426     ld (hl), #0x20
   8199 2C            [ 4]  427     inc l
   819A 36 A0         [10]  428    ld (hl), #0xA0
                            429 
                            430 
                            431    ;;-----------
   819C 11 00 C0      [10]  432    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   819F DD 4E 00      [19]  433     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   81A2 DD 46 01      [19]  434     ld      b,  entity_y(ix)  
   81A5 04            [ 4]  435     inc b       
   81A6 04            [ 4]  436     inc b
   81A7 04            [ 4]  437     inc b 
   81A8 04            [ 4]  438     inc b
   81A9 04            [ 4]  439     inc b 
   81AA 04            [ 4]  440     inc b
   81AB CD 6C B0      [17]  441     call cpct_getScreenPtr_asm 
   81AE 36 50         [10]  442     ld (hl), #0x50
   81B0 2C            [ 4]  443     inc l
   81B1 36 40         [10]  444    ld (hl), #0x40
                            445 
                            446    ;;-------------
   81B3 11 00 C0      [10]  447    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   81B6 DD 4E 00      [19]  448     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   81B9 DD 46 01      [19]  449     ld      b,  entity_y(ix)  
   81BC 04            [ 4]  450     inc b       
   81BD 04            [ 4]  451     inc b
   81BE 04            [ 4]  452     inc b 
   81BF 04            [ 4]  453     inc b
   81C0 04            [ 4]  454     inc b 
   81C1 CD 6C B0      [17]  455     call cpct_getScreenPtr_asm 
   81C4 36 70         [10]  456     ld (hl), #0x70
   81C6 2C            [ 4]  457     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   81C7 36 D0         [10]  458    ld (hl), #0xD0
                            459 
                            460    ;;---------------------
   81C9 11 00 C0      [10]  461    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   81CC DD 4E 00      [19]  462     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   81CF DD 46 01      [19]  463     ld      b,  entity_y(ix)  
   81D2 04            [ 4]  464     inc b       
   81D3 04            [ 4]  465     inc b
   81D4 04            [ 4]  466     inc b 
   81D5 04            [ 4]  467     inc b
   81D6 CD 6C B0      [17]  468     call cpct_getScreenPtr_asm 
   81D9 36 F4         [10]  469     ld (hl), #0xF4
   81DB 2C            [ 4]  470     inc l
   81DC 36 E0         [10]  471    ld (hl), #0xE0
                            472 
                            473    ;;-----------
   81DE 11 00 C0      [10]  474    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   81E1 DD 4E 00      [19]  475     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   81E4 DD 46 01      [19]  476     ld      b,  entity_y(ix)  
   81E7 04            [ 4]  477     inc b       
   81E8 04            [ 4]  478     inc b
   81E9 04            [ 4]  479     inc b
   81EA CD 6C B0      [17]  480     call cpct_getScreenPtr_asm 
   81ED 36 F0         [10]  481     ld (hl), #0xF0
   81EF 2C            [ 4]  482     inc l
   81F0 36 E0         [10]  483    ld (hl), #0xE0
                            484 
                            485    ;;-----------
   81F2 11 00 C0      [10]  486    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   81F5 DD 4E 00      [19]  487     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   81F8 DD 46 01      [19]  488     ld      b,  entity_y(ix)  
   81FB 04            [ 4]  489     inc b       
   81FC 04            [ 4]  490     inc b
   81FD CD 6C B0      [17]  491     call cpct_getScreenPtr_asm 
   8200 36 F4         [10]  492     ld (hl), #0xF4
   8202 2C            [ 4]  493     inc l
   8203 36 E0         [10]  494    ld (hl), #0xE0
                            495 
                            496    ;;-----------
   8205 11 00 C0      [10]  497    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8208 DD 4E 00      [19]  498     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   820B DD 46 01      [19]  499     ld      b,  entity_y(ix)  
   820E 04            [ 4]  500     inc b 
   820F CD 6C B0      [17]  501     call cpct_getScreenPtr_asm
   8212 36 70         [10]  502     ld (hl), #0x70
   8214 2C            [ 4]  503     inc l 
   8215 36 D0         [10]  504    ld (hl), #0xD0
                            505 
                            506    ;;-----------
   8217 11 00 C0      [10]  507    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   821A DD 4E 00      [19]  508     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   821D DD 46 01      [19]  509     ld      b,  entity_y(ix)  
   8220 CD 6C B0      [17]  510     call cpct_getScreenPtr_asm 
   8223 36 50         [10]  511     ld (hl), #0x50
   8225 2C            [ 4]  512     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   8226 36 40         [10]  513    ld (hl), #0x40
                            514 
                            515    ;;-----------
   8228 11 00 C0      [10]  516    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   822B DD 4E 00      [19]  517     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   822E DD 46 01      [19]  518     ld      b,  entity_y(ix)  
   8231 05            [ 4]  519     dec b
   8232 CD 6C B0      [17]  520     call cpct_getScreenPtr_asm
   8235 36 20         [10]  521     ld (hl), #0x20
   8237 2C            [ 4]  522     inc l 
   8238 36 A0         [10]  523    ld (hl), #0xA0
                            524 
                            525    ;;-----------
   823A 11 00 C0      [10]  526    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   823D DD 4E 00      [19]  527     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8240 DD 46 01      [19]  528     ld      b,  entity_y(ix)  
   8243 05            [ 4]  529     dec b       
   8244 05            [ 4]  530     dec b
   8245 CD 6C B0      [17]  531     call cpct_getScreenPtr_asm
   8248 36 00         [10]  532     ld (hl), #0x00
   824A 2C            [ 4]  533     inc l 
   824B 36 00         [10]  534    ld (hl), #0x00
                            535 
                            536    ;;-----------
   824D 11 00 C0      [10]  537    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8250 DD 4E 00      [19]  538     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8253 DD 46 01      [19]  539     ld      b,  entity_y(ix)  
   8256 05            [ 4]  540     dec b       
   8257 05            [ 4]  541     dec b
   8258 05            [ 4]  542     dec b
   8259 CD 6C B0      [17]  543     call cpct_getScreenPtr_asm 
   825C 36 00         [10]  544     ld (hl), #0x00
   825E 2C            [ 4]  545     inc l
   825F 36 00         [10]  546    ld (hl), #0x00
                            547    ;;-----------
   8261 11 00 C0      [10]  548    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8264 DD 4E 00      [19]  549     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8267 DD 46 01      [19]  550     ld      b,  entity_y(ix)  
   826A 05            [ 4]  551     dec b       
   826B 05            [ 4]  552     dec b
   826C 05            [ 4]  553     dec b
   826D 05            [ 4]  554     dec b
   826E CD 6C B0      [17]  555     call cpct_getScreenPtr_asm 
   8271 36 00         [10]  556     ld (hl), #0x00
   8273 2C            [ 4]  557     inc l
   8274 36 00         [10]  558    ld (hl), #0x00
                            559 ;;-----------
   8276 11 00 C0      [10]  560    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8279 DD 4E 00      [19]  561     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   827C DD 46 01      [19]  562     ld      b,  entity_y(ix)  
   827F 05            [ 4]  563     dec b       
   8280 05            [ 4]  564     dec b
   8281 05            [ 4]  565     dec b
   8282 05            [ 4]  566     dec b
   8283 05            [ 4]  567     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   8284 CD 6C B0      [17]  568     call cpct_getScreenPtr_asm 
   8287 36 00         [10]  569     ld (hl), #0x00
   8289 2C            [ 4]  570     inc l
   828A 36 00         [10]  571    ld (hl), #0x00
                            572 ;;-----------
   828C 11 00 C0      [10]  573    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   828F DD 4E 00      [19]  574     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8292 DD 46 01      [19]  575     ld      b,  entity_y(ix)  
   8295 05            [ 4]  576     dec b       
   8296 05            [ 4]  577     dec b
   8297 05            [ 4]  578     dec b
   8298 05            [ 4]  579     dec b
   8299 05            [ 4]  580     dec b
   829A 05            [ 4]  581     dec b
   829B CD 6C B0      [17]  582     call cpct_getScreenPtr_asm 
   829E 36 00         [10]  583     ld (hl), #0x00
   82A0 2C            [ 4]  584     inc l
   82A1 36 00         [10]  585    ld (hl), #0x00
                            586 ;;-----------
   82A3 11 00 C0      [10]  587    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   82A6 DD 4E 00      [19]  588     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   82A9 DD 46 01      [19]  589     ld      b,  entity_y(ix)  
   82AC 05            [ 4]  590     dec b       
   82AD 05            [ 4]  591     dec b
   82AE 05            [ 4]  592     dec b
   82AF 05            [ 4]  593     dec b
   82B0 05            [ 4]  594     dec b
   82B1 05            [ 4]  595     dec b
   82B2 05            [ 4]  596     dec b
   82B3 CD 6C B0      [17]  597     call cpct_getScreenPtr_asm 
   82B6 36 00         [10]  598     ld (hl), #0x00
   82B8 2C            [ 4]  599     inc l
   82B9 36 00         [10]  600    ld (hl), #0x00
                            601 
   82BB C9            [10]  602 ret
                            603 
   82BC                     604 borrarEnemigo1::
                            605 
   82BC 11 00 C0      [10]  606 ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   82BF DD 4E 00      [19]  607     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   82C2 DD 46 01      [19]  608     ld      b,  entity_y(ix)  
   82C5 04            [ 4]  609     inc b       
   82C6 04            [ 4]  610     inc b
   82C7 04            [ 4]  611     inc b 
   82C8 04            [ 4]  612     inc b
   82C9 04            [ 4]  613     inc b
   82CA 04            [ 4]  614     inc b 
   82CB 04            [ 4]  615     inc b
   82CC CD 6C B0      [17]  616     call cpct_getScreenPtr_asm 
   82CF 36 00         [10]  617     ld (hl), #0x00
   82D1 2C            [ 4]  618     inc l
   82D2 36 00         [10]  619    ld (hl), #0x00
                            620 
                            621 
                            622    ;;-----------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   82D4 11 00 C0      [10]  623    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   82D7 DD 4E 00      [19]  624     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   82DA DD 46 01      [19]  625     ld      b,  entity_y(ix)  
   82DD 04            [ 4]  626     inc b       
   82DE 04            [ 4]  627     inc b
   82DF 04            [ 4]  628     inc b 
   82E0 04            [ 4]  629     inc b
   82E1 04            [ 4]  630     inc b 
   82E2 04            [ 4]  631     inc b
   82E3 CD 6C B0      [17]  632     call cpct_getScreenPtr_asm 
   82E6 36 00         [10]  633     ld (hl), #0x00
   82E8 2C            [ 4]  634     inc l
   82E9 36 00         [10]  635    ld (hl), #0x00
                            636 
                            637    ;;-------------
   82EB 11 00 C0      [10]  638    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   82EE DD 4E 00      [19]  639     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   82F1 DD 46 01      [19]  640     ld      b,  entity_y(ix)  
   82F4 04            [ 4]  641     inc b       
   82F5 04            [ 4]  642     inc b
   82F6 04            [ 4]  643     inc b 
   82F7 04            [ 4]  644     inc b
   82F8 04            [ 4]  645     inc b 
   82F9 CD 6C B0      [17]  646     call cpct_getScreenPtr_asm 
   82FC 36 00         [10]  647     ld (hl), #0x00
   82FE 2C            [ 4]  648     inc l
   82FF 36 00         [10]  649    ld (hl), #0x00
                            650 
                            651    ;;---------------------
   8301 11 00 C0      [10]  652    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8304 DD 4E 00      [19]  653     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8307 DD 46 01      [19]  654     ld      b,  entity_y(ix)  
   830A 04            [ 4]  655     inc b       
   830B 04            [ 4]  656     inc b
   830C 04            [ 4]  657     inc b 
   830D 04            [ 4]  658     inc b
   830E CD 6C B0      [17]  659     call cpct_getScreenPtr_asm 
   8311 36 00         [10]  660     ld (hl), #0x00
   8313 2C            [ 4]  661     inc l
   8314 36 00         [10]  662    ld (hl), #0x00
                            663 
                            664    ;;-----------
   8316 11 00 C0      [10]  665    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8319 DD 4E 00      [19]  666     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   831C DD 46 01      [19]  667     ld      b,  entity_y(ix)  
   831F 04            [ 4]  668     inc b       
   8320 04            [ 4]  669     inc b
   8321 04            [ 4]  670     inc b
   8322 CD 6C B0      [17]  671     call cpct_getScreenPtr_asm 
   8325 36 00         [10]  672     ld (hl), #0x00
   8327 2C            [ 4]  673     inc l
   8328 36 00         [10]  674    ld (hl), #0x00
                            675 
                            676    ;;-----------
   832A 11 00 C0      [10]  677    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   832D DD 4E 00      [19]  678     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8330 DD 46 01      [19]  679     ld      b,  entity_y(ix)  
   8333 04            [ 4]  680     inc b       
   8334 04            [ 4]  681     inc b
   8335 CD 6C B0      [17]  682     call cpct_getScreenPtr_asm 
   8338 36 00         [10]  683     ld (hl), #0x00
   833A 2C            [ 4]  684     inc l
   833B 36 00         [10]  685    ld (hl), #0x00
                            686 
                            687    ;;-----------
   833D 11 00 C0      [10]  688    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8340 DD 4E 00      [19]  689     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8343 DD 46 01      [19]  690     ld      b,  entity_y(ix)  
   8346 04            [ 4]  691     inc b 
   8347 CD 6C B0      [17]  692     call cpct_getScreenPtr_asm
   834A 36 00         [10]  693     ld (hl), #0x00
   834C 2C            [ 4]  694     inc l 
   834D 36 00         [10]  695    ld (hl), #0x00
                            696 
                            697    ;;-----------
   834F 11 00 C0      [10]  698    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8352 DD 4E 00      [19]  699     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8355 DD 46 01      [19]  700     ld      b,  entity_y(ix)  
   8358 CD 6C B0      [17]  701     call cpct_getScreenPtr_asm 
   835B 36 00         [10]  702     ld (hl), #0x00
   835D 2C            [ 4]  703     inc l
   835E 36 00         [10]  704    ld (hl), #0x00
                            705 
                            706    ;;-----------
   8360 11 00 C0      [10]  707    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8363 DD 4E 00      [19]  708     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8366 DD 46 01      [19]  709     ld      b,  entity_y(ix)  
   8369 05            [ 4]  710     dec b
   836A CD 6C B0      [17]  711     call cpct_getScreenPtr_asm
   836D 36 00         [10]  712     ld (hl), #0x00
   836F 2C            [ 4]  713     inc l 
   8370 36 00         [10]  714    ld (hl), #0x00
                            715 
                            716    ;;-----------
   8372 11 00 C0      [10]  717    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8375 DD 4E 00      [19]  718     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8378 DD 46 01      [19]  719     ld      b,  entity_y(ix)  
   837B 05            [ 4]  720     dec b       
   837C 05            [ 4]  721     dec b
   837D CD 6C B0      [17]  722     call cpct_getScreenPtr_asm
   8380 36 00         [10]  723     ld (hl), #0x00
   8382 2C            [ 4]  724     inc l 
   8383 36 00         [10]  725    ld (hl), #0x00
                            726 
                            727    ;;-----------
   8385 11 00 C0      [10]  728    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8388 DD 4E 00      [19]  729     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   838B DD 46 01      [19]  730     ld      b,  entity_y(ix)  
   838E 05            [ 4]  731     dec b       
   838F 05            [ 4]  732     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   8390 05            [ 4]  733     dec b
   8391 CD 6C B0      [17]  734     call cpct_getScreenPtr_asm 
   8394 36 00         [10]  735     ld (hl), #0x00
   8396 2C            [ 4]  736     inc l
   8397 36 00         [10]  737    ld (hl), #0x00
                            738    ;;-----------
   8399 11 00 C0      [10]  739    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   839C DD 4E 00      [19]  740     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   839F DD 46 01      [19]  741     ld      b,  entity_y(ix)  
   83A2 05            [ 4]  742     dec b       
   83A3 05            [ 4]  743     dec b
   83A4 05            [ 4]  744     dec b
   83A5 05            [ 4]  745     dec b
   83A6 CD 6C B0      [17]  746     call cpct_getScreenPtr_asm 
   83A9 36 00         [10]  747     ld (hl), #0x00
   83AB 2C            [ 4]  748     inc l
   83AC 36 00         [10]  749    ld (hl), #0x00
                            750 ;;-----------
   83AE 11 00 C0      [10]  751    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   83B1 DD 4E 00      [19]  752     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   83B4 DD 46 01      [19]  753     ld      b,  entity_y(ix)  
   83B7 05            [ 4]  754     dec b       
   83B8 05            [ 4]  755     dec b
   83B9 05            [ 4]  756     dec b
   83BA 05            [ 4]  757     dec b
   83BB 05            [ 4]  758     dec b
   83BC CD 6C B0      [17]  759     call cpct_getScreenPtr_asm 
   83BF 36 00         [10]  760     ld (hl), #0x00
   83C1 2C            [ 4]  761     inc l
   83C2 36 00         [10]  762    ld (hl), #0x00
                            763 ;;-----------
   83C4 11 00 C0      [10]  764    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   83C7 DD 4E 00      [19]  765     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   83CA DD 46 01      [19]  766     ld      b,  entity_y(ix)  
   83CD 05            [ 4]  767     dec b       
   83CE 05            [ 4]  768     dec b
   83CF 05            [ 4]  769     dec b
   83D0 05            [ 4]  770     dec b
   83D1 05            [ 4]  771     dec b
   83D2 05            [ 4]  772     dec b
   83D3 CD 6C B0      [17]  773     call cpct_getScreenPtr_asm 
   83D6 36 00         [10]  774     ld (hl), #0x00
   83D8 2C            [ 4]  775     inc l
   83D9 36 00         [10]  776    ld (hl), #0x00
                            777 ;;-----------
   83DB 11 00 C0      [10]  778    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   83DE DD 4E 00      [19]  779     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   83E1 DD 46 01      [19]  780     ld      b,  entity_y(ix)  
   83E4 05            [ 4]  781     dec b       
   83E5 05            [ 4]  782     dec b
   83E6 05            [ 4]  783     dec b
   83E7 05            [ 4]  784     dec b
   83E8 05            [ 4]  785     dec b
   83E9 05            [ 4]  786     dec b
   83EA 05            [ 4]  787     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   83EB CD 6C B0      [17]  788     call cpct_getScreenPtr_asm 
   83EE 36 00         [10]  789     ld (hl), #0x00
   83F0 2C            [ 4]  790     inc l
   83F1 36 00         [10]  791    ld (hl), #0x00
                            792 
   83F3 C9            [10]  793 ret
