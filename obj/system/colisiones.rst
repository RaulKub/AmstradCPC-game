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



                             15 .include "system/mainJuego.h.s"
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



                             17 
   A0AD                      18 enemigoDerChoque::
   A0AD DD 21 1F 40   [14]   19     ld ix, #enemyPos
   A0B1 DD 46 00      [19]   20     ld  b, entity_x(ix)  ;;ix contendra el enemigo
   A0B4 DD 21 03 40   [14]   21     ld  ix, #playerPos  ;;(player)
   A0B8 DD 7E 00      [19]   22     ld  a, entity_x(ix)
                             23     
   A0BB 3C            [ 4]   24     inc a   ;;incremento a para que choque cuando coincide la mitad del cuadrado (misma X menos uno)
   A0BC                      25     derRestaAZ:
   A0BC 3D            [ 4]   26     dec a
   A0BD 20 05         [12]   27     jr  nz, derRestaBZ
   A0BF 05            [ 4]   28     dec b
   A0C0 C0            [11]   29     ret  nz
   A0C1 CD EA 9B      [17]   30     call colision
   A0C4                      31     derRestaBZ:
   A0C4 05            [ 4]   32     dec b    
   A0C5 20 F5         [12]   33     jr  nz,  derRestaAZ
                             34 
   A0C7 C9            [10]   35     ret
                             36 
                             37 
   A0C8                      38 enemigoIzqChoque::
   A0C8 DD 21 2D 40   [14]   39     ld ix, #enemyIzqPos
   A0CC DD 46 00      [19]   40     ld  b, entity_x(ix)  ;;ix contendra el enemigo
   A0CF DD 21 03 40   [14]   41     ld  ix, #playerPos  ;;(player)
   A0D3 DD 7E 00      [19]   42     ld  a, entity_x(ix)
                             43     
   A0D6 04            [ 4]   44     inc b   ;;incremento a para que choque cuando coincide la mitad del cuadrado (misma X menos uno)
   A0D7                      45     izqRestaAZ:
   A0D7 05            [ 4]   46     dec b
   A0D8 20 05         [12]   47     jr  nz, izqRestaBZ
   A0DA 3D            [ 4]   48     dec a
                             49     ;;dec a
   A0DB C0            [11]   50     ret  nz
                             51     ;;dec a 
                             52     ;;ret nz
   A0DC CD EA 9B      [17]   53     call colision
   A0DF                      54     izqRestaBZ:
   A0DF 3D            [ 4]   55     dec a    
   A0E0 20 F5         [12]   56     jr  nz,  izqRestaAZ
                             57 
   A0E2 C9            [10]   58     ret
                             59 
   A0E3                      60     enemigoIzq2Choque::
   A0E3 DD 21 34 40   [14]   61     ld ix, #enemyIzqPos2
   A0E7 DD 46 00      [19]   62     ld  b, entity_x(ix)  ;;ix contendra el enemigo
   A0EA DD 21 03 40   [14]   63     ld  ix, #playerPos  ;;(player)
   A0EE DD 7E 00      [19]   64     ld  a, entity_x(ix)
                             65     
   A0F1 04            [ 4]   66     inc b   ;;incremento a para que choque cuando coincide la mitad del cuadrado (misma X menos uno)
   A0F2                      67     izq2RestaAZ:
   A0F2 05            [ 4]   68     dec b
   A0F3 20 05         [12]   69     jr  nz, izq2RestaBZ
   A0F5 3D            [ 4]   70     dec a
   A0F6 C0            [11]   71     ret  nz
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   A0F7 CD EA 9B      [17]   72     call colision
   A0FA                      73     izq2RestaBZ:
   A0FA 3D            [ 4]   74     dec a    
   A0FB 20 F5         [12]   75     jr  nz,  izq2RestaAZ
   A0FD 05            [ 4]   76     dec b
   A0FE C0            [11]   77     ret nz
   A0FF CD EA 9B      [17]   78     call colision
                             79 
   A102 C9            [10]   80     ret
                             81 
   A103                      82     enemigoDer2Choque::
   A103 DD 21 50 40   [14]   83     ld ix, #enemyDerPos2
   A107 DD 46 00      [19]   84     ld  b, entity_x(ix)  ;;ix contendra el enemigo
   A10A DD 21 03 40   [14]   85     ld  ix, #playerPos  ;;(player)
   A10E DD 7E 00      [19]   86     ld  a, entity_x(ix)
                             87     
   A111 3C            [ 4]   88     inc a   ;;incremento a para que choque cuando coincide la mitad del cuadrado (misma X menos uno)
   A112                      89     der2RestaAZ:
   A112 3D            [ 4]   90     dec a
   A113 20 05         [12]   91     jr  nz, der2RestaBZ
   A115 05            [ 4]   92     dec b
   A116 C0            [11]   93     ret  nz
   A117 CD EA 9B      [17]   94     call colision
   A11A                      95     der2RestaBZ:
   A11A 05            [ 4]   96     dec b    
   A11B 20 F5         [12]   97     jr  nz,  der2RestaAZ
   A11D 3D            [ 4]   98     dec a
   A11E C0            [11]   99     ret nz
   A11F CD EA 9B      [17]  100     call colision
                            101 
   A122 C9            [10]  102     ret
