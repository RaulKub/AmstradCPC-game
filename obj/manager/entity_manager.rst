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



                             16 .include "main.h.s"
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
                             15 
                             16 .globl max_entities
                             17 .globl entity_size
                             18 .globl _num_entities
                             19 .globl _last_elem_ptr
                             20 .globl _entity_array
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             17 .include "entity_manager.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             18 
                             19 ;;
                             20 ;;  ENTITY MANAGER
                             21 ;;
                             22 ;;max_entities == 16
                             23 ;;    entity_size == 7
                             24 ;;
                             25 ;;    _num_entities::     .db 0
                             26 ;;    _last_elem_ptr::    .dw _entity_array
                             27 ;;    _entity_array::
                             28 ;;        .ds max_entities*entity_size
                             29         
   4196                      30 entityman_init::
   4196 AF            [ 4]   31     xor		a 
   4197 32 00 40      [13]   32 	ld 		(_num_entities), a
                             33 
   419A 21 03 40      [10]   34 	ld 		hl, #_entity_array
   419D 22 01 40      [16]   35 	ld 		(_last_elem_ptr), hl
                             36 
   41A0 C9            [10]   37 	ret
                             38 
                             39     
                             40 
                             41 
   41A1                      42 entityman_getEntityArray_IX::
   41A1 DD 21 03 40   [14]   43     ld  ix, #_entity_array
   41A5 C9            [10]   44     ret
                             45 
   41A6                      46 entityman_getNumEntities_A::
   41A6 3A 00 40      [13]   47     ld  a, (_num_entities)
   41A9 C9            [10]   48     ret
                             49 
                             50 ;; INPUt
                             51 ;; HL: Pointer to entity initializer bytes
   41AA                      52 entityman_create::
   41AA ED 5B 01 40   [20]   53     ld      de, (_last_elem_ptr)
   41AE 01 07 00      [10]   54     ld      bc, #entity_size
   41B1 ED B0         [21]   55     ldir    
                             56 
   41B3 3A 00 40      [13]   57     ld      a, (_num_entities)
   41B6 3C            [ 4]   58     inc     a
   41B7 32 00 40      [13]   59     ld      (_num_entities), a
                             60 
   41BA 2A 01 40      [16]   61     ld      hl, (_last_elem_ptr)
   41BD 01 07 00      [10]   62     ld      bc, #entity_size
   41C0 09            [11]   63     add     hl, bc
   41C1 22 01 40      [16]   64     ld      (_last_elem_ptr), hl
                             65 
   41C4 C9            [10]   66     ret
                             67 
   41C5                      68     reset::
   41C5 3E 00         [ 7]   69     ld a, #0
   41C7 32 00 40      [13]   70         ld (_num_entities), a
   41CA 21 03 40      [10]   71         ld hl, #playerPos
   41CD 22 01 40      [16]   72     ld (_last_elem_ptr), hl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   41D0 DD 21 54 8F   [14]   73     ld ix, #cooldownMisil ;;cooldownMisil
   41D4 DD 36 00 01   [19]   74     ld 0(ix), #1
   41D8 DD 21 55 8F   [14]   75     ld ix, #letrasborradas ;;letrasborradas
   41DC DD 36 00 00   [19]   76     ld 0(ix), #0
   41E0 DD 21 56 8F   [14]   77     ld ix, #nivelactual ;;nivelactual
   41E4 DD 36 00 01   [19]   78     ld 0(ix), #1
   41E8 DD 21 57 8F   [14]   79     ld ix, #cargaNivel ;;cargaNivel
   41EC DD 36 00 01   [19]   80     ld 0(ix), #1
   41F0 DD 21 58 8F   [14]   81     ld ix, #cooldownEnemigo1 ;;cooldownEnemigo1
   41F4 DD 36 00 00   [19]   82     ld 0(ix), #0
   41F8 DD 21 59 8F   [14]   83     ld ix, #cooldownEnemigo2 ;;cooldownEnemigo2
   41FC DD 36 00 00   [19]   84     ld 0(ix), #0
   4200 DD 21 5A 8F   [14]   85     ld ix, #vidas ;;vidas
   4204 DD 36 00 03   [19]   86     ld 0(ix), #3
                             87 
   4208 DD 21 5B 8F   [14]   88     ld ix, #Mina ;;Mina
   420C DD 36 00 00   [19]   89     ld 0(ix), #0
   4210 DD 21 5B 8F   [14]   90     ld ix, #Mina ;;Mina
   4214 DD 36 01 00   [19]   91     ld 1(ix), #0
   4218 DD 21 5B 8F   [14]   92     ld ix, #Mina ;;Mina
   421C DD 36 02 00   [19]   93     ld 2(ix), #0
   4220 DD 21 5B 8F   [14]   94     ld ix, #Mina ;;Mina
   4224 DD 36 03 00   [19]   95     ld 3(ix), #0
                             96 
   4228 DD 21 5F 8F   [14]   97     ld ix, #Inicio ;;Mina
   422C DD 36 00 1E   [19]   98     ld 0(ix), #30
   4230 DD 21 5F 8F   [14]   99     ld ix, #Inicio ;;Mina
   4234 DD 36 01 01   [19]  100     ld 1(ix), #1
   4238 DD 21 5F 8F   [14]  101     ld ix, #Inicio ;;Mina
   423C DD 36 02 02   [19]  102     ld 2(ix), #2
                            103 
   4240 DD 21 18 40   [14]  104     ld ix, #wallDPos
   4244 DD 36 04 01   [19]  105     ld entity_estado(ix), #1
   4248 DD 36 05 02   [19]  106     ld entity_vy(ix), #2
   424C C9            [10]  107    ret
                            108 
                            109 
                            110 
                            111 
                            112 
                            113 
                            114 
                            115 
                            116 
                            117 
                            118 
                            119 
                            120 
                            121 
                            122 
                            123 
                            124 
                            125 
                            126 
                            127 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                            128 
                            129 
