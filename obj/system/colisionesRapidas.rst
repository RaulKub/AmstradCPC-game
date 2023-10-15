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



                             17 .include "system/render_system.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             18 .include "system/mainJuego.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                             19 .include "system/renderEnemigo3.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                             20 .include "system/renderEnemigo4.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                             21 .include "system/renderEspada.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                             22 
   5326                      23 colisionRapida::
                             24 
   5326 DD 21 0A 40   [14]   25   ld  ix, #espadaPos
   532A DD 7E 00      [19]   26   ld  a,  entity_x(ix)
   532D DD 21 50 40   [14]   27   ld  ix, #enemyDerPos2
   5331 DD 46 00      [19]   28   ld  b,  entity_x(ix)
                             29 
   5334                      30   colisionEspadaDer:
   5334 3D            [ 4]   31     dec a
   5335 28 05         [12]   32     jr z, espadaCero
   5337 05            [ 4]   33     dec b
   5338 28 18         [12]   34     jr z, enemigoCero
   533A 18 F8         [12]   35     jr colisionEspadaDer
   533C                      36   espadaCero:
   533C 05            [ 4]   37     dec b
   533D CA A7 53      [10]   38     jp z, enemigoDerAsesinado
   5340 05            [ 4]   39     dec b
   5341 CA A7 53      [10]   40     jp z, enemigoDerAsesinado
   5344 05            [ 4]   41     dec b
   5345 CA A7 53      [10]   42     jp z, enemigoDerAsesinado
   5348 05            [ 4]   43     dec b
   5349 CA A7 53      [10]   44     jp z, enemigoDerAsesinado
   534C 05            [ 4]   45     dec b
   534D CA A7 53      [10]   46     jp z, enemigoDerAsesinado
   5350 18 04         [12]   47     jr noColisionDer
   5352                      48   enemigoCero:
   5352 3D            [ 4]   49     dec a
   5353 CA A7 53      [10]   50     jp z, enemigoDerAsesinado
                             51 
   5356                      52   noColisionDer:
   5356 DD 21 0A 40   [14]   53     ld  ix, #espadaPos
   535A DD 7E 00      [19]   54     ld  a,  entity_x(ix)
   535D DD 21 34 40   [14]   55     ld  ix, #enemyIzqPos2
   5361 DD 46 00      [19]   56     ld  b,  entity_x(ix)
                             57 
                             58 ;;------------------------------
                             59 
   5364                      60   colisionEspadaIzq:
   5364 05            [ 4]   61     dec b
   5365 28 05         [12]   62     jr z, enemigoCeroI
   5367 3D            [ 4]   63     dec a
   5368 28 12         [12]   64     jr z, espadaCeroI
   536A 18 F8         [12]   65     jr colisionEspadaIzq
   536C                      66   enemigoCeroI:
   536C 3D            [ 4]   67     dec a
   536D 28 0E         [12]   68     jr z, enemigoIzqAsesinado
   536F 3D            [ 4]   69     dec a
   5370 28 0B         [12]   70     jr z, enemigoIzqAsesinado
   5372 3D            [ 4]   71     dec a
   5373 28 08         [12]   72     jr z, enemigoIzqAsesinado
   5375 3D            [ 4]   73     dec a
   5376 28 05         [12]   74     jr z, enemigoIzqAsesinado
   5378 3D            [ 4]   75     dec a
   5379 28 02         [12]   76     jr z, enemigoIzqAsesinado
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   537B C9            [10]   77     ret
   537C                      78   espadaCeroI:
   537C C9            [10]   79     ret
                             80 
                             81 
                             82 
                             83 
                             84 
   537D                      85   enemigoIzqAsesinado:
                             86     ;;lo cambiamos a color azul
   537D DD 21 34 40   [14]   87     ld  ix, #enemyIzqPos2
   5381 DD 36 06 0F   [19]   88     ld  entity_color(ix), #0x0F
                             89     
   5385 CD BA 87      [17]   90     call borrarEnemigo3
   5388 CD EC AA      [17]   91     call borrarEspadaIzquierda
   538B DD 21 34 40   [14]   92     ld  ix, #enemyIzqPos2
   538F DD 36 00 05   [19]   93     ld  entity_x(ix), #5
   5393 DD 36 04 00   [19]   94     ld  entity_estado(ix), #0
   5397 CD F4 83      [17]   95     call pintarEnemigo3
                             96 
   539A DD 21 11 40   [14]   97     ld  ix, #wallIPos
   539E DD 7E 04      [19]   98     ld  a, entity_estado(ix)
   53A1 3C            [ 4]   99     inc a
   53A2 3C            [ 4]  100     inc a
   53A3 DD 77 04      [19]  101     ld  entity_estado(ix), a
   53A6 C9            [10]  102     ret
                            103 
   53A7                     104   enemigoDerAsesinado:
                            105 
                            106     ;;lo cambiamos a color azul
   53A7 DD 21 50 40   [14]  107     ld  ix, #enemyDerPos2
   53AB DD 36 06 0F   [19]  108     ld  entity_color(ix), #0x0F
   53AF CD 72 A9      [17]  109     call borrarEnemigo4
   53B2 CD C0 AA      [17]  110     call borrarEspadaDerecha
                            111 
   53B5 DD 21 50 40   [14]  112     ld  ix, #enemyDerPos2
   53B9 DD 36 00 48   [19]  113     ld  entity_x(ix), #72
   53BD DD 36 04 00   [19]  114     ld  entity_estado(ix), #0
   53C1 CD AC A5      [17]  115     call pintarEnemigo4
                            116 
   53C4 DD 21 18 40   [14]  117     ld  ix, #wallDPos
   53C8 DD 7E 05      [19]  118     ld  a, entity_vy(ix)
   53CB 3D            [ 4]  119     dec a
   53CC DD 77 05      [19]  120     ld  entity_vy(ix), a
                            121 
   53CF DD 21 11 40   [14]  122     ld  ix, #wallIPos
   53D3 DD 7E 04      [19]  123     ld  a, entity_estado(ix)
   53D6 3C            [ 4]  124     inc a
   53D7 3C            [ 4]  125     inc a
   53D8 DD 77 04      [19]  126     ld  entity_estado(ix), a
                            127 
   53DB C9            [10]  128     ret
