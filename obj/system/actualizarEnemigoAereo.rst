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



                             17    .include "cpcfunciones.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             18    .include "manager/entity_manager.h.s"
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



                             19    .include "system/render_system.h.s"
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



                             20    .include "system/renderEnemigo5A.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   6E16                      21 actualizarEnemigoAereo::
   6E16 DD E5         [15]   22     push ix
   6E18 DD 7E 04      [19]   23     ld a, entity_estado(ix)
   6E1B 3D            [ 4]   24     dec a 
   6E1C 28 06         [12]   25     jr z, estavivo
   6E1E 3D            [ 4]   26     dec a 
   6E1F 28 03         [12]   27     jr z, estavivo
   6E21 C3 AE 6E      [10]   28     jp noestavivo
                             29 
                             30 
   6E24                      31     estavivo:
   6E24 DD 36 06 00   [19]   32         ld entity_color(ix), #0x00
   6E28 CD 0C 46      [17]   33         call  borrarEnemigo5
                             34         ;;call  entityman_getEntityArray_IX
                             35         ;;call  entityman_getNumEntities_A
                             36         ;;call  rendersys_update
   6E2B DD E1         [14]   37         pop ix
                             38         ;;ld  ix, ix  
   6E2D DD E5         [15]   39         push ix
   6E2F DD 36 06 F0   [19]   40         ld entity_color(ix), #0xF0
   6E33 DD 7E 01      [19]   41         ld a, entity_y(ix)
   6E36 3C            [ 4]   42         inc a
   6E37 3C            [ 4]   43         inc a
   6E38 3C            [ 4]   44         inc a
   6E39 3C            [ 4]   45         inc a
   6E3A DD 77 01      [19]   46         ld entity_y(ix), a
   6E3D CD 4D 42      [17]   47         call  pintarEnemigo5
                             48         ;;call  entityman_getEntityArray_IX
                             49         ;;call  entityman_getNumEntities_A
                             50         ;;call  rendersys_update
                             51 
   6E40                      52         comprobarY:
   6E40 DD E1         [14]   53         pop ix
                             54         ;;ld  ix, ix  
   6E42 DD E5         [15]   55         push ix
   6E44 DD 7E 01      [19]   56         ld a, entity_y(ix)
   6E47 DD 21 03 40   [14]   57         ld  ix, #playerPos  
   6E4B DD 46 01      [19]   58         ld b, entity_y(ix)
                             59 
   6E4E                      60         restaY:
   6E4E 05            [ 4]   61         dec b
   6E4F 28 03         [12]   62         jr z, playerSuelo
   6E51 3D            [ 4]   63         dec a
   6E52 18 FA         [12]   64         jr restaY
   6E54                      65         playerSuelo:
   6E54 3D            [ 4]   66         dec a
   6E55 28 19         [12]   67         jr z, colisionConSuelo
   6E57 3C            [ 4]   68         inc a
   6E58 3C            [ 4]   69         inc a
   6E59 28 2B         [12]   70         jr z, comprobarColisionX
   6E5B 3C            [ 4]   71         inc a
   6E5C 28 28         [12]   72         jr z, comprobarColisionX
   6E5E 3C            [ 4]   73         inc a
   6E5F 28 25         [12]   74         jr z, comprobarColisionX
   6E61 3C            [ 4]   75         inc a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   6E62 28 22         [12]   76         jr z, comprobarColisionX
   6E64 3C            [ 4]   77         inc a
   6E65 28 1F         [12]   78         jr z, comprobarColisionX
   6E67 3C            [ 4]   79         inc a
   6E68 28 1C         [12]   80         jr z, comprobarColisionX
   6E6A 3C            [ 4]   81         inc a
   6E6B 28 19         [12]   82         jr z, comprobarColisionX
   6E6D DD E1         [14]   83         pop ix
   6E6F C9            [10]   84         ret
                             85 
   6E70                      86         colisionConSuelo:
   6E70 DD E1         [14]   87         pop ix
                             88         ;;ld  ix, ix  
   6E72 DD E5         [15]   89         push ix
   6E74 DD 36 04 00   [19]   90         ld entity_estado(ix), #0
   6E78 DD 36 06 FA   [19]   91         ld entity_color(ix), #0xFA
   6E7C CD 4D 42      [17]   92         call pintarEnemigo5
   6E7F DD 36 04 00   [19]   93         ld entity_estado(ix), #0
                             94         ;;call  entityman_getEntityArray_IX
                             95         ;;call  entityman_getNumEntities_A
                             96         ;;call  rendersys_update
   6E83 DD E1         [14]   97         pop ix
   6E85 C9            [10]   98         ret
                             99 
                            100 
                            101 
   6E86                     102         comprobarColisionX:
   6E86 DD E1         [14]  103         pop ix
                            104         ;;ld  ix, ix  
   6E88 DD E5         [15]  105         push ix
   6E8A DD 7E 00      [19]  106         ld a, entity_x(ix)
   6E8D DD 21 03 40   [14]  107         ld  ix, #playerPos  
   6E91 DD 46 00      [19]  108         ld b, entity_x(ix)
                            109 
   6E94                     110         ComprobacionX:
   6E94 3D            [ 4]  111         dec a
   6E95 28 09         [12]  112         jr z, enemigoACero
   6E97 05            [ 4]  113         dec b
   6E98 20 FA         [12]  114         jr nz, ComprobacionX
   6E9A 3D            [ 4]  115         dec a
   6E9B 28 0C         [12]  116         jr z, colisionEnemigo
   6E9D DD E1         [14]  117         pop ix
   6E9F C9            [10]  118         ret
   6EA0                     119         enemigoACero:
   6EA0 05            [ 4]  120         dec b
   6EA1 28 06         [12]  121         jr z, colisionEnemigo
   6EA3 05            [ 4]  122         dec b
   6EA4 28 03         [12]  123         jr z, colisionEnemigo
   6EA6 DD E1         [14]  124         pop ix
   6EA8 C9            [10]  125         ret
                            126 
   6EA9                     127         colisionEnemigo:
   6EA9 DD E1         [14]  128         pop ix
   6EAB CD EA 9B      [17]  129         call colision
                            130 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                            131     
                            132     
   6EAE                     133     noestavivo:
   6EAE DD E1         [14]  134         pop ix
                            135         ;;ld  ix, ix  
                            136         ;;push ix
   6EB0 DD 21 3B 40   [14]  137         ld ix, #enemyUp1Pos
                            138         ;;ld entity_color(ix), #0x00
                            139         ;; call  entityman_getEntityArray_IX
                            140        ;; call  entityman_getNumEntities_A
                            141        ;; call  rendersys_update
   6EB4 CD 0C 46      [17]  142         call  borrarEnemigo5
                            143         
   6EB7 DD 21 03 40   [14]  144         ld ix, #playerPos
   6EBB DD 46 00      [19]  145         ld b, entity_x(ix)
                            146         ;;pop ix
                            147         ;;ld  ix, ix  
                            148         ;;push ix
   6EBE DD 21 3B 40   [14]  149         ld ix, #enemyUp1Pos
   6EC2 DD 36 04 01   [19]  150         ld entity_estado(ix), #1
   6EC6 DD 36 06 F0   [19]  151         ld entity_color(ix), #0xF0
   6ECA DD 36 01 40   [19]  152         ld entity_y(ix), #0x40
   6ECE DD 70 00      [19]  153         ld entity_x(ix), b
   6ED1 CD 4D 42      [17]  154         call  pintarEnemigo5
                            155        ;; call  entityman_getEntityArray_IX
                            156        ;; call  entityman_getNumEntities_A
                            157        ;; call  rendersys_update
                            158         ;;pop ix
   6ED4 C9            [10]  159         ret
                            160         
