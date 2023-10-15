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
   5CE2                      19 pintarCrocoPos1::
                             20 ;;COCODRILO ABIERTO 
                             21     ;;Linea ultima
                             22     
                             23     
                             24     ;;Linea 14
   5CE2 11 00 C0      [10]   25     ld      de, #0xC000      
   5CE5 DD 4E 00      [19]   26     ld      c,  entity_x(ix)        
   5CE8 DD 7E 01      [19]   27     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5CEB C6 03         [ 7]   28     add a, #3
   5CED 47            [ 4]   29     ld b, a
   5CEE CD 6C B0      [17]   30     call cpct_getScreenPtr_asm
   5CF1 36 0F         [10]   31     ld      (hl),  #0x0F
   5CF3 2C            [ 4]   32     inc l   
   5CF4 36 0F         [10]   33     ld      (hl),  #0x0F
   5CF6 2C            [ 4]   34     inc l
   5CF7 36 0F         [10]   35     ld      (hl),  #0x0F
                             36 
                             37     ;;Linea 15
   5CF9 11 00 C0      [10]   38     ld      de, #0xC000      
   5CFC DD 4E 00      [19]   39     ld      c,  entity_x(ix)        
   5CFF DD 7E 01      [19]   40     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5D02 C6 02         [ 7]   41     add a, #2
   5D04 47            [ 4]   42     ld b, a
   5D05 CD 6C B0      [17]   43     call cpct_getScreenPtr_asm
   5D08 36 FF         [10]   44     ld      (hl),  #0xFF
   5D0A 2C            [ 4]   45     inc l   
   5D0B 36 FF         [10]   46     ld      (hl),  #0xFF
   5D0D 2C            [ 4]   47     inc l
   5D0E 36 FF         [10]   48     ld      (hl),  #0xFF
                             49 
                             50     ;;Linea 16
   5D10 11 00 C0      [10]   51     ld      de, #0xC000      
   5D13 DD 4E 00      [19]   52     ld      c,  entity_x(ix)        
   5D16 DD 7E 01      [19]   53     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5D19 C6 01         [ 7]   54     add a, #1
   5D1B 47            [ 4]   55     ld b, a
   5D1C CD 6C B0      [17]   56     call cpct_getScreenPtr_asm
   5D1F 36 0F         [10]   57     ld      (hl),  #0x0F
   5D21 2C            [ 4]   58     inc l   
   5D22 36 3F         [10]   59     ld      (hl),  #0x3F
   5D24 2C            [ 4]   60     inc l
   5D25 36 FF         [10]   61     ld      (hl),  #0xFF
                             62 
                             63     ;;Linea 17
   5D27 11 00 C0      [10]   64     ld      de, #0xC000      
   5D2A DD 4E 00      [19]   65     ld      c,  entity_x(ix)        
   5D2D DD 46 01      [19]   66     ld      b,  entity_y(ix)    
   5D30 CD 6C B0      [17]   67     call cpct_getScreenPtr_asm
   5D33 36 0F         [10]   68     ld      (hl),  #0x0F
   5D35 2C            [ 4]   69     inc l   
   5D36 36 0F         [10]   70     ld      (hl),  #0x0F
   5D38 2C            [ 4]   71     inc l
   5D39 36 0F         [10]   72     ld      (hl),  #0x0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                             73 
   5D3B C9            [10]   74     ret
                             75 
                             76 
   5D3C                      77     pintarCrocoPos2::
                             78 ;;COCODRILO ABIERTO 
                             79     
                             80 
                             81    
                             82 
                             83     ;;Linea 12
   5D3C 11 00 C0      [10]   84     ld      de, #0xC000      
   5D3F DD 4E 00      [19]   85     ld      c,  entity_x(ix)        
   5D42 DD 7E 01      [19]   86     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5D45 C6 03         [ 7]   87     add a, #3
   5D47 47            [ 4]   88     ld b, a
   5D48 CD 6C B0      [17]   89     call cpct_getScreenPtr_asm
   5D4B 36 22         [10]   90     ld      (hl),  #0x22
   5D4D 2C            [ 4]   91     inc l   
   5D4E 36 00         [10]   92     ld      (hl),  #0x00
   5D50 2C            [ 4]   93     inc l
   5D51 36 31         [10]   94     ld      (hl),  #0x31
                             95 
                             96     ;;Linea 13
   5D53 11 00 C0      [10]   97     ld      de, #0xC000      
   5D56 DD 4E 00      [19]   98     ld      c,  entity_x(ix)        
   5D59 DD 7E 01      [19]   99     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5D5C C6 02         [ 7]  100     add a, #2
   5D5E 47            [ 4]  101     ld b, a
   5D5F CD 6C B0      [17]  102     call cpct_getScreenPtr_asm
   5D62 36 32         [10]  103     ld      (hl),  #0x32
   5D64 2C            [ 4]  104     inc l   
   5D65 36 C0         [10]  105     ld      (hl),  #0xC0
   5D67 2C            [ 4]  106     inc l
   5D68 36 11         [10]  107     ld      (hl),  #0x11
                            108     ;;Linea 14
   5D6A 11 00 C0      [10]  109     ld      de, #0xC000      
   5D6D DD 4E 00      [19]  110     ld      c,  entity_x(ix)        
   5D70 DD 7E 01      [19]  111     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5D73 C6 01         [ 7]  112     add a, #1
   5D75 47            [ 4]  113     ld b, a
   5D76 CD 6C B0      [17]  114     call cpct_getScreenPtr_asm
   5D79 36 76         [10]  115     ld      (hl),  #0x76
   5D7B 2C            [ 4]  116     inc l   
   5D7C 36 80         [10]  117     ld      (hl),  #0x80
   5D7E 2C            [ 4]  118     inc l
   5D7F 36 31         [10]  119     ld      (hl),  #0x31
                            120 
                            121     ;;Linea 15
   5D81 11 00 C0      [10]  122     ld      de, #0xC000      
   5D84 DD 4E 00      [19]  123     ld      c,  entity_x(ix)        
   5D87 DD 7E 01      [19]  124     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5D8A 47            [ 4]  125     ld b, a
   5D8B CD 6C B0      [17]  126     call cpct_getScreenPtr_asm
   5D8E 36 76         [10]  127     ld      (hl),  #0x76
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   5D90 2C            [ 4]  128     inc l   
   5D91 36 00         [10]  129     ld      (hl),  #0x00
   5D93 2C            [ 4]  130     inc l
   5D94 36 F1         [10]  131     ld      (hl),  #0xF1
                            132 
                            133     ;;Linea 16
   5D96 11 00 C0      [10]  134     ld      de, #0xC000      
   5D99 DD 4E 00      [19]  135     ld      c,  entity_x(ix)        
   5D9C DD 7E 01      [19]  136     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5D9F 06 01         [ 7]  137     ld b, #1
   5DA1 90            [ 4]  138     sub b
   5DA2 47            [ 4]  139     ld b, a 
   5DA3 CD 6C B0      [17]  140     call cpct_getScreenPtr_asm
   5DA6 36 33         [10]  141     ld      (hl),  #0x33
   5DA8 2C            [ 4]  142     inc l   
   5DA9 36 00         [10]  143     ld      (hl),  #0x00
   5DAB 2C            [ 4]  144     inc l
   5DAC 36 62         [10]  145     ld      (hl),  #0x62
                            146 
                            147     ;;Linea 17
   5DAE 11 00 C0      [10]  148     ld      de, #0xC000      
   5DB1 DD 4E 00      [19]  149     ld      c,  entity_x(ix)        
   5DB4 DD 7E 01      [19]  150     ld      a,  entity_y(ix)
   5DB7 06 02         [ 7]  151     ld b, #2
   5DB9 90            [ 4]  152     sub b
   5DBA 47            [ 4]  153     ld b, a     
   5DBB CD 6C B0      [17]  154     call cpct_getScreenPtr_asm
   5DBE 36 11         [10]  155     ld      (hl),  #0x11
   5DC0 2C            [ 4]  156     inc l   
   5DC1 36 00         [10]  157     ld      (hl),  #0x00
   5DC3 2C            [ 4]  158     inc l
   5DC4 36 66         [10]  159     ld      (hl),  #0x66
                            160 
   5DC6 C9            [10]  161     ret
                            162 
   5DC7                     163     pintarCrocoPos3::
                            164 ;;COCODRILO ABIERTO 
                            165     
                            166     ;;Linea 7
   5DC7 11 00 C0      [10]  167     ld      de, #0xC000      
   5DCA DD 4E 00      [19]  168     ld      c,  entity_x(ix)        
   5DCD DD 7E 01      [19]  169     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5DD0 C6 03         [ 7]  170     add a, #3
   5DD2 47            [ 4]  171     ld b, a
   5DD3 CD 6C B0      [17]  172     call cpct_getScreenPtr_asm
   5DD6 36 F2         [10]  173     ld      (hl),  #0xF2
   5DD8 2C            [ 4]  174     inc l   
   5DD9 36 D0         [10]  175     ld      (hl),  #0xD0
   5DDB 2C            [ 4]  176     inc l
   5DDC 36 E2         [10]  177     ld      (hl),  #0xE2
                            178 
                            179     ;;Linea 8
   5DDE 11 00 C0      [10]  180     ld      de, #0xC000      
   5DE1 DD 4E 00      [19]  181     ld      c,  entity_x(ix)        
   5DE4 DD 7E 01      [19]  182     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   5DE7 C6 02         [ 7]  183     add a, #2
   5DE9 47            [ 4]  184     ld b, a
   5DEA CD 6C B0      [17]  185     call cpct_getScreenPtr_asm
   5DED 36 A2         [10]  186     ld      (hl),  #0xA2
   5DEF 2C            [ 4]  187     inc l   
   5DF0 36 00         [10]  188     ld      (hl),  #0x00
   5DF2 2C            [ 4]  189     inc l
   5DF3 36 62         [10]  190     ld      (hl),  #0x62
                            191 
                            192     ;;Linea 9
   5DF5 11 00 C0      [10]  193     ld      de, #0xC000      
   5DF8 DD 4E 00      [19]  194     ld      c,  entity_x(ix)        
   5DFB DD 7E 01      [19]  195     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5DFE C6 01         [ 7]  196     add a, #1
   5E00 47            [ 4]  197     ld b, a
   5E01 CD 6C B0      [17]  198     call cpct_getScreenPtr_asm
   5E04 36 76         [10]  199     ld      (hl),  #0x76
   5E06 2C            [ 4]  200     inc l   
   5E07 36 00         [10]  201     ld      (hl),  #0x00
   5E09 2C            [ 4]  202     inc l
   5E0A 36 11         [10]  203     ld      (hl),  #0x11
                            204 
                            205     ;;Linea 10
   5E0C 11 00 C0      [10]  206     ld      de, #0xC000      
   5E0F DD 4E 00      [19]  207     ld      c,  entity_x(ix)        
   5E12 DD 7E 01      [19]  208     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5E15 47            [ 4]  209     ld b, a
   5E16 CD 6C B0      [17]  210     call cpct_getScreenPtr_asm
   5E19 36 32         [10]  211     ld      (hl),  #0x32
   5E1B 2C            [ 4]  212     inc l   
   5E1C 36 80         [10]  213     ld      (hl),  #0x80
   5E1E 2C            [ 4]  214     inc l
   5E1F 36 31         [10]  215     ld      (hl),  #0x31
                            216 
                            217     ;;Linea 11
   5E21 11 00 C0      [10]  218     ld      de, #0xC000      
   5E24 DD 4E 00      [19]  219     ld      c,  entity_x(ix)        
   5E27 DD 7E 01      [19]  220     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5E2A 06 01         [ 7]  221     ld b, #1
   5E2C 90            [ 4]  222     sub b
   5E2D 47            [ 4]  223     ld b, a 
   5E2E CD 6C B0      [17]  224     call cpct_getScreenPtr_asm
   5E31 36 32         [10]  225     ld      (hl),  #0x32
   5E33 2C            [ 4]  226     inc l   
   5E34 36 00         [10]  227     ld      (hl),  #0x00
   5E36 2C            [ 4]  228     inc l
   5E37 36 71         [10]  229     ld      (hl),  #0x71
                            230 
                            231     ;;Linea 12
   5E39 11 00 C0      [10]  232     ld      de, #0xC000      
   5E3C DD 4E 00      [19]  233     ld      c,  entity_x(ix)        
   5E3F DD 7E 01      [19]  234     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5E42 06 02         [ 7]  235     ld b, #2
   5E44 90            [ 4]  236     sub b
   5E45 47            [ 4]  237     ld b, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   5E46 CD 6C B0      [17]  238     call cpct_getScreenPtr_asm
   5E49 36 22         [10]  239     ld      (hl),  #0x22
   5E4B 2C            [ 4]  240     inc l   
   5E4C 36 00         [10]  241     ld      (hl),  #0x00
   5E4E 2C            [ 4]  242     inc l
   5E4F 36 31         [10]  243     ld      (hl),  #0x31
                            244 
                            245     ;;Linea 13
   5E51 11 00 C0      [10]  246     ld      de, #0xC000      
   5E54 DD 4E 00      [19]  247     ld      c,  entity_x(ix)        
   5E57 DD 7E 01      [19]  248     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5E5A 06 03         [ 7]  249     ld b, #3
   5E5C 90            [ 4]  250     sub b
   5E5D 47            [ 4]  251     ld b, a  
   5E5E CD 6C B0      [17]  252     call cpct_getScreenPtr_asm
   5E61 36 32         [10]  253     ld      (hl),  #0x32
   5E63 2C            [ 4]  254     inc l   
   5E64 36 C0         [10]  255     ld      (hl),  #0xC0
   5E66 2C            [ 4]  256     inc l
   5E67 36 11         [10]  257     ld      (hl),  #0x11
                            258     ;;Linea 14
   5E69 11 00 C0      [10]  259     ld      de, #0xC000      
   5E6C DD 4E 00      [19]  260     ld      c,  entity_x(ix)        
   5E6F DD 7E 01      [19]  261     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5E72 06 04         [ 7]  262     ld b, #4
   5E74 90            [ 4]  263     sub b
   5E75 47            [ 4]  264     ld b, a  
   5E76 CD 6C B0      [17]  265     call cpct_getScreenPtr_asm
   5E79 36 76         [10]  266     ld      (hl),  #0x76
   5E7B 2C            [ 4]  267     inc l   
   5E7C 36 80         [10]  268     ld      (hl),  #0x80
   5E7E 2C            [ 4]  269     inc l
   5E7F 36 31         [10]  270     ld      (hl),  #0x31
                            271 
                            272     ;;Linea 15
   5E81 11 00 C0      [10]  273     ld      de, #0xC000      
   5E84 DD 4E 00      [19]  274     ld      c,  entity_x(ix)        
   5E87 DD 7E 01      [19]  275     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5E8A 06 05         [ 7]  276     ld b, #5
   5E8C 90            [ 4]  277     sub b
   5E8D 47            [ 4]  278     ld b, a  
   5E8E CD 6C B0      [17]  279     call cpct_getScreenPtr_asm
   5E91 36 76         [10]  280     ld      (hl),  #0x76
   5E93 2C            [ 4]  281     inc l   
   5E94 36 00         [10]  282     ld      (hl),  #0x00
   5E96 2C            [ 4]  283     inc l
   5E97 36 F1         [10]  284     ld      (hl),  #0xF1
                            285 
                            286     ;;Linea 16
   5E99 11 00 C0      [10]  287     ld      de, #0xC000      
   5E9C DD 4E 00      [19]  288     ld      c,  entity_x(ix)        
   5E9F DD 7E 01      [19]  289     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5EA2 06 06         [ 7]  290     ld b, #6
   5EA4 90            [ 4]  291     sub b
   5EA5 47            [ 4]  292     ld b, a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   5EA6 CD 6C B0      [17]  293     call cpct_getScreenPtr_asm
   5EA9 36 33         [10]  294     ld      (hl),  #0x33
   5EAB 2C            [ 4]  295     inc l   
   5EAC 36 00         [10]  296     ld      (hl),  #0x00
   5EAE 2C            [ 4]  297     inc l
   5EAF 36 62         [10]  298     ld      (hl),  #0x62
                            299 
                            300     ;;Linea 17
   5EB1 11 00 C0      [10]  301     ld      de, #0xC000      
   5EB4 DD 4E 00      [19]  302     ld      c,  entity_x(ix)        
   5EB7 DD 7E 01      [19]  303     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5EBA 06 07         [ 7]  304     ld b, #7
   5EBC 90            [ 4]  305     sub b
   5EBD 47            [ 4]  306     ld b, a  
   5EBE CD 6C B0      [17]  307     call cpct_getScreenPtr_asm
   5EC1 36 11         [10]  308     ld      (hl),  #0x11
   5EC3 2C            [ 4]  309     inc l   
   5EC4 36 00         [10]  310     ld      (hl),  #0x00
   5EC6 2C            [ 4]  311     inc l
   5EC7 36 66         [10]  312     ld      (hl),  #0x66
                            313 
   5EC9 C9            [10]  314     ret
                            315 
   5ECA                     316     pintarCrocoPos4::
                            317 ;;COCODRILO ABIERTO 
                            318     ;;Linea ultima
   5ECA 11 00 C0      [10]  319     ld      de, #0xC000       ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   5ECD DD 21 26 40   [14]  320     ld ix, #crocodile 
   5ED1 DD 4E 00      [19]  321     ld      c,  entity_x(ix)        ;;Coordenada X (tamaño en ancho)
   5ED4 DD 7E 01      [19]  322     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5ED7 C6 03         [ 7]  323     add a, #3
   5ED9 47            [ 4]  324     ld b, a
   5EDA CD 6C B0      [17]  325     call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
   5EDD 36 FF         [10]  326     ld      (hl),  #0xFF
   5EDF 2C            [ 4]  327     inc l   
   5EE0 36 FF         [10]  328     ld      (hl),  #0xFF
   5EE2 2C            [ 4]  329     inc l
   5EE3 36 00         [10]  330     ld      (hl),  #0x00
                            331 
                            332     ;;Linea penultima
   5EE5 11 00 C0      [10]  333     ld      de, #0xC000      
   5EE8 DD 4E 00      [19]  334     ld      c,  entity_x(ix)        
   5EEB DD 7E 01      [19]  335     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5EEE C6 02         [ 7]  336     add a, #2
   5EF0 47            [ 4]  337     ld b, a
   5EF1 CD 6C B0      [17]  338     call cpct_getScreenPtr_asm
   5EF4 36 FF         [10]  339     ld      (hl),  #0xFF
   5EF6 2C            [ 4]  340     inc l   
   5EF7 36 FF         [10]  341     ld      (hl),  #0xFF
   5EF9 2C            [ 4]  342     inc l
   5EFA 36 00         [10]  343     ld      (hl),  #0x00
                            344 
                            345     ;;Linea 3
   5EFC 11 00 C0      [10]  346     ld      de, #0xC000      
   5EFF DD 4E 00      [19]  347     ld      c,  entity_x(ix)        
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   5F02 DD 7E 01      [19]  348     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5F05 C6 01         [ 7]  349     add a, #1
   5F07 47            [ 4]  350     ld b, a
   5F08 CD 6C B0      [17]  351     call cpct_getScreenPtr_asm
   5F0B 36 FF         [10]  352     ld      (hl),  #0xFF
   5F0D 2C            [ 4]  353     inc l   
   5F0E 36 FF         [10]  354     ld      (hl),  #0xFF
   5F10 2C            [ 4]  355     inc l
   5F11 36 00         [10]  356     ld      (hl),  #0x00
                            357 
                            358     ;;Linea 4
   5F13 11 00 C0      [10]  359     ld      de, #0xC000      
   5F16 DD 4E 00      [19]  360     ld      c,  entity_x(ix)        
   5F19 DD 7E 01      [19]  361     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5F1C 47            [ 4]  362     ld b, a
   5F1D CD 6C B0      [17]  363     call cpct_getScreenPtr_asm
   5F20 36 66         [10]  364     ld      (hl),  #0x66
   5F22 2C            [ 4]  365     inc l   
   5F23 36 11         [10]  366     ld      (hl),  #0x11
   5F25 2C            [ 4]  367     inc l
   5F26 36 00         [10]  368     ld      (hl),  #0x00
                            369 
                            370     ;;Linea 5
   5F28 11 00 C0      [10]  371     ld      de, #0xC000      
   5F2B DD 4E 00      [19]  372     ld      c,  entity_x(ix)        
   5F2E DD 7E 01      [19]  373     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5F31 06 01         [ 7]  374     ld b, #1
   5F33 90            [ 4]  375     sub b
   5F34 47            [ 4]  376     ld b, a 
   5F35 CD 6C B0      [17]  377     call cpct_getScreenPtr_asm
   5F38 36 76         [10]  378     ld      (hl),  #0x76
   5F3A 2C            [ 4]  379     inc l   
   5F3B 36 00         [10]  380     ld      (hl),  #0x00
   5F3D 2C            [ 4]  381     inc l
   5F3E 36 88         [10]  382     ld      (hl),  #0x88
                            383 
                            384     ;;Linea 6
   5F40 11 00 C0      [10]  385     ld      de, #0xC000      
   5F43 DD 4E 00      [19]  386     ld      c,  entity_x(ix)        
   5F46 DD 7E 01      [19]  387     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5F49 06 02         [ 7]  388     ld b, #2
   5F4B 90            [ 4]  389     sub b
   5F4C 47            [ 4]  390     ld b, a 
   5F4D CD 6C B0      [17]  391     call cpct_getScreenPtr_asm
   5F50 36 76         [10]  392     ld      (hl),  #0x76
   5F52 2C            [ 4]  393     inc l   
   5F53 36 80         [10]  394     ld      (hl),  #0x80
   5F55 2C            [ 4]  395     inc l
   5F56 36 C4         [10]  396     ld      (hl),  #0xC4
                            397 
                            398     ;;Linea 7
   5F58 11 00 C0      [10]  399     ld      de, #0xC000      
   5F5B DD 4E 00      [19]  400     ld      c,  entity_x(ix)        
   5F5E DD 7E 01      [19]  401     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5F61 06 03         [ 7]  402     ld b, #3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   5F63 90            [ 4]  403     sub b
   5F64 47            [ 4]  404     ld b, a 
   5F65 CD 6C B0      [17]  405     call cpct_getScreenPtr_asm
   5F68 36 F2         [10]  406     ld      (hl),  #0xF2
   5F6A 2C            [ 4]  407     inc l   
   5F6B 36 D0         [10]  408     ld      (hl),  #0xD0
   5F6D 2C            [ 4]  409     inc l
   5F6E 36 E2         [10]  410     ld      (hl),  #0xE2
                            411 
                            412     ;;Linea 8
   5F70 11 00 C0      [10]  413     ld      de, #0xC000      
   5F73 DD 4E 00      [19]  414     ld      c,  entity_x(ix)        
   5F76 DD 7E 01      [19]  415     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5F79 06 04         [ 7]  416     ld b, #4
   5F7B 90            [ 4]  417     sub b
   5F7C 47            [ 4]  418     ld b, a  
   5F7D CD 6C B0      [17]  419     call cpct_getScreenPtr_asm
   5F80 36 A2         [10]  420     ld      (hl),  #0xA2
   5F82 2C            [ 4]  421     inc l   
   5F83 36 00         [10]  422     ld      (hl),  #0x00
   5F85 2C            [ 4]  423     inc l
   5F86 36 62         [10]  424     ld      (hl),  #0x62
                            425 
                            426     ;;Linea 9
   5F88 11 00 C0      [10]  427     ld      de, #0xC000      
   5F8B DD 4E 00      [19]  428     ld      c,  entity_x(ix)        
   5F8E DD 7E 01      [19]  429     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5F91 06 05         [ 7]  430     ld b, #5
   5F93 90            [ 4]  431     sub b
   5F94 47            [ 4]  432     ld b, a  
   5F95 CD 6C B0      [17]  433     call cpct_getScreenPtr_asm
   5F98 36 76         [10]  434     ld      (hl),  #0x76
   5F9A 2C            [ 4]  435     inc l   
   5F9B 36 00         [10]  436     ld      (hl),  #0x00
   5F9D 2C            [ 4]  437     inc l
   5F9E 36 11         [10]  438     ld      (hl),  #0x11
                            439 
                            440     ;;Linea 10
   5FA0 11 00 C0      [10]  441     ld      de, #0xC000      
   5FA3 DD 4E 00      [19]  442     ld      c,  entity_x(ix)        
   5FA6 DD 7E 01      [19]  443     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5FA9 06 06         [ 7]  444     ld b, #6
   5FAB 90            [ 4]  445     sub b
   5FAC 47            [ 4]  446     ld b, a  
   5FAD CD 6C B0      [17]  447     call cpct_getScreenPtr_asm
   5FB0 36 32         [10]  448     ld      (hl),  #0x32
   5FB2 2C            [ 4]  449     inc l   
   5FB3 36 80         [10]  450     ld      (hl),  #0x80
   5FB5 2C            [ 4]  451     inc l
   5FB6 36 31         [10]  452     ld      (hl),  #0x31
                            453 
                            454     ;;Linea 11
   5FB8 11 00 C0      [10]  455     ld      de, #0xC000      
   5FBB DD 4E 00      [19]  456     ld      c,  entity_x(ix)        
   5FBE DD 7E 01      [19]  457     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   5FC1 06 07         [ 7]  458     ld b, #7
   5FC3 90            [ 4]  459     sub b
   5FC4 47            [ 4]  460     ld b, a  
   5FC5 CD 6C B0      [17]  461     call cpct_getScreenPtr_asm
   5FC8 36 32         [10]  462     ld      (hl),  #0x32
   5FCA 2C            [ 4]  463     inc l   
   5FCB 36 00         [10]  464     ld      (hl),  #0x00
   5FCD 2C            [ 4]  465     inc l
   5FCE 36 71         [10]  466     ld      (hl),  #0x71
                            467 
                            468     ;;Linea 12
   5FD0 11 00 C0      [10]  469     ld      de, #0xC000      
   5FD3 DD 4E 00      [19]  470     ld      c,  entity_x(ix)        
   5FD6 DD 7E 01      [19]  471     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5FD9 06 08         [ 7]  472     ld b, #8
   5FDB 90            [ 4]  473     sub b
   5FDC 47            [ 4]  474     ld b, a  
   5FDD CD 6C B0      [17]  475     call cpct_getScreenPtr_asm
   5FE0 36 22         [10]  476     ld      (hl),  #0x22
   5FE2 2C            [ 4]  477     inc l   
   5FE3 36 00         [10]  478     ld      (hl),  #0x00
   5FE5 2C            [ 4]  479     inc l
   5FE6 36 31         [10]  480     ld      (hl),  #0x31
                            481 
                            482     ;;Linea 13
   5FE8 11 00 C0      [10]  483     ld      de, #0xC000      
   5FEB DD 4E 00      [19]  484     ld      c,  entity_x(ix)        
   5FEE DD 7E 01      [19]  485     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   5FF1 06 09         [ 7]  486     ld b, #9
   5FF3 90            [ 4]  487     sub b
   5FF4 47            [ 4]  488     ld b, a  
   5FF5 CD 6C B0      [17]  489     call cpct_getScreenPtr_asm
   5FF8 36 32         [10]  490     ld      (hl),  #0x32
   5FFA 2C            [ 4]  491     inc l   
   5FFB 36 C0         [10]  492     ld      (hl),  #0xC0
   5FFD 2C            [ 4]  493     inc l
   5FFE 36 11         [10]  494     ld      (hl),  #0x11
                            495     ;;Linea 14
   6000 11 00 C0      [10]  496     ld      de, #0xC000      
   6003 DD 4E 00      [19]  497     ld      c,  entity_x(ix)        
   6006 DD 7E 01      [19]  498     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6009 06 0A         [ 7]  499     ld b, #10
   600B 90            [ 4]  500     sub b
   600C 47            [ 4]  501     ld b, a  
   600D CD 6C B0      [17]  502     call cpct_getScreenPtr_asm
   6010 36 76         [10]  503     ld      (hl),  #0x76
   6012 2C            [ 4]  504     inc l   
   6013 36 80         [10]  505     ld      (hl),  #0x80
   6015 2C            [ 4]  506     inc l
   6016 36 31         [10]  507     ld      (hl),  #0x31
                            508 
                            509     ;;Linea 15
   6018 11 00 C0      [10]  510     ld      de, #0xC000      
   601B DD 4E 00      [19]  511     ld      c,  entity_x(ix)        
   601E DD 7E 01      [19]  512     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   6021 06 0B         [ 7]  513     ld b, #11
   6023 90            [ 4]  514     sub b
   6024 47            [ 4]  515     ld b, a  
   6025 CD 6C B0      [17]  516     call cpct_getScreenPtr_asm
   6028 36 76         [10]  517     ld      (hl),  #0x76
   602A 2C            [ 4]  518     inc l   
   602B 36 00         [10]  519     ld      (hl),  #0x00
   602D 2C            [ 4]  520     inc l
   602E 36 F1         [10]  521     ld      (hl),  #0xF1
                            522 
                            523     ;;Linea 16
   6030 11 00 C0      [10]  524     ld      de, #0xC000      
   6033 DD 4E 00      [19]  525     ld      c,  entity_x(ix)        
   6036 DD 7E 01      [19]  526     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6039 06 0C         [ 7]  527     ld b, #12
   603B 90            [ 4]  528     sub b
   603C 47            [ 4]  529     ld b, a  
   603D CD 6C B0      [17]  530     call cpct_getScreenPtr_asm
   6040 36 33         [10]  531     ld      (hl),  #0x33
   6042 2C            [ 4]  532     inc l   
   6043 36 00         [10]  533     ld      (hl),  #0x00
   6045 2C            [ 4]  534     inc l
   6046 36 62         [10]  535     ld      (hl),  #0x62
                            536 
                            537     ;;Linea 17
   6048 11 00 C0      [10]  538     ld      de, #0xC000      
   604B DD 4E 00      [19]  539     ld      c,  entity_x(ix)        
   604E DD 7E 01      [19]  540     ld      a,  entity_y(ix) 
   6051 06 0D         [ 7]  541     ld b, #13
   6053 90            [ 4]  542     sub b
   6054 47            [ 4]  543     ld b, a     
   6055 CD 6C B0      [17]  544     call cpct_getScreenPtr_asm
   6058 36 11         [10]  545     ld      (hl),  #0x11
   605A 2C            [ 4]  546     inc l   
   605B 36 00         [10]  547     ld      (hl),  #0x00
   605D 2C            [ 4]  548     inc l
   605E 36 66         [10]  549     ld      (hl),  #0x66
                            550 
   6060 C9            [10]  551     ret
                            552 
   6061                     553     pintarCrocoPos5::
                            554 ;;COCODRILO CERRADO    
                            555     ;;Linea ultima
   6061 DD 21 26 40   [14]  556     ld ix, #crocodile 
   6065 11 00 C0      [10]  557     ld      de, #0xC000       ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   6068 DD 4E 00      [19]  558     ld      c,  entity_x(ix)        
   606B DD 7E 01      [19]  559     ld      a,  entity_y(ix) 
   606E C6 03         [ 7]  560     add a, #3
   6070 47            [ 4]  561     ld b, a
   6071 CD 6C B0      [17]  562     call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
   6074 36 FF         [10]  563     ld      (hl),  #0xFF
   6076 2C            [ 4]  564     inc l   
   6077 36 FF         [10]  565     ld      (hl),  #0xFF
   6079 2C            [ 4]  566     inc l
   607A 36 00         [10]  567     ld      (hl),  #0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



                            568 
                            569     ;;Linea penultima
   607C 11 00 C0      [10]  570     ld      de, #0xC000      
   607F DD 4E 00      [19]  571     ld      c,  entity_x(ix)        
   6082 DD 7E 01      [19]  572     ld      a,  entity_y(ix) 
   6085 C6 02         [ 7]  573     add a, #2
   6087 47            [ 4]  574     ld b, a
   6088 CD 6C B0      [17]  575     call cpct_getScreenPtr_asm
   608B 36 FF         [10]  576     ld      (hl),  #0xFF
   608D 2C            [ 4]  577     inc l   
   608E 36 FF         [10]  578     ld      (hl),  #0xFF
   6090 2C            [ 4]  579     inc l
   6091 36 00         [10]  580     ld      (hl),  #0x00
                            581 
                            582     ;;Linea 3
   6093 11 00 C0      [10]  583     ld      de, #0xC000      
   6096 DD 4E 00      [19]  584     ld      c,  entity_x(ix)        
   6099 DD 7E 01      [19]  585     ld      a,  entity_y(ix) 
   609C C6 01         [ 7]  586     add a, #1
   609E 47            [ 4]  587     ld b, a
   609F CD 6C B0      [17]  588     call cpct_getScreenPtr_asm
   60A2 36 FF         [10]  589     ld      (hl),  #0xFF
   60A4 2C            [ 4]  590     inc l   
   60A5 36 FF         [10]  591     ld      (hl),  #0xFF
   60A7 2C            [ 4]  592     inc l
   60A8 36 00         [10]  593     ld      (hl),  #0x00
                            594 
                            595     ;;Linea 4
   60AA 11 00 C0      [10]  596     ld      de, #0xC000      
   60AD DD 4E 00      [19]  597     ld      c,  entity_x(ix)        
   60B0 DD 7E 01      [19]  598     ld      a,  entity_y(ix) 
   60B3 47            [ 4]  599     ld b, a
   60B4 CD 6C B0      [17]  600     call cpct_getScreenPtr_asm
   60B7 36 66         [10]  601     ld      (hl),  #0x66
   60B9 2C            [ 4]  602     inc l   
   60BA 36 11         [10]  603     ld      (hl),  #0x11
   60BC 2C            [ 4]  604     inc l
   60BD 36 00         [10]  605     ld      (hl),  #0x00
                            606 
                            607     ;;Linea 5
   60BF 11 00 C0      [10]  608     ld      de, #0xC000      
   60C2 DD 4E 00      [19]  609     ld      c,  entity_x(ix)        
   60C5 DD 7E 01      [19]  610     ld      a,  entity_y(ix) 
   60C8 06 01         [ 7]  611     ld b, #1
   60CA 90            [ 4]  612     sub b
   60CB 47            [ 4]  613     ld b, a 
   60CC CD 6C B0      [17]  614     call cpct_getScreenPtr_asm
   60CF 36 76         [10]  615     ld      (hl),  #0x76
   60D1 2C            [ 4]  616     inc l   
   60D2 36 00         [10]  617     ld      (hl),  #0x00
   60D4 2C            [ 4]  618     inc l
   60D5 36 88         [10]  619     ld      (hl),  #0x88
                            620 
                            621     ;;Linea 6
   60D7 11 00 C0      [10]  622     ld      de, #0xC000      
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   60DA DD 4E 00      [19]  623     ld      c,  entity_x(ix)        
   60DD DD 7E 01      [19]  624     ld      a,  entity_y(ix) 
   60E0 06 02         [ 7]  625     ld b, #2
   60E2 90            [ 4]  626     sub b
   60E3 47            [ 4]  627     ld b, a 
   60E4 CD 6C B0      [17]  628     call cpct_getScreenPtr_asm
   60E7 36 76         [10]  629     ld      (hl),  #0x76
   60E9 2C            [ 4]  630     inc l   
   60EA 36 80         [10]  631     ld      (hl),  #0x80
   60EC 2C            [ 4]  632     inc l
   60ED 36 88         [10]  633     ld      (hl),  #0x88
                            634 
                            635     ;;Linea 7
   60EF 11 00 C0      [10]  636     ld      de, #0xC000      
   60F2 DD 4E 00      [19]  637     ld      c,  entity_x(ix)        
   60F5 DD 7E 01      [19]  638     ld      a,  entity_y(ix) 
   60F8 06 03         [ 7]  639     ld b, #3
   60FA 90            [ 4]  640     sub b
   60FB 47            [ 4]  641     ld b, a 
   60FC CD 6C B0      [17]  642     call cpct_getScreenPtr_asm
   60FF 36 F2         [10]  643     ld      (hl),  #0xF2
   6101 2C            [ 4]  644     inc l   
   6102 36 D0         [10]  645     ld      (hl),  #0xD0
   6104 2C            [ 4]  646     inc l
   6105 36 88         [10]  647     ld      (hl),  #0x88
                            648 
                            649     ;;Linea 8
   6107 11 00 C0      [10]  650     ld      de, #0xC000      
   610A DD 4E 00      [19]  651     ld      c,  entity_x(ix)        
   610D DD 7E 01      [19]  652     ld      a,  entity_y(ix) 
   6110 06 04         [ 7]  653     ld b, #4
   6112 90            [ 4]  654     sub b
   6113 47            [ 4]  655     ld b, a 
   6114 CD 6C B0      [17]  656     call cpct_getScreenPtr_asm
   6117 36 B2         [10]  657     ld      (hl),  #0xB2
   6119 2C            [ 4]  658     inc l   
   611A 36 B0         [10]  659     ld      (hl),  #0xB0
   611C 2C            [ 4]  660     inc l
   611D 36 88         [10]  661     ld      (hl),  #0x88
                            662 
                            663     ;;Linea 9
   611F 11 00 C0      [10]  664     ld      de, #0xC000      
   6122 DD 4E 00      [19]  665     ld      c,  entity_x(ix)        
   6125 DD 7E 01      [19]  666     ld      a,  entity_y(ix) 
   6128 06 05         [ 7]  667     ld b, #5
   612A 90            [ 4]  668     sub b
   612B 47            [ 4]  669     ld b, a 
   612C CD 6C B0      [17]  670     call cpct_getScreenPtr_asm
   612F 36 76         [10]  671     ld      (hl),  #0x76
   6131 2C            [ 4]  672     inc l   
   6132 36 70         [10]  673     ld      (hl),  #0x70
   6134 2C            [ 4]  674     inc l
   6135 36 88         [10]  675     ld      (hl),  #0x88
                            676 
                            677     ;;Linea 10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   6137 11 00 C0      [10]  678     ld      de, #0xC000      
   613A DD 4E 00      [19]  679     ld      c,  entity_x(ix)        
   613D DD 7E 01      [19]  680     ld      a,  entity_y(ix) 
   6140 06 06         [ 7]  681     ld b, #6
   6142 90            [ 4]  682     sub b
   6143 47            [ 4]  683     ld b, a 
   6144 CD 6C B0      [17]  684     call cpct_getScreenPtr_asm
   6147 36 22         [10]  685     ld      (hl),  #0x22
   6149 2C            [ 4]  686     inc l   
   614A 36 30         [10]  687     ld      (hl),  #0x30
   614C 2C            [ 4]  688     inc l
   614D 36 88         [10]  689     ld      (hl),  #0x88
                            690 
                            691     ;;Linea 11
   614F 11 00 C0      [10]  692     ld      de, #0xC000      
   6152 DD 4E 00      [19]  693     ld      c,  entity_x(ix)        
   6155 DD 7E 01      [19]  694     ld      a,  entity_y(ix) 
   6158 06 07         [ 7]  695     ld b, #7
   615A 90            [ 4]  696     sub b
   615B 47            [ 4]  697     ld b, a 
   615C CD 6C B0      [17]  698     call cpct_getScreenPtr_asm
   615F 36 32         [10]  699     ld      (hl),  #0x32
   6161 2C            [ 4]  700     inc l   
   6162 36 10         [10]  701     ld      (hl),  #0x10
   6164 2C            [ 4]  702     inc l
   6165 36 88         [10]  703     ld      (hl),  #0x88
                            704 
                            705     ;;Linea 12
   6167 11 00 C0      [10]  706     ld      de, #0xC000      
   616A DD 4E 00      [19]  707     ld      c,  entity_x(ix)        
   616D DD 7E 01      [19]  708     ld      a,  entity_y(ix) 
   6170 06 08         [ 7]  709     ld b, #8
   6172 90            [ 4]  710     sub b
   6173 47            [ 4]  711     ld b, a   
   6174 CD 6C B0      [17]  712     call cpct_getScreenPtr_asm
   6177 36 32         [10]  713     ld      (hl),  #0x32
   6179 2C            [ 4]  714     inc l   
   617A 36 80         [10]  715     ld      (hl),  #0x80
   617C 2C            [ 4]  716     inc l
   617D 36 88         [10]  717     ld      (hl),  #0x88
                            718 
                            719     ;;Linea 13
   617F 11 00 C0      [10]  720     ld      de, #0xC000      
   6182 DD 4E 00      [19]  721     ld      c,  entity_x(ix)        
   6185 DD 7E 01      [19]  722     ld      a,  entity_y(ix) 
   6188 06 09         [ 7]  723     ld b, #9
   618A 90            [ 4]  724     sub b
   618B 47            [ 4]  725     ld b, a   
   618C CD 6C B0      [17]  726     call cpct_getScreenPtr_asm
   618F 36 32         [10]  727     ld      (hl),  #0x32
   6191 2C            [ 4]  728     inc l   
   6192 36 D0         [10]  729     ld      (hl),  #0xD0
   6194 2C            [ 4]  730     inc l
   6195 36 88         [10]  731     ld      (hl),  #0x88
                            732 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



                            733     ;;Linea 14
   6197 11 00 C0      [10]  734     ld      de, #0xC000      
   619A DD 4E 00      [19]  735     ld      c,  entity_x(ix)        
   619D DD 7E 01      [19]  736     ld      a,  entity_y(ix) 
   61A0 06 0A         [ 7]  737     ld b, #10
   61A2 90            [ 4]  738     sub b
   61A3 47            [ 4]  739     ld b, a   
   61A4 CD 6C B0      [17]  740     call cpct_getScreenPtr_asm
   61A7 36 76         [10]  741     ld      (hl),  #0x76
   61A9 2C            [ 4]  742     inc l   
   61AA 36 B0         [10]  743     ld      (hl),  #0xB0
   61AC 2C            [ 4]  744     inc l
   61AD 36 88         [10]  745     ld      (hl),  #0x88
                            746 
                            747     ;;Linea 15
   61AF 11 00 C0      [10]  748     ld      de, #0xC000      
   61B2 DD 4E 00      [19]  749     ld      c,  entity_x(ix)        
   61B5 DD 7E 01      [19]  750     ld      a,  entity_y(ix) 
   61B8 06 0B         [ 7]  751     ld b, #11
   61BA 90            [ 4]  752     sub b
   61BB 47            [ 4]  753     ld b, a   
   61BC CD 6C B0      [17]  754     call cpct_getScreenPtr_asm
   61BF 36 76         [10]  755     ld      (hl),  #0x76
   61C1 2C            [ 4]  756     inc l   
   61C2 36 70         [10]  757     ld      (hl),  #0x70
   61C4 2C            [ 4]  758     inc l
   61C5 36 88         [10]  759     ld      (hl),  #0x88
                            760 
                            761     ;;Linea 16
   61C7 11 00 C0      [10]  762     ld      de, #0xC000      
   61CA DD 4E 00      [19]  763     ld      c,  entity_x(ix)        
   61CD DD 7E 01      [19]  764     ld      a,  entity_y(ix) 
   61D0 06 0C         [ 7]  765     ld b, #12
   61D2 90            [ 4]  766     sub b
   61D3 47            [ 4]  767     ld b, a   
   61D4 CD 6C B0      [17]  768     call cpct_getScreenPtr_asm
   61D7 36 33         [10]  769     ld      (hl),  #0x33
   61D9 2C            [ 4]  770     inc l   
   61DA 36 31         [10]  771     ld      (hl),  #0x31
   61DC 2C            [ 4]  772     inc l
   61DD 36 00         [10]  773     ld      (hl),  #0x00
                            774 
                            775     ;;Linea 17
   61DF 11 00 C0      [10]  776     ld      de, #0xC000      
   61E2 DD 4E 00      [19]  777     ld      c,  entity_x(ix)        
   61E5 DD 7E 01      [19]  778     ld      a,  entity_y(ix) 
   61E8 06 0D         [ 7]  779     ld b, #13
   61EA 90            [ 4]  780     sub b
   61EB 47            [ 4]  781     ld b, a       
   61EC CD 6C B0      [17]  782     call cpct_getScreenPtr_asm
   61EF 36 11         [10]  783     ld      (hl),  #0x11
   61F1 2C            [ 4]  784     inc l   
   61F2 36 33         [10]  785     ld      (hl),  #0x33
   61F4 2C            [ 4]  786     inc l
   61F5 36 00         [10]  787     ld      (hl),  #0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



                            788 
   61F7 C9            [10]  789     ret
                            790 
   61F8                     791     pintarCrocoPos6::
                            792 ;;COCODRILO ABIERTO 
                            793     ;;Linea ultima
   61F8 11 00 C0      [10]  794     ld      de, #0xC000       ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   61FB DD 21 26 40   [14]  795     ld ix, #crocodile 
   61FF DD 4E 00      [19]  796     ld      c,  entity_x(ix)        ;;Coordenada X (tamaño en ancho)
   6202 DD 7E 01      [19]  797     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6205 C6 10         [ 7]  798     add a, #16
   6207 47            [ 4]  799     ld b, a
   6208 CD 6C B0      [17]  800     call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
   620B 36 FF         [10]  801     ld      (hl),  #0xFF
   620D 2C            [ 4]  802     inc l   
   620E 36 FF         [10]  803     ld      (hl),  #0xFF
   6210 2C            [ 4]  804     inc l
   6211 36 00         [10]  805     ld      (hl),  #0x00
                            806 
                            807     ;;Linea penultima
   6213 11 00 C0      [10]  808     ld      de, #0xC000      
   6216 DD 4E 00      [19]  809     ld      c,  entity_x(ix)        
   6219 DD 7E 01      [19]  810     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   621C C6 0F         [ 7]  811     add a, #15
   621E 47            [ 4]  812     ld b, a
   621F CD 6C B0      [17]  813     call cpct_getScreenPtr_asm
   6222 36 FF         [10]  814     ld      (hl),  #0xFF
   6224 2C            [ 4]  815     inc l   
   6225 36 FF         [10]  816     ld      (hl),  #0xFF
   6227 2C            [ 4]  817     inc l
   6228 36 00         [10]  818     ld      (hl),  #0x00
                            819 
                            820     ;;Linea 3
   622A 11 00 C0      [10]  821     ld      de, #0xC000      
   622D DD 4E 00      [19]  822     ld      c,  entity_x(ix)        
   6230 DD 7E 01      [19]  823     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6233 C6 0E         [ 7]  824     add a, #14
   6235 47            [ 4]  825     ld b, a
                            826     ;;sub   #2
                            827     ;;ld b, a
   6236 CD 6C B0      [17]  828     call cpct_getScreenPtr_asm
   6239 36 FF         [10]  829     ld      (hl),  #0xFF
   623B 2C            [ 4]  830     inc l   
   623C 36 FF         [10]  831     ld      (hl),  #0xFF
   623E 2C            [ 4]  832     inc l
   623F 36 00         [10]  833     ld      (hl),  #0x00
                            834 
                            835     ;;Linea 4
   6241 11 00 C0      [10]  836     ld      de, #0xC000      
   6244 DD 4E 00      [19]  837     ld      c,  entity_x(ix)        
   6247 DD 7E 01      [19]  838     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   624A C6 0D         [ 7]  839     add a, #13
   624C 47            [ 4]  840     ld b, a
   624D CD 6C B0      [17]  841     call cpct_getScreenPtr_asm
   6250 36 66         [10]  842     ld      (hl),  #0x66
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   6252 2C            [ 4]  843     inc l   
   6253 36 11         [10]  844     ld      (hl),  #0x11
   6255 2C            [ 4]  845     inc l
   6256 36 00         [10]  846     ld      (hl),  #0x00
                            847 
                            848     ;;Linea 5
   6258 11 00 C0      [10]  849     ld      de, #0xC000      
   625B DD 4E 00      [19]  850     ld      c,  entity_x(ix)        
   625E DD 7E 01      [19]  851     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6261 C6 0C         [ 7]  852     add a, #12
   6263 47            [ 4]  853     ld b, a
   6264 CD 6C B0      [17]  854     call cpct_getScreenPtr_asm
   6267 36 76         [10]  855     ld      (hl),  #0x76
   6269 2C            [ 4]  856     inc l   
   626A 36 00         [10]  857     ld      (hl),  #0x00
   626C 2C            [ 4]  858     inc l
   626D 36 88         [10]  859     ld      (hl),  #0x88
                            860 
                            861     ;;Linea 6
   626F 11 00 C0      [10]  862     ld      de, #0xC000      
   6272 DD 4E 00      [19]  863     ld      c,  entity_x(ix)        
   6275 DD 7E 01      [19]  864     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6278 C6 0B         [ 7]  865     add a, #11
   627A 47            [ 4]  866     ld b, a
   627B CD 6C B0      [17]  867     call cpct_getScreenPtr_asm
   627E 36 76         [10]  868     ld      (hl),  #0x76
   6280 2C            [ 4]  869     inc l   
   6281 36 80         [10]  870     ld      (hl),  #0x80
   6283 2C            [ 4]  871     inc l
   6284 36 C4         [10]  872     ld      (hl),  #0xC4
                            873 
                            874     ;;Linea 7
   6286 11 00 C0      [10]  875     ld      de, #0xC000      
   6289 DD 4E 00      [19]  876     ld      c,  entity_x(ix)        
   628C DD 7E 01      [19]  877     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   628F C6 0A         [ 7]  878     add a, #10
   6291 47            [ 4]  879     ld b, a
   6292 CD 6C B0      [17]  880     call cpct_getScreenPtr_asm
   6295 36 F2         [10]  881     ld      (hl),  #0xF2
   6297 2C            [ 4]  882     inc l   
   6298 36 D0         [10]  883     ld      (hl),  #0xD0
   629A 2C            [ 4]  884     inc l
   629B 36 E2         [10]  885     ld      (hl),  #0xE2
                            886 
                            887     ;;Linea 8
   629D 11 00 C0      [10]  888     ld      de, #0xC000      
   62A0 DD 4E 00      [19]  889     ld      c,  entity_x(ix)        
   62A3 DD 7E 01      [19]  890     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   62A6 C6 09         [ 7]  891     add a, #9
   62A8 47            [ 4]  892     ld b, a
   62A9 CD 6C B0      [17]  893     call cpct_getScreenPtr_asm
   62AC 36 A2         [10]  894     ld      (hl),  #0xA2
   62AE 2C            [ 4]  895     inc l   
   62AF 36 00         [10]  896     ld      (hl),  #0x00
   62B1 2C            [ 4]  897     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 21.
Hexadecimal [16-Bits]



   62B2 36 62         [10]  898     ld      (hl),  #0x62
                            899 
                            900     ;;Linea 9
   62B4 11 00 C0      [10]  901     ld      de, #0xC000      
   62B7 DD 4E 00      [19]  902     ld      c,  entity_x(ix)        
   62BA DD 7E 01      [19]  903     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   62BD C6 08         [ 7]  904     add a, #8
   62BF 47            [ 4]  905     ld b, a
   62C0 CD 6C B0      [17]  906     call cpct_getScreenPtr_asm
   62C3 36 76         [10]  907     ld      (hl),  #0x76
   62C5 2C            [ 4]  908     inc l   
   62C6 36 00         [10]  909     ld      (hl),  #0x00
   62C8 2C            [ 4]  910     inc l
   62C9 36 11         [10]  911     ld      (hl),  #0x11
                            912 
                            913     ;;Linea 10
   62CB 11 00 C0      [10]  914     ld      de, #0xC000      
   62CE DD 4E 00      [19]  915     ld      c,  entity_x(ix)        
   62D1 DD 7E 01      [19]  916     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   62D4 C6 07         [ 7]  917     add a, #7
   62D6 47            [ 4]  918     ld b, a
   62D7 CD 6C B0      [17]  919     call cpct_getScreenPtr_asm
   62DA 36 32         [10]  920     ld      (hl),  #0x32
   62DC 2C            [ 4]  921     inc l   
   62DD 36 80         [10]  922     ld      (hl),  #0x80
   62DF 2C            [ 4]  923     inc l
   62E0 36 31         [10]  924     ld      (hl),  #0x31
                            925 
                            926     ;;Linea 11
   62E2 11 00 C0      [10]  927     ld      de, #0xC000      
   62E5 DD 4E 00      [19]  928     ld      c,  entity_x(ix)        
   62E8 DD 7E 01      [19]  929     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   62EB C6 06         [ 7]  930     add a, #6
   62ED 47            [ 4]  931     ld b, a
   62EE CD 6C B0      [17]  932     call cpct_getScreenPtr_asm
   62F1 36 32         [10]  933     ld      (hl),  #0x32
   62F3 2C            [ 4]  934     inc l   
   62F4 36 00         [10]  935     ld      (hl),  #0x00
   62F6 2C            [ 4]  936     inc l
   62F7 36 71         [10]  937     ld      (hl),  #0x71
                            938 
                            939     ;;Linea 12
   62F9 11 00 C0      [10]  940     ld      de, #0xC000      
   62FC DD 4E 00      [19]  941     ld      c,  entity_x(ix)        
   62FF DD 7E 01      [19]  942     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6302 C6 05         [ 7]  943     add a, #5
   6304 47            [ 4]  944     ld b, a
   6305 CD 6C B0      [17]  945     call cpct_getScreenPtr_asm
   6308 36 22         [10]  946     ld      (hl),  #0x22
   630A 2C            [ 4]  947     inc l   
   630B 36 00         [10]  948     ld      (hl),  #0x00
   630D 2C            [ 4]  949     inc l
   630E 36 31         [10]  950     ld      (hl),  #0x31
                            951 
                            952     ;;Linea 13
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 22.
Hexadecimal [16-Bits]



   6310 11 00 C0      [10]  953     ld      de, #0xC000      
   6313 DD 4E 00      [19]  954     ld      c,  entity_x(ix)        
   6316 DD 7E 01      [19]  955     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6319 C6 04         [ 7]  956     add a, #4
   631B 47            [ 4]  957     ld b, a
   631C CD 6C B0      [17]  958     call cpct_getScreenPtr_asm
   631F 36 32         [10]  959     ld      (hl),  #0x32
   6321 2C            [ 4]  960     inc l   
   6322 36 C0         [10]  961     ld      (hl),  #0xC0
   6324 2C            [ 4]  962     inc l
   6325 36 11         [10]  963     ld      (hl),  #0x11
                            964     ;;Linea 14
   6327 11 00 C0      [10]  965     ld      de, #0xC000      
   632A DD 4E 00      [19]  966     ld      c,  entity_x(ix)        
   632D DD 7E 01      [19]  967     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6330 C6 03         [ 7]  968     add a, #3
   6332 47            [ 4]  969     ld b, a
   6333 CD 6C B0      [17]  970     call cpct_getScreenPtr_asm
   6336 36 76         [10]  971     ld      (hl),  #0x76
   6338 2C            [ 4]  972     inc l   
   6339 36 80         [10]  973     ld      (hl),  #0x80
   633B 2C            [ 4]  974     inc l
   633C 36 31         [10]  975     ld      (hl),  #0x31
                            976 
                            977     ;;Linea 15
   633E 11 00 C0      [10]  978     ld      de, #0xC000      
   6341 DD 4E 00      [19]  979     ld      c,  entity_x(ix)        
   6344 DD 7E 01      [19]  980     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6347 C6 02         [ 7]  981     add a, #2
   6349 47            [ 4]  982     ld b, a
   634A CD 6C B0      [17]  983     call cpct_getScreenPtr_asm
   634D 36 76         [10]  984     ld      (hl),  #0x76
   634F 2C            [ 4]  985     inc l   
   6350 36 00         [10]  986     ld      (hl),  #0x00
   6352 2C            [ 4]  987     inc l
   6353 36 F1         [10]  988     ld      (hl),  #0xF1
                            989 
                            990     ;;Linea 16
   6355 11 00 C0      [10]  991     ld      de, #0xC000      
   6358 DD 4E 00      [19]  992     ld      c,  entity_x(ix)        
   635B DD 7E 01      [19]  993     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   635E C6 01         [ 7]  994     add a, #1
   6360 47            [ 4]  995     ld b, a
   6361 CD 6C B0      [17]  996     call cpct_getScreenPtr_asm
   6364 36 33         [10]  997     ld      (hl),  #0x33
   6366 2C            [ 4]  998     inc l   
   6367 36 00         [10]  999     ld      (hl),  #0x00
   6369 2C            [ 4] 1000     inc l
   636A 36 62         [10] 1001     ld      (hl),  #0x62
                           1002 
                           1003     ;;Linea 17
   636C 11 00 C0      [10] 1004     ld      de, #0xC000      
   636F DD 4E 00      [19] 1005     ld      c,  entity_x(ix)        
   6372 DD 46 01      [19] 1006     ld      b,  entity_y(ix)    
   6375 CD 6C B0      [17] 1007     call cpct_getScreenPtr_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 23.
Hexadecimal [16-Bits]



   6378 36 11         [10] 1008     ld      (hl),  #0x11
   637A 2C            [ 4] 1009     inc l   
   637B 36 00         [10] 1010     ld      (hl),  #0x00
   637D 2C            [ 4] 1011     inc l
   637E 36 66         [10] 1012     ld      (hl),  #0x66
                           1013 
   6380 C9            [10] 1014     ret
                           1015 
   6381                    1016     pintarCrocoPos7::
                           1017 ;;COCODRILO ABIERTO 
                           1018     ;;Linea ultima
   6381 11 00 C0      [10] 1019     ld      de, #0xC000       ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   6384 DD 21 26 40   [14] 1020     ld ix, #crocodile 
   6388 DD 4E 00      [19] 1021     ld      c,  entity_x(ix)        ;;Coordenada X (tamaño en ancho)
   638B DD 7E 01      [19] 1022     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   638E C6 10         [ 7] 1023     add a, #16
   6390 47            [ 4] 1024     ld b, a
   6391 CD 6C B0      [17] 1025     call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
   6394 36 FF         [10] 1026     ld      (hl),  #0xFF
   6396 2C            [ 4] 1027     inc l   
   6397 36 FF         [10] 1028     ld      (hl),  #0xFF
   6399 2C            [ 4] 1029     inc l
   639A 36 00         [10] 1030     ld      (hl),  #0x00
                           1031 
                           1032     ;;Linea penultima
   639C 11 00 C0      [10] 1033     ld      de, #0xC000      
   639F DD 4E 00      [19] 1034     ld      c,  entity_x(ix)        
   63A2 DD 7E 01      [19] 1035     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   63A5 C6 0F         [ 7] 1036     add a, #15
   63A7 47            [ 4] 1037     ld b, a
   63A8 CD 6C B0      [17] 1038     call cpct_getScreenPtr_asm
   63AB 36 FF         [10] 1039     ld      (hl),  #0xFF
   63AD 2C            [ 4] 1040     inc l   
   63AE 36 FF         [10] 1041     ld      (hl),  #0xFF
   63B0 2C            [ 4] 1042     inc l
   63B1 36 00         [10] 1043     ld      (hl),  #0x00
                           1044 
                           1045     ;;Linea 3
   63B3 11 00 C0      [10] 1046     ld      de, #0xC000      
   63B6 DD 4E 00      [19] 1047     ld      c,  entity_x(ix)        
   63B9 DD 7E 01      [19] 1048     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   63BC C6 0E         [ 7] 1049     add a, #14
   63BE 47            [ 4] 1050     ld b, a
                           1051     ;;sub   #2
                           1052     ;;ld b, a
   63BF CD 6C B0      [17] 1053     call cpct_getScreenPtr_asm
   63C2 36 FF         [10] 1054     ld      (hl),  #0xFF
   63C4 2C            [ 4] 1055     inc l   
   63C5 36 FF         [10] 1056     ld      (hl),  #0xFF
   63C7 2C            [ 4] 1057     inc l
   63C8 36 00         [10] 1058     ld      (hl),  #0x00
                           1059 
                           1060     ;;Linea 4
   63CA 11 00 C0      [10] 1061     ld      de, #0xC000      
   63CD DD 4E 00      [19] 1062     ld      c,  entity_x(ix)        
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 24.
Hexadecimal [16-Bits]



   63D0 DD 7E 01      [19] 1063     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   63D3 C6 0D         [ 7] 1064     add a, #13
   63D5 47            [ 4] 1065     ld b, a
   63D6 CD 6C B0      [17] 1066     call cpct_getScreenPtr_asm
   63D9 36 66         [10] 1067     ld      (hl),  #0x66
   63DB 2C            [ 4] 1068     inc l   
   63DC 36 11         [10] 1069     ld      (hl),  #0x11
   63DE 2C            [ 4] 1070     inc l
   63DF 36 00         [10] 1071     ld      (hl),  #0x00
                           1072 
                           1073     ;;Linea 5
   63E1 11 00 C0      [10] 1074     ld      de, #0xC000      
   63E4 DD 4E 00      [19] 1075     ld      c,  entity_x(ix)        
   63E7 DD 7E 01      [19] 1076     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   63EA C6 0C         [ 7] 1077     add a, #12
   63EC 47            [ 4] 1078     ld b, a
   63ED CD 6C B0      [17] 1079     call cpct_getScreenPtr_asm
   63F0 36 76         [10] 1080     ld      (hl),  #0x76
   63F2 2C            [ 4] 1081     inc l   
   63F3 36 00         [10] 1082     ld      (hl),  #0x00
   63F5 2C            [ 4] 1083     inc l
   63F6 36 88         [10] 1084     ld      (hl),  #0x88
                           1085 
                           1086     ;;Linea 6
   63F8 11 00 C0      [10] 1087     ld      de, #0xC000      
   63FB DD 4E 00      [19] 1088     ld      c,  entity_x(ix)        
   63FE DD 7E 01      [19] 1089     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6401 C6 0B         [ 7] 1090     add a, #11
   6403 47            [ 4] 1091     ld b, a
   6404 CD 6C B0      [17] 1092     call cpct_getScreenPtr_asm
   6407 36 76         [10] 1093     ld      (hl),  #0x76
   6409 2C            [ 4] 1094     inc l   
   640A 36 80         [10] 1095     ld      (hl),  #0x80
   640C 2C            [ 4] 1096     inc l
   640D 36 C4         [10] 1097     ld      (hl),  #0xC4
                           1098 
                           1099     ;;Linea 7
   640F 11 00 C0      [10] 1100     ld      de, #0xC000      
   6412 DD 4E 00      [19] 1101     ld      c,  entity_x(ix)        
   6415 DD 7E 01      [19] 1102     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6418 C6 0A         [ 7] 1103     add a, #10
   641A 47            [ 4] 1104     ld b, a
   641B CD 6C B0      [17] 1105     call cpct_getScreenPtr_asm
   641E 36 F2         [10] 1106     ld      (hl),  #0xF2
   6420 2C            [ 4] 1107     inc l   
   6421 36 D0         [10] 1108     ld      (hl),  #0xD0
   6423 2C            [ 4] 1109     inc l
   6424 36 E2         [10] 1110     ld      (hl),  #0xE2
                           1111 
                           1112     ;;Linea 8
   6426 11 00 C0      [10] 1113     ld      de, #0xC000      
   6429 DD 4E 00      [19] 1114     ld      c,  entity_x(ix)        
   642C DD 7E 01      [19] 1115     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   642F C6 09         [ 7] 1116     add a, #9
   6431 47            [ 4] 1117     ld b, a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 25.
Hexadecimal [16-Bits]



   6432 CD 6C B0      [17] 1118     call cpct_getScreenPtr_asm
   6435 36 A2         [10] 1119     ld      (hl),  #0xA2
   6437 2C            [ 4] 1120     inc l   
   6438 36 00         [10] 1121     ld      (hl),  #0x00
   643A 2C            [ 4] 1122     inc l
   643B 36 62         [10] 1123     ld      (hl),  #0x62
                           1124 
                           1125     ;;Linea 9
   643D 11 00 C0      [10] 1126     ld      de, #0xC000      
   6440 DD 4E 00      [19] 1127     ld      c,  entity_x(ix)        
   6443 DD 7E 01      [19] 1128     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6446 C6 08         [ 7] 1129     add a, #8
   6448 47            [ 4] 1130     ld b, a
   6449 CD 6C B0      [17] 1131     call cpct_getScreenPtr_asm
   644C 36 76         [10] 1132     ld      (hl),  #0x76
   644E 2C            [ 4] 1133     inc l   
   644F 36 00         [10] 1134     ld      (hl),  #0x00
   6451 2C            [ 4] 1135     inc l
   6452 36 11         [10] 1136     ld      (hl),  #0x11
                           1137 
                           1138     ;;Linea 10
   6454 11 00 C0      [10] 1139     ld      de, #0xC000      
   6457 DD 4E 00      [19] 1140     ld      c,  entity_x(ix)        
   645A DD 7E 01      [19] 1141     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   645D C6 07         [ 7] 1142     add a, #7
   645F 47            [ 4] 1143     ld b, a
   6460 CD 6C B0      [17] 1144     call cpct_getScreenPtr_asm
   6463 36 32         [10] 1145     ld      (hl),  #0x32
   6465 2C            [ 4] 1146     inc l   
   6466 36 80         [10] 1147     ld      (hl),  #0x80
   6468 2C            [ 4] 1148     inc l
   6469 36 31         [10] 1149     ld      (hl),  #0x31
                           1150 
                           1151     ;;Linea 11
   646B 11 00 C0      [10] 1152     ld      de, #0xC000      
   646E DD 4E 00      [19] 1153     ld      c,  entity_x(ix)        
   6471 DD 7E 01      [19] 1154     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6474 C6 06         [ 7] 1155     add a, #6
   6476 47            [ 4] 1156     ld b, a
   6477 CD 6C B0      [17] 1157     call cpct_getScreenPtr_asm
   647A 36 32         [10] 1158     ld      (hl),  #0x32
   647C 2C            [ 4] 1159     inc l   
   647D 36 00         [10] 1160     ld      (hl),  #0x00
   647F 2C            [ 4] 1161     inc l
   6480 36 71         [10] 1162     ld      (hl),  #0x71
                           1163 
                           1164     ;;Linea 12
   6482 11 00 C0      [10] 1165     ld      de, #0xC000      
   6485 DD 4E 00      [19] 1166     ld      c,  entity_x(ix)        
   6488 DD 7E 01      [19] 1167     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   648B C6 05         [ 7] 1168     add a, #5
   648D 47            [ 4] 1169     ld b, a
   648E CD 6C B0      [17] 1170     call cpct_getScreenPtr_asm
   6491 36 22         [10] 1171     ld      (hl),  #0x22
   6493 2C            [ 4] 1172     inc l   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 26.
Hexadecimal [16-Bits]



   6494 36 00         [10] 1173     ld      (hl),  #0x00
   6496 2C            [ 4] 1174     inc l
   6497 36 31         [10] 1175     ld      (hl),  #0x31
                           1176 
                           1177     ;;Linea 13
   6499 11 00 C0      [10] 1178     ld      de, #0xC000      
   649C DD 4E 00      [19] 1179     ld      c,  entity_x(ix)        
   649F DD 7E 01      [19] 1180     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   64A2 C6 04         [ 7] 1181     add a, #4
   64A4 47            [ 4] 1182     ld b, a
   64A5 CD 6C B0      [17] 1183     call cpct_getScreenPtr_asm
   64A8 36 32         [10] 1184     ld      (hl),  #0x32
   64AA 2C            [ 4] 1185     inc l   
   64AB 36 C0         [10] 1186     ld      (hl),  #0xC0
   64AD 2C            [ 4] 1187     inc l
   64AE 36 11         [10] 1188     ld      (hl),  #0x11
                           1189     ;;Linea 14
   64B0 11 00 C0      [10] 1190     ld      de, #0xC000      
   64B3 DD 4E 00      [19] 1191     ld      c,  entity_x(ix)        
   64B6 DD 7E 01      [19] 1192     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   64B9 C6 03         [ 7] 1193     add a, #3
   64BB 47            [ 4] 1194     ld b, a
   64BC CD 6C B0      [17] 1195     call cpct_getScreenPtr_asm
   64BF 36 76         [10] 1196     ld      (hl),  #0x76
   64C1 2C            [ 4] 1197     inc l   
   64C2 36 80         [10] 1198     ld      (hl),  #0x80
   64C4 2C            [ 4] 1199     inc l
   64C5 36 31         [10] 1200     ld      (hl),  #0x31
                           1201 
                           1202     ;;Linea 15
   64C7 11 00 C0      [10] 1203     ld      de, #0xC000      
   64CA DD 4E 00      [19] 1204     ld      c,  entity_x(ix)        
   64CD DD 7E 01      [19] 1205     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   64D0 C6 02         [ 7] 1206     add a, #2
   64D2 47            [ 4] 1207     ld b, a
   64D3 CD 6C B0      [17] 1208     call cpct_getScreenPtr_asm
   64D6 36 76         [10] 1209     ld      (hl),  #0x76
   64D8 2C            [ 4] 1210     inc l   
   64D9 36 00         [10] 1211     ld      (hl),  #0x00
   64DB 2C            [ 4] 1212     inc l
   64DC 36 F1         [10] 1213     ld      (hl),  #0xF1
                           1214 
                           1215     ;;Linea 16
   64DE 11 00 C0      [10] 1216     ld      de, #0xC000      
   64E1 DD 4E 00      [19] 1217     ld      c,  entity_x(ix)        
   64E4 DD 7E 01      [19] 1218     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   64E7 C6 01         [ 7] 1219     add a, #1
   64E9 47            [ 4] 1220     ld b, a
   64EA CD 6C B0      [17] 1221     call cpct_getScreenPtr_asm
   64ED 36 33         [10] 1222     ld      (hl),  #0x33
   64EF 2C            [ 4] 1223     inc l   
   64F0 36 00         [10] 1224     ld      (hl),  #0x00
   64F2 2C            [ 4] 1225     inc l
   64F3 36 62         [10] 1226     ld      (hl),  #0x62
                           1227 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 27.
Hexadecimal [16-Bits]



                           1228     ;;Linea 17
   64F5 11 00 C0      [10] 1229     ld      de, #0xC000      
   64F8 DD 4E 00      [19] 1230     ld      c,  entity_x(ix)        
   64FB DD 46 01      [19] 1231     ld      b,  entity_y(ix)    
   64FE CD 6C B0      [17] 1232     call cpct_getScreenPtr_asm
   6501 36 11         [10] 1233     ld      (hl),  #0x11
   6503 2C            [ 4] 1234     inc l   
   6504 36 00         [10] 1235     ld      (hl),  #0x00
   6506 2C            [ 4] 1236     inc l
   6507 36 66         [10] 1237     ld      (hl),  #0x66
                           1238 
   6509 C9            [10] 1239     ret
                           1240 
                           1241 
                           1242 
                           1243 
                           1244 
                           1245 
                           1246 
                           1247 
                           1248 
                           1249     ;;Borrar
   650A                    1250     borrarCrocoPos1::
                           1251 ;;COCODRILO ABIERTO 
                           1252     ;;Linea ultima
                           1253     
                           1254     
                           1255     ;;Linea 13
   650A 11 00 C0      [10] 1256     ld      de, #0xC000      
   650D DD 4E 00      [19] 1257     ld      c,  entity_x(ix)        
   6510 DD 7E 01      [19] 1258     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6513 C6 04         [ 7] 1259     add a, #4
   6515 47            [ 4] 1260     ld b, a
   6516 CD 6C B0      [17] 1261     call cpct_getScreenPtr_asm
   6519 36 0F         [10] 1262     ld      (hl),  #0x0F
   651B 2C            [ 4] 1263     inc l   
   651C 36 0F         [10] 1264     ld      (hl),  #0x0F
   651E 2C            [ 4] 1265     inc l
   651F 36 0F         [10] 1266     ld      (hl),  #0x0F
                           1267     ;;Linea 14
   6521 11 00 C0      [10] 1268     ld      de, #0xC000      
   6524 DD 4E 00      [19] 1269     ld      c,  entity_x(ix)        
   6527 DD 7E 01      [19] 1270     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   652A C6 03         [ 7] 1271     add a, #3
   652C 47            [ 4] 1272     ld b, a
   652D CD 6C B0      [17] 1273     call cpct_getScreenPtr_asm
   6530 36 0F         [10] 1274     ld      (hl),  #0x0F
   6532 2C            [ 4] 1275     inc l   
   6533 36 0F         [10] 1276     ld      (hl),  #0x0F
   6535 2C            [ 4] 1277     inc l
   6536 36 0F         [10] 1278     ld      (hl),  #0x0F
                           1279 
                           1280     ;;Linea 15
   6538 11 00 C0      [10] 1281     ld      de, #0xC000      
   653B DD 4E 00      [19] 1282     ld      c,  entity_x(ix)        
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 28.
Hexadecimal [16-Bits]



   653E DD 7E 01      [19] 1283     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6541 C6 02         [ 7] 1284     add a, #2
   6543 47            [ 4] 1285     ld b, a
   6544 CD 6C B0      [17] 1286     call cpct_getScreenPtr_asm
   6547 36 0F         [10] 1287     ld      (hl),  #0x0F
   6549 2C            [ 4] 1288     inc l   
   654A 36 0F         [10] 1289     ld      (hl),  #0x0F
   654C 2C            [ 4] 1290     inc l
   654D 36 0F         [10] 1291     ld      (hl),  #0x0F
                           1292 
                           1293     ;;Linea 16
   654F 11 00 C0      [10] 1294     ld      de, #0xC000      
   6552 DD 4E 00      [19] 1295     ld      c,  entity_x(ix)        
   6555 DD 7E 01      [19] 1296     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6558 C6 01         [ 7] 1297     add a, #1
   655A 47            [ 4] 1298     ld b, a
   655B CD 6C B0      [17] 1299     call cpct_getScreenPtr_asm
   655E 36 0F         [10] 1300     ld      (hl),  #0x0F
   6560 2C            [ 4] 1301     inc l   
   6561 36 0F         [10] 1302     ld      (hl),  #0x0F
   6563 2C            [ 4] 1303     inc l
   6564 36 0F         [10] 1304     ld      (hl),  #0x0F
                           1305 
                           1306     ;;Linea 17
   6566 11 00 C0      [10] 1307     ld      de, #0xC000      
   6569 DD 4E 00      [19] 1308     ld      c,  entity_x(ix)        
   656C DD 46 01      [19] 1309     ld      b,  entity_y(ix)    
   656F CD 6C B0      [17] 1310     call cpct_getScreenPtr_asm
   6572 36 0F         [10] 1311     ld      (hl),  #0x0F
   6574 2C            [ 4] 1312     inc l   
   6575 36 0F         [10] 1313     ld      (hl),  #0x0F
   6577 2C            [ 4] 1314     inc l
   6578 36 0F         [10] 1315     ld      (hl),  #0x0F
                           1316 
   657A C9            [10] 1317     ret
                           1318 
   657B                    1319     borrarCrocoPos2::
                           1320 
                           1321 
   657B C9            [10] 1322     ret
                           1323 
   657C                    1324     borrarCrocoPos3::
                           1325 
   657C C9            [10] 1326     ret
                           1327 
                           1328 
   657D                    1329     borrarCrocoPos4::
                           1330 
   657D C9            [10] 1331     ret
                           1332 
                           1333 
   657E                    1334     borrarCrocoPos5::
                           1335 
                           1336     ;;Linea 12
   657E 11 00 C0      [10] 1337     ld      de, #0xC000      
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 29.
Hexadecimal [16-Bits]



   6581 DD 4E 00      [19] 1338     ld      c,  entity_x(ix)        
   6584 DD 7E 01      [19] 1339     ld      a,  entity_y(ix) 
   6587 06 08         [ 7] 1340     ld b, #8
   6589 90            [ 4] 1341     sub b
   658A 47            [ 4] 1342     ld b, a   
   658B CD 6C B0      [17] 1343     call cpct_getScreenPtr_asm
   658E 36 00         [10] 1344     ld      (hl),  #0x00
   6590 2C            [ 4] 1345     inc l   
   6591 36 00         [10] 1346     ld      (hl),  #0x00
   6593 2C            [ 4] 1347     inc l
   6594 36 00         [10] 1348     ld      (hl),  #0x00
                           1349 
                           1350     ;;Linea 13
   6596 11 00 C0      [10] 1351     ld      de, #0xC000      
   6599 DD 4E 00      [19] 1352     ld      c,  entity_x(ix)        
   659C DD 7E 01      [19] 1353     ld      a,  entity_y(ix) 
   659F 06 09         [ 7] 1354     ld b, #9
   65A1 90            [ 4] 1355     sub b
   65A2 47            [ 4] 1356     ld b, a   
   65A3 CD 6C B0      [17] 1357     call cpct_getScreenPtr_asm
   65A6 36 00         [10] 1358     ld      (hl),  #0x00
   65A8 2C            [ 4] 1359     inc l   
   65A9 36 00         [10] 1360     ld      (hl),  #0x00
   65AB 2C            [ 4] 1361     inc l
   65AC 36 00         [10] 1362     ld      (hl),  #0x00
                           1363 
                           1364     ;;Linea 14
   65AE 11 00 C0      [10] 1365     ld      de, #0xC000      
   65B1 DD 4E 00      [19] 1366     ld      c,  entity_x(ix)        
   65B4 DD 7E 01      [19] 1367     ld      a,  entity_y(ix) 
   65B7 06 0A         [ 7] 1368     ld b, #10
   65B9 90            [ 4] 1369     sub b
   65BA 47            [ 4] 1370     ld b, a   
   65BB CD 6C B0      [17] 1371     call cpct_getScreenPtr_asm
   65BE 36 00         [10] 1372     ld      (hl),  #0x00
   65C0 2C            [ 4] 1373     inc l   
   65C1 36 00         [10] 1374     ld      (hl),  #0x00
   65C3 2C            [ 4] 1375     inc l
   65C4 36 00         [10] 1376     ld      (hl),  #0x00
                           1377 
                           1378     ;;Linea 15
   65C6 11 00 C0      [10] 1379     ld      de, #0xC000      
   65C9 DD 4E 00      [19] 1380     ld      c,  entity_x(ix)        
   65CC DD 7E 01      [19] 1381     ld      a,  entity_y(ix) 
   65CF 06 0B         [ 7] 1382     ld b, #11
   65D1 90            [ 4] 1383     sub b
   65D2 47            [ 4] 1384     ld b, a   
   65D3 CD 6C B0      [17] 1385     call cpct_getScreenPtr_asm
   65D6 36 00         [10] 1386     ld      (hl),  #0x00
   65D8 2C            [ 4] 1387     inc l   
   65D9 36 00         [10] 1388     ld      (hl),  #0x00
   65DB 2C            [ 4] 1389     inc l
   65DC 36 00         [10] 1390     ld      (hl),  #0x00
                           1391 
                           1392     ;;Linea 16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 30.
Hexadecimal [16-Bits]



   65DE 11 00 C0      [10] 1393     ld      de, #0xC000      
   65E1 DD 4E 00      [19] 1394     ld      c,  entity_x(ix)        
   65E4 DD 7E 01      [19] 1395     ld      a,  entity_y(ix) 
   65E7 06 0C         [ 7] 1396     ld b, #12
   65E9 90            [ 4] 1397     sub b
   65EA 47            [ 4] 1398     ld b, a   
   65EB CD 6C B0      [17] 1399     call cpct_getScreenPtr_asm
   65EE 36 00         [10] 1400     ld      (hl),  #0x00
   65F0 2C            [ 4] 1401     inc l   
   65F1 36 00         [10] 1402     ld      (hl),  #0x00
   65F3 2C            [ 4] 1403     inc l
   65F4 36 00         [10] 1404     ld      (hl),  #0x00
                           1405 
                           1406     ;;Linea 17
   65F6 11 00 C0      [10] 1407     ld      de, #0xC000      
   65F9 DD 4E 00      [19] 1408     ld      c,  entity_x(ix)        
   65FC DD 7E 01      [19] 1409     ld      a,  entity_y(ix) 
   65FF 06 0D         [ 7] 1410     ld b, #13
   6601 90            [ 4] 1411     sub b
   6602 47            [ 4] 1412     ld b, a       
   6603 CD 6C B0      [17] 1413     call cpct_getScreenPtr_asm
   6606 36 00         [10] 1414     ld      (hl),  #0x00
   6608 2C            [ 4] 1415     inc l   
   6609 36 00         [10] 1416     ld      (hl),  #0x00
   660B 2C            [ 4] 1417     inc l
   660C 36 00         [10] 1418     ld      (hl),  #0x00
                           1419 
                           1420 
                           1421     
                           1422 
   660E C9            [10] 1423     ret
                           1424 
                           1425 
   660F                    1426     borrarCrocoPos6::
                           1427     ;;Linea 12
   660F 11 00 C0      [10] 1428     ld      de, #0xC000      
   6612 DD 4E 00      [19] 1429     ld      c,  entity_x(ix)        
   6615 DD 7E 01      [19] 1430     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6618 06 02         [ 7] 1431     ld b, #2
   661A 90            [ 4] 1432     sub b
   661B 47            [ 4] 1433     ld b, a  
   661C CD 6C B0      [17] 1434     call cpct_getScreenPtr_asm
   661F 36 00         [10] 1435     ld      (hl),  #0x00
   6621 2C            [ 4] 1436     inc l   
   6622 36 00         [10] 1437     ld      (hl),  #0x00
   6624 2C            [ 4] 1438     inc l
   6625 36 00         [10] 1439     ld      (hl),  #0x00
                           1440 ;;Linea 13
   6627 11 00 C0      [10] 1441     ld      de, #0xC000      
   662A DD 4E 00      [19] 1442     ld      c,  entity_x(ix)        
   662D DD 7E 01      [19] 1443     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6630 06 03         [ 7] 1444     ld b, #3
   6632 90            [ 4] 1445     sub b
   6633 47            [ 4] 1446     ld b, a  
   6634 CD 6C B0      [17] 1447     call cpct_getScreenPtr_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 31.
Hexadecimal [16-Bits]



   6637 36 0F         [10] 1448     ld      (hl),  #0x0F
   6639 2C            [ 4] 1449     inc l   
   663A 36 0F         [10] 1450     ld      (hl),  #0x0F
   663C 2C            [ 4] 1451     inc l
   663D 36 0F         [10] 1452     ld      (hl),  #0x0F
                           1453     ;;Linea 14
   663F 11 00 C0      [10] 1454     ld      de, #0xC000      
   6642 DD 4E 00      [19] 1455     ld      c,  entity_x(ix)        
   6645 DD 7E 01      [19] 1456     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6648 06 04         [ 7] 1457     ld b, #4
   664A 90            [ 4] 1458     sub b
   664B 47            [ 4] 1459     ld b, a  
   664C CD 6C B0      [17] 1460     call cpct_getScreenPtr_asm
   664F 36 00         [10] 1461     ld      (hl),  #0x00
   6651 2C            [ 4] 1462     inc l   
   6652 36 00         [10] 1463     ld      (hl),  #0x00
   6654 2C            [ 4] 1464     inc l
   6655 36 00         [10] 1465     ld      (hl),  #0x00
                           1466 
                           1467     ;;Linea 15
   6657 11 00 C0      [10] 1468     ld      de, #0xC000      
   665A DD 4E 00      [19] 1469     ld      c,  entity_x(ix)        
   665D DD 7E 01      [19] 1470     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6660 06 05         [ 7] 1471     ld b, #5
   6662 90            [ 4] 1472     sub b
   6663 47            [ 4] 1473     ld b, a  
   6664 CD 6C B0      [17] 1474     call cpct_getScreenPtr_asm
   6667 36 00         [10] 1475     ld      (hl),  #0x00
   6669 2C            [ 4] 1476     inc l   
   666A 36 00         [10] 1477     ld      (hl),  #0x00
   666C 2C            [ 4] 1478     inc l
   666D 36 00         [10] 1479     ld      (hl),  #0x00
                           1480 
                           1481     ;;Linea 16
   666F 11 00 C0      [10] 1482     ld      de, #0xC000      
   6672 DD 4E 00      [19] 1483     ld      c,  entity_x(ix)        
   6675 DD 7E 01      [19] 1484     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6678 06 06         [ 7] 1485     ld b, #6
   667A 90            [ 4] 1486     sub b
   667B 47            [ 4] 1487     ld b, a  
   667C CD 6C B0      [17] 1488     call cpct_getScreenPtr_asm
   667F 36 00         [10] 1489     ld      (hl),  #0x00
   6681 2C            [ 4] 1490     inc l   
   6682 36 00         [10] 1491     ld      (hl),  #0x00
   6684 2C            [ 4] 1492     inc l
   6685 36 00         [10] 1493     ld      (hl),  #0x00
                           1494 
                           1495     ;;Linea 17
   6687 11 00 C0      [10] 1496     ld      de, #0xC000      
   668A DD 4E 00      [19] 1497     ld      c,  entity_x(ix)        
   668D DD 7E 01      [19] 1498     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6690 06 07         [ 7] 1499     ld b, #7
   6692 90            [ 4] 1500     sub b
   6693 47            [ 4] 1501     ld b, a  
   6694 CD 6C B0      [17] 1502     call cpct_getScreenPtr_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 32.
Hexadecimal [16-Bits]



   6697 36 00         [10] 1503     ld      (hl),  #0x00
   6699 2C            [ 4] 1504     inc l   
   669A 36 00         [10] 1505     ld      (hl),  #0x00
   669C 2C            [ 4] 1506     inc l
   669D 36 00         [10] 1507     ld      (hl),  #0x00
                           1508 
   669F C9            [10] 1509     ret
                           1510 
                           1511 
   66A0                    1512     borrarCrocoPos7::
                           1513 ;;Linea 12
   66A0 11 00 C0      [10] 1514     ld      de, #0xC000      
   66A3 DD 4E 00      [19] 1515     ld      c,  entity_x(ix)        
   66A6 DD 7E 01      [19] 1516     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   66A9 C6 03         [ 7] 1517     add a, #3
   66AB 47            [ 4] 1518     ld b, a
   66AC CD 6C B0      [17] 1519     call cpct_getScreenPtr_asm
   66AF 36 00         [10] 1520     ld      (hl),  #0x00
   66B1 2C            [ 4] 1521     inc l   
   66B2 36 00         [10] 1522     ld      (hl),  #0x00
   66B4 2C            [ 4] 1523     inc l
   66B5 36 00         [10] 1524     ld      (hl),  #0x00
                           1525 
                           1526     ;;Linea 13
   66B7 11 00 C0      [10] 1527     ld      de, #0xC000      
   66BA DD 4E 00      [19] 1528     ld      c,  entity_x(ix)        
   66BD DD 7E 01      [19] 1529     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   66C0 C6 02         [ 7] 1530     add a, #2
   66C2 47            [ 4] 1531     ld b, a
   66C3 CD 6C B0      [17] 1532     call cpct_getScreenPtr_asm
   66C6 36 00         [10] 1533     ld      (hl),  #0x00
   66C8 2C            [ 4] 1534     inc l   
   66C9 36 00         [10] 1535     ld      (hl),  #0x00
   66CB 2C            [ 4] 1536     inc l
   66CC 36 00         [10] 1537     ld      (hl),  #0x00
                           1538     ;;Linea 14
   66CE 11 00 C0      [10] 1539     ld      de, #0xC000      
   66D1 DD 4E 00      [19] 1540     ld      c,  entity_x(ix)        
   66D4 DD 7E 01      [19] 1541     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   66D7 C6 01         [ 7] 1542     add a, #1
   66D9 47            [ 4] 1543     ld b, a
   66DA CD 6C B0      [17] 1544     call cpct_getScreenPtr_asm
   66DD 36 00         [10] 1545     ld      (hl),  #0x00
   66DF 2C            [ 4] 1546     inc l   
   66E0 36 00         [10] 1547     ld      (hl),  #0x00
   66E2 2C            [ 4] 1548     inc l
   66E3 36 00         [10] 1549     ld      (hl),  #0x00
                           1550 
                           1551     ;;Linea 15
   66E5 11 00 C0      [10] 1552     ld      de, #0xC000      
   66E8 DD 4E 00      [19] 1553     ld      c,  entity_x(ix)        
   66EB DD 7E 01      [19] 1554     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   66EE 47            [ 4] 1555     ld b, a
   66EF CD 6C B0      [17] 1556     call cpct_getScreenPtr_asm
   66F2 36 00         [10] 1557     ld      (hl),  #0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 33.
Hexadecimal [16-Bits]



   66F4 2C            [ 4] 1558     inc l   
   66F5 36 00         [10] 1559     ld      (hl),  #0x00
   66F7 2C            [ 4] 1560     inc l
   66F8 36 00         [10] 1561     ld      (hl),  #0x00
                           1562 
                           1563     ;;Linea 16
   66FA 11 00 C0      [10] 1564     ld      de, #0xC000      
   66FD DD 4E 00      [19] 1565     ld      c,  entity_x(ix)        
   6700 DD 7E 01      [19] 1566     ld      a,  entity_y(ix)         ;;Coordenada Y (tamaño en alto)
   6703 06 01         [ 7] 1567     ld b, #1
   6705 90            [ 4] 1568     sub b
   6706 47            [ 4] 1569     ld b, a 
   6707 CD 6C B0      [17] 1570     call cpct_getScreenPtr_asm
   670A 36 00         [10] 1571     ld      (hl),  #0x00
   670C 2C            [ 4] 1572     inc l   
   670D 36 00         [10] 1573     ld      (hl),  #0x00
   670F 2C            [ 4] 1574     inc l
   6710 36 00         [10] 1575     ld      (hl),  #0x00
                           1576 
                           1577     ;;Linea 17
   6712 11 00 C0      [10] 1578     ld      de, #0xC000      
   6715 DD 4E 00      [19] 1579     ld      c,  entity_x(ix)        
   6718 DD 7E 01      [19] 1580     ld      a,  entity_y(ix)
   671B 06 02         [ 7] 1581     ld b, #2
   671D 90            [ 4] 1582     sub b
   671E 47            [ 4] 1583     ld b, a     
   671F CD 6C B0      [17] 1584     call cpct_getScreenPtr_asm
   6722 36 00         [10] 1585     ld      (hl),  #0x00
   6724 2C            [ 4] 1586     inc l   
   6725 36 00         [10] 1587     ld      (hl),  #0x00
   6727 2C            [ 4] 1588     inc l
   6728 36 00         [10] 1589     ld      (hl),  #0x00
                           1590 
   672A C9            [10] 1591     ret
