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



                             18 ;;Funciones Globales
   AAAA                      19         pintarEspadaDerecha::
   AAAA CD 10 AB      [17]   20             call pintarPrimerPixeld
   AAAD CD 26 AB      [17]   21             call pintarSegundoPixeld
   AAB0 CD 3D AB      [17]   22             call pintarTercerPixeld
   AAB3 CD 55 AB      [17]   23             call pintarCuartoPixeld
   AAB6 CD 6E AB      [17]   24             call pintarQuintoPixeld
   AAB9 CD 88 AB      [17]   25             call pintarSextoPixeld
   AABC CD A3 AB      [17]   26             call pintarSeptimoPixeld
                             27 
                             28         
   AABF C9            [10]   29             ret
                             30         
   AAC0                      31         borrarEspadaDerecha::
   AAC0 CD BF AB      [17]   32             call borrarPrimerPixeld
   AAC3 CD D5 AB      [17]   33             call borrarSegundoPixeld
   AAC6 CD EC AB      [17]   34             call borrarTercerPixeld
   AAC9 CD 04 AC      [17]   35             call borrarCuartoPixeld
   AACC CD 1D AC      [17]   36             call borrarQuintoPixeld
   AACF CD 37 AC      [17]   37             call borrarSextoPixeld
   AAD2 CD 52 AC      [17]   38             call borrarSeptimoPixeld
   AAD5 C9            [10]   39             ret
                             40         
                             41         
                             42         
   AAD6                      43         pintarEspadaIzquierda::
   AAD6 CD 6E AC      [17]   44             call pintarPrimerPixeli
   AAD9 CD 85 AC      [17]   45             call pintarSegundoPixeli
   AADC CD 9D AC      [17]   46             call pintarTercerPixeli
   AADF CD B6 AC      [17]   47             call pintarCuartoPixeli
   AAE2 CD D0 AC      [17]   48             call pintarQuintoPixeli
   AAE5 CD EB AC      [17]   49             call pintarSextoPixeli
   AAE8 CD 07 AD      [17]   50             call pintarSeptimoPixeli
   AAEB C9            [10]   51             ret
   AAEC                      52         borrarEspadaIzquierda::
   AAEC CD 24 AD      [17]   53             call borrarPrimerPixeli
   AAEF CD 3B AD      [17]   54             call borrarSegundoPixeli
   AAF2 CD 53 AD      [17]   55             call borrarTercerPixeli
   AAF5 CD 6C AD      [17]   56             call borrarCuartoPixeli
   AAF8 CD 86 AD      [17]   57             call borrarQuintoPixeli
   AAFB CD A1 AD      [17]   58             call borrarSextoPixeli
   AAFE CD BD AD      [17]   59             call borrarSeptimoPixeli
   AB01 C9            [10]   60             ret
                             61         
                             62         
                             63 ;;Funciones locales       
   AB02                      64         cargarDatos:
                             65         
   AB02 DD 21 0A 40   [14]   66             ld ix, #espadaPos
   AB06 11 00 C0      [10]   67             ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   AB09 DD 4E 00      [19]   68             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   AB0C DD 46 01      [19]   69             ld      b,  entity_y(ix)  
   AB0F C9            [10]   70             ret
                             71 
                             72         
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                             73     ;;Der
   AB10                      74         pintarPrimerPixeld:
   AB10 CD 02 AB      [17]   75             call cargarDatos
   AB13 CD 6C B0      [17]   76             call cpct_getScreenPtr_asm
   AB16 2D            [ 4]   77             dec l
   AB17 36 00         [10]   78             ld (hl), #0x00
   AB19 2C            [ 4]   79             inc l
   AB1A 36 06         [10]   80             ld (hl), #0x06;;ld (hl), #0x0F
   AB1C 2C            [ 4]   81             inc l
   AB1D 36 00         [10]   82             ld (hl), #0x00;;ld (hl), #0x08
   AB1F 2C            [ 4]   83             inc l
   AB20 36 00         [10]   84             ld (hl), #0x00;;ld (hl), #0x0F
   AB22 2C            [ 4]   85             inc l
   AB23 36 00         [10]   86             ld (hl), #0x00;;ld (hl), #0x08
   AB25 C9            [10]   87             ret 
   AB26                      88         pintarSegundoPixeld:
   AB26 CD 02 AB      [17]   89             call cargarDatos
   AB29 04            [ 4]   90             inc b  
   AB2A CD 6C B0      [17]   91             call cpct_getScreenPtr_asm
   AB2D 2D            [ 4]   92             dec l
   AB2E 36 F8         [10]   93             ld (hl), #0xF8
   AB30 2C            [ 4]   94             inc l
   AB31 36 25         [10]   95             ld (hl), #0x25
   AB33 2C            [ 4]   96             inc l
   AB34 36 0F         [10]   97             ld (hl), #0x0F
   AB36 2C            [ 4]   98             inc l
   AB37 36 0F         [10]   99             ld (hl), #0x0F
   AB39 2C            [ 4]  100             inc l
   AB3A 36 08         [10]  101             ld (hl), #0x08
                            102             
   AB3C C9            [10]  103             ret
   AB3D                     104         pintarTercerPixeld:
   AB3D CD 02 AB      [17]  105             call cargarDatos
   AB40 04            [ 4]  106             inc b
   AB41 04            [ 4]  107             inc b  
   AB42 CD 6C B0      [17]  108             call cpct_getScreenPtr_asm
   AB45 2D            [ 4]  109             dec l
   AB46 36 DA         [10]  110             ld (hl), #0xDA
   AB48 2C            [ 4]  111             inc l
   AB49 36 A5         [10]  112             ld (hl), #0xA5;;ld (hl), #0x0F
   AB4B 2C            [ 4]  113             inc l
   AB4C 36 0F         [10]  114             ld (hl), #0x0F;;ld (hl), #0x08
   AB4E 2C            [ 4]  115             inc l
   AB4F 36 7F         [10]  116             ld (hl), #0x7F;;ld (hl), #0x0F
   AB51 2C            [ 4]  117             inc l
   AB52 36 0E         [10]  118             ld (hl), #0x0E;;ld (hl), #0x08
   AB54 C9            [10]  119             ret 
   AB55                     120         pintarCuartoPixeld:
   AB55 CD 02 AB      [17]  121             call cargarDatos
   AB58 04            [ 4]  122             inc b
   AB59 04            [ 4]  123             inc b
   AB5A 04            [ 4]  124             inc b  
   AB5B CD 6C B0      [17]  125             call cpct_getScreenPtr_asm
   AB5E 2D            [ 4]  126             dec l
   AB5F 36 8F         [10]  127             ld (hl), #0x8F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   AB61 2C            [ 4]  128             inc l
   AB62 36 2D         [10]  129             ld (hl), #0x2D
   AB64 2C            [ 4]  130             inc l
   AB65 36 EF         [10]  131             ld (hl), #0xEF
   AB67 2C            [ 4]  132             inc l
   AB68 36 FD         [10]  133             ld (hl), #0xFD
   AB6A 2C            [ 4]  134             inc l
   AB6B 36 8F         [10]  135             ld (hl), #0x8F
   AB6D C9            [10]  136             ret 
   AB6E                     137         pintarQuintoPixeld:
   AB6E CD 02 AB      [17]  138             call cargarDatos
   AB71 04            [ 4]  139             inc b
   AB72 04            [ 4]  140             inc b
   AB73 04            [ 4]  141             inc b 
   AB74 04            [ 4]  142             inc b 
   AB75 CD 6C B0      [17]  143             call cpct_getScreenPtr_asm
   AB78 2D            [ 4]  144             dec l
   AB79 36 DA         [10]  145             ld (hl), #0xDA
   AB7B 2C            [ 4]  146             inc l
   AB7C 36 A5         [10]  147             ld (hl), #0xA5;;ld (hl), #0x0F
   AB7E 2C            [ 4]  148             inc l
   AB7F 36 0F         [10]  149             ld (hl), #0x0F;;ld (hl), #0x08
   AB81 2C            [ 4]  150             inc l
   AB82 36 7F         [10]  151             ld (hl), #0x7F;;ld (hl), #0x0F
   AB84 2C            [ 4]  152             inc l
   AB85 36 0E         [10]  153             ld (hl), #0x0E;;ld (hl), #0x08
   AB87 C9            [10]  154             ret 
   AB88                     155         pintarSextoPixeld:
   AB88 CD 02 AB      [17]  156             call cargarDatos
   AB8B 04            [ 4]  157             inc b
   AB8C 04            [ 4]  158             inc b
   AB8D 04            [ 4]  159             inc b 
   AB8E 04            [ 4]  160             inc b 
   AB8F 04            [ 4]  161             inc b
   AB90 CD 6C B0      [17]  162             call cpct_getScreenPtr_asm
   AB93 2D            [ 4]  163             dec l
   AB94 36 F8         [10]  164             ld (hl), #0xF8
   AB96 2C            [ 4]  165             inc l
   AB97 36 25         [10]  166             ld (hl), #0x25
   AB99 2C            [ 4]  167             inc l
   AB9A 36 0F         [10]  168             ld (hl), #0x0F
   AB9C 2C            [ 4]  169             inc l
   AB9D 36 0F         [10]  170             ld (hl), #0x0F
   AB9F 2C            [ 4]  171             inc l
   ABA0 36 08         [10]  172             ld (hl), #0x08
   ABA2 C9            [10]  173             ret 
   ABA3                     174         pintarSeptimoPixeld:
   ABA3 CD 02 AB      [17]  175             call cargarDatos
   ABA6 04            [ 4]  176             inc b
   ABA7 04            [ 4]  177             inc b
   ABA8 04            [ 4]  178             inc b
   ABA9 04            [ 4]  179             inc b
   ABAA 04            [ 4]  180             inc b 
   ABAB 04            [ 4]  181             inc b 
   ABAC CD 6C B0      [17]  182             call cpct_getScreenPtr_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   ABAF 2D            [ 4]  183             dec l
   ABB0 36 00         [10]  184             ld (hl), #0x00
   ABB2 2C            [ 4]  185             inc l
   ABB3 36 06         [10]  186             ld (hl), #0x06;;ld (hl), #0x0F
   ABB5 2C            [ 4]  187             inc l
   ABB6 36 00         [10]  188             ld (hl), #0x00;;ld (hl), #0x08
   ABB8 2C            [ 4]  189             inc l
   ABB9 36 00         [10]  190             ld (hl), #0x00;;ld (hl), #0x0F
   ABBB 2C            [ 4]  191             inc l
   ABBC 36 00         [10]  192             ld (hl), #0x00;;ld (hl), #0x08
   ABBE C9            [10]  193             ret 
                            194         
                            195 
   ABBF                     196         borrarPrimerPixeld:
   ABBF CD 02 AB      [17]  197             call cargarDatos
   ABC2 CD 6C B0      [17]  198             call cpct_getScreenPtr_asm
   ABC5 2D            [ 4]  199             dec l
   ABC6 36 EE         [10]  200             ld (hl), #0xEE
   ABC8 2C            [ 4]  201             inc l
   ABC9 36 00         [10]  202             ld (hl), #0x00;;ld (hl), #0x0F
   ABCB 2C            [ 4]  203             inc l
   ABCC 36 00         [10]  204             ld (hl), #0x00;;ld (hl), #0x08
   ABCE 2C            [ 4]  205             inc l
   ABCF 36 00         [10]  206             ld (hl), #0x00;;ld (hl), #0x0F
   ABD1 2C            [ 4]  207             inc l
   ABD2 36 00         [10]  208             ld (hl), #0x00;;ld (hl), #0x08
   ABD4 C9            [10]  209             ret 
   ABD5                     210         borrarSegundoPixeld:
   ABD5 CD 02 AB      [17]  211             call cargarDatos
   ABD8 04            [ 4]  212             inc b  
   ABD9 CD 6C B0      [17]  213             call cpct_getScreenPtr_asm
   ABDC 2D            [ 4]  214             dec l
   ABDD 36 8E         [10]  215             ld (hl), #0x8E
   ABDF 2C            [ 4]  216             inc l
   ABE0 36 00         [10]  217             ld (hl), #0x00
   ABE2 2C            [ 4]  218             inc l
   ABE3 36 00         [10]  219             ld (hl), #0x00
   ABE5 2C            [ 4]  220             inc l
   ABE6 36 00         [10]  221             ld (hl), #0x00;;ld (hl), #0x0F
   ABE8 2C            [ 4]  222             inc l
   ABE9 36 00         [10]  223             ld (hl), #0x00;;ld (hl), #0x08
   ABEB C9            [10]  224             ret
   ABEC                     225         borrarTercerPixeld:
   ABEC CD 02 AB      [17]  226             call cargarDatos
   ABEF 04            [ 4]  227             inc b
   ABF0 04            [ 4]  228             inc b  
   ABF1 CD 6C B0      [17]  229             call cpct_getScreenPtr_asm
   ABF4 2D            [ 4]  230             dec l
   ABF5 36 CC         [10]  231             ld (hl), #0xCC
   ABF7 2C            [ 4]  232             inc l
   ABF8 36 00         [10]  233             ld (hl), #0x00;;ld (hl), #0x0F
   ABFA 2C            [ 4]  234             inc l
   ABFB 36 00         [10]  235             ld (hl), #0x00;;ld (hl), #0x08
   ABFD 2C            [ 4]  236             inc l
   ABFE 36 00         [10]  237             ld (hl), #0x00;;ld (hl), #0x0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   AC00 2C            [ 4]  238             inc l
   AC01 36 00         [10]  239             ld (hl), #0x00;;ld (hl), #0x08
   AC03 C9            [10]  240             ret 
   AC04                     241         borrarCuartoPixeld:
   AC04 CD 02 AB      [17]  242             call cargarDatos
   AC07 04            [ 4]  243             inc b
   AC08 04            [ 4]  244             inc b  
   AC09 04            [ 4]  245             inc b
   AC0A CD 6C B0      [17]  246             call cpct_getScreenPtr_asm
   AC0D 2D            [ 4]  247             dec l
   AC0E 36 EE         [10]  248             ld (hl), #0xEE
   AC10 2C            [ 4]  249             inc l
   AC11 36 00         [10]  250             ld (hl), #0x00;;ld (hl), #0x0F
   AC13 2C            [ 4]  251             inc l
   AC14 36 00         [10]  252             ld (hl), #0x00;;ld (hl), #0x08
   AC16 2C            [ 4]  253             inc l
   AC17 36 00         [10]  254             ld (hl), #0x00;;ld (hl), #0x0F
   AC19 2C            [ 4]  255             inc l
   AC1A 36 00         [10]  256             ld (hl), #0x00;;ld (hl), #0x08
   AC1C C9            [10]  257             ret 
   AC1D                     258         borrarQuintoPixeld:
   AC1D CD 02 AB      [17]  259             call cargarDatos
   AC20 04            [ 4]  260             inc b
   AC21 04            [ 4]  261             inc b  
   AC22 04            [ 4]  262             inc b
   AC23 04            [ 4]  263             inc b
   AC24 CD 6C B0      [17]  264             call cpct_getScreenPtr_asm
   AC27 2D            [ 4]  265             dec l
   AC28 36 2E         [10]  266             ld (hl), #0x2E
   AC2A 2C            [ 4]  267             inc l
   AC2B 36 00         [10]  268             ld (hl), #0x00;;ld (hl), #0x0F
   AC2D 2C            [ 4]  269             inc l
   AC2E 36 00         [10]  270             ld (hl), #0x00;;ld (hl), #0x08
   AC30 2C            [ 4]  271             inc l
   AC31 36 00         [10]  272             ld (hl), #0x00;;ld (hl), #0x0F
   AC33 2C            [ 4]  273             inc l
   AC34 36 00         [10]  274             ld (hl), #0x00;;ld (hl), #0x08
   AC36 C9            [10]  275             ret 
   AC37                     276         borrarSextoPixeld:
   AC37 CD 02 AB      [17]  277             call cargarDatos
   AC3A 04            [ 4]  278             inc b
   AC3B 04            [ 4]  279             inc b
   AC3C 04            [ 4]  280             inc b  
   AC3D 04            [ 4]  281             inc b
   AC3E 04            [ 4]  282             inc b
   AC3F CD 6C B0      [17]  283             call cpct_getScreenPtr_asm
   AC42 2D            [ 4]  284             dec l
   AC43 36 28         [10]  285             ld (hl), #0x28
   AC45 2C            [ 4]  286             inc l
   AC46 36 00         [10]  287             ld (hl), #0x00;;ld (hl), #0x0F
   AC48 2C            [ 4]  288             inc l
   AC49 36 00         [10]  289             ld (hl), #0x00;;ld (hl), #0x08
   AC4B 2C            [ 4]  290             inc l
   AC4C 36 00         [10]  291             ld (hl), #0x00;;ld (hl), #0x0F
   AC4E 2C            [ 4]  292             inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   AC4F 36 00         [10]  293             ld (hl), #0x00;;ld (hl), #0x08
   AC51 C9            [10]  294             ret 
   AC52                     295         borrarSeptimoPixeld:
   AC52 CD 02 AB      [17]  296             call cargarDatos
   AC55 04            [ 4]  297             inc b
   AC56 04            [ 4]  298             inc b
   AC57 04            [ 4]  299             inc b
   AC58 04            [ 4]  300             inc b
   AC59 04            [ 4]  301             inc b
   AC5A 04            [ 4]  302             inc b
   AC5B CD 6C B0      [17]  303             call cpct_getScreenPtr_asm
   AC5E 2D            [ 4]  304             dec l
   AC5F 36 42         [10]  305             ld (hl), #0x42
   AC61 2C            [ 4]  306             inc l
   AC62 36 00         [10]  307             ld (hl), #0x00;;ld (hl), #0x0F
   AC64 2C            [ 4]  308             inc l
   AC65 36 00         [10]  309             ld (hl), #0x00;;ld (hl), #0x08
   AC67 2C            [ 4]  310             inc l
   AC68 36 00         [10]  311             ld (hl), #0x00;;ld (hl), #0x0F
   AC6A 2C            [ 4]  312             inc l
   AC6B 36 00         [10]  313             ld (hl), #0x00;;ld (hl), #0x08
   AC6D C9            [10]  314             ret 
                            315     ;;IZQ
   AC6E                     316         pintarPrimerPixeli: 
                            317 
   AC6E CD 02 AB      [17]  318             call cargarDatos
   AC71 CD 6C B0      [17]  319             call cpct_getScreenPtr_asm
   AC74 2C            [ 4]  320             inc l
   AC75 2C            [ 4]  321             inc l
   AC76 36 00         [10]  322             ld (hl), #0x00
   AC78 2D            [ 4]  323             dec l
   AC79 36 06         [10]  324             ld (hl), #0x06;;ld (hl), #0x0F
   AC7B 2D            [ 4]  325             dec l
   AC7C 36 00         [10]  326             ld (hl), #0x00;;ld (hl), #0x08
   AC7E 2D            [ 4]  327             dec l
   AC7F 36 00         [10]  328             ld (hl), #0x00;;ld (hl), #0x0F
   AC81 2D            [ 4]  329             dec l
   AC82 36 00         [10]  330             ld (hl), #0x00;;ld (hl), #0x08
   AC84 C9            [10]  331             ret 
   AC85                     332         pintarSegundoPixeli:
   AC85 CD 02 AB      [17]  333             call cargarDatos
   AC88 04            [ 4]  334             inc b  
   AC89 CD 6C B0      [17]  335             call cpct_getScreenPtr_asm
   AC8C 2C            [ 4]  336             inc l
   AC8D 2C            [ 4]  337             inc l
   AC8E 36 F0         [10]  338             ld (hl), #0xF0
   AC90 2D            [ 4]  339             dec l
   AC91 36 4A         [10]  340             ld (hl), #0x4A
   AC93 2D            [ 4]  341             dec l
   AC94 36 0F         [10]  342             ld (hl), #0x0F
   AC96 2D            [ 4]  343             dec l
   AC97 36 0F         [10]  344             ld (hl), #0x0F
   AC99 2D            [ 4]  345             dec l
   AC9A 36 01         [10]  346             ld (hl), #0x01
   AC9C C9            [10]  347             ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   AC9D                     348         pintarTercerPixeli:
                            349 
   AC9D CD 02 AB      [17]  350             call cargarDatos
   ACA0 04            [ 4]  351             inc b
   ACA1 04            [ 4]  352             inc b
   ACA2 CD 6C B0      [17]  353             call cpct_getScreenPtr_asm
   ACA5 2C            [ 4]  354             inc l
   ACA6 2C            [ 4]  355             inc l
   ACA7 36 B5         [10]  356             ld (hl), #0xB5
   ACA9 2D            [ 4]  357             dec l
   ACAA 36 5A         [10]  358             ld (hl), #0x5A
   ACAC 2D            [ 4]  359             dec l
   ACAD 36 0F         [10]  360             ld (hl), #0x0F
   ACAF 2D            [ 4]  361             dec l
   ACB0 36 EF         [10]  362             ld (hl), #0xEF
   ACB2 2D            [ 4]  363             dec l
   ACB3 36 07         [10]  364             ld (hl), #0x07
   ACB5 C9            [10]  365             ret
                            366 
   ACB6                     367         pintarCuartoPixeli:
   ACB6 CD 02 AB      [17]  368             call cargarDatos
   ACB9 04            [ 4]  369             inc b
   ACBA 04            [ 4]  370             inc b
   ACBB 04            [ 4]  371             inc b
   ACBC CD 6C B0      [17]  372             call cpct_getScreenPtr_asm
   ACBF 2C            [ 4]  373             inc l
   ACC0 2C            [ 4]  374             inc l
   ACC1 36 1F         [10]  375             ld (hl), #0x1F
   ACC3 2D            [ 4]  376             dec l
   ACC4 36 4B         [10]  377             ld (hl), #0x4B
   ACC6 2D            [ 4]  378             dec l
   ACC7 36 7F         [10]  379             ld (hl), #0x7F
   ACC9 2D            [ 4]  380             dec l
   ACCA 36 FB         [10]  381             ld (hl), #0xFB
   ACCC 2D            [ 4]  382             dec l
   ACCD 36 1F         [10]  383             ld (hl), #0x1F
   ACCF C9            [10]  384             ret
   ACD0                     385         pintarQuintoPixeli:
   ACD0 CD 02 AB      [17]  386             call cargarDatos
   ACD3 04            [ 4]  387             inc b
   ACD4 04            [ 4]  388             inc b
   ACD5 04            [ 4]  389             inc b
   ACD6 04            [ 4]  390             inc b
   ACD7 CD 6C B0      [17]  391             call cpct_getScreenPtr_asm
   ACDA 2C            [ 4]  392             inc l
   ACDB 2C            [ 4]  393             inc l
   ACDC 36 B5         [10]  394             ld (hl), #0xB5
   ACDE 2D            [ 4]  395             dec l
   ACDF 36 5A         [10]  396             ld (hl), #0x5A
   ACE1 2D            [ 4]  397             dec l
   ACE2 36 0F         [10]  398             ld (hl), #0x0F
   ACE4 2D            [ 4]  399             dec l
   ACE5 36 EF         [10]  400             ld (hl), #0xEF
   ACE7 2D            [ 4]  401             dec l
   ACE8 36 07         [10]  402             ld (hl), #0x07
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   ACEA C9            [10]  403             ret
   ACEB                     404         pintarSextoPixeli:
   ACEB CD 02 AB      [17]  405             call cargarDatos
   ACEE 04            [ 4]  406             inc b
   ACEF 04            [ 4]  407             inc b
   ACF0 04            [ 4]  408             inc b
   ACF1 04            [ 4]  409             inc b
   ACF2 04            [ 4]  410             inc b
   ACF3 CD 6C B0      [17]  411             call cpct_getScreenPtr_asm
   ACF6 2C            [ 4]  412             inc l
   ACF7 2C            [ 4]  413             inc l
   ACF8 36 F0         [10]  414             ld (hl), #0xF0
   ACFA 2D            [ 4]  415             dec l
   ACFB 36 4A         [10]  416             ld (hl), #0x4A
   ACFD 2D            [ 4]  417             dec l
   ACFE 36 0F         [10]  418             ld (hl), #0x0F
   AD00 2D            [ 4]  419             dec l
   AD01 36 0F         [10]  420             ld (hl), #0x0F
   AD03 2D            [ 4]  421             dec l
   AD04 36 01         [10]  422             ld (hl), #0x01
   AD06 C9            [10]  423             ret
   AD07                     424         pintarSeptimoPixeli:
   AD07 CD 02 AB      [17]  425             call cargarDatos
   AD0A 04            [ 4]  426             inc b
   AD0B 04            [ 4]  427             inc b
   AD0C 04            [ 4]  428             inc b
   AD0D 04            [ 4]  429             inc b
   AD0E 04            [ 4]  430             inc b
   AD0F 04            [ 4]  431             inc b
   AD10 CD 6C B0      [17]  432             call cpct_getScreenPtr_asm
   AD13 2C            [ 4]  433             inc l
   AD14 2C            [ 4]  434             inc l
   AD15 36 00         [10]  435             ld (hl), #0x00
   AD17 2D            [ 4]  436             dec l
   AD18 36 06         [10]  437             ld (hl), #0x06;;ld (hl), #0x0F
   AD1A 2D            [ 4]  438             dec l
   AD1B 36 00         [10]  439             ld (hl), #0x00;;ld (hl), #0x08
   AD1D 2D            [ 4]  440             dec l
   AD1E 36 00         [10]  441             ld (hl), #0x00;;ld (hl), #0x0F
   AD20 2D            [ 4]  442             dec l
   AD21 36 00         [10]  443             ld (hl), #0x00;;ld (hl), #0x08
   AD23 C9            [10]  444             ret
   AD24                     445         borrarPrimerPixeli:
   AD24 CD 02 AB      [17]  446             call cargarDatos
   AD27 CD 6C B0      [17]  447             call cpct_getScreenPtr_asm
   AD2A 2C            [ 4]  448             inc l
   AD2B 2C            [ 4]  449             inc l
   AD2C 36 77         [10]  450             ld (hl), #0x77
   AD2E 2D            [ 4]  451             dec l
   AD2F 36 00         [10]  452             ld (hl), #0x00;;ld (hl), #0x0F
   AD31 2D            [ 4]  453             dec l
   AD32 36 00         [10]  454             ld (hl), #0x00;;ld (hl), #0x08
   AD34 2D            [ 4]  455             dec l
   AD35 36 00         [10]  456             ld (hl), #0x00;;ld (hl), #0x0F
   AD37 2D            [ 4]  457             dec l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   AD38 36 00         [10]  458             ld (hl), #0x00;;ld (hl), #0x08
   AD3A C9            [10]  459             ret
   AD3B                     460         borrarSegundoPixeli:
   AD3B CD 02 AB      [17]  461             call cargarDatos
   AD3E 04            [ 4]  462             inc b
   AD3F CD 6C B0      [17]  463             call cpct_getScreenPtr_asm
   AD42 2C            [ 4]  464             inc l
   AD43 2C            [ 4]  465             inc l
   AD44 36 17         [10]  466             ld (hl), #0x17
   AD46 2D            [ 4]  467             dec l
   AD47 36 00         [10]  468             ld (hl), #0x00;;ld (hl), #0x0F
   AD49 2D            [ 4]  469             dec l
   AD4A 36 00         [10]  470             ld (hl), #0x00;;ld (hl), #0x08
   AD4C 2D            [ 4]  471             dec l
   AD4D 36 00         [10]  472             ld (hl), #0x00;;ld (hl), #0x0F
   AD4F 2D            [ 4]  473             dec l
   AD50 36 00         [10]  474             ld (hl), #0x00;;ld (hl), #0x08
   AD52 C9            [10]  475             ret
   AD53                     476         borrarTercerPixeli:
   AD53 CD 02 AB      [17]  477             call cargarDatos
   AD56 04            [ 4]  478             inc b
   AD57 04            [ 4]  479             inc b
   AD58 CD 6C B0      [17]  480             call cpct_getScreenPtr_asm
   AD5B 2C            [ 4]  481             inc l
   AD5C 2C            [ 4]  482             inc l
   AD5D 36 33         [10]  483             ld (hl), #0x33
   AD5F 2D            [ 4]  484             dec l
   AD60 36 00         [10]  485             ld (hl), #0x00;;ld (hl), #0x0F
   AD62 2D            [ 4]  486             dec l
   AD63 36 00         [10]  487             ld (hl), #0x00;;ld (hl), #0x08
   AD65 2D            [ 4]  488             dec l
   AD66 36 00         [10]  489             ld (hl), #0x00;;ld (hl), #0x0F
   AD68 2D            [ 4]  490             dec l
   AD69 36 00         [10]  491             ld (hl), #0x00;;ld (hl), #0x08
   AD6B C9            [10]  492             ret
   AD6C                     493         borrarCuartoPixeli:
   AD6C CD 02 AB      [17]  494             call cargarDatos
   AD6F 04            [ 4]  495             inc b
   AD70 04            [ 4]  496             inc b
   AD71 04            [ 4]  497             inc b
   AD72 CD 6C B0      [17]  498             call cpct_getScreenPtr_asm
   AD75 2C            [ 4]  499             inc l
   AD76 2C            [ 4]  500             inc l
   AD77 36 77         [10]  501             ld (hl), #0x77
   AD79 2D            [ 4]  502             dec l
   AD7A 36 00         [10]  503             ld (hl), #0x00;;ld (hl), #0x0F
   AD7C 2D            [ 4]  504             dec l
   AD7D 36 00         [10]  505             ld (hl), #0x00;;ld (hl), #0x08
   AD7F 2D            [ 4]  506             dec l
   AD80 36 00         [10]  507             ld (hl), #0x00;;ld (hl), #0x0F
   AD82 2D            [ 4]  508             dec l
   AD83 36 00         [10]  509             ld (hl), #0x00;;ld (hl), #0x08
   AD85 C9            [10]  510             ret
   AD86                     511         borrarQuintoPixeli:
   AD86 CD 02 AB      [17]  512             call cargarDatos
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   AD89 04            [ 4]  513             inc b
   AD8A 04            [ 4]  514             inc b
   AD8B 04            [ 4]  515             inc b
   AD8C 04            [ 4]  516             inc b
   AD8D CD 6C B0      [17]  517             call cpct_getScreenPtr_asm
   AD90 2C            [ 4]  518             inc l
   AD91 2C            [ 4]  519             inc l
   AD92 36 47         [10]  520             ld (hl), #0x47
   AD94 2D            [ 4]  521             dec l
   AD95 36 00         [10]  522             ld (hl), #0x00;;ld (hl), #0x0F
   AD97 2D            [ 4]  523             dec l
   AD98 36 00         [10]  524             ld (hl), #0x00;;ld (hl), #0x08
   AD9A 2D            [ 4]  525             dec l
   AD9B 36 00         [10]  526             ld (hl), #0x00;;ld (hl), #0x0F
   AD9D 2D            [ 4]  527             dec l
   AD9E 36 00         [10]  528             ld (hl), #0x00;;ld (hl), #0x08
   ADA0 C9            [10]  529             ret
   ADA1                     530         borrarSextoPixeli:
   ADA1 CD 02 AB      [17]  531             call cargarDatos
   ADA4 04            [ 4]  532             inc b
   ADA5 04            [ 4]  533             inc b
   ADA6 04            [ 4]  534             inc b
   ADA7 04            [ 4]  535             inc b
   ADA8 04            [ 4]  536             inc b
   ADA9 CD 6C B0      [17]  537             call cpct_getScreenPtr_asm
   ADAC 2C            [ 4]  538             inc l
   ADAD 2C            [ 4]  539             inc l
   ADAE 36 41         [10]  540             ld (hl), #0x41
   ADB0 2D            [ 4]  541             dec l
   ADB1 36 00         [10]  542             ld (hl), #0x00;;ld (hl), #0x0F
   ADB3 2D            [ 4]  543             dec l
   ADB4 36 00         [10]  544             ld (hl), #0x00;;ld (hl), #0x08
   ADB6 2D            [ 4]  545             dec l
   ADB7 36 00         [10]  546             ld (hl), #0x00;;ld (hl), #0x0F
   ADB9 2D            [ 4]  547             dec l
   ADBA 36 00         [10]  548             ld (hl), #0x00;;ld (hl), #0x08
   ADBC C9            [10]  549             ret
   ADBD                     550         borrarSeptimoPixeli:
   ADBD CD 02 AB      [17]  551             call cargarDatos
   ADC0 04            [ 4]  552             inc b
   ADC1 04            [ 4]  553             inc b
   ADC2 04            [ 4]  554             inc b
   ADC3 04            [ 4]  555             inc b
   ADC4 04            [ 4]  556             inc b
   ADC5 04            [ 4]  557             inc b
   ADC6 CD 6C B0      [17]  558             call cpct_getScreenPtr_asm
   ADC9 2C            [ 4]  559             inc l
   ADCA 2C            [ 4]  560             inc l
   ADCB 36 24         [10]  561             ld (hl), #0x24
   ADCD 2D            [ 4]  562             dec l
   ADCE 36 00         [10]  563             ld (hl), #0x00;;ld (hl), #0x0F
   ADD0 2D            [ 4]  564             dec l
   ADD1 36 00         [10]  565             ld (hl), #0x00;;ld (hl), #0x08
   ADD3 2D            [ 4]  566             dec l
   ADD4 36 00         [10]  567             ld (hl), #0x00;;ld (hl), #0x0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   ADD6 2D            [ 4]  568             dec l
   ADD7 36 00         [10]  569             ld (hl), #0x00;;ld (hl), #0x08
   ADD9 C9            [10]  570             ret
