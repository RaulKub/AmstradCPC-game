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
   88F2                      19 pintarEnemigo2::
   88F2 DD 21 2D 40   [14]   20     ld ix, #enemyIzqPos
   88F6 DD 7E 04      [19]   21     ld a, entity_estado(ix)
   88F9 3D            [ 4]   22     dec a
   88FA CA 40 8A      [10]   23     jp z, renderPos1
   88FD 3D            [ 4]   24     dec a
   88FE CA 7C 8B      [10]   25     jp z, renderPos2
                             26 
   8901                      27     renderPos0:
   8901 DD 36 04 01   [19]   28     ld entity_estado(ix), #1
                             29 
   8905 11 00 C0      [10]   30     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8908 DD 4E 00      [19]   31     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   890B DD 46 01      [19]   32     ld      b,  entity_y(ix)  
   890E 04            [ 4]   33     inc b       
   890F 04            [ 4]   34     inc b
   8910 04            [ 4]   35     inc b 
   8911 04            [ 4]   36     inc b
   8912 04            [ 4]   37     inc b
   8913 04            [ 4]   38     inc b 
   8914 04            [ 4]   39     inc b
   8915 CD 6C B0      [17]   40     call cpct_getScreenPtr_asm 
   8918 36 EE         [10]   41     ld (hl), #0xEE
   891A 2C            [ 4]   42     inc l
   891B 36 00         [10]   43    ld (hl), #0x00
                             44 
                             45 
                             46    ;;-----------
   891D 11 00 C0      [10]   47    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8920 DD 4E 00      [19]   48     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8923 DD 46 01      [19]   49     ld      b,  entity_y(ix)  
   8926 04            [ 4]   50     inc b       
   8927 04            [ 4]   51     inc b
   8928 04            [ 4]   52     inc b 
   8929 04            [ 4]   53     inc b
   892A 04            [ 4]   54     inc b 
   892B 04            [ 4]   55     inc b
   892C CD 6C B0      [17]   56     call cpct_getScreenPtr_asm 
   892F 36 3F         [10]   57     ld (hl), #0x3F
   8931 2C            [ 4]   58     inc l
   8932 36 50         [10]   59    ld (hl), #0x50
                             60 
                             61    ;;-------------
   8934 11 00 C0      [10]   62    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8937 DD 4E 00      [19]   63     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   893A DD 46 01      [19]   64     ld      b,  entity_y(ix)  
   893D 04            [ 4]   65     inc b       
   893E 04            [ 4]   66     inc b
   893F 04            [ 4]   67     inc b 
   8940 04            [ 4]   68     inc b
   8941 04            [ 4]   69     inc b 
   8942 CD 6C B0      [17]   70     call cpct_getScreenPtr_asm 
   8945 36 1F         [10]   71     ld (hl), #0x1F
   8947 2C            [ 4]   72     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   8948 36 A0         [10]   73    ld (hl), #0xA0
                             74 
                             75    ;;---------------------
   894A 11 00 C0      [10]   76    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   894D DD 4E 00      [19]   77     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8950 DD 46 01      [19]   78     ld      b,  entity_y(ix)  
   8953 04            [ 4]   79     inc b       
   8954 04            [ 4]   80     inc b
   8955 04            [ 4]   81     inc b 
   8956 04            [ 4]   82     inc b
   8957 CD 6C B0      [17]   83     call cpct_getScreenPtr_asm 
   895A 36 1F         [10]   84     ld (hl), #0x1F
   895C 2C            [ 4]   85     inc l
   895D 36 E0         [10]   86    ld (hl), #0xE0
                             87 
                             88    ;;-----------
   895F 11 00 C0      [10]   89    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8962 DD 4E 00      [19]   90     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8965 DD 46 01      [19]   91     ld      b,  entity_y(ix)  
   8968 04            [ 4]   92     inc b       
   8969 04            [ 4]   93     inc b
   896A 04            [ 4]   94     inc b
   896B CD 6C B0      [17]   95     call cpct_getScreenPtr_asm 
   896E 36 1F         [10]   96     ld (hl), #0x1F
   8970 2C            [ 4]   97     inc l
   8971 36 F2         [10]   98    ld (hl), #0xF2
                             99 
                            100    ;;-----------
   8973 11 00 C0      [10]  101    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8976 DD 4E 00      [19]  102     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8979 DD 46 01      [19]  103     ld      b,  entity_y(ix)  
   897C 04            [ 4]  104     inc b       
   897D 04            [ 4]  105     inc b
   897E CD 6C B0      [17]  106     call cpct_getScreenPtr_asm 
   8981 36 1F         [10]  107     ld (hl), #0x1F
   8983 2C            [ 4]  108     inc l
   8984 36 F0         [10]  109    ld (hl), #0xF0
                            110 
                            111    ;;-----------
   8986 11 00 C0      [10]  112    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8989 DD 4E 00      [19]  113     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   898C DD 46 01      [19]  114     ld      b,  entity_y(ix)  
   898F 04            [ 4]  115     inc b 
   8990 CD 6C B0      [17]  116     call cpct_getScreenPtr_asm
   8993 36 1F         [10]  117     ld (hl), #0x1F
   8995 2C            [ 4]  118     inc l 
   8996 36 F2         [10]  119    ld (hl), #0xF2
                            120 
                            121    ;;-----------
   8998 11 00 C0      [10]  122    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   899B DD 4E 00      [19]  123     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   899E DD 46 01      [19]  124     ld      b,  entity_y(ix)  
   89A1 CD 6C B0      [17]  125     call cpct_getScreenPtr_asm 
   89A4 36 1F         [10]  126     ld (hl), #0x1F
   89A6 2C            [ 4]  127     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   89A7 36 E0         [10]  128    ld (hl), #0xE0
                            129 
                            130    ;;-----------
   89A9 11 00 C0      [10]  131    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   89AC DD 4E 00      [19]  132     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   89AF DD 46 01      [19]  133     ld      b,  entity_y(ix)  
   89B2 05            [ 4]  134     dec b
   89B3 CD 6C B0      [17]  135     call cpct_getScreenPtr_asm
   89B6 36 1F         [10]  136     ld (hl), #0x1F
   89B8 2C            [ 4]  137     inc l 
   89B9 36 A0         [10]  138    ld (hl), #0xA0
                            139 
                            140    ;;-----------
   89BB 11 00 C0      [10]  141    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   89BE DD 4E 00      [19]  142     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   89C1 DD 46 01      [19]  143     ld      b,  entity_y(ix)  
   89C4 05            [ 4]  144     dec b       
   89C5 05            [ 4]  145     dec b
   89C6 CD 6C B0      [17]  146     call cpct_getScreenPtr_asm
   89C9 36 3F         [10]  147     ld (hl), #0x3F
   89CB 2C            [ 4]  148     inc l 
   89CC 36 50         [10]  149    ld (hl), #0x50
                            150 
                            151    ;;-----------
   89CE 11 00 C0      [10]  152    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   89D1 DD 4E 00      [19]  153     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   89D4 DD 46 01      [19]  154     ld      b,  entity_y(ix)  
   89D7 05            [ 4]  155     dec b       
   89D8 05            [ 4]  156     dec b
   89D9 05            [ 4]  157     dec b
   89DA CD 6C B0      [17]  158     call cpct_getScreenPtr_asm 
   89DD 36 EE         [10]  159     ld (hl), #0xEE
   89DF 2C            [ 4]  160     inc l
   89E0 36 00         [10]  161    ld (hl), #0x00
                            162    ;;-----------
   89E2 11 00 C0      [10]  163    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   89E5 DD 4E 00      [19]  164     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   89E8 DD 46 01      [19]  165     ld      b,  entity_y(ix)  
   89EB 05            [ 4]  166     dec b       
   89EC 05            [ 4]  167     dec b
   89ED 05            [ 4]  168     dec b
   89EE 05            [ 4]  169     dec b
   89EF CD 6C B0      [17]  170     call cpct_getScreenPtr_asm 
   89F2 36 00         [10]  171     ld (hl), #0x00
   89F4 2C            [ 4]  172     inc l
   89F5 36 00         [10]  173    ld (hl), #0x00
                            174 ;;-----------
   89F7 11 00 C0      [10]  175    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   89FA DD 4E 00      [19]  176     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   89FD DD 46 01      [19]  177     ld      b,  entity_y(ix)  
   8A00 05            [ 4]  178     dec b       
   8A01 05            [ 4]  179     dec b
   8A02 05            [ 4]  180     dec b
   8A03 05            [ 4]  181     dec b
   8A04 05            [ 4]  182     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   8A05 CD 6C B0      [17]  183     call cpct_getScreenPtr_asm 
   8A08 36 00         [10]  184     ld (hl), #0x00
   8A0A 2C            [ 4]  185     inc l
   8A0B 36 00         [10]  186    ld (hl), #0x00
                            187 ;;-----------
   8A0D 11 00 C0      [10]  188    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8A10 DD 4E 00      [19]  189     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8A13 DD 46 01      [19]  190     ld      b,  entity_y(ix)  
   8A16 05            [ 4]  191     dec b       
   8A17 05            [ 4]  192     dec b
   8A18 05            [ 4]  193     dec b
   8A19 05            [ 4]  194     dec b
   8A1A 05            [ 4]  195     dec b
   8A1B 05            [ 4]  196     dec b
   8A1C CD 6C B0      [17]  197     call cpct_getScreenPtr_asm 
   8A1F 36 00         [10]  198     ld (hl), #0x00
   8A21 2C            [ 4]  199     inc l
   8A22 36 00         [10]  200    ld (hl), #0x00
                            201 ;;-----------
   8A24 11 00 C0      [10]  202    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8A27 DD 4E 00      [19]  203     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8A2A DD 46 01      [19]  204     ld      b,  entity_y(ix)  
   8A2D 05            [ 4]  205     dec b       
   8A2E 05            [ 4]  206     dec b
   8A2F 05            [ 4]  207     dec b
   8A30 05            [ 4]  208     dec b
   8A31 05            [ 4]  209     dec b
   8A32 05            [ 4]  210     dec b
   8A33 05            [ 4]  211     dec b
   8A34 CD 6C B0      [17]  212     call cpct_getScreenPtr_asm 
   8A37 36 00         [10]  213     ld (hl), #0x00
   8A39 2C            [ 4]  214     inc l
   8A3A 36 00         [10]  215    ld (hl), #0x00
                            216 
   8A3C DD 34 00      [23]  217    inc entity_x(ix)
                            218 
   8A3F C9            [10]  219 ret
                            220 
                            221 
   8A40                     222     renderPos1:
   8A40 DD 36 04 02   [19]  223     ld entity_estado(ix), #2
                            224 
   8A44 11 00 C0      [10]  225     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8A47 DD 4E 00      [19]  226     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8A4A DD 46 01      [19]  227     ld      b,  entity_y(ix)  
   8A4D 04            [ 4]  228     inc b       
   8A4E 04            [ 4]  229     inc b
   8A4F 04            [ 4]  230     inc b 
   8A50 04            [ 4]  231     inc b
   8A51 04            [ 4]  232     inc b
   8A52 04            [ 4]  233     inc b 
   8A53 04            [ 4]  234     inc b
   8A54 CD 6C B0      [17]  235     call cpct_getScreenPtr_asm 
   8A57 36 10         [10]  236     ld (hl), #0x10
   8A59 2C            [ 4]  237     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   8A5A 36 50         [10]  238    ld (hl), #0x50
                            239 
                            240 
                            241    ;;-----------
   8A5C 11 00 C0      [10]  242    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8A5F DD 4E 00      [19]  243     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8A62 DD 46 01      [19]  244     ld      b,  entity_y(ix)  
   8A65 04            [ 4]  245     inc b       
   8A66 04            [ 4]  246     inc b
   8A67 04            [ 4]  247     inc b 
   8A68 04            [ 4]  248     inc b
   8A69 04            [ 4]  249     inc b 
   8A6A 04            [ 4]  250     inc b
   8A6B CD 6C B0      [17]  251     call cpct_getScreenPtr_asm 
   8A6E 36 20         [10]  252     ld (hl), #0x20
   8A70 2C            [ 4]  253     inc l
   8A71 36 A0         [10]  254    ld (hl), #0xA0
                            255 
                            256    ;;-------------
   8A73 11 00 C0      [10]  257    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8A76 DD 4E 00      [19]  258     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8A79 DD 46 01      [19]  259     ld      b,  entity_y(ix)  
   8A7C 04            [ 4]  260     inc b       
   8A7D 04            [ 4]  261     inc b
   8A7E 04            [ 4]  262     inc b 
   8A7F 04            [ 4]  263     inc b
   8A80 04            [ 4]  264     inc b 
   8A81 CD 6C B0      [17]  265     call cpct_getScreenPtr_asm 
   8A84 36 B0         [10]  266     ld (hl), #0xB0
   8A86 2C            [ 4]  267     inc l
   8A87 36 E0         [10]  268    ld (hl), #0xE0
                            269 
                            270    ;;---------------------
   8A89 11 00 C0      [10]  271    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8A8C DD 4E 00      [19]  272     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8A8F DD 46 01      [19]  273     ld      b,  entity_y(ix)  
   8A92 04            [ 4]  274     inc b       
   8A93 04            [ 4]  275     inc b
   8A94 04            [ 4]  276     inc b 
   8A95 04            [ 4]  277     inc b
   8A96 CD 6C B0      [17]  278     call cpct_getScreenPtr_asm 
   8A99 36 70         [10]  279     ld (hl), #0x70
   8A9B 2C            [ 4]  280     inc l
   8A9C 36 F2         [10]  281    ld (hl), #0xF2
                            282 
                            283    ;;-----------
   8A9E 11 00 C0      [10]  284    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8AA1 DD 4E 00      [19]  285     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8AA4 DD 46 01      [19]  286     ld      b,  entity_y(ix)  
   8AA7 04            [ 4]  287     inc b       
   8AA8 04            [ 4]  288     inc b
   8AA9 04            [ 4]  289     inc b
   8AAA CD 6C B0      [17]  290     call cpct_getScreenPtr_asm 
   8AAD 36 70         [10]  291     ld (hl), #0x70
   8AAF 2C            [ 4]  292     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   8AB0 36 F0         [10]  293    ld (hl), #0xF0
                            294 
                            295    ;;-----------
   8AB2 11 00 C0      [10]  296    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8AB5 DD 4E 00      [19]  297     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8AB8 DD 46 01      [19]  298     ld      b,  entity_y(ix)  
   8ABB 04            [ 4]  299     inc b       
   8ABC 04            [ 4]  300     inc b
   8ABD CD 6C B0      [17]  301     call cpct_getScreenPtr_asm 
   8AC0 36 70         [10]  302     ld (hl), #0x70
   8AC2 2C            [ 4]  303     inc l
   8AC3 36 F2         [10]  304    ld (hl), #0xF2
                            305 
                            306    ;;-----------
   8AC5 11 00 C0      [10]  307    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8AC8 DD 4E 00      [19]  308     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8ACB DD 46 01      [19]  309     ld      b,  entity_y(ix)  
   8ACE 04            [ 4]  310     inc b 
   8ACF CD 6C B0      [17]  311     call cpct_getScreenPtr_asm
   8AD2 36 B0         [10]  312     ld (hl), #0xB0
   8AD4 2C            [ 4]  313     inc l 
   8AD5 36 E0         [10]  314    ld (hl), #0xE0
                            315 
                            316    ;;-----------
   8AD7 11 00 C0      [10]  317    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8ADA DD 4E 00      [19]  318     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8ADD DD 46 01      [19]  319     ld      b,  entity_y(ix)  
   8AE0 CD 6C B0      [17]  320     call cpct_getScreenPtr_asm 
   8AE3 36 20         [10]  321     ld (hl), #0x20
   8AE5 2C            [ 4]  322     inc l
   8AE6 36 A0         [10]  323    ld (hl), #0xA0
                            324 
                            325    ;;-----------
   8AE8 11 00 C0      [10]  326    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8AEB DD 4E 00      [19]  327     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8AEE DD 46 01      [19]  328     ld      b,  entity_y(ix)  
   8AF1 05            [ 4]  329     dec b
   8AF2 CD 6C B0      [17]  330     call cpct_getScreenPtr_asm
   8AF5 36 10         [10]  331     ld (hl), #0x10
   8AF7 2C            [ 4]  332     inc l 
   8AF8 36 50         [10]  333    ld (hl), #0x50
                            334 
                            335    ;;-----------
   8AFA 11 00 C0      [10]  336    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8AFD DD 4E 00      [19]  337     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8B00 DD 46 01      [19]  338     ld      b,  entity_y(ix)  
   8B03 05            [ 4]  339     dec b       
   8B04 05            [ 4]  340     dec b
   8B05 CD 6C B0      [17]  341     call cpct_getScreenPtr_asm
   8B08 36 00         [10]  342     ld (hl), #0x00
   8B0A 2C            [ 4]  343     inc l 
   8B0B 36 00         [10]  344    ld (hl), #0x00
                            345 
                            346    ;;-----------
   8B0D 11 00 C0      [10]  347    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   8B10 DD 4E 00      [19]  348     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8B13 DD 46 01      [19]  349     ld      b,  entity_y(ix)  
   8B16 05            [ 4]  350     dec b       
   8B17 05            [ 4]  351     dec b
   8B18 05            [ 4]  352     dec b
   8B19 CD 6C B0      [17]  353     call cpct_getScreenPtr_asm 
   8B1C 36 00         [10]  354     ld (hl), #0x00
   8B1E 2C            [ 4]  355     inc l
   8B1F 36 00         [10]  356    ld (hl), #0x00
                            357    ;;-----------
   8B21 11 00 C0      [10]  358    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8B24 DD 4E 00      [19]  359     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8B27 DD 46 01      [19]  360     ld      b,  entity_y(ix)  
   8B2A 05            [ 4]  361     dec b       
   8B2B 05            [ 4]  362     dec b
   8B2C 05            [ 4]  363     dec b
   8B2D 05            [ 4]  364     dec b
   8B2E CD 6C B0      [17]  365     call cpct_getScreenPtr_asm 
   8B31 36 00         [10]  366     ld (hl), #0x00
   8B33 2C            [ 4]  367     inc l
   8B34 36 00         [10]  368    ld (hl), #0x00
                            369 ;;-----------
   8B36 11 00 C0      [10]  370    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8B39 DD 4E 00      [19]  371     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8B3C DD 46 01      [19]  372     ld      b,  entity_y(ix)  
   8B3F 05            [ 4]  373     dec b       
   8B40 05            [ 4]  374     dec b
   8B41 05            [ 4]  375     dec b
   8B42 05            [ 4]  376     dec b
   8B43 05            [ 4]  377     dec b
   8B44 CD 6C B0      [17]  378     call cpct_getScreenPtr_asm 
   8B47 36 00         [10]  379     ld (hl), #0x00
   8B49 2C            [ 4]  380     inc l
   8B4A 36 00         [10]  381    ld (hl), #0x00
                            382 ;;-----------
   8B4C 11 00 C0      [10]  383    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8B4F DD 4E 00      [19]  384     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8B52 DD 46 01      [19]  385     ld      b,  entity_y(ix)  
   8B55 05            [ 4]  386     dec b       
   8B56 05            [ 4]  387     dec b
   8B57 05            [ 4]  388     dec b
   8B58 05            [ 4]  389     dec b
   8B59 05            [ 4]  390     dec b
   8B5A 05            [ 4]  391     dec b
   8B5B CD 6C B0      [17]  392     call cpct_getScreenPtr_asm 
   8B5E 36 00         [10]  393     ld (hl), #0x00
   8B60 2C            [ 4]  394     inc l
   8B61 36 00         [10]  395    ld (hl), #0x00
                            396 ;;-----------
   8B63 11 00 C0      [10]  397    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8B66 DD 4E 00      [19]  398     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8B69 DD 46 01      [19]  399     ld      b,  entity_y(ix)  
   8B6C 05            [ 4]  400     dec b       
   8B6D 05            [ 4]  401     dec b
   8B6E 05            [ 4]  402     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   8B6F 05            [ 4]  403     dec b
   8B70 05            [ 4]  404     dec b
   8B71 05            [ 4]  405     dec b
   8B72 05            [ 4]  406     dec b
   8B73 CD 6C B0      [17]  407     call cpct_getScreenPtr_asm 
   8B76 36 00         [10]  408     ld (hl), #0x00
   8B78 2C            [ 4]  409     inc l
   8B79 36 00         [10]  410    ld (hl), #0x00
                            411 
   8B7B C9            [10]  412 ret
                            413 
   8B7C                     414     renderPos2:
   8B7C DD 36 04 01   [19]  415     ld entity_estado(ix), #1
                            416 
   8B80 11 00 C0      [10]  417      ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8B83 DD 4E 00      [19]  418     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8B86 DD 46 01      [19]  419     ld      b,  entity_y(ix)  
   8B89 04            [ 4]  420     inc b       
   8B8A 04            [ 4]  421     inc b
   8B8B 04            [ 4]  422     inc b 
   8B8C 04            [ 4]  423     inc b
   8B8D 04            [ 4]  424     inc b
   8B8E 04            [ 4]  425     inc b 
   8B8F 04            [ 4]  426     inc b
   8B90 CD 6C B0      [17]  427     call cpct_getScreenPtr_asm 
   8B93 36 50         [10]  428     ld (hl), #0x50
   8B95 2C            [ 4]  429     inc l
   8B96 36 40         [10]  430    ld (hl), #0x40
                            431 
                            432 
                            433    ;;-----------
   8B98 11 00 C0      [10]  434    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8B9B DD 4E 00      [19]  435     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8B9E DD 46 01      [19]  436     ld      b,  entity_y(ix)  
   8BA1 04            [ 4]  437     inc b       
   8BA2 04            [ 4]  438     inc b
   8BA3 04            [ 4]  439     inc b 
   8BA4 04            [ 4]  440     inc b
   8BA5 04            [ 4]  441     inc b 
   8BA6 04            [ 4]  442     inc b
   8BA7 CD 6C B0      [17]  443     call cpct_getScreenPtr_asm 
   8BAA 36 20         [10]  444     ld (hl), #0x20
   8BAC 2C            [ 4]  445     inc l
   8BAD 36 A0         [10]  446    ld (hl), #0xA0
                            447 
                            448    ;;-------------
   8BAF 11 00 C0      [10]  449    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8BB2 DD 4E 00      [19]  450     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8BB5 DD 46 01      [19]  451     ld      b,  entity_y(ix)  
   8BB8 04            [ 4]  452     inc b       
   8BB9 04            [ 4]  453     inc b
   8BBA 04            [ 4]  454     inc b 
   8BBB 04            [ 4]  455     inc b
   8BBC 04            [ 4]  456     inc b 
   8BBD CD 6C B0      [17]  457     call cpct_getScreenPtr_asm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   8BC0 36 B0         [10]  458     ld (hl), #0xB0
   8BC2 2C            [ 4]  459     inc l
   8BC3 36 E0         [10]  460    ld (hl), #0xE0
                            461 
                            462    ;;---------------------
   8BC5 11 00 C0      [10]  463    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8BC8 DD 4E 00      [19]  464     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8BCB DD 46 01      [19]  465     ld      b,  entity_y(ix)  
   8BCE 04            [ 4]  466     inc b       
   8BCF 04            [ 4]  467     inc b
   8BD0 04            [ 4]  468     inc b 
   8BD1 04            [ 4]  469     inc b
   8BD2 CD 6C B0      [17]  470     call cpct_getScreenPtr_asm 
   8BD5 36 70         [10]  471     ld (hl), #0x70
   8BD7 2C            [ 4]  472     inc l
   8BD8 36 F2         [10]  473    ld (hl), #0xF2
                            474 
                            475    ;;-----------
   8BDA 11 00 C0      [10]  476    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8BDD DD 4E 00      [19]  477     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8BE0 DD 46 01      [19]  478     ld      b,  entity_y(ix)  
   8BE3 04            [ 4]  479     inc b       
   8BE4 04            [ 4]  480     inc b
   8BE5 04            [ 4]  481     inc b
   8BE6 CD 6C B0      [17]  482     call cpct_getScreenPtr_asm 
   8BE9 36 70         [10]  483     ld (hl), #0x70
   8BEB 2C            [ 4]  484     inc l
   8BEC 36 F0         [10]  485    ld (hl), #0xF0
                            486 
                            487    ;;-----------
   8BEE 11 00 C0      [10]  488    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8BF1 DD 4E 00      [19]  489     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8BF4 DD 46 01      [19]  490     ld      b,  entity_y(ix)  
   8BF7 04            [ 4]  491     inc b       
   8BF8 04            [ 4]  492     inc b
   8BF9 CD 6C B0      [17]  493     call cpct_getScreenPtr_asm 
   8BFC 36 70         [10]  494     ld (hl), #0x70
   8BFE 2C            [ 4]  495     inc l
   8BFF 36 F2         [10]  496    ld (hl), #0xF2
                            497 
                            498    ;;-----------
   8C01 11 00 C0      [10]  499    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8C04 DD 4E 00      [19]  500     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8C07 DD 46 01      [19]  501     ld      b,  entity_y(ix)  
   8C0A 04            [ 4]  502     inc b 
   8C0B CD 6C B0      [17]  503     call cpct_getScreenPtr_asm
   8C0E 36 B0         [10]  504     ld (hl), #0xB0
   8C10 2C            [ 4]  505     inc l 
   8C11 36 E0         [10]  506    ld (hl), #0xE0
                            507 
                            508    ;;-----------
   8C13 11 00 C0      [10]  509    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8C16 DD 4E 00      [19]  510     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8C19 DD 46 01      [19]  511     ld      b,  entity_y(ix)  
   8C1C CD 6C B0      [17]  512     call cpct_getScreenPtr_asm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   8C1F 36 20         [10]  513     ld (hl), #0x20
   8C21 2C            [ 4]  514     inc l
   8C22 36 A0         [10]  515    ld (hl), #0xA0
                            516 
                            517    ;;-----------
   8C24 11 00 C0      [10]  518    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8C27 DD 4E 00      [19]  519     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8C2A DD 46 01      [19]  520     ld      b,  entity_y(ix)  
   8C2D 05            [ 4]  521     dec b
   8C2E CD 6C B0      [17]  522     call cpct_getScreenPtr_asm
   8C31 36 50         [10]  523     ld (hl), #0x50
   8C33 2C            [ 4]  524     inc l 
   8C34 36 40         [10]  525    ld (hl), #0x40
                            526 
                            527    ;;-----------
   8C36 11 00 C0      [10]  528    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8C39 DD 4E 00      [19]  529     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8C3C DD 46 01      [19]  530     ld      b,  entity_y(ix)  
   8C3F 05            [ 4]  531     dec b       
   8C40 05            [ 4]  532     dec b
   8C41 CD 6C B0      [17]  533     call cpct_getScreenPtr_asm
   8C44 36 00         [10]  534     ld (hl), #0x00
   8C46 2C            [ 4]  535     inc l 
   8C47 36 00         [10]  536    ld (hl), #0x00
                            537 
                            538    ;;-----------
   8C49 11 00 C0      [10]  539    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8C4C DD 4E 00      [19]  540     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8C4F DD 46 01      [19]  541     ld      b,  entity_y(ix)  
   8C52 05            [ 4]  542     dec b       
   8C53 05            [ 4]  543     dec b
   8C54 05            [ 4]  544     dec b
   8C55 CD 6C B0      [17]  545     call cpct_getScreenPtr_asm 
   8C58 36 00         [10]  546     ld (hl), #0x00
   8C5A 2C            [ 4]  547     inc l
   8C5B 36 00         [10]  548    ld (hl), #0x00
                            549    ;;-----------
   8C5D 11 00 C0      [10]  550    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8C60 DD 4E 00      [19]  551     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8C63 DD 46 01      [19]  552     ld      b,  entity_y(ix)  
   8C66 05            [ 4]  553     dec b       
   8C67 05            [ 4]  554     dec b
   8C68 05            [ 4]  555     dec b
   8C69 05            [ 4]  556     dec b
   8C6A CD 6C B0      [17]  557     call cpct_getScreenPtr_asm 
   8C6D 36 00         [10]  558     ld (hl), #0x00
   8C6F 2C            [ 4]  559     inc l
   8C70 36 00         [10]  560    ld (hl), #0x00
                            561 ;;-----------
   8C72 11 00 C0      [10]  562    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8C75 DD 4E 00      [19]  563     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8C78 DD 46 01      [19]  564     ld      b,  entity_y(ix)  
   8C7B 05            [ 4]  565     dec b       
   8C7C 05            [ 4]  566     dec b
   8C7D 05            [ 4]  567     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   8C7E 05            [ 4]  568     dec b
   8C7F 05            [ 4]  569     dec b
   8C80 CD 6C B0      [17]  570     call cpct_getScreenPtr_asm 
   8C83 36 00         [10]  571     ld (hl), #0x00
   8C85 2C            [ 4]  572     inc l
   8C86 36 00         [10]  573    ld (hl), #0x00
                            574 ;;-----------
   8C88 11 00 C0      [10]  575    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8C8B DD 4E 00      [19]  576     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8C8E DD 46 01      [19]  577     ld      b,  entity_y(ix)  
   8C91 05            [ 4]  578     dec b       
   8C92 05            [ 4]  579     dec b
   8C93 05            [ 4]  580     dec b
   8C94 05            [ 4]  581     dec b
   8C95 05            [ 4]  582     dec b
   8C96 05            [ 4]  583     dec b
   8C97 CD 6C B0      [17]  584     call cpct_getScreenPtr_asm 
   8C9A 36 00         [10]  585     ld (hl), #0x00
   8C9C 2C            [ 4]  586     inc l
   8C9D 36 00         [10]  587    ld (hl), #0x00
                            588 ;;-----------
   8C9F 11 00 C0      [10]  589    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8CA2 DD 4E 00      [19]  590     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8CA5 DD 46 01      [19]  591     ld      b,  entity_y(ix)  
   8CA8 05            [ 4]  592     dec b       
   8CA9 05            [ 4]  593     dec b
   8CAA 05            [ 4]  594     dec b
   8CAB 05            [ 4]  595     dec b
   8CAC 05            [ 4]  596     dec b
   8CAD 05            [ 4]  597     dec b
   8CAE 05            [ 4]  598     dec b
   8CAF CD 6C B0      [17]  599     call cpct_getScreenPtr_asm 
   8CB2 36 00         [10]  600     ld (hl), #0x00
   8CB4 2C            [ 4]  601     inc l
   8CB5 36 00         [10]  602    ld (hl), #0x00
                            603 
   8CB7 C9            [10]  604 ret
                            605 
   8CB8                     606 borrarEnemigo2::
                            607 
   8CB8 11 00 C0      [10]  608      ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8CBB DD 4E 00      [19]  609     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8CBE DD 46 01      [19]  610     ld      b,  entity_y(ix)  
   8CC1 04            [ 4]  611     inc b       
   8CC2 04            [ 4]  612     inc b
   8CC3 04            [ 4]  613     inc b 
   8CC4 04            [ 4]  614     inc b
   8CC5 04            [ 4]  615     inc b
   8CC6 04            [ 4]  616     inc b 
   8CC7 04            [ 4]  617     inc b
   8CC8 CD 6C B0      [17]  618     call cpct_getScreenPtr_asm 
   8CCB 36 00         [10]  619     ld (hl), #0x00
   8CCD 2C            [ 4]  620     inc l
   8CCE 36 00         [10]  621    ld (hl), #0x00
                            622 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



                            623 
                            624    ;;-----------
   8CD0 11 00 C0      [10]  625    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8CD3 DD 4E 00      [19]  626     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8CD6 DD 46 01      [19]  627     ld      b,  entity_y(ix)  
   8CD9 04            [ 4]  628     inc b       
   8CDA 04            [ 4]  629     inc b
   8CDB 04            [ 4]  630     inc b 
   8CDC 04            [ 4]  631     inc b
   8CDD 04            [ 4]  632     inc b 
   8CDE 04            [ 4]  633     inc b
   8CDF CD 6C B0      [17]  634     call cpct_getScreenPtr_asm 
   8CE2 36 00         [10]  635     ld (hl), #0x00
   8CE4 2C            [ 4]  636     inc l
   8CE5 36 00         [10]  637    ld (hl), #0x00
                            638 
                            639    ;;-------------
   8CE7 11 00 C0      [10]  640    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8CEA DD 4E 00      [19]  641     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8CED DD 46 01      [19]  642     ld      b,  entity_y(ix)  
   8CF0 04            [ 4]  643     inc b       
   8CF1 04            [ 4]  644     inc b
   8CF2 04            [ 4]  645     inc b 
   8CF3 04            [ 4]  646     inc b
   8CF4 04            [ 4]  647     inc b 
   8CF5 CD 6C B0      [17]  648     call cpct_getScreenPtr_asm 
   8CF8 36 00         [10]  649     ld (hl), #0x00
   8CFA 2C            [ 4]  650     inc l
   8CFB 36 00         [10]  651    ld (hl), #0x00
                            652 
                            653    ;;---------------------
   8CFD 11 00 C0      [10]  654    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8D00 DD 4E 00      [19]  655     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8D03 DD 46 01      [19]  656     ld      b,  entity_y(ix)  
   8D06 04            [ 4]  657     inc b       
   8D07 04            [ 4]  658     inc b
   8D08 04            [ 4]  659     inc b 
   8D09 04            [ 4]  660     inc b
   8D0A CD 6C B0      [17]  661     call cpct_getScreenPtr_asm 
   8D0D 36 00         [10]  662     ld (hl), #0x00
   8D0F 2C            [ 4]  663     inc l
   8D10 36 00         [10]  664    ld (hl), #0x00
                            665 
                            666    ;;-----------
   8D12 11 00 C0      [10]  667    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8D15 DD 4E 00      [19]  668     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8D18 DD 46 01      [19]  669     ld      b,  entity_y(ix)  
   8D1B 04            [ 4]  670     inc b       
   8D1C 04            [ 4]  671     inc b
   8D1D 04            [ 4]  672     inc b
   8D1E CD 6C B0      [17]  673     call cpct_getScreenPtr_asm 
   8D21 36 00         [10]  674     ld (hl), #0x00
   8D23 2C            [ 4]  675     inc l
   8D24 36 00         [10]  676    ld (hl), #0x00
                            677 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



                            678    ;;-----------
   8D26 11 00 C0      [10]  679    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8D29 DD 4E 00      [19]  680     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8D2C DD 46 01      [19]  681     ld      b,  entity_y(ix)  
   8D2F 04            [ 4]  682     inc b       
   8D30 04            [ 4]  683     inc b
   8D31 CD 6C B0      [17]  684     call cpct_getScreenPtr_asm 
   8D34 36 00         [10]  685     ld (hl), #0x00
   8D36 2C            [ 4]  686     inc l
   8D37 36 00         [10]  687    ld (hl), #0x00
                            688 
                            689    ;;-----------
   8D39 11 00 C0      [10]  690    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8D3C DD 4E 00      [19]  691     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8D3F DD 46 01      [19]  692     ld      b,  entity_y(ix)  
   8D42 04            [ 4]  693     inc b 
   8D43 CD 6C B0      [17]  694     call cpct_getScreenPtr_asm
   8D46 36 00         [10]  695     ld (hl), #0x00
   8D48 2C            [ 4]  696     inc l 
   8D49 36 00         [10]  697    ld (hl), #0x00
                            698 
                            699    ;;-----------
   8D4B 11 00 C0      [10]  700    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8D4E DD 4E 00      [19]  701     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8D51 DD 46 01      [19]  702     ld      b,  entity_y(ix)  
   8D54 CD 6C B0      [17]  703     call cpct_getScreenPtr_asm 
   8D57 36 00         [10]  704     ld (hl), #0x00
   8D59 2C            [ 4]  705     inc l
   8D5A 36 00         [10]  706    ld (hl), #0x00
                            707 
                            708    ;;-----------
   8D5C 11 00 C0      [10]  709    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8D5F DD 4E 00      [19]  710     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8D62 DD 46 01      [19]  711     ld      b,  entity_y(ix)  
   8D65 05            [ 4]  712     dec b
   8D66 CD 6C B0      [17]  713     call cpct_getScreenPtr_asm
   8D69 36 00         [10]  714     ld (hl), #0x00
   8D6B 2C            [ 4]  715     inc l 
   8D6C 36 00         [10]  716    ld (hl), #0x00
                            717 
                            718    ;;-----------
   8D6E 11 00 C0      [10]  719    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8D71 DD 4E 00      [19]  720     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8D74 DD 46 01      [19]  721     ld      b,  entity_y(ix)  
   8D77 05            [ 4]  722     dec b       
   8D78 05            [ 4]  723     dec b
   8D79 CD 6C B0      [17]  724     call cpct_getScreenPtr_asm
   8D7C 36 00         [10]  725     ld (hl), #0x00
   8D7E 2C            [ 4]  726     inc l 
   8D7F 36 00         [10]  727    ld (hl), #0x00
                            728 
                            729    ;;-----------
   8D81 11 00 C0      [10]  730    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8D84 DD 4E 00      [19]  731     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8D87 DD 46 01      [19]  732     ld      b,  entity_y(ix)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   8D8A 05            [ 4]  733     dec b       
   8D8B 05            [ 4]  734     dec b
   8D8C 05            [ 4]  735     dec b
   8D8D CD 6C B0      [17]  736     call cpct_getScreenPtr_asm 
   8D90 36 00         [10]  737     ld (hl), #0x00
   8D92 2C            [ 4]  738     inc l
   8D93 36 00         [10]  739    ld (hl), #0x00
                            740    ;;-----------
   8D95 11 00 C0      [10]  741    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8D98 DD 4E 00      [19]  742     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8D9B DD 46 01      [19]  743     ld      b,  entity_y(ix)  
   8D9E 05            [ 4]  744     dec b       
   8D9F 05            [ 4]  745     dec b
   8DA0 05            [ 4]  746     dec b
   8DA1 05            [ 4]  747     dec b
   8DA2 CD 6C B0      [17]  748     call cpct_getScreenPtr_asm 
   8DA5 36 00         [10]  749     ld (hl), #0x00
   8DA7 2C            [ 4]  750     inc l
   8DA8 36 00         [10]  751    ld (hl), #0x00
                            752 ;;-----------
   8DAA 11 00 C0      [10]  753    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8DAD DD 4E 00      [19]  754     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8DB0 DD 46 01      [19]  755     ld      b,  entity_y(ix)  
   8DB3 05            [ 4]  756     dec b       
   8DB4 05            [ 4]  757     dec b
   8DB5 05            [ 4]  758     dec b
   8DB6 05            [ 4]  759     dec b
   8DB7 05            [ 4]  760     dec b
   8DB8 CD 6C B0      [17]  761     call cpct_getScreenPtr_asm 
   8DBB 36 00         [10]  762     ld (hl), #0x00
   8DBD 2C            [ 4]  763     inc l
   8DBE 36 00         [10]  764    ld (hl), #0x00
                            765 ;;-----------
   8DC0 11 00 C0      [10]  766    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8DC3 DD 4E 00      [19]  767     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8DC6 DD 46 01      [19]  768     ld      b,  entity_y(ix)  
   8DC9 05            [ 4]  769     dec b       
   8DCA 05            [ 4]  770     dec b
   8DCB 05            [ 4]  771     dec b
   8DCC 05            [ 4]  772     dec b
   8DCD 05            [ 4]  773     dec b
   8DCE 05            [ 4]  774     dec b
   8DCF CD 6C B0      [17]  775     call cpct_getScreenPtr_asm 
   8DD2 36 00         [10]  776     ld (hl), #0x00
   8DD4 2C            [ 4]  777     inc l
   8DD5 36 00         [10]  778    ld (hl), #0x00
                            779 ;;-----------
   8DD7 11 00 C0      [10]  780    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   8DDA DD 4E 00      [19]  781     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   8DDD DD 46 01      [19]  782     ld      b,  entity_y(ix)  
   8DE0 05            [ 4]  783     dec b       
   8DE1 05            [ 4]  784     dec b
   8DE2 05            [ 4]  785     dec b
   8DE3 05            [ 4]  786     dec b
   8DE4 05            [ 4]  787     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   8DE5 05            [ 4]  788     dec b
   8DE6 05            [ 4]  789     dec b
   8DE7 CD 6C B0      [17]  790     call cpct_getScreenPtr_asm 
   8DEA 36 00         [10]  791     ld (hl), #0x00
   8DEC 2C            [ 4]  792     inc l
   8DED 36 00         [10]  793    ld (hl), #0x00
                            794 
   8DEF C9            [10]  795 ret
