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



                             19 .include "system/renderPersonaje.h.s"
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
                             15 .globl pintarPersonajePos0
                             16 .globl borraPersonajePos0
                             17 .globl pintarPersonajePos1
                             18 .globl ataqueAereoDerecha
                             19 .globl ataqueAereoDerecha2
                             20 .globl ataqueAereoIzquierda
                             21 .globl ataqueAereoIzquierda2
                             22 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                             20 .include "system/renderEnemigo5A.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                             21 
                             22 
   6B2B                      23 ataqueAereo::
   6B2B DD 21 03 40   [14]   24     ld ix, #playerPos
   6B2F DD 4E 00      [19]   25     ld c, entity_x(ix)
   6B32 DD 46 01      [19]   26     ld b, entity_y(ix)
   6B35 05            [ 4]   27     dec b
   6B36 05            [ 4]   28     dec b
   6B37 05            [ 4]   29     dec b
   6B38 05            [ 4]   30     dec b
   6B39 05            [ 4]   31     dec b
   6B3A 05            [ 4]   32     dec b
   6B3B 05            [ 4]   33     dec b
   6B3C 05            [ 4]   34     dec b
   6B3D 05            [ 4]   35     dec b
   6B3E C5            [11]   36     push bc
                             37 
                             38     ;;ld      de, #0xC000        
                             39     ;;call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
                             40 ;;
                             41     ;;ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
                             42     ;;ld      a,  #0xAF         ;;Color (en la posición de la entidad)
                             43     ;;ld      c,  #1         ;;Ancho (en la posición de la entidad)
                             44     ;;ld      b,  #6        ;;Alto (en la posición de la entidad)
                             45     ;;call cpct_drawSolidBox_asm
                             46 
   6B3F DD 21 03 40   [14]   47     ld ix, #playerPos
   6B43 DD 7E 04      [19]   48     ld a, entity_estado(ix)
   6B46 3D            [ 4]   49     dec a 
   6B47 28 02         [12]   50     jr z, ataqueAereoIzq
   6B49 18 3D         [12]   51     jr ataqueAereoDer
                             52 
                             53 
   6B4B                      54     ataqueAereoIzq:
   6B4B CD 69 75      [17]   55     call ataqueAereoIzquierda
                             56 
   6B4E 3E 0A         [ 7]   57     ld a, #10
   6B50                      58     bucleizq:
   6B50 76            [ 4]   59     halt
   6B51 3D            [ 4]   60     dec a
   6B52 20 FC         [12]   61     jr nz, bucleizq
                             62 
   6B54 CD FB 76      [17]   63     call ataqueAereoIzquierda2
                             64 
   6B57 3E 0A         [ 7]   65     ld a, #10
   6B59                      66     bucleizq2:
   6B59 76            [ 4]   67     halt
   6B5A 3D            [ 4]   68     dec a
   6B5B 20 FC         [12]   69     jr nz, bucleizq2
                             70 
   6B5D 3E 0A         [ 7]   71     ld a, #10
   6B5F                      72     bucleizq3:
   6B5F 76            [ 4]   73     halt
   6B60 3D            [ 4]   74     dec a
   6B61 20 FC         [12]   75     jr nz, bucleizq3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                             76 
   6B63 CD 69 75      [17]   77     call ataqueAereoIzquierda
                             78 
   6B66 3E 0A         [ 7]   79     ld a, #10
   6B68                      80     bucleizq4:
   6B68 76            [ 4]   81     halt
   6B69 3D            [ 4]   82     dec a
   6B6A 20 FC         [12]   83     jr nz, bucleizq4
                             84 
   6B6C CD FB 76      [17]   85     call ataqueAereoIzquierda2
                             86 
                             87     ;;borrar
   6B6F C1            [10]   88     pop bc
                             89 
   6B70 11 00 C0      [10]   90     ld      de, #0xC000  
   6B73 05            [ 4]   91     dec b     
   6B74 05            [ 4]   92     dec b
   6B75 05            [ 4]   93     dec b 
   6B76 CD 6C B0      [17]   94     call cpct_getScreenPtr_asm 
                             95 
   6B79 EB            [ 4]   96     ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
   6B7A 3E 00         [ 7]   97     ld      a,  #0x00         ;;Color (en la posición de la entidad)
   6B7C 0E 02         [ 7]   98     ld      c,  #2        ;;Ancho (en la posición de la entidad)
   6B7E 06 08         [ 7]   99     ld      b,  #8        ;;Alto (en la posición de la entidad)
   6B80 CD C1 AF      [17]  100     call cpct_drawSolidBox_asm
                            101 
   6B83 CD CC 72      [17]  102     call pintarPersonajePos1
                            103 
   6B86 18 3B         [12]  104     jr continua
                            105 
   6B88                     106     ataqueAereoDer:
   6B88 CD 8D 78      [17]  107     call ataqueAereoDerecha
                            108 
   6B8B 3E 0A         [ 7]  109     ld a, #10
   6B8D                     110     bucleder:
   6B8D 76            [ 4]  111     halt
   6B8E 3D            [ 4]  112     dec a
   6B8F 20 FC         [12]  113     jr nz, bucleder
                            114 
   6B91 CD 1F 7A      [17]  115     call ataqueAereoDerecha2
                            116 
   6B94 3E 0A         [ 7]  117     ld a, #10
   6B96                     118     bucleder2:
   6B96 76            [ 4]  119     halt
   6B97 3D            [ 4]  120     dec a
   6B98 20 FC         [12]  121     jr nz, bucleder2
                            122 
   6B9A CD 8D 78      [17]  123     call ataqueAereoDerecha
                            124 
   6B9D 3E 0A         [ 7]  125     ld a, #10
   6B9F                     126     bucleder3:
   6B9F 76            [ 4]  127     halt
   6BA0 3D            [ 4]  128     dec a
   6BA1 20 FC         [12]  129     jr nz, bucleder3
                            130 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   6BA3 CD 1F 7A      [17]  131     call ataqueAereoDerecha2
                            132 
   6BA6 3E 0A         [ 7]  133     ld a, #10
   6BA8                     134     bucleder4:
   6BA8 76            [ 4]  135     halt
   6BA9 3D            [ 4]  136     dec a
   6BAA 20 FC         [12]  137     jr nz, bucleder4
                            138 
                            139     ;;borrar
   6BAC C1            [10]  140     pop bc
                            141 
   6BAD 11 00 C0      [10]  142     ld      de, #0xC000  
   6BB0 05            [ 4]  143     dec b      
   6BB1 05            [ 4]  144     dec b
   6BB2 05            [ 4]  145     dec b
   6BB3 CD 6C B0      [17]  146     call cpct_getScreenPtr_asm 
                            147 
   6BB6 EB            [ 4]  148     ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
   6BB7 3E 00         [ 7]  149     ld      a,  #0x00         ;;Color (en la posición de la entidad)
   6BB9 0E 02         [ 7]  150     ld      c,  #2        ;;Ancho (en la posición de la entidad)
   6BBB 06 08         [ 7]  151     ld      b,  #8        ;;Alto (en la posición de la entidad)
   6BBD CD C1 AF      [17]  152     call cpct_drawSolidBox_asm
                            153 
   6BC0 CD 2E 70      [17]  154     call pintarPersonajePos0
                            155 
                            156 
                            157 
   6BC3                     158     continua:
                            159     
                            160 
                            161 
   6BC3                     162     deteccionEnemigo:
   6BC3 DD 21 03 40   [14]  163     ld ix, #playerPos
   6BC7 DD 7E 00      [19]  164     ld a, entity_x(ix)
   6BCA DD 21 3B 40   [14]  165     ld ix, #enemyUp1Pos
   6BCE DD 46 00      [19]  166     ld b, entity_x(ix)
                            167 
   6BD1                     168     compruebaX1:
   6BD1 3D            [ 4]  169     dec a
   6BD2 28 05         [12]  170     jr z, playerXCero1
   6BD4 05            [ 4]  171     dec b
   6BD5 28 0B         [12]  172     jr z, enemyUp1Cero
   6BD7 18 F8         [12]  173     jr compruebaX1
   6BD9                     174     playerXCero1:
   6BD9 05            [ 4]  175     dec b
   6BDA 28 0C         [12]  176     jr z, mismaX1
   6BDC 05            [ 4]  177     dec b
   6BDD 28 09         [12]  178     jr z, mismaX1
   6BDF C3 87 6C      [10]  179     jp deteccionEnemigo2
   6BE2                     180     enemyUp1Cero:
   6BE2 3D            [ 4]  181     dec a
   6BE3 28 03         [12]  182     jr z, mismaX1
   6BE5 C3 87 6C      [10]  183     jp deteccionEnemigo2
                            184 
   6BE8                     185     mismaX1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   6BE8 DD 21 03 40   [14]  186     ld ix, #playerPos
   6BEC DD 7E 01      [19]  187     ld a, entity_y(ix)
   6BEF DD 21 3B 40   [14]  188     ld ix, #enemyUp1Pos
   6BF3 DD 46 01      [19]  189     ld b, entity_y(ix)
                            190 
   6BF6                     191     compruebaY1:
   6BF6 05            [ 4]  192     dec b
   6BF7 28 06         [12]  193     jr z, enemyUp1YCero
   6BF9 3D            [ 4]  194     dec a
   6BFA CA 87 6C      [10]  195     jp z, deteccionEnemigo2
   6BFD 18 F7         [12]  196     jr compruebaY1
   6BFF                     197     enemyUp1YCero:
   6BFF 3D            [ 4]  198     dec a
   6C00 28 41         [12]  199     jr z, mataUp1
   6C02 3D            [ 4]  200     dec a
   6C03 28 3E         [12]  201     jr z, mataUp1
   6C05 3D            [ 4]  202     dec a
   6C06 28 3B         [12]  203     jr z, mataUp1
   6C08 3D            [ 4]  204     dec a
   6C09 28 38         [12]  205     jr z, mataUp1
   6C0B 3D            [ 4]  206     dec a
   6C0C 28 35         [12]  207     jr z, mataUp1
   6C0E 3D            [ 4]  208     dec a
   6C0F 28 32         [12]  209     jr z, mataUp1
   6C11 3D            [ 4]  210     dec a
   6C12 28 2F         [12]  211     jr z, mataUp1
   6C14 3D            [ 4]  212     dec a
   6C15 28 2C         [12]  213     jr z, mataUp1
   6C17 3D            [ 4]  214     dec a
   6C18 28 29         [12]  215     jr z, mataUp1
   6C1A 3D            [ 4]  216     dec a
   6C1B 28 26         [12]  217     jr z, mataUp1
   6C1D 3D            [ 4]  218     dec a
   6C1E 28 23         [12]  219     jr z, mataUp1
   6C20 3D            [ 4]  220     dec a
   6C21 28 20         [12]  221     jr z, mataUp1
   6C23 3D            [ 4]  222     dec a
   6C24 28 1D         [12]  223     jr z, mataUp1
   6C26 3D            [ 4]  224     dec a
   6C27 28 1A         [12]  225     jr z, mataUp1
   6C29 3D            [ 4]  226     dec a
   6C2A 28 17         [12]  227     jr z, mataUp1
   6C2C 3D            [ 4]  228     dec a
   6C2D 28 14         [12]  229     jr z, mataUp1
   6C2F 3D            [ 4]  230     dec a
   6C30 28 11         [12]  231     jr z, mataUp1
   6C32 3D            [ 4]  232     dec a
   6C33 28 0E         [12]  233     jr z, mataUp1
   6C35 3D            [ 4]  234     dec a
   6C36 28 0B         [12]  235     jr z, mataUp1
   6C38 3D            [ 4]  236     dec a
   6C39 28 08         [12]  237     jr z, mataUp1
   6C3B 3D            [ 4]  238     dec a
   6C3C 28 05         [12]  239     jr z, mataUp1
   6C3E 3D            [ 4]  240     dec a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   6C3F 28 02         [12]  241     jr z, mataUp1
   6C41 18 44         [12]  242     jr deteccionEnemigo2
                            243 
   6C43                     244     mataUp1:
   6C43 DD 21 3B 40   [14]  245     ld  ix, #enemyUp1Pos
   6C47 DD 36 06 F0   [19]  246     ld entity_color(ix), #0xF0
   6C4B CD 4D 42      [17]  247     call pintarEnemigo5
                            248     ;;call  entityman_getEntityArray_IX
                            249     ;;call  entityman_getNumEntities_A
                            250     ;;call  rendersys_update
                            251 
   6C4E 3E 32         [ 7]  252     ld a, #50
   6C50                     253     muere1bucle:
   6C50 76            [ 4]  254     halt
   6C51 3D            [ 4]  255     dec a 
   6C52 20 FC         [12]  256     jr nz, muere1bucle
                            257 
                            258 
   6C54 DD 21 3B 40   [14]  259     ld  ix, #enemyUp1Pos
   6C58 DD 36 06 00   [19]  260     ld entity_color(ix), #0x00
   6C5C CD 0C 46      [17]  261     call borrarEnemigo5
                            262     ;;call  entityman_getEntityArray_IX
                            263     ;;call  entityman_getNumEntities_A
                            264     ;;call  rendersys_update
                            265 
   6C5F DD 21 11 40   [14]  266     ld ix, #wallIPos
   6C63 DD 7E 05      [19]  267     ld a, entity_vy(ix)
   6C66 3C            [ 4]  268     inc a 
   6C67 DD 77 05      [19]  269     ld entity_vy(ix), a
                            270 
   6C6A DD 21 03 40   [14]  271     ld ix, #playerPos
   6C6E DD 46 00      [19]  272     ld b, entity_x(ix)
                            273     
   6C71 DD 21 3B 40   [14]  274     ld  ix, #enemyUp1Pos
   6C75 DD 36 04 00   [19]  275     ld entity_estado(ix), #0
   6C79 DD 36 06 F0   [19]  276     ld entity_color(ix), #0xF0
   6C7D DD 36 01 40   [19]  277     ld entity_y(ix), #0x40
   6C81 DD 70 00      [19]  278     ld entity_x(ix), b
   6C84 CD 4D 42      [17]  279     call pintarEnemigo5
                            280     ;;call  entityman_getEntityArray_IX
                            281     ;;call  entityman_getNumEntities_A
                            282     ;;call  rendersys_update
                            283 
                            284 
                            285     ;;----------------------------------------------
   6C87                     286     deteccionEnemigo2:
   6C87 DD 21 03 40   [14]  287     ld ix, #playerPos
   6C8B DD 7E 00      [19]  288     ld a, entity_x(ix)
   6C8E DD 21 42 40   [14]  289     ld ix, #enemyUp2Pos
   6C92 DD 46 00      [19]  290     ld b, entity_x(ix)
                            291 
   6C95                     292     compruebaX2:
   6C95 3D            [ 4]  293     dec a
   6C96 28 05         [12]  294     jr z, playerXCero2
   6C98 05            [ 4]  295     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   6C99 28 0B         [12]  296     jr z, enemyUp2Cero
   6C9B 18 F8         [12]  297     jr compruebaX2
   6C9D                     298     playerXCero2:
   6C9D 05            [ 4]  299     dec b
   6C9E 28 0C         [12]  300     jr z, mismaX2
   6CA0 05            [ 4]  301     dec b
   6CA1 28 09         [12]  302     jr z, mismaX2
   6CA3 C3 4E 6D      [10]  303     jp deteccionEnemigo3
   6CA6                     304     enemyUp2Cero:
   6CA6 3D            [ 4]  305     dec a
   6CA7 28 03         [12]  306     jr z, mismaX2
   6CA9 C3 4E 6D      [10]  307     jp deteccionEnemigo3
                            308 
   6CAC                     309     mismaX2:
   6CAC DD 21 03 40   [14]  310     ld ix, #playerPos
   6CB0 DD 7E 01      [19]  311     ld a, entity_y(ix)
   6CB3 DD 21 42 40   [14]  312     ld ix, #enemyUp2Pos
   6CB7 DD 46 01      [19]  313     ld b, entity_y(ix)
                            314 
   6CBA                     315     compruebaY2:
   6CBA 05            [ 4]  316     dec b
   6CBB 28 06         [12]  317     jr z, enemyUp2YCero
   6CBD 3D            [ 4]  318     dec a
   6CBE CA 4E 6D      [10]  319     jp z, deteccionEnemigo3
   6CC1 18 F7         [12]  320     jr compruebaY2
   6CC3                     321     enemyUp2YCero:
   6CC3 3D            [ 4]  322     dec a
   6CC4 28 41         [12]  323     jr z, mataUp2
   6CC6 3D            [ 4]  324     dec a
   6CC7 28 3E         [12]  325     jr z, mataUp2
   6CC9 3D            [ 4]  326     dec a
   6CCA 28 3B         [12]  327     jr z, mataUp2
   6CCC 3D            [ 4]  328     dec a
   6CCD 28 38         [12]  329     jr z, mataUp2
   6CCF 3D            [ 4]  330     dec a
   6CD0 28 35         [12]  331     jr z, mataUp2
   6CD2 3D            [ 4]  332     dec a
   6CD3 28 32         [12]  333     jr z, mataUp2
   6CD5 3D            [ 4]  334     dec a
   6CD6 28 2F         [12]  335     jr z, mataUp2
   6CD8 3D            [ 4]  336     dec a
   6CD9 28 2C         [12]  337     jr z, mataUp2
   6CDB 3D            [ 4]  338     dec a
   6CDC 28 29         [12]  339     jr z, mataUp2
   6CDE 3D            [ 4]  340     dec a
   6CDF 28 26         [12]  341     jr z, mataUp2
   6CE1 3D            [ 4]  342     dec a
   6CE2 28 23         [12]  343     jr z, mataUp2
   6CE4 3D            [ 4]  344     dec a
   6CE5 28 20         [12]  345     jr z, mataUp2
   6CE7 3D            [ 4]  346     dec a
   6CE8 28 1D         [12]  347     jr z, mataUp2
   6CEA 3D            [ 4]  348     dec a
   6CEB 28 1A         [12]  349     jr z, mataUp2
   6CED 3D            [ 4]  350     dec a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   6CEE 28 17         [12]  351     jr z, mataUp2
   6CF0 3D            [ 4]  352     dec a
   6CF1 28 14         [12]  353     jr z, mataUp2
   6CF3 3D            [ 4]  354     dec a
   6CF4 28 11         [12]  355     jr z, mataUp2
   6CF6 3D            [ 4]  356     dec a
   6CF7 28 0E         [12]  357     jr z, mataUp2
   6CF9 3D            [ 4]  358     dec a
   6CFA 28 0B         [12]  359     jr z, mataUp2
   6CFC 3D            [ 4]  360     dec a
   6CFD 28 08         [12]  361     jr z, mataUp2
   6CFF 3D            [ 4]  362     dec a
   6D00 28 05         [12]  363     jr z, mataUp2
   6D02 3D            [ 4]  364     dec a
   6D03 28 02         [12]  365     jr z, mataUp2
   6D05 18 47         [12]  366     jr deteccionEnemigo3
                            367 
   6D07                     368     mataUp2:
   6D07 DD 21 42 40   [14]  369     ld  ix, #enemyUp2Pos
   6D0B DD 36 06 F0   [19]  370     ld entity_color(ix), #0xF0
   6D0F CD 4D 42      [17]  371     call pintarEnemigo5
                            372     ;call  entityman_getEntityArray_IX
                            373     ;call  entityman_getNumEntities_A
                            374     ;call  rendersys_update
                            375 
   6D12 3E 32         [ 7]  376     ld a, #50
   6D14                     377     muere2bucle:
   6D14 76            [ 4]  378     halt
   6D15 3D            [ 4]  379     dec a 
   6D16 20 FC         [12]  380     jr nz, muere2bucle
                            381 
                            382 
   6D18 DD 21 42 40   [14]  383     ld  ix, #enemyUp2Pos
   6D1C DD 36 06 00   [19]  384     ld entity_color(ix), #0x00
   6D20 CD 0C 46      [17]  385     call borrarEnemigo5
                            386     ;;call  entityman_getEntityArray_IX
                            387     ;;call  entityman_getNumEntities_A
                            388     ;;call  rendersys_update
                            389 
   6D23 DD 21 11 40   [14]  390     ld ix, #wallIPos
   6D27 DD 7E 05      [19]  391     ld a, entity_vy(ix)
   6D2A 3C            [ 4]  392     inc a 
   6D2B DD 77 05      [19]  393     ld entity_vy(ix), a
                            394 
   6D2E DD 21 03 40   [14]  395     ld ix, #playerPos
   6D32 DD 46 00      [19]  396     ld b, entity_x(ix)
                            397     
   6D35 DD 21 42 40   [14]  398     ld  ix, #enemyUp2Pos
   6D39 DD 36 04 00   [19]  399     ld entity_estado(ix), #0
   6D3D DD 36 06 F0   [19]  400     ld entity_color(ix), #0xF0
   6D41 DD 36 01 40   [19]  401     ld entity_y(ix), #0x40
   6D45 04            [ 4]  402     inc b 
   6D46 04            [ 4]  403     inc b 
   6D47 04            [ 4]  404     inc b
   6D48 DD 70 00      [19]  405     ld entity_x(ix), b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   6D4B CD 4D 42      [17]  406     call pintarEnemigo5
                            407     ;;call  entityman_getEntityArray_IX
                            408     ;;call  entityman_getNumEntities_A
                            409     ;;call  rendersys_update
                            410 
                            411     ;;------------------------
   6D4E                     412     deteccionEnemigo3:
   6D4E DD 21 03 40   [14]  413     ld ix, #playerPos
   6D52 DD 7E 00      [19]  414     ld a, entity_x(ix)
   6D55 DD 21 49 40   [14]  415     ld ix, #enemyUp3Pos
   6D59 DD 46 00      [19]  416     ld b, entity_x(ix)
                            417 
   6D5C                     418     compruebaX3:
   6D5C 3D            [ 4]  419     dec a
   6D5D 28 05         [12]  420     jr z, playerXCero3
   6D5F 05            [ 4]  421     dec b
   6D60 28 0B         [12]  422     jr z, enemyUp3Cero
   6D62 18 F8         [12]  423     jr compruebaX3
   6D64                     424     playerXCero3:
   6D64 05            [ 4]  425     dec b
   6D65 28 0C         [12]  426     jr z, mismaX3
   6D67 05            [ 4]  427     dec b
   6D68 28 09         [12]  428     jr z, mismaX3
   6D6A C3 15 6E      [10]  429     jp nomata
   6D6D                     430     enemyUp3Cero:
   6D6D 3D            [ 4]  431     dec a
   6D6E 28 03         [12]  432     jr z, mismaX3
   6D70 C3 15 6E      [10]  433     jp nomata
                            434 
   6D73                     435     mismaX3:
   6D73 DD 21 03 40   [14]  436     ld ix, #playerPos
   6D77 DD 7E 01      [19]  437     ld a, entity_y(ix)
   6D7A DD 21 49 40   [14]  438     ld ix, #enemyUp3Pos
   6D7E DD 46 01      [19]  439     ld b, entity_y(ix)
                            440 
   6D81                     441     compruebaY3:
   6D81 05            [ 4]  442     dec b
   6D82 28 06         [12]  443     jr z, enemyUp3YCero
   6D84 3D            [ 4]  444     dec a
   6D85 CA 15 6E      [10]  445     jp z, nomata
   6D88 18 F7         [12]  446     jr compruebaY3
   6D8A                     447     enemyUp3YCero:
   6D8A 3D            [ 4]  448     dec a
   6D8B 28 41         [12]  449     jr z, mataUp3
   6D8D 3D            [ 4]  450     dec a
   6D8E 28 3E         [12]  451     jr z, mataUp3
   6D90 3D            [ 4]  452     dec a
   6D91 28 3B         [12]  453     jr z, mataUp3
   6D93 3D            [ 4]  454     dec a
   6D94 28 38         [12]  455     jr z, mataUp3
   6D96 3D            [ 4]  456     dec a
   6D97 28 35         [12]  457     jr z, mataUp3
   6D99 3D            [ 4]  458     dec a
   6D9A 28 32         [12]  459     jr z, mataUp3
   6D9C 3D            [ 4]  460     dec a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   6D9D 28 2F         [12]  461     jr z, mataUp3
   6D9F 3D            [ 4]  462     dec a
   6DA0 28 2C         [12]  463     jr z, mataUp3
   6DA2 3D            [ 4]  464     dec a
   6DA3 28 29         [12]  465     jr z, mataUp3
   6DA5 3D            [ 4]  466     dec a
   6DA6 28 26         [12]  467     jr z, mataUp3
   6DA8 3D            [ 4]  468     dec a
   6DA9 28 23         [12]  469     jr z, mataUp3
   6DAB 3D            [ 4]  470     dec a
   6DAC 28 20         [12]  471     jr z, mataUp3
   6DAE 3D            [ 4]  472     dec a
   6DAF 28 1D         [12]  473     jr z, mataUp3
   6DB1 3D            [ 4]  474     dec a
   6DB2 28 1A         [12]  475     jr z, mataUp3
   6DB4 3D            [ 4]  476     dec a
   6DB5 28 17         [12]  477     jr z, mataUp3
   6DB7 3D            [ 4]  478     dec a
   6DB8 28 14         [12]  479     jr z, mataUp3
   6DBA 3D            [ 4]  480     dec a
   6DBB 28 11         [12]  481     jr z, mataUp3
   6DBD 3D            [ 4]  482     dec a
   6DBE 28 0E         [12]  483     jr z, mataUp3
   6DC0 3D            [ 4]  484     dec a
   6DC1 28 0B         [12]  485     jr z, mataUp3
   6DC3 3D            [ 4]  486     dec a
   6DC4 28 08         [12]  487     jr z, mataUp3
   6DC6 3D            [ 4]  488     dec a
   6DC7 28 05         [12]  489     jr z, mataUp3
   6DC9 3D            [ 4]  490     dec a
   6DCA 28 02         [12]  491     jr z, mataUp3
   6DCC 18 47         [12]  492     jr nomata
                            493 
   6DCE                     494     mataUp3:
   6DCE DD 21 49 40   [14]  495     ld  ix, #enemyUp3Pos
   6DD2 DD 36 06 F0   [19]  496     ld entity_color(ix), #0xF0
   6DD6 CD 4D 42      [17]  497     call pintarEnemigo5
                            498     ;;call  entityman_getEntityArray_IX
                            499     ;;call  entityman_getNumEntities_A
                            500     ;;call  rendersys_update
                            501 
   6DD9 3E 32         [ 7]  502     ld a, #50
   6DDB                     503     muere3bucle:
   6DDB 76            [ 4]  504     halt
   6DDC 3D            [ 4]  505     dec a 
   6DDD 20 FC         [12]  506     jr nz, muere3bucle
                            507 
                            508 
   6DDF DD 21 49 40   [14]  509     ld  ix, #enemyUp3Pos
   6DE3 DD 36 06 00   [19]  510     ld entity_color(ix), #0x00
   6DE7 CD 0C 46      [17]  511     call borrarEnemigo5
                            512     ;;call  entityman_getEntityArray_IX
                            513     ;;call  entityman_getNumEntities_A
                            514     ;;call  rendersys_update
                            515 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   6DEA DD 21 11 40   [14]  516     ld ix, #wallIPos
   6DEE DD 7E 05      [19]  517     ld a, entity_vy(ix)
   6DF1 3C            [ 4]  518     inc a 
   6DF2 DD 77 05      [19]  519     ld entity_vy(ix), a
                            520 
   6DF5 DD 21 03 40   [14]  521     ld ix, #playerPos
   6DF9 DD 46 00      [19]  522     ld b, entity_x(ix)
                            523     
   6DFC DD 21 49 40   [14]  524     ld  ix, #enemyUp3Pos
   6E00 DD 36 04 00   [19]  525     ld entity_estado(ix), #0
   6E04 DD 36 06 F0   [19]  526     ld entity_color(ix), #0xF0
   6E08 DD 36 01 40   [19]  527     ld entity_y(ix), #0x40
   6E0C 04            [ 4]  528     inc b 
   6E0D 04            [ 4]  529     inc b 
   6E0E 04            [ 4]  530     inc b
   6E0F DD 70 00      [19]  531     ld entity_x(ix), b
   6E12 CD 4D 42      [17]  532     call pintarEnemigo5
                            533     ;;call  entityman_getEntityArray_IX
                            534     ;;call  entityman_getNumEntities_A
                            535     ;;call  rendersys_update
                            536 
   6E15                     537     nomata:
   6E15 C9            [10]  538     ret
