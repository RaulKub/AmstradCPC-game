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
                             15    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             16    .include "system/mainJuego.h.s"
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



                             17    .include "system/colisiones.h.s"
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
                             15 .globl enemigoDerChoque
                             16 .globl enemigoIzqChoque
                             17 .globl enemigoDer2Choque
                             18 .globl enemigoIzq2Choque
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             18    .include "cpcfunciones.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             19    .include "manager/entity_manager.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                             20    .include "system/render_system.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                             21    .include "system/actualizarEnemigoAereo.h.s"
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
                             15 .globl actualizarEnemigoAereo
                             16 .globl actualizarEnemigoAereo2
                             17 .globl actualizarEnemigoAereo3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                             22    .include "system/renderEnemigo1.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                             23    .include "system/renderEnemigo2.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                             24    .include "system/renderEnemigo3.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                             25    .include "system/renderEnemigo4.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                             26    .include "system/renderEnemigo5A.h.s"
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
                             15 .globl pintarEnemigo5
                             16 .globl borrarEnemigo5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



                             27    .include "system/renderCroco.h.s"
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
                             15 .globl pintarCrocoPos1
                             16 .globl pintarCrocoPos2
                             17 .globl pintarCrocoPos3
                             18 .globl pintarCrocoPos4
                             19 .globl pintarCrocoPos5
                             20 .globl pintarCrocoPos6
                             21 .globl pintarCrocoPos7
                             22 .globl borrarCrocoPos1
                             23 .globl borrarCrocoPos2
                             24 .globl borrarCrocoPos3
                             25 .globl borrarCrocoPos4
                             26 .globl borrarCrocoPos5
                             27 .globl borrarCrocoPos6
                             28 .globl borrarCrocoPos7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



                             28    
                             29    ;;actualizarEnemigos:: 
                             30    ;; call cpct_waitVSYNC_asm
                             31    ;; halt 
                             32    ;; halt
                             33    ;; halt
                             34    ;; call cpct_waitVSYNC_asm
                             35    ;; halt 
                             36    ;; halt
                             37    ;; halt
                             38    ;; call cpct_waitVSYNC_asm
                             39    ;; halt 
                             40    ;; halt
                             41    ;; halt
                             42    ;; call cpct_waitVSYNC_asm
                             43    ;; halt 
                             44    ;; halt
                             45    ;; halt
                             46    ;; call cpct_waitVSYNC_asm
                             47    ;; halt 
                             48    ;; halt
                             49    ;; halt
                             50    ;; call cpct_waitVSYNC_asm
                             51    ;; halt 
                             52    ;; halt
                             53    ;; halt
                             54    ;; call cpct_waitVSYNC_asm
                             55    ;; halt 
                             56    ;; halt
                             57    ;; halt
                             58    ;; call cpct_waitVSYNC_asm
                             59    ;; halt 
                             60    ;; halt
                             61    ;; halt
                             62    ;; call cpct_waitVSYNC_asm
                             63    ;; halt 
                             64    ;; halt
                             65    ;; halt
                             66    ;; call cpct_waitVSYNC_asm
                             67    ;;  ld  ix, #enemyPos  ;;(enemy)
                             68    ;;  ld entity_color(ix), #0x00
                             69    ;; call  entityman_getEntityArray_IX
                             70    ;; call  entityman_getNumEntities_A
                             71    ;; call  rendersys_update
                             72    ;; ld  ix, #enemyPos  ;;(enemy)
                             73    ;;  ld entity_color(ix), #0xF0
                             74    ;;  ld a, entity_x(ix)
                             75    ;;  dec a
                             76    ;;  ld entity_x(ix), a
                             77    ;;  call  entityman_getEntityArray_IX
                             78    ;; call  entityman_getNumEntities_A
                             79    ;; call  rendersys_update
                             80 ;;
                             81    ;;  ld  ix, #enemyIzqPos  ;;(enemy)
                             82    ;;  ld entity_color(ix), #0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



                             83    ;; call  entityman_getEntityArray_IX
                             84    ;; call  entityman_getNumEntities_A
                             85    ;; call  rendersys_update
                             86    ;; ld  ix, #enemyIzqPos  ;;(enemy)
                             87    ;;  ld entity_color(ix), #0xF0
                             88    ;;  ld a, entity_x(ix)
                             89    ;;  inc  a
                             90    ;;  ld entity_x(ix), a
                             91    ;;  call  entityman_getEntityArray_IX
                             92    ;; call  entityman_getNumEntities_A
                             93    ;; call  rendersys_update
                             94 ;;
                             95    ;;  ld  ix, #enemyUp1Pos  ;;(enemy)
                             96    ;;  ld entity_color(ix), #0x00
                             97    ;; call  entityman_getEntityArray_IX
                             98    ;; call  entityman_getNumEntities_A
                             99    ;; call  rendersys_update
                            100    ;; ld  ix, #enemyUp1Pos  ;;(enemy)
                            101    ;;  ld entity_color(ix), #0xF0
                            102    ;;  ld a, entity_y(ix)
                            103    ;;  inc a
                            104    ;;  ld entity_y(ix), a
                            105    ;;  call  entityman_getEntityArray_IX
                            106    ;; call  entityman_getNumEntities_A
                            107    ;; call  rendersys_update
                            108 ;;
                            109    ;;  ld  ix, #enemyUp2Pos  ;;(enemy)
                            110    ;;  ld entity_color(ix), #0x00
                            111    ;; call  entityman_getEntityArray_IX
                            112    ;; call  entityman_getNumEntities_A
                            113    ;; call  rendersys_update
                            114    ;; ld  ix, #enemyUp2Pos  ;;(enemy)
                            115    ;;  ld entity_color(ix), #0xF0
                            116    ;;  ld a, entity_y(ix)
                            117    ;;  inc a
                            118    ;;  ld entity_y(ix), a
                            119    ;;  call  entityman_getEntityArray_IX
                            120    ;; call  entityman_getNumEntities_A
                            121    ;; call  rendersys_update
                            122 ;;
                            123    ;;  ld  ix, #enemyUp3Pos  ;;(enemy)
                            124    ;;  ld entity_color(ix), #0x00
                            125    ;; call  entityman_getEntityArray_IX
                            126    ;; call  entityman_getNumEntities_A
                            127    ;; call  rendersys_update
                            128    ;; ld  ix, #enemyUp3Pos  ;;(enemy)
                            129    ;;  ld entity_color(ix), #0xF0
                            130    ;;  ld a, entity_y(ix)
                            131    ;;  inc a
                            132    ;;  ld entity_y(ix), a
                            133    ;;  call  entityman_getEntityArray_IX
                            134    ;; call  entityman_getNumEntities_A
                            135    ;; call  rendersys_update
                            136 ;;
                            137    ;;  ld  ix, #enemyUp4Pos  ;;(enemy)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



                            138    ;;  ld entity_color(ix), #0x00
                            139    ;; call  entityman_getEntityArray_IX
                            140    ;; call  entityman_getNumEntities_A
                            141    ;; call  rendersys_update
                            142    ;; ld  ix, #enemyUp4Pos  ;;(enemy)
                            143    ;;  ld entity_color(ix), #0xF0
                            144    ;;  ld a, entity_y(ix)
                            145    ;;  inc a
                            146    ;;  ld entity_y(ix), a
                            147    ;;  call  entityman_getEntityArray_IX
                            148    ;; call  entityman_getNumEntities_A
                            149    ;; call  rendersys_update
                            150 ;;
                            151    ;;  ld  ix, #enemyUp5Pos  ;;(enemy)
                            152    ;;  ld entity_color(ix), #0x00
                            153    ;; call  entityman_getEntityArray_IX
                            154    ;; call  entityman_getNumEntities_A
                            155    ;; call  rendersys_update
                            156    ;; ld  ix, #enemyUp5Pos  ;;(enemy)
                            157    ;;  ld entity_color(ix), #0xF0
                            158    ;;  ld a, entity_y(ix)
                            159    ;;  inc a
                            160    ;;  ld entity_y(ix), a
                            161    ;; call  entityman_getEntityArray_IX
                            162    ;; call  entityman_getNumEntities_A
                            163    ;; call  rendersys_update
                            164 ;;
                            165    ;; 
                            166    ;; call enemigoDerChoque
                            167    ;; call enemigoIzqChoque
                            168 ;;
                            169    ;; ret
                            170 
   4D76                     171     actualizarEnemigos1:: 
                            172     ;;call cpct_waitVSYNC_asm
                            173     ;;halt 
                            174     ;;halt
                            175     ;;halt
                            176     ;;call cpct_waitVSYNC_asm
                            177     ;;halt 
                            178     ;;halt
                            179     ;;halt
                            180     ;;call cpct_waitVSYNC_asm
                            181     ;;halt 
                            182     ;;halt
                            183     ;;halt
                            184     ;;call cpct_waitVSYNC_asm
                            185     ;;halt 
                            186     ;;halt
                            187     ;;halt
                            188     ;;call cpct_waitVSYNC_asm
                            189     ;;halt 
                            190     ;;halt
                            191     ;;halt
                            192     ;;call cpct_waitVSYNC_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



                            193     ;;halt 
                            194     ;;halt
                            195     ;;halt
                            196     ;;call cpct_waitVSYNC_asm
                            197     ;;//comentamos la espera del nivel 1
                            198     ;;halt 
                            199     ;;halt
                            200     ;;halt
                            201     ;;call cpct_waitVSYNC_asm
                            202     ;;halt 
                            203     ;;halt
                            204     ;;halt
                            205     ;;call cpct_waitVSYNC_asm
                            206     ;;halt 
                            207     ;;halt
                            208     ;;halt
                            209     ;;call cpct_waitVSYNC_asm
   4D76 DD 21 58 8F   [14]  210     ld ix, #cooldownEnemigo1
   4D7A DD 35 00      [23]  211     dec 0(ix)
   4D7D 28 06         [12]  212     jr z, seActualiza1
   4D7F DD 36 00 01   [19]  213     ld 0(ix), #1
   4D83 18 19         [12]  214     jr noseActualiza1
   4D85                     215     seActualiza1:
   4D85 DD 21 1F 40   [14]  216      ld  ix, #enemyPos  ;;(enemy)
   4D89 DD 36 06 00   [19]  217      ld entity_color(ix), #0x00
                            218     ;;call  entityman_getEntityArray_IX
                            219     ;;call  entityman_getNumEntities_A
                            220     ;;call  rendersys_update
   4D8D CD BC 82      [17]  221     call borrarEnemigo1
   4D90 DD 21 1F 40   [14]  222     ld  ix, #enemyPos  ;;(enemy)
                            223      ;;ld entity_color(ix), #0xF0
   4D94 DD 7E 00      [19]  224      ld a, entity_x(ix)
   4D97 3D            [ 4]  225      dec a
   4D98 DD 77 00      [19]  226      ld entity_x(ix), a
                            227     ;;call  entityman_getEntityArray_IX
                            228     ;;call  entityman_getNumEntities_A
                            229     ;;call  rendersys_update
   4D9B CD F6 7E      [17]  230     call pintarEnemigo1
   4D9E                     231     noseActualiza1:
                            232 
   4D9E CD AD A0      [17]  233     call enemigoDerChoque
                            234 
                            235     
                            236     
   4DA1 C9            [10]  237     ret
                            238 
   4DA2                     239     actualizarEnemigos2::
                            240     ;;call cpct_waitVSYNC_asm
                            241     ;;halt 
                            242     ;;halt
                            243     ;;halt
                            244     ;;call cpct_waitVSYNC_asm
                            245     ;;halt 
                            246     ;;halt
                            247     ;;halt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



                            248     ;;call cpct_waitVSYNC_asm
                            249     ;;halt 
                            250     ;;halt
                            251     ;;halt
                            252     ;;call cpct_waitVSYNC_asm
                            253     ;;halt 
                            254     ;;halt
                            255     ;;halt
                            256     ;;call cpct_waitVSYNC_asm
                            257     ;;halt 
                            258     ;;halt
                            259     ;;halt
                            260     ;;call cpct_waitVSYNC_asm
                            261     ;;halt 
                            262     ;;halt
                            263     ;;halt
                            264     ;;call cpct_waitVSYNC_asm
                            265     ;;halt 
                            266     ;//DESDE AQUI
                            267     ;;halt
                            268     ;;halt
                            269     ;;call cpct_waitVSYNC_asm
                            270     ;;halt 
                            271     ;;halt
                            272     ;;halt
                            273     ;;call cpct_waitVSYNC_asm
                            274     ;;halt 
                            275     ;;halt
                            276     ;;halt
                            277     ;;call cpct_waitVSYNC_asm
   4DA2 DD 21 58 8F   [14]  278     ld ix, #cooldownEnemigo1
   4DA6 DD 35 00      [23]  279     dec 0(ix)
   4DA9 28 06         [12]  280     jr z, seActualiza2
   4DAB DD 36 00 01   [19]  281     ld 0(ix), #1
   4DAF 18 19         [12]  282     jr noseActualiza2
   4DB1                     283     seActualiza2:
   4DB1 DD 21 1F 40   [14]  284       ld  ix, #enemyPos  ;;(enemy)
   4DB5 DD 36 06 00   [19]  285      ld entity_color(ix), #0x00
                            286     ;;call  entityman_getEntityArray_IX
                            287     ;;call  entityman_getNumEntities_A
                            288     ;;call  rendersys_update
   4DB9 CD BC 82      [17]  289     call borrarEnemigo1
   4DBC DD 21 1F 40   [14]  290     ld  ix, #enemyPos  ;;(enemy)
                            291      ;;ld entity_color(ix), #0xF0
   4DC0 DD 7E 00      [19]  292      ld a, entity_x(ix)
   4DC3 3D            [ 4]  293      dec a
   4DC4 DD 77 00      [19]  294      ld entity_x(ix), a
                            295     ;;call  entityman_getEntityArray_IX
                            296     ;;call  entityman_getNumEntities_A
                            297     ;;call  rendersys_update
   4DC7 CD F6 7E      [17]  298     call pintarEnemigo1
   4DCA                     299     noseActualiza2:
                            300 
   4DCA CD AD A0      [17]  301     call enemigoDerChoque
                            302 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   4DCD DD 21 59 8F   [14]  303    ld ix, #cooldownEnemigo2
   4DD1 DD 35 00      [23]  304     dec 0(ix)
   4DD4 28 06         [12]  305     jr z, seActualiza21
   4DD6 DD 36 00 01   [19]  306     ld 0(ix), #1
   4DDA 18 19         [12]  307     jr noseActualiza21
   4DDC                     308     seActualiza21:
   4DDC DD 21 2D 40   [14]  309      ld  ix, #enemyIzqPos  ;;(enemy)
   4DE0 DD 36 06 00   [19]  310      ld entity_color(ix), #0x00
                            311     ;;call  entityman_getEntityArray_IX
                            312     ;;call  entityman_getNumEntities_A
                            313     ;;call  rendersys_update
   4DE4 CD B8 8C      [17]  314     call borrarEnemigo2
   4DE7 DD 21 2D 40   [14]  315     ld  ix, #enemyIzqPos  ;;(enemy)
                            316      ;;ld entity_color(ix), #0xF0
   4DEB DD 7E 00      [19]  317      ld a, entity_x(ix)
   4DEE 3C            [ 4]  318      inc a
   4DEF DD 77 00      [19]  319      ld entity_x(ix), a
                            320     ;;call  entityman_getEntityArray_IX
                            321     ;;call  entityman_getNumEntities_A
                            322     ;;call  rendersys_update
   4DF2 CD F2 88      [17]  323     call pintarEnemigo2
   4DF5                     324    noseActualiza21:
   4DF5 CD C8 A0      [17]  325     call enemigoIzqChoque
                            326 
                            327     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                            328     ;;ld entity_color(ix), #0x00
                            329     ;;call  entityman_getEntityArray_IX
                            330     ;;call  entityman_getNumEntities_A
                            331     ;;call  rendersys_update
                            332     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                            333     ;; ld entity_color(ix), #0xF0
                            334     ;; ld a, entity_x(ix)
                            335     ;; inc  a
                            336     ;; ld entity_x(ix), a
                            337     ;; call  entityman_getEntityArray_IX
                            338     ;;call  entityman_getNumEntities_A
                            339     ;;call  rendersys_update
                            340 ;;
                            341     ;;call enemigoIzqChoque
                            342 
   4DF8 C9            [10]  343     ret
                            344 
   4DF9                     345     actualizarEnemigos3:: 
                            346     ;;call cpct_waitVSYNC_asm
                            347     ;;halt 
                            348     ;;halt
                            349     ;;halt
                            350     ;;call cpct_waitVSYNC_asm
                            351     ;;halt 
                            352     ;;halt
                            353     ;;halt
                            354     ;;call cpct_waitVSYNC_asm
                            355     ;;halt 
                            356     ;;halt
                            357     ;;halt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



                            358     ;;call cpct_waitVSYNC_asm
                            359     ;;halt 
                            360     ;;halt
                            361     ;;halt
                            362     ;;call cpct_waitVSYNC_asm
                            363     ;;halt 
                            364     ;;halt
                            365     ;;halt
                            366     ;;call cpct_waitVSYNC_asm
                            367     ;;halt 
                            368     ;;halt
                            369     ;;halt
                            370     ;;call cpct_waitVSYNC_asm
                            371     ;;halt 
                            372     ;;halt
                            373     ;;halt
                            374     ;;call cpct_waitVSYNC_asm
                            375     ;;halt 
                            376     ;;halt
                            377     ;;halt
                            378     ;;call cpct_waitVSYNC_asm
                            379     ;;halt 
                            380     ;;halt
                            381     ;;halt
                            382     ;//AQUI
                            383     ;;call cpct_waitVSYNC_asm
   4DF9 DD 21 58 8F   [14]  384     ld ix, #cooldownEnemigo1
   4DFD DD 35 00      [23]  385     dec 0(ix)
   4E00 28 06         [12]  386     jr z, seActualiza3
   4E02 DD 36 00 01   [19]  387     ld 0(ix), #1
   4E06 18 19         [12]  388     jr noseActualiza3
   4E08                     389     seActualiza3:
   4E08 DD 21 1F 40   [14]  390       ld  ix, #enemyPos  ;;(enemy)
   4E0C DD 36 06 00   [19]  391      ld entity_color(ix), #0x00
                            392     ;;call  entityman_getEntityArray_IX
                            393     ;;call  entityman_getNumEntities_A
                            394     ;;call  rendersys_update
   4E10 CD BC 82      [17]  395     call borrarEnemigo1
   4E13 DD 21 1F 40   [14]  396     ld  ix, #enemyPos  ;;(enemy)
                            397      ;;ld entity_color(ix), #0xF0
   4E17 DD 7E 00      [19]  398      ld a, entity_x(ix)
   4E1A 3D            [ 4]  399      dec a
   4E1B DD 77 00      [19]  400      ld entity_x(ix), a
                            401     ;;call  entityman_getEntityArray_IX
                            402     ;;call  entityman_getNumEntities_A
                            403     ;;call  rendersys_update
   4E1E CD F6 7E      [17]  404     call pintarEnemigo1
   4E21                     405    noseActualiza3:
   4E21 CD AD A0      [17]  406     call enemigoDerChoque
                            407 
   4E24 DD 21 59 8F   [14]  408 ld ix, #cooldownEnemigo2
   4E28 DD 35 00      [23]  409     dec 0(ix)
   4E2B 28 06         [12]  410     jr z, seActualiza22
   4E2D DD 36 00 01   [19]  411     ld 0(ix), #1
   4E31 18 19         [12]  412     jr noseActualiza22
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 21.
Hexadecimal [16-Bits]



   4E33                     413     seActualiza22:
   4E33 DD 21 2D 40   [14]  414      ld  ix, #enemyIzqPos  ;;(enemy)
   4E37 DD 36 06 00   [19]  415      ld entity_color(ix), #0x00
                            416     ;;call  entityman_getEntityArray_IX
                            417     ;;call  entityman_getNumEntities_A
                            418     ;;call  rendersys_update
   4E3B CD B8 8C      [17]  419     call borrarEnemigo2
   4E3E DD 21 2D 40   [14]  420     ld  ix, #enemyIzqPos  ;;(enemy)
                            421      ;;ld entity_color(ix), #0xF0
   4E42 DD 7E 00      [19]  422      ld a, entity_x(ix)
   4E45 3C            [ 4]  423      inc a
   4E46 DD 77 00      [19]  424      ld entity_x(ix), a
                            425     ;;call  entityman_getEntityArray_IX
                            426     ;;call  entityman_getNumEntities_A
                            427     ;;call  rendersys_update
   4E49 CD F2 88      [17]  428     call pintarEnemigo2
   4E4C                     429    noseActualiza22:
   4E4C CD C8 A0      [17]  430     call enemigoIzqChoque
                            431 
                            432     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                            433     ;;ld entity_color(ix), #0x00
                            434     ;;call  entityman_getEntityArray_IX
                            435     ;;call  entityman_getNumEntities_A
                            436     ;;call  rendersys_update
                            437     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                            438     ;; ld entity_color(ix), #0xF0
                            439     ;; ld a, entity_x(ix)
                            440     ;; inc  a
                            441     ;; ld entity_x(ix), a
                            442     ;; call  entityman_getEntityArray_IX
                            443     ;;call  entityman_getNumEntities_A
                            444     ;;call  rendersys_update
                            445 ;;
                            446     ;;call enemigoIzqChoque
                            447 
   4E4F DD 21 34 40   [14]  448     ld  ix, #enemyIzqPos2  ;;(enemy)
   4E53 DD 36 06 00   [19]  449      ld entity_color(ix), #0x00
                            450     ;;call  entityman_getEntityArray_IX
                            451     ;;call  entityman_getNumEntities_A
                            452     ;;call  rendersys_update
   4E57 CD BA 87      [17]  453     call borrarEnemigo3
   4E5A DD 21 34 40   [14]  454     ld  ix, #enemyIzqPos2  ;;(enemy)
   4E5E DD 36 06 FF   [19]  455      ld entity_color(ix), #0xFF
   4E62 DD 7E 00      [19]  456      ld a, entity_x(ix)
   4E65 3C            [ 4]  457      inc  a
   4E66 DD 77 00      [19]  458      ld entity_x(ix), a
                            459      ;;call  entityman_getEntityArray_IX
                            460     ;;call  entityman_getNumEntities_A
                            461     ;;call  rendersys_update
   4E69 CD F4 83      [17]  462     call pintarEnemigo3
                            463     ;AQUI
                            464     ;;call cpct_waitVSYNC_asm
                            465     ;;halt 
                            466     ;;halt
                            467     ;;halt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 22.
Hexadecimal [16-Bits]



                            468     ;;call cpct_waitVSYNC_asm
                            469     ;;halt 
                            470     ;;halt
                            471     ;;halt
                            472     ;;call cpct_waitVSYNC_asm
                            473     ;;halt 
                            474     ;;halt
                            475     ;;halt
                            476     ;;call cpct_waitVSYNC_asm
                            477     ;;halt 
                            478     ;;halt
                            479     ;;halt
                            480     ;;call cpct_waitVSYNC_asm
                            481     ;;halt 
                            482     ;;halt
                            483     ;;halt
                            484     ;;AQUI
                            485     ;call cpct_waitVSYNC_asm
                            486     ;halt 
                            487     ;halt
                            488     ;halt
                            489     ;;;;QUITAMOS LAS 2 VELOCIDADES
                            490 
                            491   ;;  ld  ix, #enemyIzqPos2  ;;(enemy)
                            492   ;;   ld entity_color(ix), #0x00
                            493   ;;  ;;call  entityman_getEntityArray_IX
                            494   ;;  ;;call  entityman_getNumEntities_A
                            495   ;;  ;;call  rendersys_update
                            496   ;;  call borrarEnemigo3
                            497   ;;  ld  ix, #enemyIzqPos2  ;;(enemy)
                            498   ;;   ld entity_color(ix), #0xFF
                            499   ;;   ld a, entity_x(ix)
                            500   ;;   inc  a
                            501   ;;   ld entity_x(ix), a
                            502   ;;   call pintarEnemigo3
                            503     ;; call  entityman_getEntityArray_IX
                            504     ;;call  entityman_getNumEntities_A
                            505     ;;call  rendersys_update
                            506 
   4E6C CD E3 A0      [17]  507     call enemigoIzq2Choque
                            508 
                            509     ;;ld  ix, #enemyDerPos2  ;;(enemy)
                            510      ;;ld entity_color(ix), #0x00
                            511     ;call  entityman_getEntityArray_IX
                            512     ;call  entityman_getNumEntities_A
                            513     ;call  rendersys_update
                            514     ;ld  ix, #enemyDerPos2  ;;(enemy)
                            515      ;ld entity_color(ix), #0x0F
                            516      ;ld a, entity_x(ix)
                            517     ; dec  a
                            518     ; ld entity_x(ix), a
                            519     ; call  entityman_getEntityArray_IX
                            520     ;call  entityman_getNumEntities_A
                            521     ;call  rendersys_update
                            522     ;ld  ix, #enemyDerPos2  ;;(enemy)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 23.
Hexadecimal [16-Bits]



                            523     ; ld entity_color(ix), #0x00
                            524    ; call  entityman_getEntityArray_IX
                            525     ;call  entityman_getNumEntities_A
                            526     ;call  rendersys_update
                            527     ;ld  ix, #enemyDerPos2  ;;(enemy)
                            528      ;ld entity_color(ix), #0x0F
                            529      ;ld a, entity_x(ix)
                            530      ;dec  a
                            531     ; ld entity_x(ix), a
                            532      ;call  entityman_getEntityArray_IX
                            533     ;call  entityman_getNumEntities_A
                            534     ;call  rendersys_update
                            535 
                            536      ;call enemigoDer2Choque
                            537 
                            538     
                            539     
                            540     
                            541 
   4E6F C9            [10]  542     ret
                            543 
   4E70                     544      actualizarEnemigos4:: 
                            545     ;;call cpct_waitVSYNC_asm
                            546     ;;halt 
                            547     ;;halt
                            548     ;;halt
                            549     ;;call cpct_waitVSYNC_asm
                            550     ;;halt 
                            551     ;;halt
                            552     ;;halt
                            553     ;;call cpct_waitVSYNC_asm
                            554     ;;halt 
                            555     ;;halt
                            556     ;;halt
                            557     ;;call cpct_waitVSYNC_asm
                            558     ;;halt 
                            559     ;;halt
                            560     ;;halt
                            561     ;;call cpct_waitVSYNC_asm
                            562     ;;halt 
                            563     ;;halt
                            564     ;;halt
                            565     ;;call cpct_waitVSYNC_asm
                            566     ;;halt 
                            567     ;;halt
                            568     ;;halt
                            569     ;;call cpct_waitVSYNC_asm
                            570     ;;halt 
                            571     ;;halt
                            572     ;;halt
                            573     ;;call cpct_waitVSYNC_asm
                            574     ;;halt 
                            575     ;;halt
                            576     ;;halt
                            577     ;AQUI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 24.
Hexadecimal [16-Bits]



                            578     ;;call cpct_waitVSYNC_asm
                            579     ;;halt 
                            580     ;;halt
                            581     ;;halt
                            582     ;;call cpct_waitVSYNC_asm
   4E70 DD 21 58 8F   [14]  583     ld ix, #cooldownEnemigo1
   4E74 DD 35 00      [23]  584     dec 0(ix)
   4E77 28 06         [12]  585     jr z, seActualiza4
   4E79 DD 36 00 01   [19]  586     ld 0(ix), #1
   4E7D 18 19         [12]  587     jr noseActualiza4
   4E7F                     588     seActualiza4:
   4E7F DD 21 1F 40   [14]  589       ld  ix, #enemyPos  ;;(enemy)
   4E83 DD 36 06 00   [19]  590      ld entity_color(ix), #0x00
                            591     ;;call  entityman_getEntityArray_IX
                            592     ;;call  entityman_getNumEntities_A
                            593     ;;call  rendersys_update
   4E87 CD BC 82      [17]  594     call borrarEnemigo1
   4E8A DD 21 1F 40   [14]  595     ld  ix, #enemyPos  ;;(enemy)
                            596      ;;ld entity_color(ix), #0xF0
   4E8E DD 7E 00      [19]  597      ld a, entity_x(ix)
   4E91 3D            [ 4]  598      dec a
   4E92 DD 77 00      [19]  599      ld entity_x(ix), a
                            600     ;;call  entityman_getEntityArray_IX
                            601     ;;call  entityman_getNumEntities_A
                            602     ;;call  rendersys_update
   4E95 CD F6 7E      [17]  603     call pintarEnemigo1
   4E98                     604     noseActualiza4:
                            605 
   4E98 CD AD A0      [17]  606     call enemigoDerChoque
                            607 
   4E9B DD 21 59 8F   [14]  608 ld ix, #cooldownEnemigo2
   4E9F DD 35 00      [23]  609     dec 0(ix)
   4EA2 28 06         [12]  610     jr z, seActualiza23
   4EA4 DD 36 00 01   [19]  611     ld 0(ix), #1
   4EA8 18 19         [12]  612     jr noseActualiza23
   4EAA                     613     seActualiza23:
   4EAA DD 21 2D 40   [14]  614      ld  ix, #enemyIzqPos  ;;(enemy)
   4EAE DD 36 06 00   [19]  615      ld entity_color(ix), #0x00
                            616     ;;call  entityman_getEntityArray_IX
                            617     ;;call  entityman_getNumEntities_A
                            618     ;;call  rendersys_update
   4EB2 CD B8 8C      [17]  619     call borrarEnemigo2
   4EB5 DD 21 2D 40   [14]  620     ld  ix, #enemyIzqPos  ;;(enemy)
                            621      ;;ld entity_color(ix), #0xF0
   4EB9 DD 7E 00      [19]  622      ld a, entity_x(ix)
   4EBC 3C            [ 4]  623      inc a
   4EBD DD 77 00      [19]  624      ld entity_x(ix), a
                            625     ;;call  entityman_getEntityArray_IX
                            626     ;;call  entityman_getNumEntities_A
                            627     ;;call  rendersys_update
   4EC0 CD F2 88      [17]  628     call pintarEnemigo2
   4EC3                     629    noseActualiza23:
   4EC3 CD C8 A0      [17]  630     call enemigoIzqChoque
                            631 
                            632     ;;ld  ix, #enemyIzqPos  ;;(enemy)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 25.
Hexadecimal [16-Bits]



                            633     ;;ld entity_color(ix), #0x00
                            634     ;;call  entityman_getEntityArray_IX
                            635     ;;call  entityman_getNumEntities_A
                            636     ;;call  rendersys_update
                            637     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                            638     ;; ld entity_color(ix), #0xF0
                            639     ;; ld a, entity_x(ix)
                            640     ;; inc  a
                            641     ;; ld entity_x(ix), a
                            642     ;; call  entityman_getEntityArray_IX
                            643     ;;call  entityman_getNumEntities_A
                            644     ;;call  rendersys_update
                            645 ;;
                            646     ;;call enemigoIzqChoque
                            647 
   4EC6 DD 21 34 40   [14]  648     ld  ix, #enemyIzqPos2  ;;(enemy)
   4ECA DD 36 06 00   [19]  649      ld entity_color(ix), #0x00
                            650     ;;call  entityman_getEntityArray_IX
                            651     ;;call  entityman_getNumEntities_A
                            652     ;;call  rendersys_update
   4ECE CD BA 87      [17]  653     call borrarEnemigo3
   4ED1 DD 21 34 40   [14]  654     ld  ix, #enemyIzqPos2  ;;(enemy)
   4ED5 DD 36 06 FF   [19]  655      ld entity_color(ix), #0xFF
   4ED9 DD 7E 00      [19]  656      ld a, entity_x(ix)
   4EDC 3C            [ 4]  657      inc  a
   4EDD DD 77 00      [19]  658      ld entity_x(ix), a
                            659      ;;call  entityman_getEntityArray_IX
                            660     ;;call  entityman_getNumEntities_A
                            661     ;;call  rendersys_update
   4EE0 CD F4 83      [17]  662     call pintarEnemigo3
                            663     ;;AQUI
                            664     ;;call cpct_waitVSYNC_asm
                            665     ;;halt 
                            666     ;;halt
                            667     ;;halt
                            668     ;;call cpct_waitVSYNC_asm
                            669     ;;halt 
                            670     ;;halt
                            671     ;;halt
                            672     ;;;;QUITAMOS LAS 2 VELOCIDADES
                            673    ;; ld  ix, #enemyIzqPos2  ;;(enemy)
                            674    ;;  ld entity_color(ix), #0x00
                            675    ;; ;;call  entityman_getEntityArray_IX
                            676    ;; ;;call  entityman_getNumEntities_A
                            677    ;; ;;call  rendersys_update
                            678    ;; call borrarEnemigo3
                            679    ;; ld  ix, #enemyIzqPos2  ;;(enemy)
                            680    ;;  ld entity_color(ix), #0xFF
                            681    ;;  ld a, entity_x(ix)
                            682    ;;  inc  a
                            683    ;;  ld entity_x(ix), a
                            684    ;;  call pintarEnemigo3
                            685     ;; call  entityman_getEntityArray_IX
                            686     ;;call  entityman_getNumEntities_A
                            687     ;;call  rendersys_update
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 26.
Hexadecimal [16-Bits]



                            688 
   4EE3 CD E3 A0      [17]  689     call enemigoIzq2Choque
                            690 
                            691     ;;ld  ix, #enemyDerPos2  ;;(enemy)
                            692      ;;ld entity_color(ix), #0x00
                            693     ;call  entityman_getEntityArray_IX
                            694     ;call  entityman_getNumEntities_A
                            695     ;call  rendersys_update
                            696     ;ld  ix, #enemyDerPos2  ;;(enemy)
                            697      ;ld entity_color(ix), #0x0F
                            698      ;ld a, entity_x(ix)
                            699     ; dec  a
                            700     ; ld entity_x(ix), a
                            701     ; call  entityman_getEntityArray_IX
                            702     ;call  entityman_getNumEntities_A
                            703     ;call  rendersys_update
                            704     ;ld  ix, #enemyDerPos2  ;;(enemy)
                            705     ; ld entity_color(ix), #0x00
                            706    ; call  entityman_getEntityArray_IX
                            707     ;call  entityman_getNumEntities_A
                            708     ;call  rendersys_update
                            709     ;ld  ix, #enemyDerPos2  ;;(enemy)
                            710      ;ld entity_color(ix), #0x0F
                            711      ;ld a, entity_x(ix)
                            712      ;dec  a
                            713     ; ld entity_x(ix), a
                            714      ;call  entityman_getEntityArray_IX
                            715     ;call  entityman_getNumEntities_A
                            716     ;call  rendersys_update
                            717 
                            718      ;call enemigoDer2Choque
                            719 
                            720 
   4EE6 DD 21 3B 40   [14]  721    ld ix, #enemyUp1Pos
   4EEA CD 16 6E      [17]  722    call actualizarEnemigoAereo
   4EED C9            [10]  723     ret
                            724 
                            725 
   4EEE                     726     actualizarEnemigos5:: 
                            727     ;;call cpct_waitVSYNC_asm
                            728     ;;halt 
                            729     ;;halt
                            730     ;;halt
                            731     ;;call cpct_waitVSYNC_asm
                            732     ;;halt 
                            733     ;;halt
                            734     ;;halt
                            735     ;;call cpct_waitVSYNC_asm
                            736     ;;halt 
                            737     ;;halt
                            738     ;;halt
                            739     ;;call cpct_waitVSYNC_asm
                            740     ;;halt 
                            741     ;;halt
                            742     ;;halt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 27.
Hexadecimal [16-Bits]



                            743     ;;call cpct_waitVSYNC_asm
                            744     ;;halt 
                            745     ;;halt
                            746     ;;halt
                            747     ;;call cpct_waitVSYNC_asm
                            748     ;;halt 
                            749     ;;halt
                            750     ;;halt
                            751     ;;call cpct_waitVSYNC_asm
                            752     ;;halt 
                            753     ;;halt
                            754     ;;halt
                            755     ;;call cpct_waitVSYNC_asm
                            756     ;;halt 
                            757     ;;halt
                            758     ;;halt
                            759     ;;AQUI
                            760     ;;call cpct_waitVSYNC_asm
                            761     ;;halt 
                            762     ;;halt
                            763     ;;halt
                            764     ;;call cpct_waitVSYNC_asm
   4EEE DD 21 58 8F   [14]  765     ld ix, #cooldownEnemigo1
   4EF2 DD 35 00      [23]  766     dec 0(ix)
   4EF5 28 06         [12]  767     jr z, seActualiza5
   4EF7 DD 36 00 01   [19]  768     ld 0(ix), #1
   4EFB 18 19         [12]  769     jr noseActualiza5
   4EFD                     770     seActualiza5:
   4EFD DD 21 1F 40   [14]  771       ld  ix, #enemyPos  ;;(enemy)
   4F01 DD 36 06 00   [19]  772      ld entity_color(ix), #0x00
                            773     ;;call  entityman_getEntityArray_IX
                            774     ;;call  entityman_getNumEntities_A
                            775     ;;call  rendersys_update
   4F05 CD BC 82      [17]  776     call borrarEnemigo1
   4F08 DD 21 1F 40   [14]  777     ld  ix, #enemyPos  ;;(enemy)
                            778      ;;ld entity_color(ix), #0xF0
   4F0C DD 7E 00      [19]  779      ld a, entity_x(ix)
   4F0F 3D            [ 4]  780      dec a
   4F10 DD 77 00      [19]  781      ld entity_x(ix), a
                            782     ;;call  entityman_getEntityArray_IX
                            783     ;;call  entityman_getNumEntities_A
                            784     ;;call  rendersys_update
   4F13 CD F6 7E      [17]  785     call pintarEnemigo1
   4F16                     786    noseActualiza5:
   4F16 CD AD A0      [17]  787     call enemigoDerChoque
                            788 
   4F19 DD 21 59 8F   [14]  789    ld ix, #cooldownEnemigo2
   4F1D DD 35 00      [23]  790     dec 0(ix)
   4F20 28 06         [12]  791     jr z, seActualiza24
   4F22 DD 36 00 01   [19]  792     ld 0(ix), #1
   4F26 18 19         [12]  793     jr noseActualiza24
   4F28                     794     seActualiza24:
   4F28 DD 21 2D 40   [14]  795      ld  ix, #enemyIzqPos  ;;(enemy)
   4F2C DD 36 06 00   [19]  796      ld entity_color(ix), #0x00
                            797     ;;call  entityman_getEntityArray_IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 28.
Hexadecimal [16-Bits]



                            798     ;;call  entityman_getNumEntities_A
                            799     ;;call  rendersys_update
   4F30 CD B8 8C      [17]  800     call borrarEnemigo2
   4F33 DD 21 2D 40   [14]  801     ld  ix, #enemyIzqPos  ;;(enemy)
                            802      ;;ld entity_color(ix), #0xF0
   4F37 DD 7E 00      [19]  803      ld a, entity_x(ix)
   4F3A 3C            [ 4]  804      inc a
   4F3B DD 77 00      [19]  805      ld entity_x(ix), a
                            806     ;;call  entityman_getEntityArray_IX
                            807     ;;call  entityman_getNumEntities_A
                            808     ;;call  rendersys_update
   4F3E CD F2 88      [17]  809     call pintarEnemigo2
   4F41                     810    noseActualiza24:
   4F41 CD C8 A0      [17]  811     call enemigoIzqChoque
                            812 
                            813     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                            814     ;;ld entity_color(ix), #0x00
                            815     ;;call  entityman_getEntityArray_IX
                            816     ;;call  entityman_getNumEntities_A
                            817     ;;call  rendersys_update
                            818     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                            819     ;; ld entity_color(ix), #0xF0
                            820     ;; ld a, entity_x(ix)
                            821     ;; inc  a
                            822     ;; ld entity_x(ix), a
                            823     ;; call  entityman_getEntityArray_IX
                            824     ;;call  entityman_getNumEntities_A
                            825     ;;call  rendersys_update
                            826 ;;
                            827     ;;call enemigoIzqChoque
                            828 
   4F44 DD 21 34 40   [14]  829     ld  ix, #enemyIzqPos2  ;;(enemy)
   4F48 DD 36 06 00   [19]  830      ld entity_color(ix), #0x00
                            831     ;;call  entityman_getEntityArray_IX
                            832     ;;call  entityman_getNumEntities_A
                            833     ;;call  rendersys_update
   4F4C CD BA 87      [17]  834     call borrarEnemigo3
   4F4F DD 21 34 40   [14]  835     ld  ix, #enemyIzqPos2  ;;(enemy)
   4F53 DD 36 06 FF   [19]  836      ld entity_color(ix), #0xFF
   4F57 DD 7E 00      [19]  837      ld a, entity_x(ix)
   4F5A 3C            [ 4]  838      inc  a
   4F5B DD 77 00      [19]  839      ld entity_x(ix), a
                            840      ;;call  entityman_getEntityArray_IX
                            841     ;;call  entityman_getNumEntities_A
                            842     ;;call  rendersys_update
   4F5E CD F4 83      [17]  843     call pintarEnemigo3
                            844     ;AQUI
                            845     ;;call cpct_waitVSYNC_asm
                            846     ;;halt 
                            847     ;;halt
                            848     ;;halt
                            849     ;;call cpct_waitVSYNC_asm
                            850     ;;halt 
                            851     ;;halt
                            852     ;;halt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 29.
Hexadecimal [16-Bits]



                            853     ;;;;QUITAMOS LAS 2 VELOCIDADES
                            854    ;; ld  ix, #enemyIzqPos2  ;;(enemy)
                            855    ;;  ld entity_color(ix), #0x00
                            856    ;; ;;call  entityman_getEntityArray_IX
                            857    ;; ;;call  entityman_getNumEntities_A
                            858    ;; ;;call  rendersys_update
                            859    ;; call borrarEnemigo3
                            860    ;; ld  ix, #enemyIzqPos2  ;;(enemy)
                            861    ;;  ld entity_color(ix), #0xFF
                            862    ;;  ld a, entity_x(ix)
                            863    ;;  inc  a
                            864    ;;  ld entity_x(ix), a
                            865    ;;  call pintarEnemigo3
                            866    ;; ;; call  entityman_getEntityArray_IX
                            867     ;;call  entityman_getNumEntities_A
                            868     ;;call  rendersys_update
                            869 
   4F61 CD E3 A0      [17]  870     call enemigoIzq2Choque
                            871 
                            872 
                            873     ;;ld  ix, #enemyDerPos2  ;;(enemy)
                            874      ;;ld entity_color(ix), #0x00
                            875     ;call  entityman_getEntityArray_IX
                            876     ;call  entityman_getNumEntities_A
                            877     ;call  rendersys_update
                            878     ;ld  ix, #enemyDerPos2  ;;(enemy)
                            879      ;ld entity_color(ix), #0x0F
                            880      ;ld a, entity_x(ix)
                            881     ; dec  a
                            882     ; ld entity_x(ix), a
                            883     ; call  entityman_getEntityArray_IX
                            884     ;call  entityman_getNumEntities_A
                            885     ;call  rendersys_update
                            886     ;ld  ix, #enemyDerPos2  ;;(enemy)
                            887     ; ld entity_color(ix), #0x00
                            888    ; call  entityman_getEntityArray_IX
                            889     ;call  entityman_getNumEntities_A
                            890     ;call  rendersys_update
                            891     ;ld  ix, #enemyDerPos2  ;;(enemy)
                            892      ;ld entity_color(ix), #0x0F
                            893      ;ld a, entity_x(ix)
                            894      ;dec  a
                            895     ; ld entity_x(ix), a
                            896      ;call  entityman_getEntityArray_IX
                            897     ;call  entityman_getNumEntities_A
                            898     ;call  rendersys_update
                            899 
                            900      ;call enemigoDer2Choque
                            901 
   4F64 DD 21 3B 40   [14]  902    ld ix, #enemyUp1Pos
   4F68 CD 16 6E      [17]  903    call actualizarEnemigoAereo
                            904    ;;ld ix, #enemyUp2Pos
                            905    ;;call actualizarEnemigoAereo2
                            906    ;;ld ix, #enemyUp3Pos
                            907    ;;call actualizarEnemigoAereo3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 30.
Hexadecimal [16-Bits]



                            908 
                            909 
   4F6B DD 21 26 40   [14]  910    ld  ix, #crocodile  ;;(enemy)
   4F6F DD 7E 04      [19]  911     ld a, entity_estado(ix)
   4F72 3D            [ 4]  912     dec a
   4F73 CA 14 50      [10]  913     jp z, crocoPos1
   4F76 3D            [ 4]  914     dec a 
   4F77 28 1E         [12]  915     jr z, crocoPos2
   4F79 3D            [ 4]  916     dec a 
   4F7A 28 28         [12]  917     jr z, crocoPos3
   4F7C 3D            [ 4]  918     dec a 
   4F7D 28 42         [12]  919     jr z, crocoPos4
   4F7F 3D            [ 4]  920     dec a 
   4F80 28 5F         [12]  921     jr z, crocoPos5
   4F82 3D            [ 4]  922     dec a 
   4F83 28 69         [12]  923     jr z, crocoPos6
   4F85 3D            [ 4]  924     dec a 
   4F86 28 73         [12]  925     jr z, crocoPos7
                            926     ;;Estado 8, estado de cooldown
   4F88 DD 35 05      [23]  927     dec entity_vy(ix)
   4F8B 28 03         [12]  928    jr z, finCDCroco
   4F8D C3 3B 50      [10]  929    jp seguirActualizacion5
   4F90                     930    finCDCroco:
   4F90 DD 36 04 01   [19]  931    ld entity_estado(ix), #1
   4F94 C3 3B 50      [10]  932    jp seguirActualizacion5
   4F97                     933     crocoPos2:
   4F97 DD 36 04 03   [19]  934     ld entity_estado(ix), #3
   4F9B CD 7B 65      [17]  935     call borrarCrocoPos2
   4F9E CD C7 5D      [17]  936     call pintarCrocoPos3
   4FA1 C3 3B 50      [10]  937     jp seguirActualizacion5
   4FA4                     938     crocoPos3:
   4FA4 DD 36 04 04   [19]  939     ld entity_estado(ix), #4
   4FA8 CD 7C 65      [17]  940     call borrarCrocoPos3
   4FAB CD CA 5E      [17]  941     call pintarCrocoPos4
   4FAE DD 46 00      [19]  942     ld b,  entity_x(ix)
   4FB1 DD 21 03 40   [14]  943     ld ix, #playerPos
   4FB5 DD 7E 00      [19]  944     ld a, entity_x(ix)
   4FB8 90            [ 4]  945     sub b
   4FB9 28 03         [12]  946     jr z, colisionCroco
   4FBB C3 3B 50      [10]  947     jp seguirActualizacion5
   4FBE                     948     colisionCroco:
   4FBE CD EA 9B      [17]  949    call colision
   4FC1                     950     crocoPos4:
   4FC1 DD 36 04 05   [19]  951     ld entity_estado(ix), #5
   4FC5 CD 7D 65      [17]  952     call borrarCrocoPos4
   4FC8 CD 61 60      [17]  953     call pintarCrocoPos5
   4FCB DD 46 00      [19]  954     ld b,  entity_x(ix)
   4FCE DD 21 03 40   [14]  955     ld ix, #playerPos
   4FD2 DD 7E 00      [19]  956     ld a, entity_x(ix)
   4FD5 90            [ 4]  957     sub b
   4FD6 28 06         [12]  958     jr z, colisionCroco2
   4FD8 3D            [ 4]  959     dec a
   4FD9 28 03         [12]  960     jr z, colisionCroco2
   4FDB C3 3B 50      [10]  961     jp seguirActualizacion5
   4FDE                     962     colisionCroco2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 31.
Hexadecimal [16-Bits]



   4FDE CD EA 9B      [17]  963    call colision
                            964 
   4FE1                     965     crocoPos5:
   4FE1 DD 36 04 06   [19]  966     ld entity_estado(ix), #6
   4FE5 CD 7E 65      [17]  967     call borrarCrocoPos5
   4FE8 CD C7 5D      [17]  968     call pintarCrocoPos3
   4FEB C3 3B 50      [10]  969     jp seguirActualizacion5
   4FEE                     970     crocoPos6:
   4FEE DD 36 04 07   [19]  971     ld entity_estado(ix), #7
   4FF2 CD 0F 66      [17]  972     call borrarCrocoPos6
   4FF5 CD 3C 5D      [17]  973     call pintarCrocoPos2
   4FF8 C3 3B 50      [10]  974     jp seguirActualizacion5
   4FFB                     975     crocoPos7:
   4FFB DD 36 04 08   [19]  976     ld entity_estado(ix), #8
   4FFF CD A0 66      [17]  977     call borrarCrocoPos7
   5002 CD E2 5C      [17]  978     call pintarCrocoPos1
   5005 DD 21 26 40   [14]  979     ld  ix, #crocodile
   5009 DD 36 00 00   [19]  980     ld entity_x(ix), #0
   500D DD 36 05 05   [19]  981     ld entity_vy(ix), #5
   5011 C3 3B 50      [10]  982     jp seguirActualizacion5
   5014                     983     crocoPos1:
   5014 CD 0A 65      [17]  984     call borrarCrocoPos1
   5017 DD 21 03 40   [14]  985     ld  ix, #playerPos
   501B DD 7E 00      [19]  986     ld a, entity_x(ix)
   501E DD 21 26 40   [14]  987     ld  ix, #crocodile
   5022 DD 46 00      [19]  988     ld b, entity_x(ix)
   5025 90            [ 4]  989     sub b
   5026 20 09         [12]  990     jr nz, saltaCroco
                            991 
   5028                     992     encuentraEnemigo:
   5028 DD 34 04      [23]  993     inc entity_estado(ix)
   502B CD 3C 5D      [17]  994     call pintarCrocoPos2 
   502E C3 3B 50      [10]  995     jp seguirActualizacion5
   5031                     996     saltaCroco:
   5031 3D            [ 4]  997     dec a
   5032 28 F4         [12]  998     jr z, encuentraEnemigo
                            999     ;;dec a
                           1000     ;;jr z, encuentraEnemigo
   5034 04            [ 4] 1001      inc b
   5035 DD 70 00      [19] 1002      ld entity_x(ix), b
   5038 CD E2 5C      [17] 1003      call pintarCrocoPos1
                           1004    ;;ld entity_color(ix), #0x00
                           1005 
   503B                    1006    seguirActualizacion5:
                           1007   ;;  ld  ix, #enemyDerPos2  ;;(enemy)
                           1008   ;;   ld entity_color(ix), #0x00
                           1009   ;;   call borrarEnemigo4
                           1010   ;; ;; call  entityman_getEntityArray_IX
                           1011   ;; ;; call  entityman_getNumEntities_A
                           1012   ;; ;; call  rendersys_update
                           1013   ;;  ld  ix, #enemyDerPos2  ;;(enemy)
                           1014   ;;   ld entity_color(ix), #0x0F
                           1015   ;;   ld a, entity_x(ix)
                           1016   ;;   dec  a
                           1017   ;;   ld entity_x(ix), a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 32.
Hexadecimal [16-Bits]



                           1018   ;;   call pintarEnemigo4
                           1019   ;;   call enemigoDer2Choque
   503B C9            [10] 1020     ret
                           1021 
   503C                    1022     actualizarEnemigos6:: 
                           1023     ;;call cpct_waitVSYNC_asm
                           1024     ;;halt 
                           1025     ;;halt
                           1026     ;;halt
                           1027     ;;call cpct_waitVSYNC_asm
                           1028     ;;halt 
                           1029     ;;halt
                           1030     ;;halt
                           1031     ;;call cpct_waitVSYNC_asm
                           1032     ;;halt 
                           1033     ;;halt
                           1034     ;;halt
                           1035     ;;call cpct_waitVSYNC_asm
                           1036     ;;halt 
                           1037     ;;halt
                           1038     ;;halt
                           1039     ;;call cpct_waitVSYNC_asm
                           1040     ;;halt 
                           1041     ;;halt
                           1042     ;;halt
                           1043     ;;call cpct_waitVSYNC_asm
                           1044     ;;halt 
                           1045     ;;halt
                           1046     ;;halt
                           1047     ;;call cpct_waitVSYNC_asm
                           1048     ;;halt 
                           1049     ;;halt
                           1050     ;;halt
                           1051     ;;call cpct_waitVSYNC_asm
                           1052     ;;halt 
                           1053     ;;halt
                           1054     ;;halt
                           1055     ;AQUI
                           1056     ;;call cpct_waitVSYNC_asm
                           1057     ;;halt 
                           1058     ;;halt
                           1059     ;;halt
                           1060     ;;call cpct_waitVSYNC_asm
   503C DD 21 58 8F   [14] 1061     ld ix, #cooldownEnemigo1
   5040 DD 35 00      [23] 1062     dec 0(ix)
   5043 28 06         [12] 1063     jr z, seActualiza6
   5045 DD 36 00 01   [19] 1064     ld 0(ix), #1
   5049 18 19         [12] 1065     jr noseActualiza6
   504B                    1066     seActualiza6:
   504B DD 21 1F 40   [14] 1067       ld  ix, #enemyPos  ;;(enemy)
   504F DD 36 06 00   [19] 1068      ld entity_color(ix), #0x00
                           1069     ;;call  entityman_getEntityArray_IX
                           1070     ;;call  entityman_getNumEntities_A
                           1071     ;;call  rendersys_update
   5053 CD BC 82      [17] 1072     call borrarEnemigo1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 33.
Hexadecimal [16-Bits]



   5056 DD 21 1F 40   [14] 1073     ld  ix, #enemyPos  ;;(enemy)
                           1074      ;;ld entity_color(ix), #0xF0
   505A DD 7E 00      [19] 1075      ld a, entity_x(ix)
   505D 3D            [ 4] 1076      dec a
   505E DD 77 00      [19] 1077      ld entity_x(ix), a
                           1078     ;;call  entityman_getEntityArray_IX
                           1079     ;;call  entityman_getNumEntities_A
                           1080     ;;call  rendersys_update
   5061 CD F6 7E      [17] 1081     call pintarEnemigo1
   5064                    1082    noseActualiza6:
   5064 CD AD A0      [17] 1083     call enemigoDerChoque
                           1084 
   5067 DD 21 59 8F   [14] 1085 ld ix, #cooldownEnemigo2
   506B DD 35 00      [23] 1086     dec 0(ix)
   506E 28 06         [12] 1087     jr z, seActualiza25
   5070 DD 36 00 01   [19] 1088     ld 0(ix), #1
   5074 18 19         [12] 1089     jr noseActualiza25
   5076                    1090     seActualiza25:
   5076 DD 21 2D 40   [14] 1091      ld  ix, #enemyIzqPos  ;;(enemy)
   507A DD 36 06 00   [19] 1092      ld entity_color(ix), #0x00
                           1093     ;;call  entityman_getEntityArray_IX
                           1094     ;;call  entityman_getNumEntities_A
                           1095     ;;call  rendersys_update
   507E CD B8 8C      [17] 1096     call borrarEnemigo2
   5081 DD 21 2D 40   [14] 1097     ld  ix, #enemyIzqPos  ;;(enemy)
                           1098      ;;ld entity_color(ix), #0xF0
   5085 DD 7E 00      [19] 1099      ld a, entity_x(ix)
   5088 3C            [ 4] 1100      inc a
   5089 DD 77 00      [19] 1101      ld entity_x(ix), a
                           1102     ;;call  entityman_getEntityArray_IX
                           1103     ;;call  entityman_getNumEntities_A
                           1104     ;;call  rendersys_update
   508C CD F2 88      [17] 1105     call pintarEnemigo2
   508F                    1106    noseActualiza25:
   508F CD C8 A0      [17] 1107     call enemigoIzqChoque
                           1108 
                           1109     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                           1110     ;;ld entity_color(ix), #0x00
                           1111     ;;call  entityman_getEntityArray_IX
                           1112     ;;call  entityman_getNumEntities_A
                           1113     ;;call  rendersys_update
                           1114     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                           1115     ;; ld entity_color(ix), #0xF0
                           1116     ;; ld a, entity_x(ix)
                           1117     ;; inc  a
                           1118     ;; ld entity_x(ix), a
                           1119     ;; call  entityman_getEntityArray_IX
                           1120     ;;call  entityman_getNumEntities_A
                           1121     ;;call  rendersys_update
                           1122 ;;
                           1123     ;;call enemigoIzqChoque
                           1124 
   5092 DD 21 34 40   [14] 1125     ld  ix, #enemyIzqPos2  ;;(enemy)
   5096 DD 36 06 00   [19] 1126      ld entity_color(ix), #0x00
                           1127     ;;call  entityman_getEntityArray_IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 34.
Hexadecimal [16-Bits]



                           1128     ;;call  entityman_getNumEntities_A
                           1129     ;;call  rendersys_update
   509A CD BA 87      [17] 1130     call borrarEnemigo3
   509D DD 21 34 40   [14] 1131     ld  ix, #enemyIzqPos2  ;;(enemy)
   50A1 DD 36 06 FF   [19] 1132      ld entity_color(ix), #0xFF
   50A5 DD 7E 00      [19] 1133      ld a, entity_x(ix)
   50A8 3C            [ 4] 1134      inc  a
   50A9 DD 77 00      [19] 1135      ld entity_x(ix), a
                           1136      ;;call  entityman_getEntityArray_IX
                           1137     ;;call  entityman_getNumEntities_A
                           1138     ;;call  rendersys_update
   50AC CD F4 83      [17] 1139     call pintarEnemigo3
                           1140     ;AQUI
                           1141     ;;call cpct_waitVSYNC_asm
                           1142     ;;halt 
                           1143     ;;halt
                           1144     ;;halt
                           1145     ;;call cpct_waitVSYNC_asm
                           1146     ;;halt 
                           1147     ;;halt
                           1148     ;;halt
                           1149     ;;;;QUITAMOS LAS 2 VELOCIDADES
                           1150    ;; ld  ix, #enemyIzqPos2  ;;(enemy)
                           1151    ;;  ld entity_color(ix), #0x00
                           1152    ;; ;;call  entityman_getEntityArray_IX
                           1153    ;; ;;call  entityman_getNumEntities_A
                           1154    ;; ;;call  rendersys_update
                           1155    ;; call borrarEnemigo3
                           1156    ;; ld  ix, #enemyIzqPos2  ;;(enemy)
                           1157    ;;  ld entity_color(ix), #0xFF
                           1158    ;;  ld a, entity_x(ix)
                           1159    ;;  inc  a
                           1160    ;;  ld entity_x(ix), a
                           1161    ;;  call pintarEnemigo3
                           1162    ;; ;; call  entityman_getEntityArray_IX
                           1163     ;;call  entityman_getNumEntities_A
                           1164     ;;call  rendersys_update
                           1165 
   50AF CD E3 A0      [17] 1166     call enemigoIzq2Choque
                           1167 
                           1168 
   50B2 DD 21 50 40   [14] 1169     ld  ix, #enemyDerPos2  ;;(enemy)
   50B6 DD 36 06 00   [19] 1170      ld entity_color(ix), #0x00
   50BA CD 72 A9      [17] 1171      call borrarEnemigo4
                           1172    ;; call  entityman_getEntityArray_IX
                           1173    ;; call  entityman_getNumEntities_A
                           1174    ;; call  rendersys_update
   50BD DD 21 50 40   [14] 1175     ld  ix, #enemyDerPos2  ;;(enemy)
   50C1 DD 36 06 0F   [19] 1176      ld entity_color(ix), #0x0F
   50C5 DD 7E 00      [19] 1177      ld a, entity_x(ix)
   50C8 3D            [ 4] 1178      dec  a
   50C9 DD 77 00      [19] 1179      ld entity_x(ix), a
   50CC CD AC A5      [17] 1180      call pintarEnemigo4
                           1181     ;AQUI
                           1182    ;;  call cpct_waitVSYNC_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 35.
Hexadecimal [16-Bits]



                           1183    ;; halt 
                           1184    ;; halt
                           1185    ;; halt
                           1186    ;; call cpct_waitVSYNC_asm
                           1187    ;; halt 
                           1188    ;; halt
                           1189    ;; halt
                           1190    ;;  call  entityman_getEntityArray_IX
                           1191    ;; call  entityman_getNumEntities_A
                           1192    ;; call  rendersys_update
                           1193    ;;BAJAR VELOCIDAD
                           1194  ;;   ld  ix, #enemyDerPos2  ;;(enemy)
                           1195  ;;    ld entity_color(ix), #0x00
                           1196  ;;    call borrarEnemigo4
                           1197  ;;   ;;call  entityman_getEntityArray_IX
                           1198  ;;   ;;call  entityman_getNumEntities_A
                           1199  ;;   ;;call  rendersys_update
                           1200  ;;   ld  ix, #enemyDerPos2  ;;(enemy)
                           1201  ;;    ld entity_color(ix), #0x0F
                           1202  ;;    ld a, entity_x(ix)
                           1203  ;;    dec  a
                           1204  ;;    ld entity_x(ix), a
                           1205  ;;    call pintarEnemigo4
                           1206     ;; call  entityman_getEntityArray_IX
                           1207     ;;call  entityman_getNumEntities_A
                           1208     ;;call  rendersys_update
                           1209 
   50CF CD 03 A1      [17] 1210      call enemigoDer2Choque
                           1211 
   50D2 DD 21 26 40   [14] 1212      ld  ix, #crocodile  ;;(enemy)
   50D6 DD 7E 04      [19] 1213     ld a, entity_estado(ix)
   50D9 3D            [ 4] 1214     dec a
   50DA CA 7B 51      [10] 1215     jp z, crocoPos1N6
   50DD 3D            [ 4] 1216     dec a 
   50DE 28 1E         [12] 1217     jr z, crocoPos2N6
   50E0 3D            [ 4] 1218     dec a 
   50E1 28 28         [12] 1219     jr z, crocoPos3N6
   50E3 3D            [ 4] 1220     dec a 
   50E4 28 42         [12] 1221     jr z, crocoPos4N6
   50E6 3D            [ 4] 1222     dec a 
   50E7 28 5F         [12] 1223     jr z, crocoPos5N6
   50E9 3D            [ 4] 1224     dec a 
   50EA 28 69         [12] 1225     jr z, crocoPos6N6
   50EC 3D            [ 4] 1226     dec a 
   50ED 28 73         [12] 1227     jr z, crocoPos7N6
                           1228     ;;Estado 8, estado de cooldown
   50EF DD 35 05      [23] 1229     dec entity_vy(ix)
   50F2 28 03         [12] 1230    jr z, finCDCrocoN6
   50F4 C3 A2 51      [10] 1231    jp seguirActualizacion6
   50F7                    1232    finCDCrocoN6:
   50F7 DD 36 04 01   [19] 1233    ld entity_estado(ix), #1
   50FB C3 A2 51      [10] 1234    jp seguirActualizacion6
   50FE                    1235     crocoPos2N6:
   50FE DD 36 04 03   [19] 1236     ld entity_estado(ix), #3
   5102 CD 7B 65      [17] 1237     call borrarCrocoPos2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 36.
Hexadecimal [16-Bits]



   5105 CD C7 5D      [17] 1238     call pintarCrocoPos3
   5108 C3 A2 51      [10] 1239     jp seguirActualizacion6
   510B                    1240     crocoPos3N6:
   510B DD 36 04 04   [19] 1241     ld entity_estado(ix), #4
   510F CD 7C 65      [17] 1242     call borrarCrocoPos3
   5112 CD CA 5E      [17] 1243     call pintarCrocoPos4
   5115 DD 46 00      [19] 1244     ld b,  entity_x(ix)
   5118 DD 21 03 40   [14] 1245     ld ix, #playerPos
   511C DD 7E 00      [19] 1246     ld a, entity_x(ix)
   511F 90            [ 4] 1247     sub b
   5120 28 03         [12] 1248     jr z, colisionCrocoN6
   5122 C3 A2 51      [10] 1249     jp seguirActualizacion6
   5125                    1250     colisionCrocoN6:
   5125 CD EA 9B      [17] 1251    call colision
   5128                    1252     crocoPos4N6:
   5128 DD 36 04 05   [19] 1253     ld entity_estado(ix), #5
   512C CD 7D 65      [17] 1254     call borrarCrocoPos4
   512F CD 61 60      [17] 1255     call pintarCrocoPos5
   5132 DD 46 00      [19] 1256     ld b,  entity_x(ix)
   5135 DD 21 03 40   [14] 1257     ld ix, #playerPos
   5139 DD 7E 00      [19] 1258     ld a, entity_x(ix)
   513C 90            [ 4] 1259     sub b
   513D 28 06         [12] 1260     jr z, colisionCroco2N6
   513F 3D            [ 4] 1261     dec a
   5140 28 03         [12] 1262     jr z, colisionCroco2N6
   5142 C3 A2 51      [10] 1263     jp seguirActualizacion6
   5145                    1264     colisionCroco2N6:
   5145 CD EA 9B      [17] 1265    call colision
                           1266 
   5148                    1267     crocoPos5N6:
   5148 DD 36 04 06   [19] 1268     ld entity_estado(ix), #6
   514C CD 7E 65      [17] 1269     call borrarCrocoPos5
   514F CD C7 5D      [17] 1270     call pintarCrocoPos3
   5152 C3 A2 51      [10] 1271     jp seguirActualizacion6
   5155                    1272     crocoPos6N6:
   5155 DD 36 04 07   [19] 1273     ld entity_estado(ix), #7
   5159 CD 0F 66      [17] 1274     call borrarCrocoPos6
   515C CD 3C 5D      [17] 1275     call pintarCrocoPos2
   515F C3 A2 51      [10] 1276     jp seguirActualizacion6
   5162                    1277     crocoPos7N6:
   5162 DD 36 04 08   [19] 1278     ld entity_estado(ix), #8
   5166 CD A0 66      [17] 1279     call borrarCrocoPos7
   5169 CD E2 5C      [17] 1280     call pintarCrocoPos1
   516C DD 21 26 40   [14] 1281     ld  ix, #crocodile
   5170 DD 36 00 00   [19] 1282     ld entity_x(ix), #0
   5174 DD 36 05 05   [19] 1283     ld entity_vy(ix), #5
   5178 C3 A2 51      [10] 1284     jp seguirActualizacion6
   517B                    1285     crocoPos1N6:
   517B CD 0A 65      [17] 1286     call borrarCrocoPos1
   517E DD 21 03 40   [14] 1287     ld  ix, #playerPos
   5182 DD 7E 00      [19] 1288     ld a, entity_x(ix)
   5185 DD 21 26 40   [14] 1289     ld  ix, #crocodile
   5189 DD 46 00      [19] 1290     ld b, entity_x(ix)
   518C 90            [ 4] 1291     sub b
   518D 20 09         [12] 1292     jr nz, saltaCrocoN6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 37.
Hexadecimal [16-Bits]



   518F                    1293     encuentraEnemigoN6:
   518F DD 34 04      [23] 1294     inc entity_estado(ix)
   5192 CD 3C 5D      [17] 1295     call pintarCrocoPos2 
   5195 C3 A2 51      [10] 1296     jp seguirActualizacion6
   5198                    1297     saltaCrocoN6:
   5198 3D            [ 4] 1298     dec a
   5199 28 F4         [12] 1299     jr z, encuentraEnemigoN6
                           1300     ;;dec a
                           1301     ;;jr z, encuentraEnemigoN6
   519B 04            [ 4] 1302      inc b
   519C DD 70 00      [19] 1303      ld entity_x(ix), b
   519F CD E2 5C      [17] 1304      call pintarCrocoPos1
                           1305    ;;ld entity_color(ix), #0x00
   51A2                    1306    seguirActualizacion6:
                           1307 
   51A2 DD 21 3B 40   [14] 1308    ld ix, #enemyUp1Pos
   51A6 CD 16 6E      [17] 1309   call actualizarEnemigoAereo
                           1310   ;; call borrarEnemigo5
                           1311   ;; ld ix, #enemyUp2Pos
                           1312   ;; call borrarEnemigo5
                           1313   ;; ;call actualizarEnemigoAereo2
                           1314   ;; ld ix, #enemyUp3Pos
                           1315   ;; call actualizarEnemigoAereo3
                           1316  ;; ld ix, #enemyUp1Pos
                           1317  ;;  call actualizarEnemigoAereo
                           1318  ;;  ld ix, #enemyUp2Pos
                           1319  ;;  call actualizarEnemigoAereo2
                           1320  ;;  ld ix, #enemyUp3Pos
                           1321  ;;  call actualizarEnemigoAereo3
   51A9 C9            [10] 1322     ret
                           1323 
                           1324 
                           1325 
   51AA                    1326     actualizarEnemigos7:: 
                           1327     ;;call cpct_waitVSYNC_asm
                           1328     ;;halt 
                           1329     ;;halt
                           1330     ;;halt
                           1331     ;;call cpct_waitVSYNC_asm
                           1332     ;;halt 
                           1333     ;;halt
                           1334     ;;halt
                           1335     ;;call cpct_waitVSYNC_asm
                           1336     ;;halt 
                           1337     ;;halt
                           1338     ;;halt
                           1339     ;;call cpct_waitVSYNC_asm
                           1340     ;;halt 
                           1341     ;;halt
                           1342     ;;halt
                           1343     ;;call cpct_waitVSYNC_asm
                           1344     ;;halt 
                           1345     ;;halt
                           1346     ;;halt
                           1347     ;;call cpct_waitVSYNC_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 38.
Hexadecimal [16-Bits]



                           1348     ;;halt 
                           1349     ;;halt
                           1350     ;;halt
                           1351     ;;call cpct_waitVSYNC_asm
                           1352     ;;halt 
                           1353     ;;halt
                           1354     ;;halt
                           1355     ;;call cpct_waitVSYNC_asm
                           1356     ;;halt 
                           1357     ;;halt
                           1358     ;;halt
                           1359     ;AQUI
                           1360     ;;call cpct_waitVSYNC_asm
                           1361     ;;halt 
                           1362     ;;halt
                           1363     ;;halt
                           1364     ;;call cpct_waitVSYNC_asm
   51AA DD 21 58 8F   [14] 1365     ld ix, #cooldownEnemigo1
   51AE DD 35 00      [23] 1366     dec 0(ix)
   51B1 28 06         [12] 1367     jr z, seActualiza7
   51B3 DD 36 00 01   [19] 1368     ld 0(ix), #1
   51B7 18 19         [12] 1369     jr noseActualiza7
   51B9                    1370     seActualiza7:
   51B9 DD 21 1F 40   [14] 1371       ld  ix, #enemyPos  ;;(enemy)
   51BD DD 36 06 00   [19] 1372      ld entity_color(ix), #0x00
                           1373     ;;call  entityman_getEntityArray_IX
                           1374     ;;call  entityman_getNumEntities_A
                           1375     ;;call  rendersys_update
   51C1 CD BC 82      [17] 1376     call borrarEnemigo1
   51C4 DD 21 1F 40   [14] 1377     ld  ix, #enemyPos  ;;(enemy)
                           1378      ;;ld entity_color(ix), #0xF0
   51C8 DD 7E 00      [19] 1379      ld a, entity_x(ix)
   51CB 3D            [ 4] 1380      dec a
   51CC DD 77 00      [19] 1381      ld entity_x(ix), a
                           1382     ;;call  entityman_getEntityArray_IX
                           1383     ;;call  entityman_getNumEntities_A
                           1384     ;;call  rendersys_update
   51CF CD F6 7E      [17] 1385     call pintarEnemigo1
   51D2                    1386    noseActualiza7:
   51D2 CD AD A0      [17] 1387     call enemigoDerChoque
                           1388 
   51D5 DD 21 59 8F   [14] 1389 ld ix, #cooldownEnemigo2
   51D9 DD 35 00      [23] 1390     dec 0(ix)
   51DC 28 06         [12] 1391     jr z, seActualiza26
   51DE DD 36 00 01   [19] 1392     ld 0(ix), #1
   51E2 18 19         [12] 1393     jr noseActualiza26
   51E4                    1394     seActualiza26:
   51E4 DD 21 2D 40   [14] 1395      ld  ix, #enemyIzqPos  ;;(enemy)
   51E8 DD 36 06 00   [19] 1396      ld entity_color(ix), #0x00
                           1397     ;;call  entityman_getEntityArray_IX
                           1398     ;;call  entityman_getNumEntities_A
                           1399     ;;call  rendersys_update
   51EC CD B8 8C      [17] 1400     call borrarEnemigo2
   51EF DD 21 2D 40   [14] 1401     ld  ix, #enemyIzqPos  ;;(enemy)
                           1402      ;;ld entity_color(ix), #0xF0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 39.
Hexadecimal [16-Bits]



   51F3 DD 7E 00      [19] 1403      ld a, entity_x(ix)
   51F6 3C            [ 4] 1404      inc a
   51F7 DD 77 00      [19] 1405      ld entity_x(ix), a
                           1406     ;;call  entityman_getEntityArray_IX
                           1407     ;;call  entityman_getNumEntities_A
                           1408     ;;call  rendersys_update
   51FA CD F2 88      [17] 1409     call pintarEnemigo2
   51FD                    1410    noseActualiza26:
   51FD CD C8 A0      [17] 1411     call enemigoIzqChoque
                           1412 
                           1413     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                           1414     ;;ld entity_color(ix), #0x00
                           1415     ;;call  entityman_getEntityArray_IX
                           1416     ;;call  entityman_getNumEntities_A
                           1417     ;;call  rendersys_update
                           1418     ;;ld  ix, #enemyIzqPos  ;;(enemy)
                           1419     ;; ld entity_color(ix), #0xF0
                           1420     ;; ld a, entity_x(ix)
                           1421     ;; inc  a
                           1422     ;; ld entity_x(ix), a
                           1423     ;; call  entityman_getEntityArray_IX
                           1424     ;;call  entityman_getNumEntities_A
                           1425     ;;call  rendersys_update
                           1426 ;;
                           1427     ;;call enemigoIzqChoque
                           1428 
   5200 DD 21 34 40   [14] 1429     ld  ix, #enemyIzqPos2  ;;(enemy)
   5204 DD 36 06 00   [19] 1430      ld entity_color(ix), #0x00
                           1431     ;;call  entityman_getEntityArray_IX
                           1432     ;;call  entityman_getNumEntities_A
                           1433     ;;call  rendersys_update
   5208 CD BA 87      [17] 1434     call borrarEnemigo3
   520B DD 21 34 40   [14] 1435     ld  ix, #enemyIzqPos2  ;;(enemy)
   520F DD 36 06 FF   [19] 1436      ld entity_color(ix), #0xFF
   5213 DD 7E 00      [19] 1437      ld a, entity_x(ix)
   5216 3C            [ 4] 1438      inc  a
   5217 DD 77 00      [19] 1439      ld entity_x(ix), a
                           1440      ;;call  entityman_getEntityArray_IX
                           1441     ;;call  entityman_getNumEntities_A
                           1442     ;;call  rendersys_update
   521A CD F4 83      [17] 1443     call pintarEnemigo3
                           1444     ;AQUI
                           1445     ;;call cpct_waitVSYNC_asm
                           1446     ;;halt 
                           1447     ;;halt
                           1448     ;;halt
                           1449     ;;call cpct_waitVSYNC_asm
                           1450     ;;halt 
                           1451     ;;halt
                           1452     ;;halt
                           1453     ;;;;QUITAMOS LAS 2 VELOCIDADES
                           1454    ;; ld  ix, #enemyIzqPos2  ;;(enemy)
                           1455    ;;  ld entity_color(ix), #0x00
                           1456    ;; ;;call  entityman_getEntityArray_IX
                           1457    ;; ;;call  entityman_getNumEntities_A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 40.
Hexadecimal [16-Bits]



                           1458    ;; ;;call  rendersys_update
                           1459    ;; call borrarEnemigo3
                           1460    ;; ld  ix, #enemyIzqPos2  ;;(enemy)
                           1461    ;;  ld entity_color(ix), #0xFF
                           1462    ;;  ld a, entity_x(ix)
                           1463    ;;  inc  a
                           1464    ;;  ld entity_x(ix), a
                           1465    ;;  call pintarEnemigo3
                           1466    ;; ;; call  entityman_getEntityArray_IX
                           1467     ;;call  entityman_getNumEntities_A
                           1468     ;;call  rendersys_update
                           1469 
   521D CD E3 A0      [17] 1470     call enemigoIzq2Choque
                           1471 
                           1472 
   5220 DD 21 50 40   [14] 1473     ld  ix, #enemyDerPos2  ;;(enemy)
   5224 DD 36 06 00   [19] 1474      ld entity_color(ix), #0x00
   5228 CD 72 A9      [17] 1475      call borrarEnemigo4
                           1476    ;; call  entityman_getEntityArray_IX
                           1477    ;; call  entityman_getNumEntities_A
                           1478    ;; call  rendersys_update
   522B DD 21 50 40   [14] 1479     ld  ix, #enemyDerPos2  ;;(enemy)
   522F DD 36 06 0F   [19] 1480      ld entity_color(ix), #0x0F
   5233 DD 7E 00      [19] 1481      ld a, entity_x(ix)
   5236 3D            [ 4] 1482      dec  a
   5237 DD 77 00      [19] 1483      ld entity_x(ix), a
   523A CD AC A5      [17] 1484      call pintarEnemigo4
                           1485     ;AQUI
                           1486    ;;  call cpct_waitVSYNC_asm
                           1487    ;; halt 
                           1488    ;; halt
                           1489    ;; halt
                           1490    ;; call cpct_waitVSYNC_asm
                           1491    ;; halt 
                           1492    ;; halt
                           1493    ;; halt
                           1494    ;;  call  entityman_getEntityArray_IX
                           1495    ;; call  entityman_getNumEntities_A
                           1496    ;; call  rendersys_update
                           1497    ;;BAJAR VELOCIDAD
                           1498  ;;   ld  ix, #enemyDerPos2  ;;(enemy)
                           1499  ;;    ld entity_color(ix), #0x00
                           1500  ;;    call borrarEnemigo4
                           1501  ;;   ;;call  entityman_getEntityArray_IX
                           1502  ;;   ;;call  entityman_getNumEntities_A
                           1503  ;;   ;;call  rendersys_update
                           1504  ;;   ld  ix, #enemyDerPos2  ;;(enemy)
                           1505  ;;    ld entity_color(ix), #0x0F
                           1506  ;;    ld a, entity_x(ix)
                           1507  ;;    dec  a
                           1508  ;;    ld entity_x(ix), a
                           1509  ;;    call pintarEnemigo4
                           1510     ;; call  entityman_getEntityArray_IX
                           1511     ;;call  entityman_getNumEntities_A
                           1512     ;;call  rendersys_update
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 41.
Hexadecimal [16-Bits]



                           1513 
   523D CD 03 A1      [17] 1514      call enemigoDer2Choque
                           1515 
   5240 DD 21 26 40   [14] 1516      ld  ix, #crocodile  ;;(enemy)
   5244 DD 7E 04      [19] 1517     ld a, entity_estado(ix)
   5247 3D            [ 4] 1518     dec a
   5248 CA E9 52      [10] 1519     jp z, crocoPos1N7
   524B 3D            [ 4] 1520     dec a 
   524C 28 1E         [12] 1521     jr z, crocoPos2N7
   524E 3D            [ 4] 1522     dec a 
   524F 28 28         [12] 1523     jr z, crocoPos3N7
   5251 3D            [ 4] 1524     dec a 
   5252 28 42         [12] 1525     jr z, crocoPos4N7
   5254 3D            [ 4] 1526     dec a 
   5255 28 5F         [12] 1527     jr z, crocoPos5N7
   5257 3D            [ 4] 1528     dec a 
   5258 28 69         [12] 1529     jr z, crocoPos6N7
   525A 3D            [ 4] 1530     dec a 
   525B 28 73         [12] 1531     jr z, crocoPos7N7
                           1532     ;;Estado 8, estado de cooldown
   525D DD 35 05      [23] 1533     dec entity_vy(ix)
   5260 28 03         [12] 1534    jr z, finCDCrocoN7
   5262 C3 10 53      [10] 1535    jp seguirActualizacion7
   5265                    1536    finCDCrocoN7:
   5265 DD 36 04 01   [19] 1537    ld entity_estado(ix), #1
   5269 C3 10 53      [10] 1538    jp seguirActualizacion7
   526C                    1539     crocoPos2N7:
   526C DD 36 04 03   [19] 1540     ld entity_estado(ix), #3
   5270 CD 7B 65      [17] 1541     call borrarCrocoPos2
   5273 CD C7 5D      [17] 1542     call pintarCrocoPos3
   5276 C3 10 53      [10] 1543     jp seguirActualizacion7
   5279                    1544     crocoPos3N7:
   5279 DD 36 04 04   [19] 1545     ld entity_estado(ix), #4
   527D CD 7C 65      [17] 1546     call borrarCrocoPos3
   5280 CD CA 5E      [17] 1547     call pintarCrocoPos4
   5283 DD 46 00      [19] 1548     ld b,  entity_x(ix)
   5286 DD 21 03 40   [14] 1549     ld ix, #playerPos
   528A DD 7E 00      [19] 1550     ld a, entity_x(ix)
   528D 90            [ 4] 1551     sub b
   528E 28 03         [12] 1552     jr z, colisionCrocoN7
   5290 C3 10 53      [10] 1553     jp seguirActualizacion7
   5293                    1554     colisionCrocoN7:
   5293 CD EA 9B      [17] 1555    call colision
   5296                    1556     crocoPos4N7:
   5296 DD 36 04 05   [19] 1557     ld entity_estado(ix), #5
   529A CD 7D 65      [17] 1558     call borrarCrocoPos4
   529D CD 61 60      [17] 1559     call pintarCrocoPos5
   52A0 DD 46 00      [19] 1560     ld b,  entity_x(ix)
   52A3 DD 21 03 40   [14] 1561     ld ix, #playerPos
   52A7 DD 7E 00      [19] 1562     ld a, entity_x(ix)
   52AA 90            [ 4] 1563     sub b
   52AB 28 06         [12] 1564     jr z, colisionCroco2N7
   52AD 3D            [ 4] 1565     dec a
   52AE 28 03         [12] 1566     jr z, colisionCroco2N7
   52B0 C3 10 53      [10] 1567     jp seguirActualizacion7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 42.
Hexadecimal [16-Bits]



   52B3                    1568     colisionCroco2N7:
   52B3 CD EA 9B      [17] 1569    call colision
                           1570 
   52B6                    1571     crocoPos5N7:
   52B6 DD 36 04 06   [19] 1572     ld entity_estado(ix), #6
   52BA CD 7E 65      [17] 1573     call borrarCrocoPos5
   52BD CD C7 5D      [17] 1574     call pintarCrocoPos3
   52C0 C3 10 53      [10] 1575     jp seguirActualizacion7
   52C3                    1576     crocoPos6N7:
   52C3 DD 36 04 07   [19] 1577     ld entity_estado(ix), #7
   52C7 CD 0F 66      [17] 1578     call borrarCrocoPos6
   52CA CD 3C 5D      [17] 1579     call pintarCrocoPos2
   52CD C3 10 53      [10] 1580     jp seguirActualizacion7
   52D0                    1581     crocoPos7N7:
   52D0 DD 36 04 08   [19] 1582     ld entity_estado(ix), #8
   52D4 CD A0 66      [17] 1583     call borrarCrocoPos7
   52D7 CD E2 5C      [17] 1584     call pintarCrocoPos1
   52DA DD 21 26 40   [14] 1585     ld  ix, #crocodile
   52DE DD 36 00 00   [19] 1586     ld entity_x(ix), #0
   52E2 DD 36 05 05   [19] 1587     ld entity_vy(ix), #5
   52E6 C3 10 53      [10] 1588     jp seguirActualizacion7
   52E9                    1589     crocoPos1N7:
   52E9 CD 0A 65      [17] 1590     call borrarCrocoPos1
   52EC DD 21 03 40   [14] 1591     ld  ix, #playerPos
   52F0 DD 7E 00      [19] 1592     ld a, entity_x(ix)
   52F3 DD 21 26 40   [14] 1593     ld  ix, #crocodile
   52F7 DD 46 00      [19] 1594     ld b, entity_x(ix)
   52FA 90            [ 4] 1595     sub b
   52FB 20 09         [12] 1596     jr nz, saltaCrocoN7
                           1597     
   52FD                    1598     encuentraEnemigoN7:
   52FD DD 34 04      [23] 1599     inc entity_estado(ix)
   5300 CD 3C 5D      [17] 1600     call pintarCrocoPos2 
   5303 C3 10 53      [10] 1601     jp seguirActualizacion7
   5306                    1602     saltaCrocoN7:
   5306 3D            [ 4] 1603     dec a
   5307 28 F4         [12] 1604     jr z, encuentraEnemigoN7
                           1605     ;;dec a
                           1606     ;;jr z, encuentraEnemigoN7
   5309 04            [ 4] 1607      inc b
   530A DD 70 00      [19] 1608      ld entity_x(ix), b
   530D CD E2 5C      [17] 1609      call pintarCrocoPos1
                           1610    ;;ld entity_color(ix), #0x00
   5310                    1611    seguirActualizacion7:
                           1612 
   5310 DD 21 3B 40   [14] 1613    ld ix, #enemyUp1Pos
   5314 CD 16 6E      [17] 1614   call actualizarEnemigoAereo
                           1615   ;; call borrarEnemigo5
   5317 DD 21 42 40   [14] 1616    ld ix, #enemyUp2Pos
                           1617   ;; call borrarEnemigo5
   531B CD DC 53      [17] 1618   call actualizarEnemigoAereo2
   531E DD 21 49 40   [14] 1619    ld ix, #enemyUp3Pos
   5322 CD CC 7B      [17] 1620    call actualizarEnemigoAereo3
                           1621  ;; ld ix, #enemyUp1Pos
                           1622  ;;  call actualizarEnemigoAereo
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 43.
Hexadecimal [16-Bits]



                           1623  ;;  ld ix, #enemyUp2Pos
                           1624  ;;  call actualizarEnemigoAereo2
                           1625  ;;  ld ix, #enemyUp3Pos
                           1626  ;;  call actualizarEnemigoAereo3
   5325 C9            [10] 1627     ret
