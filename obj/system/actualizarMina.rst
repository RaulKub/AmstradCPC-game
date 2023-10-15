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



                             17 .include "mainJuego.h.s"
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



                             18 .include "system/render_system.h.s"
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
                             15 .globl rendersys_update
                             16 .globl rendersys_init
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                             19 .include "system/renderEspada.h.s"
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
                             15 .globl pintarEspadaDerecha
                             16 .globl borrarEspadaDerecha
                             17 .globl pintarEspadaIzquierda
                             18 .globl borrarEspadaIzquierda
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                             20 .include "system/renderEnemigo1.h.s"
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
                             15 .globl pintarEnemigo1
                             16 .globl borrarEnemigo1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                             21 .include "system/renderEnemigo2.h.s"
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
                             15 .globl pintarEnemigo2
                             16 .globl borrarEnemigo2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                             22 .include "system/renderEnemigo3.h.s"
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
                             15 .globl pintarEnemigo3
                             16 .globl borrarEnemigo3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                             23 .include "system/renderEnemigo4.h.s"
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
                             15 .globl pintarEnemigo4
                             16 .globl borrarEnemigo4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                             24 
   54A2 00                   25 muerteporMina:: .db #0
                             26 
                             27 
   54A3                      28 actualizarMina::
   54A3 DD 21 5B 8F   [14]   29     ld ix, #Mina
   54A7 DD 7E 00      [19]   30     ld a, 0(ix)
   54AA 3D            [ 4]   31     dec a
   54AB 28 01         [12]   32     jr z, colocada
   54AD C9            [10]   33     ret
                             34 
   54AE                      35     colocada:
   54AE DD 7E 02      [19]   36     ld a, 2(ix)
   54B1 3D            [ 4]   37     dec a 
   54B2 28 36         [12]   38     jr z, Encendida
   54B4 3D            [ 4]   39     dec a 
   54B5 CA F8 59      [10]   40     jp z, Explotando
                             41     ;;APAGADA:
   54B8 DD 35 03      [23]   42     dec 3(ix)
   54BB 28 0E         [12]   43     jr z, Encender
                             44     ;;REDIBUJAR APAGADA
   54BD 11 00 C0      [10]   45     ld      de, #0xC000   
   54C0 DD 4E 01      [19]   46     ld      c,  1(ix)          
   54C3 06 8F         [ 7]   47     ld      b,  #0x8F
   54C5 CD 6C B0      [17]   48     call cpct_getScreenPtr_asm 
   54C8 36 F0         [10]   49     ld (hl), #0xF0  
   54CA C9            [10]   50     ret
   54CB                      51     Encender:
   54CB DD 36 02 01   [19]   52     ld 2(ix), #1
                             53     ;;REDIBUJAR ENCENDIDA
   54CF 11 00 C0      [10]   54     ld      de, #0xC000   
   54D2 DD 4E 01      [19]   55     ld      c,  1(ix)          
   54D5 06 8F         [ 7]   56     ld      b,  #0x8F
   54D7 CD 6C B0      [17]   57     call cpct_getScreenPtr_asm 
   54DA 36 F0         [10]   58     ld (hl), #0xF0 
   54DC 11 00 C0      [10]   59     ld      de, #0xC000   
   54DF DD 4E 01      [19]   60     ld      c,  1(ix)          
   54E2 06 8E         [ 7]   61     ld      b,  #0x8E
   54E4 CD 6C B0      [17]   62     call cpct_getScreenPtr_asm 
   54E7 36 66         [10]   63     ld (hl), #0x66 
   54E9 C9            [10]   64     ret
                             65 
   54EA                      66     Encendida:
   54EA DD 46 01      [19]   67     ld b, 1(ix)
   54ED DD 21 03 40   [14]   68     ld ix, #playerPos
   54F1 DD 7E 00      [19]   69     ld a, entity_x(ix)
   54F4 90            [ 4]   70     sub b
   54F5 CA 4B 55      [10]   71     jp z, colisionMina
   54F8 DD 21 1F 40   [14]   72     ld ix, #enemyPos
   54FC DD 7E 00      [19]   73     ld a, entity_x(ix)
   54FF 90            [ 4]   74     sub b
   5500 CA 20 56      [10]   75     jp z, colisionEnemigoDerecha1
   5503 DD 21 2D 40   [14]   76     ld ix, #enemyIzqPos
   5507 DD 7E 00      [19]   77     ld a, entity_x(ix)
   550A 90            [ 4]   78     sub b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   550B CA 1B 57      [10]   79     jp z, colisionEnemigoIzquierda1
   550E DD 21 34 40   [14]   80     ld ix, #enemyIzqPos2
   5512 DD 7E 00      [19]   81     ld a, entity_x(ix)
   5515 90            [ 4]   82     sub b
   5516 CA 16 58      [10]   83     jp z, colisionEnemigoIzquierda2
   5519 3D            [ 4]   84     dec a 
   551A CA 16 58      [10]   85     jp z, colisionEnemigoIzquierda2  ;;Añadimos dos bytes para el enemigo rapido
   551D DD 21 50 40   [14]   86     ld ix, #enemyDerPos2
   5521 DD 7E 00      [19]   87     ld a, entity_x(ix)
   5524 90            [ 4]   88     sub b
   5525 CA 07 59      [10]   89     jp z, colisionEnemigoDerecha2
   5528 3D            [ 4]   90     dec a 
   5529 CA 07 59      [10]   91     jp z, colisionEnemigoDerecha2  ;;Añadimos dos bytes para el enemigo rapido
                             92     ;;REDIBUJAR ENCENDIDA
   552C DD 21 5B 8F   [14]   93     ld ix, #Mina
   5530 11 00 C0      [10]   94     ld      de, #0xC000   
   5533 DD 4E 01      [19]   95     ld      c,  1(ix)          
   5536 06 8F         [ 7]   96     ld      b,  #0x8F
   5538 CD 6C B0      [17]   97     call cpct_getScreenPtr_asm 
   553B 36 F0         [10]   98     ld (hl), #0xF0 
   553D 11 00 C0      [10]   99     ld      de, #0xC000   
   5540 DD 4E 01      [19]  100     ld      c,  1(ix)          
   5543 06 8E         [ 7]  101     ld      b,  #0x8E
   5545 CD 6C B0      [17]  102     call cpct_getScreenPtr_asm 
   5548 36 66         [10]  103     ld (hl), #0x66
   554A C9            [10]  104     ret
                            105 
   554B                     106     colisionMina:
                            107     ;;PINTAR EXPLOSION PARTE 1
   554B DD 21 5B 8F   [14]  108     ld ix, #Mina
   554F 11 00 C0      [10]  109     ld      de, #0xC000   
   5552 DD 4E 01      [19]  110     ld      c,  1(ix)
   5555 06 8F         [ 7]  111     ld      b,  #0x8F
   5557 CD 6C B0      [17]  112     call cpct_getScreenPtr_asm 
   555A 36 E2         [10]  113     ld (hl), #0xE2
   555C 2D            [ 4]  114     dec l
   555D 36 74         [10]  115     ld (hl), #0x74
   555F 11 00 C0      [10]  116     ld      de, #0xC000   
   5562 DD 4E 01      [19]  117     ld      c,  1(ix)          
   5565 06 8E         [ 7]  118     ld      b,  #0x8E
   5567 CD 6C B0      [17]  119     call cpct_getScreenPtr_asm 
   556A 36 C4         [10]  120     ld (hl), #0xC4 
   556C 2D            [ 4]  121     dec l
   556D 36 32         [10]  122     ld (hl), #0x32
   556F 11 00 C0      [10]  123     ld      de, #0xC000   
   5572 DD 4E 01      [19]  124     ld      c,  1(ix)
   5575 06 8D         [ 7]  125     ld      b,  #0x8D
   5577 CD 6C B0      [17]  126     call cpct_getScreenPtr_asm 
   557A 36 C4         [10]  127     ld (hl), #0xC4
   557C 2D            [ 4]  128     dec l
   557D 36 32         [10]  129     ld (hl), #0x32
   557F 11 00 C0      [10]  130     ld      de, #0xC000   
   5582 DD 4E 01      [19]  131     ld      c,  1(ix)          
   5585 06 8C         [ 7]  132     ld      b,  #0x8C
   5587 CD 6C B0      [17]  133     call cpct_getScreenPtr_asm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   558A 36 88         [10]  134     ld (hl), #0x88 
   558C 2D            [ 4]  135     dec l
   558D 36 11         [10]  136     ld (hl), #0x11
   558F 3E 14         [ 7]  137     ld a, #20
   5591                     138     esperaExp8:
   5591 76            [ 4]  139     halt
   5592 3D            [ 4]  140     dec a 
   5593 20 FC         [12]  141     jr nz, esperaExp8
                            142     ;;EXPLOSION GRANDE
   5595 11 00 C0      [10]  143     ld      de, #0xC000   
   5598 DD 4E 01      [19]  144     ld      c,  1(ix)
   559B 06 8F         [ 7]  145     ld      b,  #0x8F
   559D CD 6C B0      [17]  146     call cpct_getScreenPtr_asm 
   55A0 36 F1         [10]  147     ld (hl), #0xF1
   55A2 2D            [ 4]  148     dec l
   55A3 36 F8         [10]  149     ld (hl), #0xF8
   55A5 11 00 C0      [10]  150     ld      de, #0xC000   
   55A8 DD 4E 01      [19]  151     ld      c,  1(ix)          
   55AB 06 8E         [ 7]  152     ld      b,  #0x8E
   55AD CD 6C B0      [17]  153     call cpct_getScreenPtr_asm 
   55B0 36 F1         [10]  154     ld (hl), #0xF1 
   55B2 2D            [ 4]  155     dec l
   55B3 36 F8         [10]  156     ld (hl), #0xF8
   55B5 11 00 C0      [10]  157     ld      de, #0xC000   
   55B8 DD 4E 01      [19]  158     ld      c,  1(ix)
   55BB 06 8D         [ 7]  159     ld      b,  #0x8D
   55BD CD 6C B0      [17]  160     call cpct_getScreenPtr_asm 
   55C0 36 F3         [10]  161     ld (hl), #0xF3
   55C2 2D            [ 4]  162     dec l
   55C3 36 FC         [10]  163     ld (hl), #0xFC
   55C5 11 00 C0      [10]  164     ld      de, #0xC000   
   55C8 DD 4E 01      [19]  165     ld      c,  1(ix)          
   55CB 06 8C         [ 7]  166     ld      b,  #0x8C
   55CD CD 6C B0      [17]  167     call cpct_getScreenPtr_asm 
   55D0 36 E2         [10]  168     ld (hl), #0xE2 
   55D2 2D            [ 4]  169     dec l
   55D3 36 74         [10]  170     ld (hl), #0x74
   55D5 11 00 C0      [10]  171     ld      de, #0xC000   
   55D8 DD 4E 01      [19]  172     ld      c,  1(ix)
   55DB 06 8B         [ 7]  173     ld      b,  #0x8B
   55DD CD 6C B0      [17]  174     call cpct_getScreenPtr_asm 
   55E0 36 E2         [10]  175     ld (hl), #0xE2
   55E2 2D            [ 4]  176     dec l
   55E3 36 74         [10]  177     ld (hl), #0x74
   55E5 11 00 C0      [10]  178     ld      de, #0xC000   
   55E8 DD 4E 01      [19]  179     ld      c,  1(ix)          
   55EB 06 8A         [ 7]  180     ld      b,  #0x8A
   55ED CD 6C B0      [17]  181     call cpct_getScreenPtr_asm 
   55F0 36 C4         [10]  182     ld (hl), #0xC4 
   55F2 2D            [ 4]  183     dec l
   55F3 36 32         [10]  184     ld (hl), #0x32
   55F5 11 00 C0      [10]  185     ld      de, #0xC000   
   55F8 DD 4E 01      [19]  186     ld      c,  1(ix)
   55FB 06 89         [ 7]  187     ld      b,  #0x89
   55FD CD 6C B0      [17]  188     call cpct_getScreenPtr_asm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   5600 36 C4         [10]  189     ld (hl), #0xC4
   5602 2D            [ 4]  190     dec l
   5603 36 32         [10]  191     ld (hl), #0x32
   5605 11 00 C0      [10]  192     ld      de, #0xC000   
   5608 DD 4E 01      [19]  193     ld      c,  1(ix)          
   560B 06 88         [ 7]  194     ld      b,  #0x88
   560D CD 6C B0      [17]  195     call cpct_getScreenPtr_asm 
   5610 36 88         [10]  196     ld (hl), #0x88 
   5612 2D            [ 4]  197     dec l
   5613 36 11         [10]  198     ld (hl), #0x11
   5615 DD 21 A2 54   [14]  199     ld ix, #muerteporMina
   5619 DD 36 00 01   [19]  200     ld 0(ix), #1
   561D C3 EA 9B      [10]  201     jp colision
                            202 
   5620                     203     colisionEnemigoDerecha1:
                            204     ;;Eliminar el enemigo derecha
   5620 CD BC 82      [17]  205     call borrarEnemigo1
   5623 DD 21 5B 8F   [14]  206     ld ix, #Mina 
   5627 DD 36 02 02   [19]  207     ld 2(ix), #2
   562B DD 21 1F 40   [14]  208     ld  ix, #enemyPos
   562F DD 36 00 48   [19]  209     ld  entity_x(ix), #72
   5633 DD 36 04 00   [19]  210     ld  entity_estado(ix), #0
   5637 CD F6 7E      [17]  211     call pintarEnemigo1
   563A DD 21 18 40   [14]  212     ld  ix, #wallDPos
   563E DD 7E 05      [19]  213     ld  a, entity_vy(ix)
   5641 3D            [ 4]  214     dec a
   5642 DD 77 05      [19]  215     ld  entity_vy(ix), a
   5645 DD 21 11 40   [14]  216     ld  ix, #wallIPos
   5649 DD 7E 04      [19]  217     ld  a, entity_estado(ix)
   564C 3C            [ 4]  218     inc a
   564D DD 77 04      [19]  219     ld  entity_estado(ix), a
                            220     ;;PINTAR EXPLOSION PARTE 1
   5650 DD 21 5B 8F   [14]  221     ld ix, #Mina
   5654 11 00 C0      [10]  222     ld      de, #0xC000   
   5657 DD 4E 01      [19]  223     ld      c,  1(ix)
   565A 06 8F         [ 7]  224     ld      b,  #0x8F
   565C CD 6C B0      [17]  225     call cpct_getScreenPtr_asm 
   565F 36 E2         [10]  226     ld (hl), #0xE2
   5661 2D            [ 4]  227     dec l
   5662 36 74         [10]  228     ld (hl), #0x74
   5664 11 00 C0      [10]  229     ld      de, #0xC000   
   5667 DD 4E 01      [19]  230     ld      c,  1(ix)          
   566A 06 8E         [ 7]  231     ld      b,  #0x8E
   566C CD 6C B0      [17]  232     call cpct_getScreenPtr_asm 
   566F 36 C4         [10]  233     ld (hl), #0xC4 
   5671 2D            [ 4]  234     dec l
   5672 36 32         [10]  235     ld (hl), #0x32
   5674 11 00 C0      [10]  236     ld      de, #0xC000   
   5677 DD 4E 01      [19]  237     ld      c,  1(ix)
   567A 06 8D         [ 7]  238     ld      b,  #0x8D
   567C CD 6C B0      [17]  239     call cpct_getScreenPtr_asm 
   567F 36 C4         [10]  240     ld (hl), #0xC4
   5681 2D            [ 4]  241     dec l
   5682 36 32         [10]  242     ld (hl), #0x32
   5684 11 00 C0      [10]  243     ld      de, #0xC000   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   5687 DD 4E 01      [19]  244     ld      c,  1(ix)          
   568A 06 8C         [ 7]  245     ld      b,  #0x8C
   568C CD 6C B0      [17]  246     call cpct_getScreenPtr_asm 
   568F 36 88         [10]  247     ld (hl), #0x88 
   5691 2D            [ 4]  248     dec l
   5692 36 11         [10]  249     ld (hl), #0x11
   5694 3E 14         [ 7]  250     ld a, #20
   5696                     251     esperaExp:
   5696 76            [ 4]  252     halt
   5697 3D            [ 4]  253     dec a 
   5698 20 FC         [12]  254     jr nz, esperaExp
                            255     ;;EXPLOSION GRANDE
   569A 11 00 C0      [10]  256     ld      de, #0xC000   
   569D DD 4E 01      [19]  257     ld      c,  1(ix)
   56A0 06 8F         [ 7]  258     ld      b,  #0x8F
   56A2 CD 6C B0      [17]  259     call cpct_getScreenPtr_asm 
   56A5 36 F1         [10]  260     ld (hl), #0xF1
   56A7 2D            [ 4]  261     dec l
   56A8 36 F8         [10]  262     ld (hl), #0xF8
   56AA 11 00 C0      [10]  263     ld      de, #0xC000   
   56AD DD 4E 01      [19]  264     ld      c,  1(ix)          
   56B0 06 8E         [ 7]  265     ld      b,  #0x8E
   56B2 CD 6C B0      [17]  266     call cpct_getScreenPtr_asm 
   56B5 36 F1         [10]  267     ld (hl), #0xF1 
   56B7 2D            [ 4]  268     dec l
   56B8 36 F8         [10]  269     ld (hl), #0xF8
   56BA 11 00 C0      [10]  270     ld      de, #0xC000   
   56BD DD 4E 01      [19]  271     ld      c,  1(ix)
   56C0 06 8D         [ 7]  272     ld      b,  #0x8D
   56C2 CD 6C B0      [17]  273     call cpct_getScreenPtr_asm 
   56C5 36 F3         [10]  274     ld (hl), #0xF3
   56C7 2D            [ 4]  275     dec l
   56C8 36 FC         [10]  276     ld (hl), #0xFC
   56CA 11 00 C0      [10]  277     ld      de, #0xC000   
   56CD DD 4E 01      [19]  278     ld      c,  1(ix)          
   56D0 06 8C         [ 7]  279     ld      b,  #0x8C
   56D2 CD 6C B0      [17]  280     call cpct_getScreenPtr_asm 
   56D5 36 E2         [10]  281     ld (hl), #0xE2 
   56D7 2D            [ 4]  282     dec l
   56D8 36 74         [10]  283     ld (hl), #0x74
   56DA 11 00 C0      [10]  284     ld      de, #0xC000   
   56DD DD 4E 01      [19]  285     ld      c,  1(ix)
   56E0 06 8B         [ 7]  286     ld      b,  #0x8B
   56E2 CD 6C B0      [17]  287     call cpct_getScreenPtr_asm 
   56E5 36 E2         [10]  288     ld (hl), #0xE2
   56E7 2D            [ 4]  289     dec l
   56E8 36 74         [10]  290     ld (hl), #0x74
   56EA 11 00 C0      [10]  291     ld      de, #0xC000   
   56ED DD 4E 01      [19]  292     ld      c,  1(ix)          
   56F0 06 8A         [ 7]  293     ld      b,  #0x8A
   56F2 CD 6C B0      [17]  294     call cpct_getScreenPtr_asm 
   56F5 36 C4         [10]  295     ld (hl), #0xC4 
   56F7 2D            [ 4]  296     dec l
   56F8 36 32         [10]  297     ld (hl), #0x32
   56FA 11 00 C0      [10]  298     ld      de, #0xC000   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   56FD DD 4E 01      [19]  299     ld      c,  1(ix)
   5700 06 89         [ 7]  300     ld      b,  #0x89
   5702 CD 6C B0      [17]  301     call cpct_getScreenPtr_asm 
   5705 36 C4         [10]  302     ld (hl), #0xC4
   5707 2D            [ 4]  303     dec l
   5708 36 32         [10]  304     ld (hl), #0x32
   570A 11 00 C0      [10]  305     ld      de, #0xC000   
   570D DD 4E 01      [19]  306     ld      c,  1(ix)          
   5710 06 88         [ 7]  307     ld      b,  #0x88
   5712 CD 6C B0      [17]  308     call cpct_getScreenPtr_asm 
   5715 36 88         [10]  309     ld (hl), #0x88 
   5717 2D            [ 4]  310     dec l
   5718 36 11         [10]  311     ld (hl), #0x11
   571A C9            [10]  312     ret
   571B                     313     colisionEnemigoIzquierda1:
   571B CD B8 8C      [17]  314     call borrarEnemigo2
   571E DD 21 5B 8F   [14]  315     ld ix, #Mina 
   5722 DD 36 02 02   [19]  316     ld 2(ix), #2
                            317     ;;Eliminar el enemigo izquierda
                            318     
   5726 DD 21 2D 40   [14]  319     ld  ix, #enemyIzqPos
   572A DD 36 00 05   [19]  320     ld  entity_x(ix), #5
   572E DD 36 04 00   [19]  321     ld  entity_estado(ix), #0
   5732 CD F2 88      [17]  322     call pintarEnemigo2
                            323 
   5735 DD 21 18 40   [14]  324     ld  ix, #wallDPos
   5739 DD 7E 05      [19]  325     ld  a, entity_vy(ix)
   573C 3D            [ 4]  326     dec a
   573D DD 77 05      [19]  327     ld  entity_vy(ix), a
   5740 DD 21 11 40   [14]  328     ld  ix, #wallIPos
   5744 DD 7E 04      [19]  329     ld  a, entity_estado(ix)
   5747 3C            [ 4]  330     inc a
   5748 DD 77 04      [19]  331     ld  entity_estado(ix), a
                            332     ;;PINTAR EXPLOSION PARTE 1
   574B DD 21 5B 8F   [14]  333     ld ix, #Mina
   574F 11 00 C0      [10]  334     ld      de, #0xC000   
   5752 DD 4E 01      [19]  335     ld      c,  1(ix)
   5755 06 8F         [ 7]  336     ld      b,  #0x8F
   5757 CD 6C B0      [17]  337     call cpct_getScreenPtr_asm 
   575A 36 E2         [10]  338     ld (hl), #0xE2
   575C 2D            [ 4]  339     dec l
   575D 36 74         [10]  340     ld (hl), #0x74
   575F 11 00 C0      [10]  341     ld      de, #0xC000   
   5762 DD 4E 01      [19]  342     ld      c,  1(ix)          
   5765 06 8E         [ 7]  343     ld      b,  #0x8E
   5767 CD 6C B0      [17]  344     call cpct_getScreenPtr_asm 
   576A 36 C4         [10]  345     ld (hl), #0xC4 
   576C 2D            [ 4]  346     dec l
   576D 36 32         [10]  347     ld (hl), #0x32
   576F 11 00 C0      [10]  348     ld      de, #0xC000   
   5772 DD 4E 01      [19]  349     ld      c,  1(ix)
   5775 06 8D         [ 7]  350     ld      b,  #0x8D
   5777 CD 6C B0      [17]  351     call cpct_getScreenPtr_asm 
   577A 36 C4         [10]  352     ld (hl), #0xC4
   577C 2D            [ 4]  353     dec l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   577D 36 32         [10]  354     ld (hl), #0x32
   577F 11 00 C0      [10]  355     ld      de, #0xC000   
   5782 DD 4E 01      [19]  356     ld      c,  1(ix)          
   5785 06 8C         [ 7]  357     ld      b,  #0x8C
   5787 CD 6C B0      [17]  358     call cpct_getScreenPtr_asm 
   578A 36 88         [10]  359     ld (hl), #0x88 
   578C 2D            [ 4]  360     dec l
   578D 36 11         [10]  361     ld (hl), #0x11
   578F 3E 14         [ 7]  362     ld a, #20
   5791                     363     esperaExp2:
   5791 76            [ 4]  364     halt
   5792 3D            [ 4]  365     dec a 
   5793 20 FC         [12]  366     jr nz, esperaExp2
                            367     ;;EXPLOSION GRANDE
   5795 11 00 C0      [10]  368     ld      de, #0xC000   
   5798 DD 4E 01      [19]  369     ld      c,  1(ix)
   579B 06 8F         [ 7]  370     ld      b,  #0x8F
   579D CD 6C B0      [17]  371     call cpct_getScreenPtr_asm 
   57A0 36 F1         [10]  372     ld (hl), #0xF1
   57A2 2D            [ 4]  373     dec l
   57A3 36 F8         [10]  374     ld (hl), #0xF8
   57A5 11 00 C0      [10]  375     ld      de, #0xC000   
   57A8 DD 4E 01      [19]  376     ld      c,  1(ix)          
   57AB 06 8E         [ 7]  377     ld      b,  #0x8E
   57AD CD 6C B0      [17]  378     call cpct_getScreenPtr_asm 
   57B0 36 F1         [10]  379     ld (hl), #0xF1 
   57B2 2D            [ 4]  380     dec l
   57B3 36 F8         [10]  381     ld (hl), #0xF8
   57B5 11 00 C0      [10]  382     ld      de, #0xC000   
   57B8 DD 4E 01      [19]  383     ld      c,  1(ix)
   57BB 06 8D         [ 7]  384     ld      b,  #0x8D
   57BD CD 6C B0      [17]  385     call cpct_getScreenPtr_asm 
   57C0 36 F3         [10]  386     ld (hl), #0xF3
   57C2 2D            [ 4]  387     dec l
   57C3 36 FC         [10]  388     ld (hl), #0xFC
   57C5 11 00 C0      [10]  389     ld      de, #0xC000   
   57C8 DD 4E 01      [19]  390     ld      c,  1(ix)          
   57CB 06 8C         [ 7]  391     ld      b,  #0x8C
   57CD CD 6C B0      [17]  392     call cpct_getScreenPtr_asm 
   57D0 36 E2         [10]  393     ld (hl), #0xE2 
   57D2 2D            [ 4]  394     dec l
   57D3 36 74         [10]  395     ld (hl), #0x74
   57D5 11 00 C0      [10]  396     ld      de, #0xC000   
   57D8 DD 4E 01      [19]  397     ld      c,  1(ix)
   57DB 06 8B         [ 7]  398     ld      b,  #0x8B
   57DD CD 6C B0      [17]  399     call cpct_getScreenPtr_asm 
   57E0 36 E2         [10]  400     ld (hl), #0xE2
   57E2 2D            [ 4]  401     dec l
   57E3 36 74         [10]  402     ld (hl), #0x74
   57E5 11 00 C0      [10]  403     ld      de, #0xC000   
   57E8 DD 4E 01      [19]  404     ld      c,  1(ix)          
   57EB 06 8A         [ 7]  405     ld      b,  #0x8A
   57ED CD 6C B0      [17]  406     call cpct_getScreenPtr_asm 
   57F0 36 C4         [10]  407     ld (hl), #0xC4 
   57F2 2D            [ 4]  408     dec l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   57F3 36 32         [10]  409     ld (hl), #0x32
   57F5 11 00 C0      [10]  410     ld      de, #0xC000   
   57F8 DD 4E 01      [19]  411     ld      c,  1(ix)
   57FB 06 89         [ 7]  412     ld      b,  #0x89
   57FD CD 6C B0      [17]  413     call cpct_getScreenPtr_asm 
   5800 36 C4         [10]  414     ld (hl), #0xC4
   5802 2D            [ 4]  415     dec l
   5803 36 32         [10]  416     ld (hl), #0x32
   5805 11 00 C0      [10]  417     ld      de, #0xC000   
   5808 DD 4E 01      [19]  418     ld      c,  1(ix)          
   580B 06 88         [ 7]  419     ld      b,  #0x88
   580D CD 6C B0      [17]  420     call cpct_getScreenPtr_asm 
   5810 36 88         [10]  421     ld (hl), #0x88 
   5812 2D            [ 4]  422     dec l
   5813 36 11         [10]  423     ld (hl), #0x11
   5815 C9            [10]  424     ret
   5816                     425     colisionEnemigoIzquierda2:
   5816 CD BA 87      [17]  426     call borrarEnemigo3
   5819 DD 21 5B 8F   [14]  427     ld ix, #Mina 
   581D DD 36 02 02   [19]  428     ld 2(ix), #2
                            429     ;;Eliminar el enemigo rapido
                            430     
   5821 DD 21 34 40   [14]  431     ld  ix, #enemyIzqPos2
   5825 DD 36 00 05   [19]  432     ld  entity_x(ix), #5
   5829 DD 36 04 00   [19]  433     ld  entity_estado(ix), #0
   582D CD F4 83      [17]  434     call pintarEnemigo3
   5830 DD 21 11 40   [14]  435     ld  ix, #wallIPos
   5834 DD 7E 04      [19]  436     ld  a, entity_estado(ix)
   5837 3C            [ 4]  437     inc a
   5838 3C            [ 4]  438     inc a
   5839 DD 77 04      [19]  439     ld  entity_estado(ix), a
                            440     ;;PINTAR EXPLOSION PARTE 1
   583C DD 21 5B 8F   [14]  441     ld ix, #Mina
   5840 11 00 C0      [10]  442     ld      de, #0xC000   
   5843 DD 4E 01      [19]  443     ld      c,  1(ix)
   5846 06 8F         [ 7]  444     ld      b,  #0x8F
   5848 CD 6C B0      [17]  445     call cpct_getScreenPtr_asm 
   584B 36 E2         [10]  446     ld (hl), #0xE2
   584D 2D            [ 4]  447     dec l
   584E 36 74         [10]  448     ld (hl), #0x74
   5850 11 00 C0      [10]  449     ld      de, #0xC000   
   5853 DD 4E 01      [19]  450     ld      c,  1(ix)          
   5856 06 8E         [ 7]  451     ld      b,  #0x8E
   5858 CD 6C B0      [17]  452     call cpct_getScreenPtr_asm 
   585B 36 C4         [10]  453     ld (hl), #0xC4 
   585D 2D            [ 4]  454     dec l
   585E 36 32         [10]  455     ld (hl), #0x32
   5860 11 00 C0      [10]  456     ld      de, #0xC000   
   5863 DD 4E 01      [19]  457     ld      c,  1(ix)
   5866 06 8D         [ 7]  458     ld      b,  #0x8D
   5868 CD 6C B0      [17]  459     call cpct_getScreenPtr_asm 
   586B 36 C4         [10]  460     ld (hl), #0xC4
   586D 2D            [ 4]  461     dec l
   586E 36 32         [10]  462     ld (hl), #0x32
   5870 11 00 C0      [10]  463     ld      de, #0xC000   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   5873 DD 4E 01      [19]  464     ld      c,  1(ix)          
   5876 06 8C         [ 7]  465     ld      b,  #0x8C
   5878 CD 6C B0      [17]  466     call cpct_getScreenPtr_asm 
   587B 36 88         [10]  467     ld (hl), #0x88 
   587D 2D            [ 4]  468     dec l
   587E 36 11         [10]  469     ld (hl), #0x11
   5880 3E 14         [ 7]  470     ld a, #20
   5882                     471     esperaExp3:
   5882 76            [ 4]  472     halt
   5883 3D            [ 4]  473     dec a 
   5884 20 FC         [12]  474     jr nz, esperaExp3
                            475     ;;EXPLOSION GRANDE
   5886 11 00 C0      [10]  476     ld      de, #0xC000   
   5889 DD 4E 01      [19]  477     ld      c,  1(ix)
   588C 06 8F         [ 7]  478     ld      b,  #0x8F
   588E CD 6C B0      [17]  479     call cpct_getScreenPtr_asm 
   5891 36 F1         [10]  480     ld (hl), #0xF1
   5893 2D            [ 4]  481     dec l
   5894 36 F8         [10]  482     ld (hl), #0xF8
   5896 11 00 C0      [10]  483     ld      de, #0xC000   
   5899 DD 4E 01      [19]  484     ld      c,  1(ix)          
   589C 06 8E         [ 7]  485     ld      b,  #0x8E
   589E CD 6C B0      [17]  486     call cpct_getScreenPtr_asm 
   58A1 36 F1         [10]  487     ld (hl), #0xF1 
   58A3 2D            [ 4]  488     dec l
   58A4 36 F8         [10]  489     ld (hl), #0xF8
   58A6 11 00 C0      [10]  490     ld      de, #0xC000   
   58A9 DD 4E 01      [19]  491     ld      c,  1(ix)
   58AC 06 8D         [ 7]  492     ld      b,  #0x8D
   58AE CD 6C B0      [17]  493     call cpct_getScreenPtr_asm 
   58B1 36 F3         [10]  494     ld (hl), #0xF3
   58B3 2D            [ 4]  495     dec l
   58B4 36 FC         [10]  496     ld (hl), #0xFC
   58B6 11 00 C0      [10]  497     ld      de, #0xC000   
   58B9 DD 4E 01      [19]  498     ld      c,  1(ix)          
   58BC 06 8C         [ 7]  499     ld      b,  #0x8C
   58BE CD 6C B0      [17]  500     call cpct_getScreenPtr_asm 
   58C1 36 E2         [10]  501     ld (hl), #0xE2 
   58C3 2D            [ 4]  502     dec l
   58C4 36 74         [10]  503     ld (hl), #0x74
   58C6 11 00 C0      [10]  504     ld      de, #0xC000   
   58C9 DD 4E 01      [19]  505     ld      c,  1(ix)
   58CC 06 8B         [ 7]  506     ld      b,  #0x8B
   58CE CD 6C B0      [17]  507     call cpct_getScreenPtr_asm 
   58D1 36 E2         [10]  508     ld (hl), #0xE2
   58D3 2D            [ 4]  509     dec l
   58D4 36 74         [10]  510     ld (hl), #0x74
   58D6 11 00 C0      [10]  511     ld      de, #0xC000   
   58D9 DD 4E 01      [19]  512     ld      c,  1(ix)          
   58DC 06 8A         [ 7]  513     ld      b,  #0x8A
   58DE CD 6C B0      [17]  514     call cpct_getScreenPtr_asm 
   58E1 36 C4         [10]  515     ld (hl), #0xC4 
   58E3 2D            [ 4]  516     dec l
   58E4 36 32         [10]  517     ld (hl), #0x32
   58E6 11 00 C0      [10]  518     ld      de, #0xC000   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   58E9 DD 4E 01      [19]  519     ld      c,  1(ix)
   58EC 06 89         [ 7]  520     ld      b,  #0x89
   58EE CD 6C B0      [17]  521     call cpct_getScreenPtr_asm 
   58F1 36 C4         [10]  522     ld (hl), #0xC4
   58F3 2D            [ 4]  523     dec l
   58F4 36 32         [10]  524     ld (hl), #0x32
   58F6 11 00 C0      [10]  525     ld      de, #0xC000   
   58F9 DD 4E 01      [19]  526     ld      c,  1(ix)          
   58FC 06 88         [ 7]  527     ld      b,  #0x88
   58FE CD 6C B0      [17]  528     call cpct_getScreenPtr_asm 
   5901 36 88         [10]  529     ld (hl), #0x88 
   5903 2D            [ 4]  530     dec l
   5904 36 11         [10]  531     ld (hl), #0x11
                            532 
                            533 
   5906 C9            [10]  534     ret
                            535 
   5907                     536     colisionEnemigoDerecha2:
   5907 CD 72 A9      [17]  537     call borrarEnemigo4
   590A DD 21 5B 8F   [14]  538     ld ix, #Mina 
   590E DD 36 02 02   [19]  539     ld 2(ix), #2
                            540     ;;Eliminar el enemigo rapido
                            541     
   5912 DD 21 50 40   [14]  542     ld  ix, #enemyDerPos2
   5916 DD 36 00 48   [19]  543     ld  entity_x(ix), #72
   591A DD 36 04 00   [19]  544     ld  entity_estado(ix), #0
   591E CD AC A5      [17]  545     call pintarEnemigo4
   5921 DD 21 11 40   [14]  546     ld  ix, #wallIPos
   5925 DD 7E 04      [19]  547     ld  a, entity_estado(ix)
   5928 3C            [ 4]  548     inc a
   5929 3C            [ 4]  549     inc a
   592A DD 77 04      [19]  550     ld  entity_estado(ix), a
                            551     ;;PINTAR EXPLOSION PARTE 1
   592D DD 21 5B 8F   [14]  552     ld ix, #Mina
   5931 11 00 C0      [10]  553     ld      de, #0xC000   
   5934 DD 4E 01      [19]  554     ld      c,  1(ix)
   5937 06 8F         [ 7]  555     ld      b,  #0x8F
   5939 CD 6C B0      [17]  556     call cpct_getScreenPtr_asm 
   593C 36 E2         [10]  557     ld (hl), #0xE2
   593E 2D            [ 4]  558     dec l
   593F 36 74         [10]  559     ld (hl), #0x74
   5941 11 00 C0      [10]  560     ld      de, #0xC000   
   5944 DD 4E 01      [19]  561     ld      c,  1(ix)          
   5947 06 8E         [ 7]  562     ld      b,  #0x8E
   5949 CD 6C B0      [17]  563     call cpct_getScreenPtr_asm 
   594C 36 C4         [10]  564     ld (hl), #0xC4 
   594E 2D            [ 4]  565     dec l
   594F 36 32         [10]  566     ld (hl), #0x32
   5951 11 00 C0      [10]  567     ld      de, #0xC000   
   5954 DD 4E 01      [19]  568     ld      c,  1(ix)
   5957 06 8D         [ 7]  569     ld      b,  #0x8D
   5959 CD 6C B0      [17]  570     call cpct_getScreenPtr_asm 
   595C 36 C4         [10]  571     ld (hl), #0xC4
   595E 2D            [ 4]  572     dec l
   595F 36 32         [10]  573     ld (hl), #0x32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 21.
Hexadecimal [16-Bits]



   5961 11 00 C0      [10]  574     ld      de, #0xC000   
   5964 DD 4E 01      [19]  575     ld      c,  1(ix)          
   5967 06 8C         [ 7]  576     ld      b,  #0x8C
   5969 CD 6C B0      [17]  577     call cpct_getScreenPtr_asm 
   596C 36 88         [10]  578     ld (hl), #0x88 
   596E 2D            [ 4]  579     dec l
   596F 36 11         [10]  580     ld (hl), #0x11
   5971 3E 14         [ 7]  581     ld a, #20
   5973                     582     esperaExpDerecha:
   5973 76            [ 4]  583     halt
   5974 3D            [ 4]  584     dec a 
   5975 20 FC         [12]  585     jr nz, esperaExpDerecha
                            586     ;;EXPLOSION GRANDE
   5977 11 00 C0      [10]  587     ld      de, #0xC000   
   597A DD 4E 01      [19]  588     ld      c,  1(ix)
   597D 06 8F         [ 7]  589     ld      b,  #0x8F
   597F CD 6C B0      [17]  590     call cpct_getScreenPtr_asm 
   5982 36 F1         [10]  591     ld (hl), #0xF1
   5984 2D            [ 4]  592     dec l
   5985 36 F8         [10]  593     ld (hl), #0xF8
   5987 11 00 C0      [10]  594     ld      de, #0xC000   
   598A DD 4E 01      [19]  595     ld      c,  1(ix)          
   598D 06 8E         [ 7]  596     ld      b,  #0x8E
   598F CD 6C B0      [17]  597     call cpct_getScreenPtr_asm 
   5992 36 F1         [10]  598     ld (hl), #0xF1 
   5994 2D            [ 4]  599     dec l
   5995 36 F8         [10]  600     ld (hl), #0xF8
   5997 11 00 C0      [10]  601     ld      de, #0xC000   
   599A DD 4E 01      [19]  602     ld      c,  1(ix)
   599D 06 8D         [ 7]  603     ld      b,  #0x8D
   599F CD 6C B0      [17]  604     call cpct_getScreenPtr_asm 
   59A2 36 F3         [10]  605     ld (hl), #0xF3
   59A4 2D            [ 4]  606     dec l
   59A5 36 FC         [10]  607     ld (hl), #0xFC
   59A7 11 00 C0      [10]  608     ld      de, #0xC000   
   59AA DD 4E 01      [19]  609     ld      c,  1(ix)          
   59AD 06 8C         [ 7]  610     ld      b,  #0x8C
   59AF CD 6C B0      [17]  611     call cpct_getScreenPtr_asm 
   59B2 36 E2         [10]  612     ld (hl), #0xE2 
   59B4 2D            [ 4]  613     dec l
   59B5 36 74         [10]  614     ld (hl), #0x74
   59B7 11 00 C0      [10]  615     ld      de, #0xC000   
   59BA DD 4E 01      [19]  616     ld      c,  1(ix)
   59BD 06 8B         [ 7]  617     ld      b,  #0x8B
   59BF CD 6C B0      [17]  618     call cpct_getScreenPtr_asm 
   59C2 36 E2         [10]  619     ld (hl), #0xE2
   59C4 2D            [ 4]  620     dec l
   59C5 36 74         [10]  621     ld (hl), #0x74
   59C7 11 00 C0      [10]  622     ld      de, #0xC000   
   59CA DD 4E 01      [19]  623     ld      c,  1(ix)          
   59CD 06 8A         [ 7]  624     ld      b,  #0x8A
   59CF CD 6C B0      [17]  625     call cpct_getScreenPtr_asm 
   59D2 36 C4         [10]  626     ld (hl), #0xC4 
   59D4 2D            [ 4]  627     dec l
   59D5 36 32         [10]  628     ld (hl), #0x32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 22.
Hexadecimal [16-Bits]



   59D7 11 00 C0      [10]  629     ld      de, #0xC000   
   59DA DD 4E 01      [19]  630     ld      c,  1(ix)
   59DD 06 89         [ 7]  631     ld      b,  #0x89
   59DF CD 6C B0      [17]  632     call cpct_getScreenPtr_asm 
   59E2 36 C4         [10]  633     ld (hl), #0xC4
   59E4 2D            [ 4]  634     dec l
   59E5 36 32         [10]  635     ld (hl), #0x32
   59E7 11 00 C0      [10]  636     ld      de, #0xC000   
   59EA DD 4E 01      [19]  637     ld      c,  1(ix)          
   59ED 06 88         [ 7]  638     ld      b,  #0x88
   59EF CD 6C B0      [17]  639     call cpct_getScreenPtr_asm 
   59F2 36 88         [10]  640     ld (hl), #0x88 
   59F4 2D            [ 4]  641     dec l
   59F5 36 11         [10]  642     ld (hl), #0x11
                            643 
                            644 
   59F7 C9            [10]  645     ret
                            646 
                            647 
   59F8                     648     Explotando:
                            649     ;;EXPLOSION GRANDE INVERTIDA
   59F8 11 00 C0      [10]  650     ld      de, #0xC000   
   59FB DD 4E 01      [19]  651     ld      c,  1(ix)
   59FE 06 8F         [ 7]  652     ld      b,  #0x8F
   5A00 CD 6C B0      [17]  653     call cpct_getScreenPtr_asm 
   5A03 36 FE         [10]  654     ld (hl), #0xFE
   5A05 2D            [ 4]  655     dec l
   5A06 36 F7         [10]  656     ld (hl), #0xF7
   5A08 11 00 C0      [10]  657     ld      de, #0xC000   
   5A0B DD 4E 01      [19]  658     ld      c,  1(ix)          
   5A0E 06 8E         [ 7]  659     ld      b,  #0x8E
   5A10 CD 6C B0      [17]  660     call cpct_getScreenPtr_asm 
   5A13 36 FE         [10]  661     ld (hl), #0xFE
   5A15 2D            [ 4]  662     dec l
   5A16 36 F7         [10]  663     ld (hl), #0xF7
   5A18 11 00 C0      [10]  664     ld      de, #0xC000   
   5A1B DD 4E 01      [19]  665     ld      c,  1(ix)
   5A1E 06 8D         [ 7]  666     ld      b,  #0x8D
   5A20 CD 6C B0      [17]  667     call cpct_getScreenPtr_asm 
   5A23 36 FC         [10]  668     ld (hl), #0xFC
   5A25 2D            [ 4]  669     dec l
   5A26 36 F3         [10]  670     ld (hl), #0xF3
   5A28 11 00 C0      [10]  671     ld      de, #0xC000   
   5A2B DD 4E 01      [19]  672     ld      c,  1(ix)          
   5A2E 06 8C         [ 7]  673     ld      b,  #0x8C
   5A30 CD 6C B0      [17]  674     call cpct_getScreenPtr_asm 
   5A33 36 EC         [10]  675     ld (hl), #0xEC 
   5A35 2D            [ 4]  676     dec l
   5A36 36 73         [10]  677     ld (hl), #0x73
   5A38 11 00 C0      [10]  678     ld      de, #0xC000   
   5A3B DD 4E 01      [19]  679     ld      c,  1(ix)
   5A3E 06 8B         [ 7]  680     ld      b,  #0x8B
   5A40 CD 6C B0      [17]  681     call cpct_getScreenPtr_asm 
   5A43 36 EC         [10]  682     ld (hl), #0xEC
   5A45 2D            [ 4]  683     dec l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 23.
Hexadecimal [16-Bits]



   5A46 36 73         [10]  684     ld (hl), #0x73
   5A48 11 00 C0      [10]  685     ld      de, #0xC000   
   5A4B DD 4E 01      [19]  686     ld      c,  1(ix)          
   5A4E 06 8A         [ 7]  687     ld      b,  #0x8A
   5A50 CD 6C B0      [17]  688     call cpct_getScreenPtr_asm 
   5A53 36 C8         [10]  689     ld (hl), #0xC8 
   5A55 2D            [ 4]  690     dec l
   5A56 36 31         [10]  691     ld (hl), #0x31
   5A58 11 00 C0      [10]  692     ld      de, #0xC000   
   5A5B DD 4E 01      [19]  693     ld      c,  1(ix)
   5A5E 06 89         [ 7]  694     ld      b,  #0x89
   5A60 CD 6C B0      [17]  695     call cpct_getScreenPtr_asm 
   5A63 36 C8         [10]  696     ld (hl), #0xC8
   5A65 2D            [ 4]  697     dec l
   5A66 36 31         [10]  698     ld (hl), #0x31
   5A68 11 00 C0      [10]  699     ld      de, #0xC000   
   5A6B DD 4E 01      [19]  700     ld      c,  1(ix)          
   5A6E 06 88         [ 7]  701     ld      b,  #0x88
   5A70 CD 6C B0      [17]  702     call cpct_getScreenPtr_asm 
   5A73 36 80         [10]  703     ld (hl), #0x80 
   5A75 2D            [ 4]  704     dec l
   5A76 36 10         [10]  705     ld (hl), #0x10
   5A78 3E 05         [ 7]  706     ld a, #5
   5A7A                     707     esperaExp4:
   5A7A 76            [ 4]  708     halt
   5A7B 3D            [ 4]  709     dec a 
   5A7C 20 FC         [12]  710     jr nz, esperaExp4
                            711     ;;EXPLOSION GRANDE
   5A7E 11 00 C0      [10]  712     ld      de, #0xC000   
   5A81 DD 4E 01      [19]  713     ld      c,  1(ix)
   5A84 06 8F         [ 7]  714     ld      b,  #0x8F
   5A86 CD 6C B0      [17]  715     call cpct_getScreenPtr_asm 
   5A89 36 F1         [10]  716     ld (hl), #0xF1
   5A8B 2D            [ 4]  717     dec l
   5A8C 36 F8         [10]  718     ld (hl), #0xF8
   5A8E 11 00 C0      [10]  719     ld      de, #0xC000   
   5A91 DD 4E 01      [19]  720     ld      c,  1(ix)          
   5A94 06 8E         [ 7]  721     ld      b,  #0x8E
   5A96 CD 6C B0      [17]  722     call cpct_getScreenPtr_asm 
   5A99 36 F1         [10]  723     ld (hl), #0xF1 
   5A9B 2D            [ 4]  724     dec l
   5A9C 36 F8         [10]  725     ld (hl), #0xF8
   5A9E 11 00 C0      [10]  726     ld      de, #0xC000   
   5AA1 DD 4E 01      [19]  727     ld      c,  1(ix)
   5AA4 06 8D         [ 7]  728     ld      b,  #0x8D
   5AA6 CD 6C B0      [17]  729     call cpct_getScreenPtr_asm 
   5AA9 36 F3         [10]  730     ld (hl), #0xF3
   5AAB 2D            [ 4]  731     dec l
   5AAC 36 FC         [10]  732     ld (hl), #0xFC
   5AAE 11 00 C0      [10]  733     ld      de, #0xC000   
   5AB1 DD 4E 01      [19]  734     ld      c,  1(ix)          
   5AB4 06 8C         [ 7]  735     ld      b,  #0x8C
   5AB6 CD 6C B0      [17]  736     call cpct_getScreenPtr_asm 
   5AB9 36 E2         [10]  737     ld (hl), #0xE2 
   5ABB 2D            [ 4]  738     dec l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 24.
Hexadecimal [16-Bits]



   5ABC 36 74         [10]  739     ld (hl), #0x74
   5ABE 11 00 C0      [10]  740     ld      de, #0xC000   
   5AC1 DD 4E 01      [19]  741     ld      c,  1(ix)
   5AC4 06 8B         [ 7]  742     ld      b,  #0x8B
   5AC6 CD 6C B0      [17]  743     call cpct_getScreenPtr_asm 
   5AC9 36 E2         [10]  744     ld (hl), #0xE2
   5ACB 2D            [ 4]  745     dec l
   5ACC 36 74         [10]  746     ld (hl), #0x74
   5ACE 11 00 C0      [10]  747     ld      de, #0xC000   
   5AD1 DD 4E 01      [19]  748     ld      c,  1(ix)          
   5AD4 06 8A         [ 7]  749     ld      b,  #0x8A
   5AD6 CD 6C B0      [17]  750     call cpct_getScreenPtr_asm 
   5AD9 36 C4         [10]  751     ld (hl), #0xC4 
   5ADB 2D            [ 4]  752     dec l
   5ADC 36 32         [10]  753     ld (hl), #0x32
   5ADE 11 00 C0      [10]  754     ld      de, #0xC000   
   5AE1 DD 4E 01      [19]  755     ld      c,  1(ix)
   5AE4 06 89         [ 7]  756     ld      b,  #0x89
   5AE6 CD 6C B0      [17]  757     call cpct_getScreenPtr_asm 
   5AE9 36 C4         [10]  758     ld (hl), #0xC4
   5AEB 2D            [ 4]  759     dec l
   5AEC 36 32         [10]  760     ld (hl), #0x32
   5AEE 11 00 C0      [10]  761     ld      de, #0xC000   
   5AF1 DD 4E 01      [19]  762     ld      c,  1(ix)          
   5AF4 06 88         [ 7]  763     ld      b,  #0x88
   5AF6 CD 6C B0      [17]  764     call cpct_getScreenPtr_asm 
   5AF9 36 88         [10]  765     ld (hl), #0x88 
   5AFB 2D            [ 4]  766     dec l
   5AFC 36 11         [10]  767     ld (hl), #0x11
   5AFE 3E 05         [ 7]  768     ld a, #5
   5B00                     769     esperaExp5:
   5B00 76            [ 4]  770     halt
   5B01 3D            [ 4]  771     dec a 
   5B02 20 FC         [12]  772     jr nz, esperaExp5
                            773     ;;EXPLOSION GRANDE INVERTIDA
   5B04 11 00 C0      [10]  774     ld      de, #0xC000   
   5B07 DD 4E 01      [19]  775     ld      c,  1(ix)
   5B0A 06 8F         [ 7]  776     ld      b,  #0x8F
   5B0C CD 6C B0      [17]  777     call cpct_getScreenPtr_asm 
   5B0F 36 FE         [10]  778     ld (hl), #0xFE
   5B11 2D            [ 4]  779     dec l
   5B12 36 F7         [10]  780     ld (hl), #0xF7
   5B14 11 00 C0      [10]  781     ld      de, #0xC000   
   5B17 DD 4E 01      [19]  782     ld      c,  1(ix)          
   5B1A 06 8E         [ 7]  783     ld      b,  #0x8E
   5B1C CD 6C B0      [17]  784     call cpct_getScreenPtr_asm 
   5B1F 36 FE         [10]  785     ld (hl), #0xFE
   5B21 2D            [ 4]  786     dec l
   5B22 36 F7         [10]  787     ld (hl), #0xF7
   5B24 11 00 C0      [10]  788     ld      de, #0xC000   
   5B27 DD 4E 01      [19]  789     ld      c,  1(ix)
   5B2A 06 8D         [ 7]  790     ld      b,  #0x8D
   5B2C CD 6C B0      [17]  791     call cpct_getScreenPtr_asm 
   5B2F 36 FC         [10]  792     ld (hl), #0xFC
   5B31 2D            [ 4]  793     dec l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 25.
Hexadecimal [16-Bits]



   5B32 36 F3         [10]  794     ld (hl), #0xF3
   5B34 11 00 C0      [10]  795     ld      de, #0xC000   
   5B37 DD 4E 01      [19]  796     ld      c,  1(ix)          
   5B3A 06 8C         [ 7]  797     ld      b,  #0x8C
   5B3C CD 6C B0      [17]  798     call cpct_getScreenPtr_asm 
   5B3F 36 EC         [10]  799     ld (hl), #0xEC 
   5B41 2D            [ 4]  800     dec l
   5B42 36 73         [10]  801     ld (hl), #0x73
   5B44 11 00 C0      [10]  802     ld      de, #0xC000   
   5B47 DD 4E 01      [19]  803     ld      c,  1(ix)
   5B4A 06 8B         [ 7]  804     ld      b,  #0x8B
   5B4C CD 6C B0      [17]  805     call cpct_getScreenPtr_asm 
   5B4F 36 EC         [10]  806     ld (hl), #0xEC
   5B51 2D            [ 4]  807     dec l
   5B52 36 73         [10]  808     ld (hl), #0x73
   5B54 11 00 C0      [10]  809     ld      de, #0xC000   
   5B57 DD 4E 01      [19]  810     ld      c,  1(ix)          
   5B5A 06 8A         [ 7]  811     ld      b,  #0x8A
   5B5C CD 6C B0      [17]  812     call cpct_getScreenPtr_asm 
   5B5F 36 C8         [10]  813     ld (hl), #0xC8 
   5B61 2D            [ 4]  814     dec l
   5B62 36 31         [10]  815     ld (hl), #0x31
   5B64 11 00 C0      [10]  816     ld      de, #0xC000   
   5B67 DD 4E 01      [19]  817     ld      c,  1(ix)
   5B6A 06 89         [ 7]  818     ld      b,  #0x89
   5B6C CD 6C B0      [17]  819     call cpct_getScreenPtr_asm 
   5B6F 36 C8         [10]  820     ld (hl), #0xC8
   5B71 2D            [ 4]  821     dec l
   5B72 36 31         [10]  822     ld (hl), #0x31
   5B74 11 00 C0      [10]  823     ld      de, #0xC000   
   5B77 DD 4E 01      [19]  824     ld      c,  1(ix)          
   5B7A 06 88         [ 7]  825     ld      b,  #0x88
   5B7C CD 6C B0      [17]  826     call cpct_getScreenPtr_asm 
   5B7F 36 80         [10]  827     ld (hl), #0x80 
   5B81 2D            [ 4]  828     dec l
   5B82 36 10         [10]  829     ld (hl), #0x10
   5B84 3E 05         [ 7]  830     ld a, #5
   5B86                     831     esperaExp6:
   5B86 76            [ 4]  832     halt
   5B87 3D            [ 4]  833     dec a 
   5B88 20 FC         [12]  834     jr nz, esperaExp6
   5B8A 11 00 C0      [10]  835     ld      de, #0xC000   
   5B8D DD 4E 01      [19]  836     ld      c,  1(ix)
   5B90 06 8F         [ 7]  837     ld      b,  #0x8F
   5B92 CD 6C B0      [17]  838     call cpct_getScreenPtr_asm 
   5B95 36 E2         [10]  839     ld (hl), #0xE2
   5B97 2D            [ 4]  840     dec l
   5B98 36 74         [10]  841     ld (hl), #0x74
   5B9A 11 00 C0      [10]  842     ld      de, #0xC000   
   5B9D DD 4E 01      [19]  843     ld      c,  1(ix)          
   5BA0 06 8E         [ 7]  844     ld      b,  #0x8E
   5BA2 CD 6C B0      [17]  845     call cpct_getScreenPtr_asm 
   5BA5 36 C4         [10]  846     ld (hl), #0xC4 
   5BA7 2D            [ 4]  847     dec l
   5BA8 36 32         [10]  848     ld (hl), #0x32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 26.
Hexadecimal [16-Bits]



   5BAA 11 00 C0      [10]  849     ld      de, #0xC000   
   5BAD DD 4E 01      [19]  850     ld      c,  1(ix)
   5BB0 06 8D         [ 7]  851     ld      b,  #0x8D
   5BB2 CD 6C B0      [17]  852     call cpct_getScreenPtr_asm 
   5BB5 36 C4         [10]  853     ld (hl), #0xC4
   5BB7 2D            [ 4]  854     dec l
   5BB8 36 32         [10]  855     ld (hl), #0x32
   5BBA 11 00 C0      [10]  856     ld      de, #0xC000   
   5BBD DD 4E 01      [19]  857     ld      c,  1(ix)          
   5BC0 06 8C         [ 7]  858     ld      b,  #0x8C
   5BC2 CD 6C B0      [17]  859     call cpct_getScreenPtr_asm 
   5BC5 36 88         [10]  860     ld (hl), #0x88 
   5BC7 2D            [ 4]  861     dec l
   5BC8 36 11         [10]  862     ld (hl), #0x11
   5BCA 11 00 C0      [10]  863     ld      de, #0xC000   
   5BCD DD 4E 01      [19]  864     ld      c,  1(ix)
   5BD0 06 8B         [ 7]  865     ld      b,  #0x8B
   5BD2 CD 6C B0      [17]  866     call cpct_getScreenPtr_asm 
   5BD5 36 00         [10]  867     ld (hl), #0x00
   5BD7 2D            [ 4]  868     dec l
   5BD8 36 00         [10]  869     ld (hl), #0x00
   5BDA 11 00 C0      [10]  870     ld      de, #0xC000   
   5BDD DD 4E 01      [19]  871     ld      c,  1(ix)          
   5BE0 06 8A         [ 7]  872     ld      b,  #0x8A
   5BE2 CD 6C B0      [17]  873     call cpct_getScreenPtr_asm 
   5BE5 36 00         [10]  874     ld (hl), #0x00 
   5BE7 2D            [ 4]  875     dec l
   5BE8 36 00         [10]  876     ld (hl), #0x00
   5BEA 11 00 C0      [10]  877     ld      de, #0xC000   
   5BED DD 4E 01      [19]  878     ld      c,  1(ix)
   5BF0 06 89         [ 7]  879     ld      b,  #0x89
   5BF2 CD 6C B0      [17]  880     call cpct_getScreenPtr_asm 
   5BF5 36 00         [10]  881     ld (hl), #0x00
   5BF7 2D            [ 4]  882     dec l
   5BF8 36 00         [10]  883     ld (hl), #0x00
   5BFA 11 00 C0      [10]  884     ld      de, #0xC000   
   5BFD DD 4E 01      [19]  885     ld      c,  1(ix)          
   5C00 06 88         [ 7]  886     ld      b,  #0x88
   5C02 CD 6C B0      [17]  887     call cpct_getScreenPtr_asm 
   5C05 36 00         [10]  888     ld (hl), #0x00 
   5C07 2D            [ 4]  889     dec l
   5C08 36 00         [10]  890     ld (hl), #0x00
                            891 
                            892 
   5C0A 3E 05         [ 7]  893     ld a, #5
   5C0C                     894     esperaExp7:
   5C0C 76            [ 4]  895     halt
   5C0D 3D            [ 4]  896     dec a 
   5C0E 20 FC         [12]  897     jr nz, esperaExp7
   5C10 11 00 C0      [10]  898     ld      de, #0xC000   
   5C13 DD 4E 01      [19]  899     ld      c,  1(ix)
   5C16 06 8F         [ 7]  900     ld      b,  #0x8F
   5C18 CD 6C B0      [17]  901     call cpct_getScreenPtr_asm 
   5C1B 36 00         [10]  902     ld (hl), #0x00
   5C1D 2D            [ 4]  903     dec l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 27.
Hexadecimal [16-Bits]



   5C1E 36 00         [10]  904     ld (hl), #0x00
   5C20 11 00 C0      [10]  905     ld      de, #0xC000   
   5C23 DD 4E 01      [19]  906     ld      c,  1(ix)          
   5C26 06 8E         [ 7]  907     ld      b,  #0x8E
   5C28 CD 6C B0      [17]  908     call cpct_getScreenPtr_asm 
   5C2B 36 00         [10]  909     ld (hl), #0x00 
   5C2D 2D            [ 4]  910     dec l
   5C2E 36 00         [10]  911     ld (hl), #0x00
   5C30 11 00 C0      [10]  912     ld      de, #0xC000   
   5C33 DD 4E 01      [19]  913     ld      c,  1(ix)
   5C36 06 8D         [ 7]  914     ld      b,  #0x8D
   5C38 CD 6C B0      [17]  915     call cpct_getScreenPtr_asm 
   5C3B 36 00         [10]  916     ld (hl), #0x00
   5C3D 2D            [ 4]  917     dec l
   5C3E 36 00         [10]  918     ld (hl), #0x00
   5C40 11 00 C0      [10]  919     ld      de, #0xC000   
   5C43 DD 4E 01      [19]  920     ld      c,  1(ix)          
   5C46 06 8C         [ 7]  921     ld      b,  #0x8C
   5C48 CD 6C B0      [17]  922     call cpct_getScreenPtr_asm 
   5C4B 36 00         [10]  923     ld (hl), #0x00 
   5C4D 2D            [ 4]  924     dec l
   5C4E 36 00         [10]  925     ld (hl), #0x00
   5C50 DD 21 5B 8F   [14]  926     ld ix, #Mina 
   5C54 DD 36 02 00   [19]  927     ld 2(ix), #0
   5C58 DD 36 00 00   [19]  928     ld 0(ix), #0
   5C5C C9            [10]  929     ret
                            930 
   5C5D                     931     borrarExplosion::
   5C5D DD 21 5B 8F   [14]  932     ld ix, #Mina 
   5C61 11 00 C0      [10]  933     ld      de, #0xC000   
   5C64 DD 4E 01      [19]  934     ld      c,  1(ix)
   5C67 06 8F         [ 7]  935     ld      b,  #0x8F
   5C69 CD 6C B0      [17]  936     call cpct_getScreenPtr_asm 
   5C6C 36 00         [10]  937     ld (hl), #0x00
   5C6E 2D            [ 4]  938     dec l
   5C6F 36 00         [10]  939     ld (hl), #0x00
   5C71 11 00 C0      [10]  940     ld      de, #0xC000   
   5C74 DD 4E 01      [19]  941     ld      c,  1(ix)          
   5C77 06 8E         [ 7]  942     ld      b,  #0x8E
   5C79 CD 6C B0      [17]  943     call cpct_getScreenPtr_asm 
   5C7C 36 00         [10]  944     ld (hl), #0x00
   5C7E 2D            [ 4]  945     dec l
   5C7F 36 00         [10]  946     ld (hl), #0x00
   5C81 11 00 C0      [10]  947     ld      de, #0xC000   
   5C84 DD 4E 01      [19]  948     ld      c,  1(ix)
   5C87 06 8D         [ 7]  949     ld      b,  #0x8D
   5C89 CD 6C B0      [17]  950     call cpct_getScreenPtr_asm 
   5C8C 36 00         [10]  951     ld (hl), #0x00
   5C8E 2D            [ 4]  952     dec l
   5C8F 36 00         [10]  953     ld (hl), #0x00
   5C91 11 00 C0      [10]  954     ld      de, #0xC000   
   5C94 DD 4E 01      [19]  955     ld      c,  1(ix)          
   5C97 06 8C         [ 7]  956     ld      b,  #0x8C
   5C99 CD 6C B0      [17]  957     call cpct_getScreenPtr_asm 
   5C9C 36 00         [10]  958     ld (hl), #0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 28.
Hexadecimal [16-Bits]



   5C9E 2D            [ 4]  959     dec l
   5C9F 36 00         [10]  960     ld (hl), #0x00
   5CA1 11 00 C0      [10]  961     ld      de, #0xC000   
   5CA4 DD 4E 01      [19]  962     ld      c,  1(ix)
   5CA7 06 8B         [ 7]  963     ld      b,  #0x8B
   5CA9 CD 6C B0      [17]  964     call cpct_getScreenPtr_asm 
   5CAC 36 00         [10]  965     ld (hl), #0x00
   5CAE 2D            [ 4]  966     dec l
   5CAF 36 00         [10]  967     ld (hl), #0x00
   5CB1 11 00 C0      [10]  968     ld      de, #0xC000   
   5CB4 DD 4E 01      [19]  969     ld      c,  1(ix)          
   5CB7 06 8A         [ 7]  970     ld      b,  #0x8A
   5CB9 CD 6C B0      [17]  971     call cpct_getScreenPtr_asm 
   5CBC 36 00         [10]  972     ld (hl), #0x00 
   5CBE 2D            [ 4]  973     dec l
   5CBF 36 00         [10]  974     ld (hl), #0x00
   5CC1 11 00 C0      [10]  975     ld      de, #0xC000   
   5CC4 DD 4E 01      [19]  976     ld      c,  1(ix)
   5CC7 06 89         [ 7]  977     ld      b,  #0x89
   5CC9 CD 6C B0      [17]  978     call cpct_getScreenPtr_asm 
   5CCC 36 00         [10]  979     ld (hl), #0x00
   5CCE 2D            [ 4]  980     dec l
   5CCF 36 00         [10]  981     ld (hl), #0x00
   5CD1 11 00 C0      [10]  982     ld      de, #0xC000   
   5CD4 DD 4E 01      [19]  983     ld      c,  1(ix)          
   5CD7 06 88         [ 7]  984     ld      b,  #0x88
   5CD9 CD 6C B0      [17]  985     call cpct_getScreenPtr_asm 
   5CDC 36 00         [10]  986     ld (hl), #0x00 
   5CDE 2D            [ 4]  987     dec l
   5CDF 36 00         [10]  988     ld (hl), #0x00
                            989     
                            990  
   5CE1 C9            [10]  991 ret
