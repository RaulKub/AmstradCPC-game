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
   702E                      19 pintarPersonajePos0::
                             20 
   702E DD 21 03 40   [14]   21     ld ix, #playerPos    ;;Si estado no es 0, se pinta la pos0 derecha, o si estaba en 0 estado y vy, sino, se pinta pos1 derecha
   7032 DD 7E 04      [19]   22     ld a, entity_estado(ix)
   7035 DD 46 05      [19]   23     ld b, entity_vy(ix)
   7038 3C            [ 4]   24     inc a
   7039 3D            [ 4]   25     dec a 
   703A 28 02         [12]   26     jr z, estabaCero
   703C 18 06         [12]   27     jr pintarDerecha0
   703E                      28     estabaCero:
   703E 05            [ 4]   29     dec b 
   703F CA 88 71      [10]   30     jp z, pintarDerecha1
   7042 18 00         [12]   31     jr pintarDerecha0
                             32 
                             33 
   7044                      34     pintarDerecha0:
                             35         ;;Primero calculamos la dirección de memoria para pintar el objeto
                             36 
                             37 
   7044 11 00 C0      [10]   38             ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7047 DD 4E 00      [19]   39             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   704A DD 46 01      [19]   40             ld      b,  entity_y(ix)  
   704D 04            [ 4]   41             inc b       
   704E 04            [ 4]   42             inc b
   704F 04            [ 4]   43             inc b 
   7050 04            [ 4]   44             inc b
   7051 04            [ 4]   45             inc b
   7052 04            [ 4]   46             inc b 
   7053 04            [ 4]   47             inc b
   7054 CD 6C B0      [17]   48             call cpct_getScreenPtr_asm 
   7057 36 03         [10]   49             ld (hl), #0x03
   7059 2C            [ 4]   50             inc l
   705A 36 0C         [10]   51         ld (hl), #0x0C
                             52 
                             53 
                             54         ;;-----------
   705C 11 00 C0      [10]   55         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   705F DD 4E 00      [19]   56             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7062 DD 46 01      [19]   57             ld      b,  entity_y(ix)  
   7065 04            [ 4]   58             inc b       
   7066 04            [ 4]   59             inc b
   7067 04            [ 4]   60             inc b 
   7068 04            [ 4]   61             inc b
   7069 04            [ 4]   62             inc b 
   706A 04            [ 4]   63             inc b
   706B CD 6C B0      [17]   64             call cpct_getScreenPtr_asm 
   706E 36 24         [10]   65             ld (hl), #0x24
   7070 2C            [ 4]   66             inc l
   7071 36 82         [10]   67         ld (hl), #0x82
                             68 
                             69         ;;-------------
   7073 11 00 C0      [10]   70         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7076 DD 4E 00      [19]   71             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7079 DD 46 01      [19]   72             ld      b,  entity_y(ix)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   707C 04            [ 4]   73             inc b       
   707D 04            [ 4]   74             inc b
   707E 04            [ 4]   75             inc b 
   707F 04            [ 4]   76             inc b
   7080 04            [ 4]   77             inc b 
   7081 CD 6C B0      [17]   78             call cpct_getScreenPtr_asm 
   7084 36 14         [10]   79             ld (hl), #0x14
   7086 2C            [ 4]   80             inc l
   7087 36 42         [10]   81         ld (hl), #0x42
                             82 
                             83         ;;---------------------
   7089 11 00 C0      [10]   84         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   708C DD 4E 00      [19]   85             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   708F DD 46 01      [19]   86             ld      b,  entity_y(ix)  
   7092 04            [ 4]   87             inc b       
   7093 04            [ 4]   88             inc b
   7094 04            [ 4]   89             inc b 
   7095 04            [ 4]   90             inc b
   7096 CD 6C B0      [17]   91             call cpct_getScreenPtr_asm 
   7099 36 47         [10]   92             ld (hl), #0x47
   709B 2C            [ 4]   93             inc l
   709C 36 2E         [10]   94         ld (hl), #0x2E
                             95 
                             96         ;;-----------
   709E 11 00 C0      [10]   97         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   70A1 DD 4E 00      [19]   98             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   70A4 DD 46 01      [19]   99             ld      b,  entity_y(ix)  
   70A7 04            [ 4]  100             inc b       
   70A8 04            [ 4]  101             inc b
   70A9 04            [ 4]  102             inc b
   70AA CD 6C B0      [17]  103             call cpct_getScreenPtr_asm 
   70AD 36 77         [10]  104             ld (hl), #0x77
   70AF 2C            [ 4]  105             inc l
   70B0 36 EE         [10]  106         ld (hl), #0xEE
                            107 
                            108         ;;-----------
   70B2 11 00 C0      [10]  109         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   70B5 DD 4E 00      [19]  110             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   70B8 DD 46 01      [19]  111             ld      b,  entity_y(ix)  
   70BB 04            [ 4]  112             inc b       
   70BC 04            [ 4]  113             inc b
   70BD CD 6C B0      [17]  114             call cpct_getScreenPtr_asm 
   70C0 36 33         [10]  115             ld (hl), #0x33
   70C2 2C            [ 4]  116             inc l
   70C3 36 CC         [10]  117         ld (hl), #0xCC
                            118 
                            119         ;;-----------
   70C5 11 00 C0      [10]  120         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   70C8 DD 4E 00      [19]  121             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   70CB DD 46 01      [19]  122             ld      b,  entity_y(ix)  
   70CE 04            [ 4]  123             inc b 
   70CF CD 6C B0      [17]  124             call cpct_getScreenPtr_asm
   70D2 36 77         [10]  125             ld (hl), #0x77
   70D4 2C            [ 4]  126             inc l 
   70D5 36 8E         [10]  127         ld (hl), #0x8E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                            128 
                            129         ;;-----------
   70D7 11 00 C0      [10]  130         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   70DA DD 4E 00      [19]  131             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   70DD DD 46 01      [19]  132             ld      b,  entity_y(ix)  
   70E0 CD 6C B0      [17]  133             call cpct_getScreenPtr_asm 
   70E3 36 77         [10]  134             ld (hl), #0x77
   70E5 2C            [ 4]  135             inc l
   70E6 36 EE         [10]  136         ld (hl), #0xEE
                            137 
                            138         ;;-----------
   70E8 11 00 C0      [10]  139         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   70EB DD 4E 00      [19]  140             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   70EE DD 46 01      [19]  141             ld      b,  entity_y(ix)  
   70F1 05            [ 4]  142             dec b
   70F2 CD 6C B0      [17]  143             call cpct_getScreenPtr_asm
   70F5 36 33         [10]  144             ld (hl), #0x33
   70F7 2C            [ 4]  145             inc l 
   70F8 36 CC         [10]  146         ld (hl), #0xCC
                            147 
                            148         ;;-----------
   70FA 11 00 C0      [10]  149         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   70FD DD 4E 00      [19]  150             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7100 DD 46 01      [19]  151             ld      b,  entity_y(ix)  
   7103 05            [ 4]  152             dec b       
   7104 05            [ 4]  153             dec b
   7105 CD 6C B0      [17]  154             call cpct_getScreenPtr_asm
   7108 36 11         [10]  155             ld (hl), #0x11
   710A 2C            [ 4]  156             inc l 
   710B 36 88         [10]  157         ld (hl), #0x88
                            158 
                            159         ;;-----------
   710D 11 00 C0      [10]  160         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7110 DD 4E 00      [19]  161             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7113 DD 46 01      [19]  162             ld      b,  entity_y(ix)  
   7116 05            [ 4]  163             dec b       
   7117 05            [ 4]  164             dec b
   7118 05            [ 4]  165             dec b
   7119 CD 6C B0      [17]  166             call cpct_getScreenPtr_asm 
   711C 36 11         [10]  167             ld (hl), #0x11
   711E 2C            [ 4]  168             inc l
   711F 36 80         [10]  169         ld (hl), #0x80
                            170         ;;-----------
   7121 11 00 C0      [10]  171         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7124 DD 4E 00      [19]  172             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7127 DD 46 01      [19]  173             ld      b,  entity_y(ix)  
   712A 05            [ 4]  174             dec b       
   712B 05            [ 4]  175             dec b
   712C 05            [ 4]  176             dec b
   712D 05            [ 4]  177             dec b
   712E CD 6C B0      [17]  178             call cpct_getScreenPtr_asm 
   7131 36 11         [10]  179             ld (hl), #0x11
   7133 2C            [ 4]  180             inc l
   7134 36 88         [10]  181         ld (hl), #0x88
                            182         ;;-----------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   7136 11 00 C0      [10]  183         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7139 DD 4E 00      [19]  184             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   713C DD 46 01      [19]  185             ld      b,  entity_y(ix)  
   713F 05            [ 4]  186             dec b       
   7140 05            [ 4]  187             dec b
   7141 05            [ 4]  188             dec b
   7142 05            [ 4]  189             dec b
   7143 05            [ 4]  190             dec b
   7144 CD 6C B0      [17]  191             call cpct_getScreenPtr_asm 
   7147 36 00         [10]  192             ld (hl), #0x00
   7149 2C            [ 4]  193             inc l
   714A 36 00         [10]  194         ld (hl), #0x00
                            195         ;;-----------
   714C 11 00 C0      [10]  196         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   714F DD 4E 00      [19]  197             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7152 DD 46 01      [19]  198             ld      b,  entity_y(ix)  
   7155 05            [ 4]  199             dec b       
   7156 05            [ 4]  200             dec b
   7157 05            [ 4]  201             dec b
   7158 05            [ 4]  202             dec b
   7159 05            [ 4]  203             dec b
   715A 05            [ 4]  204             dec b
   715B CD 6C B0      [17]  205             call cpct_getScreenPtr_asm 
   715E 36 00         [10]  206             ld (hl), #0x00
   7160 2C            [ 4]  207             inc l
   7161 36 00         [10]  208         ld (hl), #0x00
                            209         ;;-----------
   7163 11 00 C0      [10]  210         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7166 DD 4E 00      [19]  211             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7169 DD 46 01      [19]  212             ld      b,  entity_y(ix)  
   716C 05            [ 4]  213             dec b       
   716D 05            [ 4]  214             dec b
   716E 05            [ 4]  215             dec b
   716F 05            [ 4]  216             dec b
   7170 05            [ 4]  217             dec b
   7171 05            [ 4]  218             dec b
   7172 05            [ 4]  219             dec b
   7173 CD 6C B0      [17]  220             call cpct_getScreenPtr_asm 
   7176 36 00         [10]  221             ld (hl), #0x00
   7178 2C            [ 4]  222             inc l
   7179 36 00         [10]  223         ld (hl), #0x00
                            224 
   717B DD 21 03 40   [14]  225         ld ix, #playerPos
   717F DD 36 04 00   [19]  226         ld entity_estado(ix), #0
   7183 DD 36 05 01   [19]  227         ld entity_vy(ix), #1
                            228 
   7187 C9            [10]  229         ret
                            230 
   7188                     231                 pintarDerecha1:
   7188 11 00 C0      [10]  232                 ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   718B DD 4E 00      [19]  233             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   718E DD 46 01      [19]  234             ld      b,  entity_y(ix)  
   7191 04            [ 4]  235             inc b       
   7192 04            [ 4]  236             inc b
   7193 04            [ 4]  237             inc b 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   7194 04            [ 4]  238             inc b
   7195 04            [ 4]  239             inc b
   7196 04            [ 4]  240             inc b 
   7197 04            [ 4]  241             inc b
   7198 CD 6C B0      [17]  242             call cpct_getScreenPtr_asm 
   719B 36 03         [10]  243             ld (hl), #0x03
   719D 2C            [ 4]  244             inc l
   719E 36 0C         [10]  245         ld (hl), #0x0C
                            246 
                            247 
                            248         ;;-----------
   71A0 11 00 C0      [10]  249         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   71A3 DD 4E 00      [19]  250             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   71A6 DD 46 01      [19]  251             ld      b,  entity_y(ix)  
   71A9 04            [ 4]  252             inc b       
   71AA 04            [ 4]  253             inc b
   71AB 04            [ 4]  254             inc b 
   71AC 04            [ 4]  255             inc b
   71AD 04            [ 4]  256             inc b 
   71AE 04            [ 4]  257             inc b
   71AF CD 6C B0      [17]  258             call cpct_getScreenPtr_asm 
   71B2 36 14         [10]  259             ld (hl), #0x14
   71B4 2C            [ 4]  260             inc l
   71B5 36 42         [10]  261         ld (hl), #0x42
                            262 
                            263         ;;-------------
   71B7 11 00 C0      [10]  264         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   71BA DD 4E 00      [19]  265             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   71BD DD 46 01      [19]  266             ld      b,  entity_y(ix)  
   71C0 04            [ 4]  267             inc b       
   71C1 04            [ 4]  268             inc b
   71C2 04            [ 4]  269             inc b 
   71C3 04            [ 4]  270             inc b
   71C4 04            [ 4]  271             inc b 
   71C5 CD 6C B0      [17]  272             call cpct_getScreenPtr_asm 
   71C8 36 24         [10]  273             ld (hl), #0x24
   71CA 2C            [ 4]  274             inc l
   71CB 36 82         [10]  275         ld (hl), #0x82
                            276 
                            277         ;;---------------------
   71CD 11 00 C0      [10]  278         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   71D0 DD 4E 00      [19]  279             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   71D3 DD 46 01      [19]  280             ld      b,  entity_y(ix)  
   71D6 04            [ 4]  281             inc b       
   71D7 04            [ 4]  282             inc b
   71D8 04            [ 4]  283             inc b 
   71D9 04            [ 4]  284             inc b
   71DA CD 6C B0      [17]  285             call cpct_getScreenPtr_asm 
   71DD 36 47         [10]  286             ld (hl), #0x47
   71DF 2C            [ 4]  287             inc l
   71E0 36 2E         [10]  288         ld (hl), #0x2E
                            289 
                            290         ;;-----------
   71E2 11 00 C0      [10]  291         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   71E5 DD 4E 00      [19]  292             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   71E8 DD 46 01      [19]  293             ld      b,  entity_y(ix)  
   71EB 04            [ 4]  294             inc b       
   71EC 04            [ 4]  295             inc b
   71ED 04            [ 4]  296             inc b
   71EE CD 6C B0      [17]  297             call cpct_getScreenPtr_asm 
   71F1 36 77         [10]  298             ld (hl), #0x77
   71F3 2C            [ 4]  299             inc l
   71F4 36 EE         [10]  300         ld (hl), #0xEE
                            301 
                            302         ;;-----------
   71F6 11 00 C0      [10]  303         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   71F9 DD 4E 00      [19]  304             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   71FC DD 46 01      [19]  305             ld      b,  entity_y(ix)  
   71FF 04            [ 4]  306             inc b       
   7200 04            [ 4]  307             inc b
   7201 CD 6C B0      [17]  308             call cpct_getScreenPtr_asm 
   7204 36 33         [10]  309             ld (hl), #0x33
   7206 2C            [ 4]  310             inc l
   7207 36 CC         [10]  311         ld (hl), #0xCC
                            312 
                            313         ;;-----------
   7209 11 00 C0      [10]  314         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   720C DD 4E 00      [19]  315             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   720F DD 46 01      [19]  316             ld      b,  entity_y(ix)  
   7212 04            [ 4]  317             inc b 
   7213 CD 6C B0      [17]  318             call cpct_getScreenPtr_asm
   7216 36 77         [10]  319             ld (hl), #0x77
   7218 2C            [ 4]  320             inc l 
   7219 36 8E         [10]  321         ld (hl), #0x8E
                            322 
                            323         ;;-----------
   721B 11 00 C0      [10]  324         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   721E DD 4E 00      [19]  325             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7221 DD 46 01      [19]  326             ld      b,  entity_y(ix)  
   7224 CD 6C B0      [17]  327             call cpct_getScreenPtr_asm 
   7227 36 77         [10]  328             ld (hl), #0x77
   7229 2C            [ 4]  329             inc l
   722A 36 EE         [10]  330         ld (hl), #0xEE
                            331 
                            332         ;;-----------
   722C 11 00 C0      [10]  333         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   722F DD 4E 00      [19]  334             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7232 DD 46 01      [19]  335             ld      b,  entity_y(ix)  
   7235 05            [ 4]  336             dec b
   7236 CD 6C B0      [17]  337             call cpct_getScreenPtr_asm
   7239 36 33         [10]  338             ld (hl), #0x33
   723B 2C            [ 4]  339             inc l 
   723C 36 CC         [10]  340         ld (hl), #0xCC
                            341 
                            342         ;;-----------
   723E 11 00 C0      [10]  343         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7241 DD 4E 00      [19]  344             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7244 DD 46 01      [19]  345             ld      b,  entity_y(ix)  
   7247 05            [ 4]  346             dec b       
   7248 05            [ 4]  347             dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   7249 CD 6C B0      [17]  348             call cpct_getScreenPtr_asm
   724C 36 11         [10]  349             ld (hl), #0x11
   724E 2C            [ 4]  350             inc l 
   724F 36 88         [10]  351         ld (hl), #0x88
                            352 
                            353         ;;-----------
   7251 11 00 C0      [10]  354         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7254 DD 4E 00      [19]  355             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7257 DD 46 01      [19]  356             ld      b,  entity_y(ix)  
   725A 05            [ 4]  357             dec b       
   725B 05            [ 4]  358             dec b
   725C 05            [ 4]  359             dec b
   725D CD 6C B0      [17]  360             call cpct_getScreenPtr_asm 
   7260 36 11         [10]  361             ld (hl), #0x11
   7262 2C            [ 4]  362             inc l
   7263 36 80         [10]  363         ld (hl), #0x80
                            364         ;;-----------
   7265 11 00 C0      [10]  365         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7268 DD 4E 00      [19]  366             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   726B DD 46 01      [19]  367             ld      b,  entity_y(ix)  
   726E 05            [ 4]  368             dec b       
   726F 05            [ 4]  369             dec b
   7270 05            [ 4]  370             dec b
   7271 05            [ 4]  371             dec b
   7272 CD 6C B0      [17]  372             call cpct_getScreenPtr_asm 
   7275 36 11         [10]  373             ld (hl), #0x11
   7277 2C            [ 4]  374             inc l
   7278 36 88         [10]  375         ld (hl), #0x88
                            376         ;;-----------
   727A 11 00 C0      [10]  377         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   727D DD 4E 00      [19]  378             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7280 DD 46 01      [19]  379             ld      b,  entity_y(ix)  
   7283 05            [ 4]  380             dec b       
   7284 05            [ 4]  381             dec b
   7285 05            [ 4]  382             dec b
   7286 05            [ 4]  383             dec b
   7287 05            [ 4]  384             dec b
   7288 CD 6C B0      [17]  385             call cpct_getScreenPtr_asm 
   728B 36 00         [10]  386             ld (hl), #0x00
   728D 2C            [ 4]  387             inc l
   728E 36 00         [10]  388         ld (hl), #0x00
                            389         ;;-----------
   7290 11 00 C0      [10]  390         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7293 DD 4E 00      [19]  391             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7296 DD 46 01      [19]  392             ld      b,  entity_y(ix)  
   7299 05            [ 4]  393             dec b       
   729A 05            [ 4]  394             dec b
   729B 05            [ 4]  395             dec b
   729C 05            [ 4]  396             dec b
   729D 05            [ 4]  397             dec b
   729E 05            [ 4]  398             dec b
   729F CD 6C B0      [17]  399             call cpct_getScreenPtr_asm 
   72A2 36 00         [10]  400             ld (hl), #0x00
   72A4 2C            [ 4]  401             inc l
   72A5 36 00         [10]  402         ld (hl), #0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                            403         ;;-----------
   72A7 11 00 C0      [10]  404         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   72AA DD 4E 00      [19]  405             ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   72AD DD 46 01      [19]  406             ld      b,  entity_y(ix)  
   72B0 05            [ 4]  407             dec b       
   72B1 05            [ 4]  408             dec b
   72B2 05            [ 4]  409             dec b
   72B3 05            [ 4]  410             dec b
   72B4 05            [ 4]  411             dec b
   72B5 05            [ 4]  412             dec b
   72B6 05            [ 4]  413             dec b
   72B7 CD 6C B0      [17]  414             call cpct_getScreenPtr_asm 
   72BA 36 00         [10]  415             ld (hl), #0x00
   72BC 2C            [ 4]  416             inc l
   72BD 36 00         [10]  417         ld (hl), #0x00
                            418 
   72BF DD 21 03 40   [14]  419         ld ix, #playerPos
   72C3 DD 36 04 00   [19]  420         ld entity_estado(ix), #0
   72C7 DD 36 05 00   [19]  421         ld entity_vy(ix), #0
                            422 
   72CB C9            [10]  423         ret
                            424 
                            425 
                            426 
                            427 
   72CC                     428 pintarPersonajePos1::
                            429 
   72CC DD 21 03 40   [14]  430     ld ix, #playerPos    ;;Si estado no es 0, se pinta la pos0 derecha, o si estaba en 0 estado y vy, sino, se pinta pos1 derecha
   72D0 DD 7E 04      [19]  431     ld a, entity_estado(ix)
   72D3 DD 46 05      [19]  432     ld b, entity_vy(ix)
   72D6 3D            [ 4]  433     dec a 
   72D7 28 02         [12]  434     jr z, estabaCero1
   72D9 18 06         [12]  435     jr pintarIzquierda0
   72DB                     436     estabaCero1:
   72DB 05            [ 4]  437     dec b 
   72DC CA 25 74      [10]  438     jp z, pintarIzquierda1
   72DF 18 00         [12]  439     jr pintarIzquierda0
                            440 
   72E1                     441 pintarIzquierda0:
                            442 
   72E1 11 00 C0      [10]  443         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   72E4 DD 4E 00      [19]  444         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   72E7 DD 46 01      [19]  445         ld      b,  entity_y(ix)  
   72EA 04            [ 4]  446         inc b       
   72EB 04            [ 4]  447         inc b
   72EC 04            [ 4]  448         inc b 
   72ED 04            [ 4]  449         inc b
   72EE 04            [ 4]  450         inc b
   72EF 04            [ 4]  451         inc b 
   72F0 04            [ 4]  452         inc b
   72F1 CD 6C B0      [17]  453         call cpct_getScreenPtr_asm 
   72F4 36 03         [10]  454         ld (hl), #0x03
   72F6 2C            [ 4]  455         inc l
   72F7 36 0C         [10]  456     ld (hl), #0x0C
                            457 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



                            458 
                            459     ;;-----------
   72F9 11 00 C0      [10]  460     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   72FC DD 4E 00      [19]  461         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   72FF DD 46 01      [19]  462         ld      b,  entity_y(ix)  
   7302 04            [ 4]  463         inc b       
   7303 04            [ 4]  464         inc b
   7304 04            [ 4]  465         inc b 
   7305 04            [ 4]  466         inc b
   7306 04            [ 4]  467         inc b 
   7307 04            [ 4]  468         inc b
   7308 CD 6C B0      [17]  469         call cpct_getScreenPtr_asm 
   730B 36 14         [10]  470         ld (hl), #0x14
   730D 2C            [ 4]  471         inc l
   730E 36 42         [10]  472     ld (hl), #0x42
                            473 
                            474     ;;-------------
   7310 11 00 C0      [10]  475     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7313 DD 4E 00      [19]  476         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7316 DD 46 01      [19]  477         ld      b,  entity_y(ix)  
   7319 04            [ 4]  478         inc b       
   731A 04            [ 4]  479         inc b
   731B 04            [ 4]  480         inc b 
   731C 04            [ 4]  481         inc b
   731D 04            [ 4]  482         inc b 
   731E CD 6C B0      [17]  483         call cpct_getScreenPtr_asm 
   7321 36 24         [10]  484         ld (hl), #0x24
   7323 2C            [ 4]  485         inc l
   7324 36 82         [10]  486     ld (hl), #0x82
                            487 
                            488     ;;---------------------
   7326 11 00 C0      [10]  489     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7329 DD 4E 00      [19]  490         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   732C DD 46 01      [19]  491         ld      b,  entity_y(ix)  
   732F 04            [ 4]  492         inc b       
   7330 04            [ 4]  493         inc b
   7331 04            [ 4]  494         inc b 
   7332 04            [ 4]  495         inc b
   7333 CD 6C B0      [17]  496         call cpct_getScreenPtr_asm 
   7336 36 47         [10]  497         ld (hl), #0x47
   7338 2C            [ 4]  498         inc l
   7339 36 2E         [10]  499     ld (hl), #0x2E
                            500 
                            501     ;;-----------
   733B 11 00 C0      [10]  502     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   733E DD 4E 00      [19]  503         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7341 DD 46 01      [19]  504         ld      b,  entity_y(ix)  
   7344 04            [ 4]  505         inc b       
   7345 04            [ 4]  506         inc b
   7346 04            [ 4]  507         inc b
   7347 CD 6C B0      [17]  508         call cpct_getScreenPtr_asm 
   734A 36 77         [10]  509         ld (hl), #0x77
   734C 2C            [ 4]  510         inc l
   734D 36 EE         [10]  511     ld (hl), #0xEE
                            512 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



                            513     ;;-----------
   734F 11 00 C0      [10]  514     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7352 DD 4E 00      [19]  515         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7355 DD 46 01      [19]  516         ld      b,  entity_y(ix)  
   7358 04            [ 4]  517         inc b       
   7359 04            [ 4]  518         inc b
   735A CD 6C B0      [17]  519         call cpct_getScreenPtr_asm 
   735D 36 33         [10]  520         ld (hl), #0x33
   735F 2C            [ 4]  521         inc l
   7360 36 CC         [10]  522     ld (hl), #0xCC
                            523 
                            524     ;;-----------
   7362 11 00 C0      [10]  525     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7365 DD 4E 00      [19]  526         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7368 DD 46 01      [19]  527         ld      b,  entity_y(ix)  
   736B 04            [ 4]  528         inc b 
   736C CD 6C B0      [17]  529         call cpct_getScreenPtr_asm
   736F 36 17         [10]  530         ld (hl), #0x17
   7371 2C            [ 4]  531         inc l 
   7372 36 EE         [10]  532     ld (hl), #0xEE
                            533 
                            534     ;;-----------
   7374 11 00 C0      [10]  535     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7377 DD 4E 00      [19]  536         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   737A DD 46 01      [19]  537         ld      b,  entity_y(ix)  
   737D CD 6C B0      [17]  538         call cpct_getScreenPtr_asm 
   7380 36 77         [10]  539         ld (hl), #0x77
   7382 2C            [ 4]  540         inc l
   7383 36 EE         [10]  541     ld (hl), #0xEE
                            542 
                            543     ;;-----------
   7385 11 00 C0      [10]  544     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7388 DD 4E 00      [19]  545         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   738B DD 46 01      [19]  546         ld      b,  entity_y(ix)  
   738E 05            [ 4]  547         dec b
   738F CD 6C B0      [17]  548         call cpct_getScreenPtr_asm
   7392 36 33         [10]  549         ld (hl), #0x33
   7394 2C            [ 4]  550         inc l 
   7395 36 CC         [10]  551     ld (hl), #0xCC
                            552 
                            553     ;;-----------
   7397 11 00 C0      [10]  554     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   739A DD 4E 00      [19]  555         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   739D DD 46 01      [19]  556         ld      b,  entity_y(ix)  
   73A0 05            [ 4]  557         dec b       
   73A1 05            [ 4]  558         dec b
   73A2 CD 6C B0      [17]  559         call cpct_getScreenPtr_asm
   73A5 36 11         [10]  560         ld (hl), #0x11
   73A7 2C            [ 4]  561         inc l 
   73A8 36 88         [10]  562     ld (hl), #0x88
                            563 
                            564     ;;-----------
   73AA 11 00 C0      [10]  565     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   73AD DD 4E 00      [19]  566         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   73B0 DD 46 01      [19]  567         ld      b,  entity_y(ix)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   73B3 05            [ 4]  568         dec b       
   73B4 05            [ 4]  569         dec b
   73B5 05            [ 4]  570         dec b
   73B6 CD 6C B0      [17]  571         call cpct_getScreenPtr_asm 
   73B9 36 10         [10]  572         ld (hl), #0x10
   73BB 2C            [ 4]  573         inc l
   73BC 36 88         [10]  574     ld (hl), #0x88
                            575     ;;-----------
   73BE 11 00 C0      [10]  576     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   73C1 DD 4E 00      [19]  577         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   73C4 DD 46 01      [19]  578         ld      b,  entity_y(ix)  
   73C7 05            [ 4]  579         dec b       
   73C8 05            [ 4]  580         dec b
   73C9 05            [ 4]  581         dec b
   73CA 05            [ 4]  582         dec b
   73CB CD 6C B0      [17]  583         call cpct_getScreenPtr_asm 
   73CE 36 11         [10]  584         ld (hl), #0x11
   73D0 2C            [ 4]  585         inc l
   73D1 36 88         [10]  586     ld (hl), #0x88
                            587     ;;-----------
   73D3 11 00 C0      [10]  588     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   73D6 DD 4E 00      [19]  589         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   73D9 DD 46 01      [19]  590         ld      b,  entity_y(ix)  
   73DC 05            [ 4]  591         dec b       
   73DD 05            [ 4]  592         dec b
   73DE 05            [ 4]  593         dec b
   73DF 05            [ 4]  594         dec b
   73E0 05            [ 4]  595         dec b
   73E1 CD 6C B0      [17]  596         call cpct_getScreenPtr_asm 
   73E4 36 00         [10]  597         ld (hl), #0x00
   73E6 2C            [ 4]  598         inc l
   73E7 36 00         [10]  599     ld (hl), #0x00
                            600     ;;-----------
   73E9 11 00 C0      [10]  601     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   73EC DD 4E 00      [19]  602         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   73EF DD 46 01      [19]  603         ld      b,  entity_y(ix)  
   73F2 05            [ 4]  604         dec b       
   73F3 05            [ 4]  605         dec b
   73F4 05            [ 4]  606         dec b
   73F5 05            [ 4]  607         dec b
   73F6 05            [ 4]  608         dec b
   73F7 05            [ 4]  609         dec b
   73F8 CD 6C B0      [17]  610         call cpct_getScreenPtr_asm 
   73FB 36 00         [10]  611         ld (hl), #0x00
   73FD 2C            [ 4]  612         inc l
   73FE 36 00         [10]  613     ld (hl), #0x00
                            614     ;;-----------
   7400 11 00 C0      [10]  615     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7403 DD 4E 00      [19]  616         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7406 DD 46 01      [19]  617         ld      b,  entity_y(ix)  
   7409 05            [ 4]  618         dec b       
   740A 05            [ 4]  619         dec b
   740B 05            [ 4]  620         dec b
   740C 05            [ 4]  621         dec b
   740D 05            [ 4]  622         dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   740E 05            [ 4]  623         dec b
   740F 05            [ 4]  624         dec b
   7410 CD 6C B0      [17]  625         call cpct_getScreenPtr_asm 
   7413 36 00         [10]  626         ld (hl), #0x00
   7415 2C            [ 4]  627         inc l
   7416 36 00         [10]  628     ld (hl), #0x00
                            629 
   7418 DD 21 03 40   [14]  630     ld ix, #playerPos
   741C DD 36 04 01   [19]  631         ld entity_estado(ix), #1
   7420 DD 36 05 01   [19]  632         ld entity_vy(ix), #1
                            633 
   7424 C9            [10]  634     ret
                            635 
   7425                     636     pintarIzquierda1:
                            637 
   7425 11 00 C0      [10]  638         ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7428 DD 4E 00      [19]  639         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   742B DD 46 01      [19]  640         ld      b,  entity_y(ix)  
   742E 04            [ 4]  641         inc b       
   742F 04            [ 4]  642         inc b
   7430 04            [ 4]  643         inc b 
   7431 04            [ 4]  644         inc b
   7432 04            [ 4]  645         inc b
   7433 04            [ 4]  646         inc b 
   7434 04            [ 4]  647         inc b
   7435 CD 6C B0      [17]  648         call cpct_getScreenPtr_asm 
   7438 36 03         [10]  649         ld (hl), #0x03
   743A 2C            [ 4]  650         inc l
   743B 36 0C         [10]  651     ld (hl), #0x0C
                            652 
                            653 
                            654     ;;-----------
   743D 11 00 C0      [10]  655     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7440 DD 4E 00      [19]  656         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7443 DD 46 01      [19]  657         ld      b,  entity_y(ix)  
   7446 04            [ 4]  658         inc b       
   7447 04            [ 4]  659         inc b
   7448 04            [ 4]  660         inc b 
   7449 04            [ 4]  661         inc b
   744A 04            [ 4]  662         inc b 
   744B 04            [ 4]  663         inc b
   744C CD 6C B0      [17]  664         call cpct_getScreenPtr_asm 
   744F 36 24         [10]  665         ld (hl), #0x24
   7451 2C            [ 4]  666         inc l
   7452 36 82         [10]  667     ld (hl), #0x82
                            668 
                            669     ;;-------------
   7454 11 00 C0      [10]  670     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7457 DD 4E 00      [19]  671         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   745A DD 46 01      [19]  672         ld      b,  entity_y(ix)  
   745D 04            [ 4]  673         inc b       
   745E 04            [ 4]  674         inc b
   745F 04            [ 4]  675         inc b 
   7460 04            [ 4]  676         inc b
   7461 04            [ 4]  677         inc b 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   7462 CD 6C B0      [17]  678         call cpct_getScreenPtr_asm 
   7465 36 14         [10]  679         ld (hl), #0x14
   7467 2C            [ 4]  680         inc l
   7468 36 42         [10]  681     ld (hl), #0x42
                            682 
                            683     ;;---------------------
   746A 11 00 C0      [10]  684     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   746D DD 4E 00      [19]  685         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7470 DD 46 01      [19]  686         ld      b,  entity_y(ix)  
   7473 04            [ 4]  687         inc b       
   7474 04            [ 4]  688         inc b
   7475 04            [ 4]  689         inc b 
   7476 04            [ 4]  690         inc b
   7477 CD 6C B0      [17]  691         call cpct_getScreenPtr_asm 
   747A 36 47         [10]  692         ld (hl), #0x47
   747C 2C            [ 4]  693         inc l
   747D 36 2E         [10]  694     ld (hl), #0x2E
                            695 
                            696     ;;-----------
   747F 11 00 C0      [10]  697     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7482 DD 4E 00      [19]  698         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7485 DD 46 01      [19]  699         ld      b,  entity_y(ix)  
   7488 04            [ 4]  700         inc b       
   7489 04            [ 4]  701         inc b
   748A 04            [ 4]  702         inc b
   748B CD 6C B0      [17]  703         call cpct_getScreenPtr_asm 
   748E 36 77         [10]  704         ld (hl), #0x77
   7490 2C            [ 4]  705         inc l
   7491 36 EE         [10]  706     ld (hl), #0xEE
                            707 
                            708     ;;-----------
   7493 11 00 C0      [10]  709     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7496 DD 4E 00      [19]  710         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7499 DD 46 01      [19]  711         ld      b,  entity_y(ix)  
   749C 04            [ 4]  712         inc b       
   749D 04            [ 4]  713         inc b
   749E CD 6C B0      [17]  714         call cpct_getScreenPtr_asm 
   74A1 36 33         [10]  715         ld (hl), #0x33
   74A3 2C            [ 4]  716         inc l
   74A4 36 CC         [10]  717     ld (hl), #0xCC
                            718 
                            719     ;;-----------
   74A6 11 00 C0      [10]  720     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   74A9 DD 4E 00      [19]  721         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   74AC DD 46 01      [19]  722         ld      b,  entity_y(ix)  
   74AF 04            [ 4]  723         inc b 
   74B0 CD 6C B0      [17]  724         call cpct_getScreenPtr_asm
   74B3 36 17         [10]  725         ld (hl), #0x17
   74B5 2C            [ 4]  726         inc l 
   74B6 36 EE         [10]  727     ld (hl), #0xEE
                            728 
                            729     ;;-----------
   74B8 11 00 C0      [10]  730     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   74BB DD 4E 00      [19]  731         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   74BE DD 46 01      [19]  732         ld      b,  entity_y(ix)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   74C1 CD 6C B0      [17]  733         call cpct_getScreenPtr_asm 
   74C4 36 77         [10]  734         ld (hl), #0x77
   74C6 2C            [ 4]  735         inc l
   74C7 36 EE         [10]  736     ld (hl), #0xEE
                            737 
                            738     ;;-----------
   74C9 11 00 C0      [10]  739     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   74CC DD 4E 00      [19]  740         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   74CF DD 46 01      [19]  741         ld      b,  entity_y(ix)  
   74D2 05            [ 4]  742         dec b
   74D3 CD 6C B0      [17]  743         call cpct_getScreenPtr_asm
   74D6 36 33         [10]  744         ld (hl), #0x33
   74D8 2C            [ 4]  745         inc l 
   74D9 36 CC         [10]  746     ld (hl), #0xCC
                            747 
                            748     ;;-----------
   74DB 11 00 C0      [10]  749     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   74DE DD 4E 00      [19]  750         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   74E1 DD 46 01      [19]  751         ld      b,  entity_y(ix)  
   74E4 05            [ 4]  752         dec b       
   74E5 05            [ 4]  753         dec b
   74E6 CD 6C B0      [17]  754         call cpct_getScreenPtr_asm
   74E9 36 11         [10]  755         ld (hl), #0x11
   74EB 2C            [ 4]  756         inc l 
   74EC 36 88         [10]  757     ld (hl), #0x88
                            758 
                            759     ;;-----------
   74EE 11 00 C0      [10]  760     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   74F1 DD 4E 00      [19]  761         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   74F4 DD 46 01      [19]  762         ld      b,  entity_y(ix)  
   74F7 05            [ 4]  763         dec b       
   74F8 05            [ 4]  764         dec b
   74F9 05            [ 4]  765         dec b
   74FA CD 6C B0      [17]  766         call cpct_getScreenPtr_asm 
   74FD 36 10         [10]  767         ld (hl), #0x10
   74FF 2C            [ 4]  768         inc l
   7500 36 88         [10]  769     ld (hl), #0x88
                            770     ;;-----------
   7502 11 00 C0      [10]  771     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7505 DD 4E 00      [19]  772         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7508 DD 46 01      [19]  773         ld      b,  entity_y(ix)  
   750B 05            [ 4]  774         dec b       
   750C 05            [ 4]  775         dec b
   750D 05            [ 4]  776         dec b
   750E 05            [ 4]  777         dec b
   750F CD 6C B0      [17]  778         call cpct_getScreenPtr_asm 
   7512 36 11         [10]  779         ld (hl), #0x11
   7514 2C            [ 4]  780         inc l
   7515 36 88         [10]  781     ld (hl), #0x88
                            782     ;;-----------
   7517 11 00 C0      [10]  783     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   751A DD 4E 00      [19]  784         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   751D DD 46 01      [19]  785         ld      b,  entity_y(ix)  
   7520 05            [ 4]  786         dec b       
   7521 05            [ 4]  787         dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   7522 05            [ 4]  788         dec b
   7523 05            [ 4]  789         dec b
   7524 05            [ 4]  790         dec b
   7525 CD 6C B0      [17]  791         call cpct_getScreenPtr_asm 
   7528 36 00         [10]  792         ld (hl), #0x00
   752A 2C            [ 4]  793         inc l
   752B 36 00         [10]  794     ld (hl), #0x00
                            795     ;;-----------
   752D 11 00 C0      [10]  796     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7530 DD 4E 00      [19]  797         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7533 DD 46 01      [19]  798         ld      b,  entity_y(ix)  
   7536 05            [ 4]  799         dec b       
   7537 05            [ 4]  800         dec b
   7538 05            [ 4]  801         dec b
   7539 05            [ 4]  802         dec b
   753A 05            [ 4]  803         dec b
   753B 05            [ 4]  804         dec b
   753C CD 6C B0      [17]  805         call cpct_getScreenPtr_asm 
   753F 36 00         [10]  806         ld (hl), #0x00
   7541 2C            [ 4]  807         inc l
   7542 36 00         [10]  808     ld (hl), #0x00
                            809     ;;-----------
   7544 11 00 C0      [10]  810     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7547 DD 4E 00      [19]  811         ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   754A DD 46 01      [19]  812         ld      b,  entity_y(ix)  
   754D 05            [ 4]  813         dec b       
   754E 05            [ 4]  814         dec b
   754F 05            [ 4]  815         dec b
   7550 05            [ 4]  816         dec b
   7551 05            [ 4]  817         dec b
   7552 05            [ 4]  818         dec b
   7553 05            [ 4]  819         dec b
   7554 CD 6C B0      [17]  820         call cpct_getScreenPtr_asm 
   7557 36 00         [10]  821         ld (hl), #0x00
   7559 2C            [ 4]  822         inc l
   755A 36 00         [10]  823     ld (hl), #0x00
   755C DD 21 03 40   [14]  824     ld ix, #playerPos
   7560 DD 36 04 01   [19]  825         ld entity_estado(ix), #1
   7564 DD 36 05 00   [19]  826         ld entity_vy(ix), #0
                            827 
   7568 C9            [10]  828 ret
                            829 
                            830 
                            831 
                            832 
                            833 
                            834 
                            835 
                            836 
                            837 
                            838 
                            839 
                            840 
                            841 
                            842 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



                            843 
                            844 
                            845 ;;pintarPersonajePos0::
                            846 ;;
                            847 ;;;;Primero calculamos la dirección de memoria para pintar el objeto
                            848 ;;
                            849 ;;
                            850 ;;    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            851 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
                            852 ;;    ld      b,  entity_y(ix)  
                            853 ;;    inc b       
                            854 ;;    inc b
                            855 ;;    inc b 
                            856 ;;    inc b
                            857 ;;    inc b
                            858 ;;    inc b 
                            859 ;;    inc b
                            860 ;;    call cpct_getScreenPtr_asm 
                            861 ;;    ld (hl), #0x01
                            862 ;;    inc l
                            863 ;;   ld (hl), #0x0E
                            864 ;;   
                            865 ;;   
                            866 ;;   ;;-----------
                            867 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            868 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
                            869 ;;    ld      b,  entity_y(ix)  
                            870 ;;    inc b       
                            871 ;;    inc b
                            872 ;;    inc b 
                            873 ;;    inc b
                            874 ;;    inc b 
                            875 ;;    inc b
                            876 ;;    call cpct_getScreenPtr_asm 
                            877 ;;    ld (hl), #0x12
                            878 ;;    inc l
                            879 ;;   ld (hl), #0x41
                            880 ;;   
                            881 ;;   ;;-------------
                            882 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            883 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
                            884 ;;    ld      b,  entity_y(ix)  
                            885 ;;    inc b       
                            886 ;;    inc b
                            887 ;;    inc b 
                            888 ;;    inc b
                            889 ;;    inc b 
                            890 ;;    call cpct_getScreenPtr_asm 
                            891 ;;    ld (hl), #0x02
                            892 ;;    inc l
                            893 ;;   ld (hl), #0xA1
                            894 ;;   
                            895 ;;   ;;---------------------
                            896 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            897 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 21.
Hexadecimal [16-Bits]



                            898 ;;    ld      b,  entity_y(ix)  
                            899 ;;    inc b       
                            900 ;;    inc b
                            901 ;;    inc b 
                            902 ;;    inc b
                            903 ;;    call cpct_getScreenPtr_asm 
                            904 ;;    ld (hl), #0x23
                            905 ;;    inc l
                            906 ;;   ld (hl), #0x1F
                            907 ;;   
                            908 ;;   ;;-----------
                            909 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            910 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
                            911 ;;    ld      b,  entity_y(ix)  
                            912 ;;    inc b       
                            913 ;;    inc b
                            914 ;;    inc b
                            915 ;;    call cpct_getScreenPtr_asm 
                            916 ;;    ld (hl), #0x33
                            917 ;;    inc l
                            918 ;;   ld (hl), #0xFF
                            919 ;;   
                            920 ;;   ;;-----------
                            921 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            922 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
                            923 ;;    ld      b,  entity_y(ix)  
                            924 ;;    inc b       
                            925 ;;    inc b
                            926 ;;    call cpct_getScreenPtr_asm 
                            927 ;;    ld (hl), #0x11
                            928 ;;    inc l
                            929 ;;   ld (hl), #0xEE
                            930 ;;   
                            931 ;;   ;;-----------
                            932 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            933 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
                            934 ;;    ld      b,  entity_y(ix)  
                            935 ;;    inc b 
                            936 ;;    call cpct_getScreenPtr_asm
                            937 ;;    ld (hl), #0x33
                            938 ;;    inc l 
                            939 ;;   ld (hl), #0xCF
                            940 ;;   
                            941 ;;   ;;-----------
                            942 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            943 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
                            944 ;;    ld      b,  entity_y(ix)  
                            945 ;;    call cpct_getScreenPtr_asm 
                            946 ;;    ld (hl), #0x33
                            947 ;;    inc l
                            948 ;;   ld (hl), #0xFF
                            949 ;;   
                            950 ;;   ;;-----------
                            951 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            952 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 22.
Hexadecimal [16-Bits]



                            953 ;;    ld      b,  entity_y(ix)  
                            954 ;;    dec b
                            955 ;;    call cpct_getScreenPtr_asm
                            956 ;;    ld (hl), #0x11
                            957 ;;    inc l 
                            958 ;;   ld (hl), #0xEE
                            959 ;;   
                            960 ;;   ;;-----------
                            961 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            962 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
                            963 ;;    ld      b,  entity_y(ix)  
                            964 ;;    dec b       
                            965 ;;    dec b
                            966 ;;    call cpct_getScreenPtr_asm
                            967 ;;    ld (hl), #0x00
                            968 ;;    inc l 
                            969 ;;   ld (hl), #0xCC
                            970 ;;   
                            971 ;;   ;;-----------
                            972 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            973 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
                            974 ;;    ld      b,  entity_y(ix)  
                            975 ;;    dec b       
                            976 ;;    dec b
                            977 ;;    dec b
                            978 ;;    call cpct_getScreenPtr_asm 
                            979 ;;    ld (hl), #0x00
                            980 ;;    inc l
                            981 ;;   ld (hl), #0xC8
                            982 ;;   ;;-----------
                            983 ;;   ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            984 ;;    ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
                            985 ;;    ld      b,  entity_y(ix)  
                            986 ;;    dec b       
                            987 ;;    dec b
                            988 ;;    dec b
                            989 ;;    dec b
                            990 ;;    call cpct_getScreenPtr_asm 
                            991 ;;    ld (hl), #0x00
                            992 ;;    inc l
                            993 ;;   ld (hl), #0xCC
                            994 ;;   
                            995 ;;
                            996 ;;ret
                            997 ;;
                            998 
                            999 
   7569                    1000 ataqueAereoIzquierda::
   7569 11 00 C0      [10] 1001 ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   756C DD 4E 00      [19] 1002     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   756F DD 46 01      [19] 1003     ld      b,  entity_y(ix)  
   7572 04            [ 4] 1004     inc b       
   7573 04            [ 4] 1005     inc b
   7574 04            [ 4] 1006     inc b 
   7575 04            [ 4] 1007     inc b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 23.
Hexadecimal [16-Bits]



   7576 04            [ 4] 1008     inc b
   7577 04            [ 4] 1009     inc b 
   7578 04            [ 4] 1010     inc b
   7579 CD 6C B0      [17] 1011     call cpct_getScreenPtr_asm 
   757C 36 03         [10] 1012     ld (hl), #0x03
   757E 2C            [ 4] 1013     inc l
   757F 36 0C         [10] 1014    ld (hl), #0x0C
                           1015 
                           1016 
                           1017    ;;-----------
   7581 11 00 C0      [10] 1018    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7584 DD 4E 00      [19] 1019     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7587 DD 46 01      [19] 1020     ld      b,  entity_y(ix)  
   758A 04            [ 4] 1021     inc b       
   758B 04            [ 4] 1022     inc b
   758C 04            [ 4] 1023     inc b 
   758D 04            [ 4] 1024     inc b
   758E 04            [ 4] 1025     inc b 
   758F 04            [ 4] 1026     inc b
   7590 CD 6C B0      [17] 1027     call cpct_getScreenPtr_asm 
   7593 36 24         [10] 1028     ld (hl), #0x24
   7595 2C            [ 4] 1029     inc l
   7596 36 82         [10] 1030    ld (hl), #0x82
                           1031 
                           1032    ;;-------------
   7598 11 00 C0      [10] 1033    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   759B DD 4E 00      [19] 1034     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   759E DD 46 01      [19] 1035     ld      b,  entity_y(ix)  
   75A1 04            [ 4] 1036     inc b       
   75A2 04            [ 4] 1037     inc b
   75A3 04            [ 4] 1038     inc b 
   75A4 04            [ 4] 1039     inc b
   75A5 04            [ 4] 1040     inc b 
   75A6 CD 6C B0      [17] 1041     call cpct_getScreenPtr_asm 
   75A9 36 14         [10] 1042     ld (hl), #0x14
   75AB 2C            [ 4] 1043     inc l
   75AC 36 42         [10] 1044    ld (hl), #0x42
                           1045 
                           1046    ;;---------------------
   75AE 11 00 C0      [10] 1047    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   75B1 DD 4E 00      [19] 1048     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   75B4 DD 46 01      [19] 1049     ld      b,  entity_y(ix)  
   75B7 04            [ 4] 1050     inc b       
   75B8 04            [ 4] 1051     inc b
   75B9 04            [ 4] 1052     inc b 
   75BA 04            [ 4] 1053     inc b
   75BB CD 6C B0      [17] 1054     call cpct_getScreenPtr_asm 
   75BE 36 47         [10] 1055     ld (hl), #0x47
   75C0 2C            [ 4] 1056     inc l
   75C1 36 2E         [10] 1057    ld (hl), #0x2E
                           1058 
                           1059    ;;-----------
   75C3 11 00 C0      [10] 1060    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   75C6 DD 4E 00      [19] 1061     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   75C9 DD 46 01      [19] 1062     ld      b,  entity_y(ix)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 24.
Hexadecimal [16-Bits]



   75CC 04            [ 4] 1063     inc b       
   75CD 04            [ 4] 1064     inc b
   75CE 04            [ 4] 1065     inc b
   75CF CD 6C B0      [17] 1066     call cpct_getScreenPtr_asm 
   75D2 36 77         [10] 1067     ld (hl), #0x77
   75D4 2C            [ 4] 1068     inc l
   75D5 36 EE         [10] 1069    ld (hl), #0xEE
                           1070 
                           1071    ;;-----------
   75D7 11 00 C0      [10] 1072    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   75DA DD 4E 00      [19] 1073     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   75DD DD 46 01      [19] 1074     ld      b,  entity_y(ix)  
   75E0 04            [ 4] 1075     inc b       
   75E1 04            [ 4] 1076     inc b
   75E2 CD 6C B0      [17] 1077     call cpct_getScreenPtr_asm 
   75E5 36 33         [10] 1078     ld (hl), #0x33
   75E7 2C            [ 4] 1079     inc l
   75E8 36 CC         [10] 1080    ld (hl), #0xCC
                           1081 
                           1082    ;;-----------
   75EA 11 00 C0      [10] 1083    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   75ED DD 4E 00      [19] 1084     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   75F0 DD 46 01      [19] 1085     ld      b,  entity_y(ix)  
   75F3 04            [ 4] 1086     inc b 
   75F4 CD 6C B0      [17] 1087     call cpct_getScreenPtr_asm
   75F7 36 17         [10] 1088     ld (hl), #0x17
   75F9 2C            [ 4] 1089     inc l 
   75FA 36 EE         [10] 1090    ld (hl), #0xEE
                           1091 
                           1092    ;;-----------
   75FC 11 00 C0      [10] 1093    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   75FF DD 4E 00      [19] 1094     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7602 DD 46 01      [19] 1095     ld      b,  entity_y(ix)  
   7605 CD 6C B0      [17] 1096     call cpct_getScreenPtr_asm 
   7608 36 77         [10] 1097     ld (hl), #0x77
   760A 2C            [ 4] 1098     inc l
   760B 36 EE         [10] 1099    ld (hl), #0xEE
                           1100 
                           1101    ;;-----------
   760D 11 00 C0      [10] 1102    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7610 DD 4E 00      [19] 1103     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7613 DD 46 01      [19] 1104     ld      b,  entity_y(ix)  
   7616 05            [ 4] 1105     dec b
   7617 CD 6C B0      [17] 1106     call cpct_getScreenPtr_asm
   761A 36 33         [10] 1107     ld (hl), #0x33
   761C 2C            [ 4] 1108     inc l 
   761D 36 CC         [10] 1109    ld (hl), #0xCC
                           1110 
                           1111    ;;-----------
   761F 11 00 C0      [10] 1112    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7622 DD 4E 00      [19] 1113     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7625 DD 46 01      [19] 1114     ld      b,  entity_y(ix)  
   7628 05            [ 4] 1115     dec b       
   7629 05            [ 4] 1116     dec b
   762A CD 6C B0      [17] 1117     call cpct_getScreenPtr_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 25.
Hexadecimal [16-Bits]



   762D 36 01         [10] 1118     ld (hl), #0x01
   762F 2C            [ 4] 1119     inc l 
   7630 36 77         [10] 1120    ld (hl), #0x77
                           1121 
                           1122    ;;-----------
   7632 11 00 C0      [10] 1123    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7635 DD 4E 00      [19] 1124     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7638 DD 46 01      [19] 1125     ld      b,  entity_y(ix)  
   763B 05            [ 4] 1126     dec b       
   763C 05            [ 4] 1127     dec b
   763D 05            [ 4] 1128     dec b
   763E CD 6C B0      [17] 1129     call cpct_getScreenPtr_asm 
   7641 36 00         [10] 1130     ld (hl), #0x00
   7643 2C            [ 4] 1131     inc l
   7644 36 75         [10] 1132    ld (hl), #0x75
                           1133    ;;-----------
   7646 11 00 C0      [10] 1134    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7649 DD 4E 00      [19] 1135     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   764C DD 46 01      [19] 1136     ld      b,  entity_y(ix)  
   764F 05            [ 4] 1137     dec b       
   7650 05            [ 4] 1138     dec b
   7651 05            [ 4] 1139     dec b
   7652 05            [ 4] 1140     dec b
   7653 CD 6C B0      [17] 1141     call cpct_getScreenPtr_asm 
   7656 36 00         [10] 1142     ld (hl), #0x00
   7658 2C            [ 4] 1143     inc l
   7659 36 00         [10] 1144    ld (hl), #0x00
                           1145 ;;-----------
   765B 11 00 C0      [10] 1146    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   765E DD 4E 00      [19] 1147     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7661 DD 46 01      [19] 1148     ld      b,  entity_y(ix)  
   7664 05            [ 4] 1149     dec b       
   7665 05            [ 4] 1150     dec b
   7666 05            [ 4] 1151     dec b
   7667 05            [ 4] 1152     dec b
   7668 05            [ 4] 1153     dec b
   7669 05            [ 4] 1154     dec b
   766A 05            [ 4] 1155     dec b
   766B CD 6C B0      [17] 1156     call cpct_getScreenPtr_asm 
   766E 36 77         [10] 1157     ld (hl), #0x77
   7670 2C            [ 4] 1158     inc l
   7671 36 EE         [10] 1159    ld (hl), #0xEE
                           1160 ;;-----------
   7673 11 00 C0      [10] 1161    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7676 DD 4E 00      [19] 1162     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7679 DD 46 01      [19] 1163     ld      b,  entity_y(ix)  
   767C 05            [ 4] 1164     dec b       
   767D 05            [ 4] 1165     dec b
   767E 05            [ 4] 1166     dec b
   767F 05            [ 4] 1167     dec b
   7680 05            [ 4] 1168     dec b
   7681 05            [ 4] 1169     dec b
   7682 05            [ 4] 1170     dec b
   7683 05            [ 4] 1171     dec b
   7684 CD 6C B0      [17] 1172     call cpct_getScreenPtr_asm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 26.
Hexadecimal [16-Bits]



   7687 36 77         [10] 1173     ld (hl), #0x77
   7689 2C            [ 4] 1174     inc l
   768A 36 EE         [10] 1175    ld (hl), #0xEE
                           1176 ;;-----------
   768C 11 00 C0      [10] 1177    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   768F DD 4E 00      [19] 1178     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7692 DD 46 01      [19] 1179     ld      b,  entity_y(ix)  
   7695 05            [ 4] 1180     dec b       
   7696 05            [ 4] 1181     dec b
   7697 05            [ 4] 1182     dec b
   7698 05            [ 4] 1183     dec b
   7699 05            [ 4] 1184     dec b
   769A 05            [ 4] 1185     dec b
   769B 05            [ 4] 1186     dec b
   769C 05            [ 4] 1187     dec b
   769D 05            [ 4] 1188     dec b
   769E CD 6C B0      [17] 1189     call cpct_getScreenPtr_asm 
   76A1 36 76         [10] 1190     ld (hl), #0x76
   76A3 2C            [ 4] 1191     inc l
   76A4 36 E6         [10] 1192    ld (hl), #0xE6
                           1193 
                           1194    ;;-----------
   76A6 11 00 C0      [10] 1195    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   76A9 DD 4E 00      [19] 1196     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   76AC DD 46 01      [19] 1197     ld      b,  entity_y(ix)  
   76AF 05            [ 4] 1198     dec b       
   76B0 05            [ 4] 1199     dec b
   76B1 05            [ 4] 1200     dec b
   76B2 05            [ 4] 1201     dec b
   76B3 05            [ 4] 1202     dec b
   76B4 05            [ 4] 1203     dec b
   76B5 05            [ 4] 1204     dec b
   76B6 05            [ 4] 1205     dec b
   76B7 05            [ 4] 1206     dec b
   76B8 05            [ 4] 1207     dec b
   76B9 CD 6C B0      [17] 1208     call cpct_getScreenPtr_asm 
   76BC 36 76         [10] 1209     ld (hl), #0x76
   76BE 2C            [ 4] 1210     inc l
   76BF 36 E6         [10] 1211    ld (hl), #0xE6
                           1212    ;;-----------
   76C1 11 00 C0      [10] 1213    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   76C4 DD 4E 00      [19] 1214     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   76C7 DD 46 01      [19] 1215     ld      b,  entity_y(ix)  
   76CA 05            [ 4] 1216     dec b       
   76CB 05            [ 4] 1217     dec b
   76CC 05            [ 4] 1218     dec b
   76CD 05            [ 4] 1219     dec b
   76CE 05            [ 4] 1220     dec b
   76CF 05            [ 4] 1221     dec b
   76D0 05            [ 4] 1222     dec b
   76D1 05            [ 4] 1223     dec b
   76D2 05            [ 4] 1224     dec b
   76D3 05            [ 4] 1225     dec b
   76D4 05            [ 4] 1226     dec b
   76D5 CD 6C B0      [17] 1227     call cpct_getScreenPtr_asm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 27.
Hexadecimal [16-Bits]



   76D8 36 77         [10] 1228     ld (hl), #0x77
   76DA 2C            [ 4] 1229     inc l
   76DB 36 EE         [10] 1230    ld (hl), #0xEE
   76DD 11 00 C0      [10] 1231     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   76E0 DD 4E 00      [19] 1232     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   76E3 DD 46 01      [19] 1233     ld      b,  entity_y(ix)  
   76E6 05            [ 4] 1234     dec b       
   76E7 05            [ 4] 1235     dec b
   76E8 05            [ 4] 1236     dec b
   76E9 05            [ 4] 1237     dec b
   76EA 05            [ 4] 1238     dec b
   76EB 05            [ 4] 1239     dec b
   76EC 05            [ 4] 1240     dec b
   76ED 05            [ 4] 1241     dec b
   76EE 05            [ 4] 1242     dec b
   76EF 05            [ 4] 1243     dec b
   76F0 05            [ 4] 1244     dec b
   76F1 05            [ 4] 1245     dec b
   76F2 CD 6C B0      [17] 1246     call cpct_getScreenPtr_asm 
   76F5 36 77         [10] 1247     ld (hl), #0x77
   76F7 2C            [ 4] 1248     inc l
   76F8 36 EE         [10] 1249    ld (hl), #0xEE
                           1250 
   76FA C9            [10] 1251 ret
                           1252 
                           1253 
   76FB                    1254 ataqueAereoIzquierda2::
   76FB 11 00 C0      [10] 1255 ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   76FE DD 4E 00      [19] 1256     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7701 DD 46 01      [19] 1257     ld      b,  entity_y(ix)  
   7704 04            [ 4] 1258     inc b       
   7705 04            [ 4] 1259     inc b
   7706 04            [ 4] 1260     inc b 
   7707 04            [ 4] 1261     inc b
   7708 04            [ 4] 1262     inc b
   7709 04            [ 4] 1263     inc b 
   770A 04            [ 4] 1264     inc b
   770B CD 6C B0      [17] 1265     call cpct_getScreenPtr_asm 
   770E 36 03         [10] 1266     ld (hl), #0x03
   7710 2C            [ 4] 1267     inc l
   7711 36 0C         [10] 1268    ld (hl), #0x0C
                           1269 
                           1270 
                           1271    ;;-----------
   7713 11 00 C0      [10] 1272    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7716 DD 4E 00      [19] 1273     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7719 DD 46 01      [19] 1274     ld      b,  entity_y(ix)  
   771C 04            [ 4] 1275     inc b       
   771D 04            [ 4] 1276     inc b
   771E 04            [ 4] 1277     inc b 
   771F 04            [ 4] 1278     inc b
   7720 04            [ 4] 1279     inc b 
   7721 04            [ 4] 1280     inc b
   7722 CD 6C B0      [17] 1281     call cpct_getScreenPtr_asm 
   7725 36 24         [10] 1282     ld (hl), #0x24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 28.
Hexadecimal [16-Bits]



   7727 2C            [ 4] 1283     inc l
   7728 36 82         [10] 1284    ld (hl), #0x82
                           1285 
                           1286    ;;-------------
   772A 11 00 C0      [10] 1287    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   772D DD 4E 00      [19] 1288     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7730 DD 46 01      [19] 1289     ld      b,  entity_y(ix)  
   7733 04            [ 4] 1290     inc b       
   7734 04            [ 4] 1291     inc b
   7735 04            [ 4] 1292     inc b 
   7736 04            [ 4] 1293     inc b
   7737 04            [ 4] 1294     inc b 
   7738 CD 6C B0      [17] 1295     call cpct_getScreenPtr_asm 
   773B 36 14         [10] 1296     ld (hl), #0x14
   773D 2C            [ 4] 1297     inc l
   773E 36 42         [10] 1298    ld (hl), #0x42
                           1299 
                           1300    ;;---------------------
   7740 11 00 C0      [10] 1301    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7743 DD 4E 00      [19] 1302     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7746 DD 46 01      [19] 1303     ld      b,  entity_y(ix)  
   7749 04            [ 4] 1304     inc b       
   774A 04            [ 4] 1305     inc b
   774B 04            [ 4] 1306     inc b 
   774C 04            [ 4] 1307     inc b
   774D CD 6C B0      [17] 1308     call cpct_getScreenPtr_asm 
   7750 36 47         [10] 1309     ld (hl), #0x47
   7752 2C            [ 4] 1310     inc l
   7753 36 2E         [10] 1311    ld (hl), #0x2E
                           1312 
                           1313    ;;-----------
   7755 11 00 C0      [10] 1314    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7758 DD 4E 00      [19] 1315     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   775B DD 46 01      [19] 1316     ld      b,  entity_y(ix)  
   775E 04            [ 4] 1317     inc b       
   775F 04            [ 4] 1318     inc b
   7760 04            [ 4] 1319     inc b
   7761 CD 6C B0      [17] 1320     call cpct_getScreenPtr_asm 
   7764 36 77         [10] 1321     ld (hl), #0x77
   7766 2C            [ 4] 1322     inc l
   7767 36 EE         [10] 1323    ld (hl), #0xEE
                           1324 
                           1325    ;;-----------
   7769 11 00 C0      [10] 1326    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   776C DD 4E 00      [19] 1327     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   776F DD 46 01      [19] 1328     ld      b,  entity_y(ix)  
   7772 04            [ 4] 1329     inc b       
   7773 04            [ 4] 1330     inc b
   7774 CD 6C B0      [17] 1331     call cpct_getScreenPtr_asm 
   7777 36 33         [10] 1332     ld (hl), #0x33
   7779 2C            [ 4] 1333     inc l
   777A 36 CC         [10] 1334    ld (hl), #0xCC
                           1335 
                           1336    ;;-----------
   777C 11 00 C0      [10] 1337    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 29.
Hexadecimal [16-Bits]



   777F DD 4E 00      [19] 1338     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7782 DD 46 01      [19] 1339     ld      b,  entity_y(ix)  
   7785 04            [ 4] 1340     inc b 
   7786 CD 6C B0      [17] 1341     call cpct_getScreenPtr_asm
   7789 36 17         [10] 1342     ld (hl), #0x17
   778B 2C            [ 4] 1343     inc l 
   778C 36 EE         [10] 1344    ld (hl), #0xEE
                           1345 
                           1346    ;;-----------
   778E 11 00 C0      [10] 1347    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7791 DD 4E 00      [19] 1348     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7794 DD 46 01      [19] 1349     ld      b,  entity_y(ix)  
   7797 CD 6C B0      [17] 1350     call cpct_getScreenPtr_asm 
   779A 36 77         [10] 1351     ld (hl), #0x77
   779C 2C            [ 4] 1352     inc l
   779D 36 EE         [10] 1353    ld (hl), #0xEE
                           1354 
                           1355    ;;-----------
   779F 11 00 C0      [10] 1356    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   77A2 DD 4E 00      [19] 1357     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   77A5 DD 46 01      [19] 1358     ld      b,  entity_y(ix)  
   77A8 05            [ 4] 1359     dec b
   77A9 CD 6C B0      [17] 1360     call cpct_getScreenPtr_asm
   77AC 36 33         [10] 1361     ld (hl), #0x33
   77AE 2C            [ 4] 1362     inc l 
   77AF 36 CC         [10] 1363    ld (hl), #0xCC
                           1364 
                           1365    ;;-----------
   77B1 11 00 C0      [10] 1366    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   77B4 DD 4E 00      [19] 1367     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   77B7 DD 46 01      [19] 1368     ld      b,  entity_y(ix)  
   77BA 05            [ 4] 1369     dec b       
   77BB 05            [ 4] 1370     dec b
   77BC CD 6C B0      [17] 1371     call cpct_getScreenPtr_asm
   77BF 36 01         [10] 1372     ld (hl), #0x01
   77C1 2C            [ 4] 1373     inc l 
   77C2 36 77         [10] 1374    ld (hl), #0x77
                           1375 
                           1376    ;;-----------
   77C4 11 00 C0      [10] 1377    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   77C7 DD 4E 00      [19] 1378     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   77CA DD 46 01      [19] 1379     ld      b,  entity_y(ix)  
   77CD 05            [ 4] 1380     dec b       
   77CE 05            [ 4] 1381     dec b
   77CF 05            [ 4] 1382     dec b
   77D0 CD 6C B0      [17] 1383     call cpct_getScreenPtr_asm 
   77D3 36 00         [10] 1384     ld (hl), #0x00
   77D5 2C            [ 4] 1385     inc l
   77D6 36 75         [10] 1386    ld (hl), #0x75
                           1387    ;;-----------
   77D8 11 00 C0      [10] 1388    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   77DB DD 4E 00      [19] 1389     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   77DE DD 46 01      [19] 1390     ld      b,  entity_y(ix)  
   77E1 05            [ 4] 1391     dec b       
   77E2 05            [ 4] 1392     dec b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 30.
Hexadecimal [16-Bits]



   77E3 05            [ 4] 1393     dec b
   77E4 05            [ 4] 1394     dec b
   77E5 CD 6C B0      [17] 1395     call cpct_getScreenPtr_asm 
   77E8 36 00         [10] 1396     ld (hl), #0x00
   77EA 2C            [ 4] 1397     inc l
   77EB 36 00         [10] 1398    ld (hl), #0x00
                           1399 ;;-----------
   77ED 11 00 C0      [10] 1400    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   77F0 DD 4E 00      [19] 1401     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   77F3 DD 46 01      [19] 1402     ld      b,  entity_y(ix)  
   77F6 05            [ 4] 1403     dec b       
   77F7 05            [ 4] 1404     dec b
   77F8 05            [ 4] 1405     dec b
   77F9 05            [ 4] 1406     dec b
   77FA 05            [ 4] 1407     dec b
   77FB 05            [ 4] 1408     dec b
   77FC 05            [ 4] 1409     dec b
   77FD CD 6C B0      [17] 1410     call cpct_getScreenPtr_asm 
   7800 36 70         [10] 1411     ld (hl), #0x70
   7802 2C            [ 4] 1412     inc l
   7803 36 E0         [10] 1413    ld (hl), #0xE0
                           1414 ;;-----------
   7805 11 00 C0      [10] 1415    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7808 DD 4E 00      [19] 1416     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   780B DD 46 01      [19] 1417     ld      b,  entity_y(ix)  
   780E 05            [ 4] 1418     dec b       
   780F 05            [ 4] 1419     dec b
   7810 05            [ 4] 1420     dec b
   7811 05            [ 4] 1421     dec b
   7812 05            [ 4] 1422     dec b
   7813 05            [ 4] 1423     dec b
   7814 05            [ 4] 1424     dec b
   7815 05            [ 4] 1425     dec b
   7816 CD 6C B0      [17] 1426     call cpct_getScreenPtr_asm 
   7819 36 70         [10] 1427     ld (hl), #0x70
   781B 2C            [ 4] 1428     inc l
   781C 36 E0         [10] 1429    ld (hl), #0xE0
                           1430 ;;-----------
   781E 11 00 C0      [10] 1431    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7821 DD 4E 00      [19] 1432     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7824 DD 46 01      [19] 1433     ld      b,  entity_y(ix)  
   7827 05            [ 4] 1434     dec b       
   7828 05            [ 4] 1435     dec b
   7829 05            [ 4] 1436     dec b
   782A 05            [ 4] 1437     dec b
   782B 05            [ 4] 1438     dec b
   782C 05            [ 4] 1439     dec b
   782D 05            [ 4] 1440     dec b
   782E 05            [ 4] 1441     dec b
   782F 05            [ 4] 1442     dec b
   7830 CD 6C B0      [17] 1443     call cpct_getScreenPtr_asm 
   7833 36 71         [10] 1444     ld (hl), #0x71
   7835 2C            [ 4] 1445     inc l
   7836 36 E8         [10] 1446    ld (hl), #0xE8
                           1447 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 31.
Hexadecimal [16-Bits]



                           1448    ;;-----------
   7838 11 00 C0      [10] 1449    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   783B DD 4E 00      [19] 1450     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   783E DD 46 01      [19] 1451     ld      b,  entity_y(ix)  
   7841 05            [ 4] 1452     dec b       
   7842 05            [ 4] 1453     dec b
   7843 05            [ 4] 1454     dec b
   7844 05            [ 4] 1455     dec b
   7845 05            [ 4] 1456     dec b
   7846 05            [ 4] 1457     dec b
   7847 05            [ 4] 1458     dec b
   7848 05            [ 4] 1459     dec b
   7849 05            [ 4] 1460     dec b
   784A 05            [ 4] 1461     dec b
   784B CD 6C B0      [17] 1462     call cpct_getScreenPtr_asm 
   784E 36 71         [10] 1463     ld (hl), #0x71
   7850 2C            [ 4] 1464     inc l
   7851 36 E8         [10] 1465    ld (hl), #0xE8
                           1466    ;;-----------
   7853 11 00 C0      [10] 1467    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7856 DD 4E 00      [19] 1468     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7859 DD 46 01      [19] 1469     ld      b,  entity_y(ix)  
   785C 05            [ 4] 1470     dec b       
   785D 05            [ 4] 1471     dec b
   785E 05            [ 4] 1472     dec b
   785F 05            [ 4] 1473     dec b
   7860 05            [ 4] 1474     dec b
   7861 05            [ 4] 1475     dec b
   7862 05            [ 4] 1476     dec b
   7863 05            [ 4] 1477     dec b
   7864 05            [ 4] 1478     dec b
   7865 05            [ 4] 1479     dec b
   7866 05            [ 4] 1480     dec b
   7867 CD 6C B0      [17] 1481     call cpct_getScreenPtr_asm 
   786A 36 70         [10] 1482     ld (hl), #0x70
   786C 2C            [ 4] 1483     inc l
   786D 36 E0         [10] 1484    ld (hl), #0xE0
   786F 11 00 C0      [10] 1485     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7872 DD 4E 00      [19] 1486     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7875 DD 46 01      [19] 1487     ld      b,  entity_y(ix)  
   7878 05            [ 4] 1488     dec b       
   7879 05            [ 4] 1489     dec b
   787A 05            [ 4] 1490     dec b
   787B 05            [ 4] 1491     dec b
   787C 05            [ 4] 1492     dec b
   787D 05            [ 4] 1493     dec b
   787E 05            [ 4] 1494     dec b
   787F 05            [ 4] 1495     dec b
   7880 05            [ 4] 1496     dec b
   7881 05            [ 4] 1497     dec b
   7882 05            [ 4] 1498     dec b
   7883 05            [ 4] 1499     dec b
   7884 CD 6C B0      [17] 1500     call cpct_getScreenPtr_asm 
   7887 36 70         [10] 1501     ld (hl), #0x70
   7889 2C            [ 4] 1502     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 32.
Hexadecimal [16-Bits]



   788A 36 E0         [10] 1503    ld (hl), #0xE0
                           1504 
   788C C9            [10] 1505 ret
                           1506 
                           1507 
   788D                    1508 ataqueAereoDerecha::
                           1509 
   788D 11 00 C0      [10] 1510 ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7890 DD 4E 00      [19] 1511     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7893 DD 46 01      [19] 1512     ld      b,  entity_y(ix)  
   7896 04            [ 4] 1513     inc b       
   7897 04            [ 4] 1514     inc b
   7898 04            [ 4] 1515     inc b 
   7899 04            [ 4] 1516     inc b
   789A 04            [ 4] 1517     inc b
   789B 04            [ 4] 1518     inc b 
   789C 04            [ 4] 1519     inc b
   789D CD 6C B0      [17] 1520     call cpct_getScreenPtr_asm 
   78A0 36 03         [10] 1521     ld (hl), #0x03
   78A2 2C            [ 4] 1522     inc l
   78A3 36 0C         [10] 1523    ld (hl), #0x0C
                           1524 
                           1525 
                           1526    ;;-----------
   78A5 11 00 C0      [10] 1527    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   78A8 DD 4E 00      [19] 1528     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   78AB DD 46 01      [19] 1529     ld      b,  entity_y(ix)  
   78AE 04            [ 4] 1530     inc b       
   78AF 04            [ 4] 1531     inc b
   78B0 04            [ 4] 1532     inc b 
   78B1 04            [ 4] 1533     inc b
   78B2 04            [ 4] 1534     inc b 
   78B3 04            [ 4] 1535     inc b
   78B4 CD 6C B0      [17] 1536     call cpct_getScreenPtr_asm 
   78B7 36 24         [10] 1537     ld (hl), #0x24
   78B9 2C            [ 4] 1538     inc l
   78BA 36 82         [10] 1539    ld (hl), #0x82
                           1540 
                           1541    ;;-------------
   78BC 11 00 C0      [10] 1542    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   78BF DD 4E 00      [19] 1543     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   78C2 DD 46 01      [19] 1544     ld      b,  entity_y(ix)  
   78C5 04            [ 4] 1545     inc b       
   78C6 04            [ 4] 1546     inc b
   78C7 04            [ 4] 1547     inc b 
   78C8 04            [ 4] 1548     inc b
   78C9 04            [ 4] 1549     inc b 
   78CA CD 6C B0      [17] 1550     call cpct_getScreenPtr_asm 
   78CD 36 14         [10] 1551     ld (hl), #0x14
   78CF 2C            [ 4] 1552     inc l
   78D0 36 42         [10] 1553    ld (hl), #0x42
                           1554 
                           1555    ;;---------------------
   78D2 11 00 C0      [10] 1556    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   78D5 DD 4E 00      [19] 1557     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 33.
Hexadecimal [16-Bits]



   78D8 DD 46 01      [19] 1558     ld      b,  entity_y(ix)  
   78DB 04            [ 4] 1559     inc b       
   78DC 04            [ 4] 1560     inc b
   78DD 04            [ 4] 1561     inc b 
   78DE 04            [ 4] 1562     inc b
   78DF CD 6C B0      [17] 1563     call cpct_getScreenPtr_asm 
   78E2 36 47         [10] 1564     ld (hl), #0x47
   78E4 2C            [ 4] 1565     inc l
   78E5 36 2E         [10] 1566    ld (hl), #0x2E
                           1567 
                           1568    ;;-----------
   78E7 11 00 C0      [10] 1569    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   78EA DD 4E 00      [19] 1570     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   78ED DD 46 01      [19] 1571     ld      b,  entity_y(ix)  
   78F0 04            [ 4] 1572     inc b       
   78F1 04            [ 4] 1573     inc b
   78F2 04            [ 4] 1574     inc b
   78F3 CD 6C B0      [17] 1575     call cpct_getScreenPtr_asm 
   78F6 36 77         [10] 1576     ld (hl), #0x77
   78F8 2C            [ 4] 1577     inc l
   78F9 36 EE         [10] 1578    ld (hl), #0xEE
                           1579 
                           1580    ;;-----------
   78FB 11 00 C0      [10] 1581    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   78FE DD 4E 00      [19] 1582     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7901 DD 46 01      [19] 1583     ld      b,  entity_y(ix)  
   7904 04            [ 4] 1584     inc b       
   7905 04            [ 4] 1585     inc b
   7906 CD 6C B0      [17] 1586     call cpct_getScreenPtr_asm 
   7909 36 33         [10] 1587     ld (hl), #0x33
   790B 2C            [ 4] 1588     inc l
   790C 36 CC         [10] 1589    ld (hl), #0xCC
                           1590 
                           1591    ;;-----------
   790E 11 00 C0      [10] 1592    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7911 DD 4E 00      [19] 1593     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7914 DD 46 01      [19] 1594     ld      b,  entity_y(ix)  
   7917 04            [ 4] 1595     inc b 
   7918 CD 6C B0      [17] 1596     call cpct_getScreenPtr_asm
   791B 36 77         [10] 1597     ld (hl), #0x77
   791D 2C            [ 4] 1598     inc l 
   791E 36 8E         [10] 1599    ld (hl), #0x8E
                           1600 
                           1601    ;;-----------
   7920 11 00 C0      [10] 1602    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7923 DD 4E 00      [19] 1603     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7926 DD 46 01      [19] 1604     ld      b,  entity_y(ix)  
   7929 CD 6C B0      [17] 1605     call cpct_getScreenPtr_asm 
   792C 36 77         [10] 1606     ld (hl), #0x77
   792E 2C            [ 4] 1607     inc l
   792F 36 EE         [10] 1608    ld (hl), #0xEE
                           1609 
                           1610    ;;-----------
   7931 11 00 C0      [10] 1611    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7934 DD 4E 00      [19] 1612     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 34.
Hexadecimal [16-Bits]



   7937 DD 46 01      [19] 1613     ld      b,  entity_y(ix)  
   793A 05            [ 4] 1614     dec b
   793B CD 6C B0      [17] 1615     call cpct_getScreenPtr_asm
   793E 36 33         [10] 1616     ld (hl), #0x33
   7940 2C            [ 4] 1617     inc l 
   7941 36 CC         [10] 1618    ld (hl), #0xCC
                           1619 
                           1620    ;;-----------
   7943 11 00 C0      [10] 1621    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7946 DD 4E 00      [19] 1622     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7949 DD 46 01      [19] 1623     ld      b,  entity_y(ix)  
   794C 05            [ 4] 1624     dec b       
   794D 05            [ 4] 1625     dec b
   794E CD 6C B0      [17] 1626     call cpct_getScreenPtr_asm
   7951 36 EE         [10] 1627     ld (hl), #0xEE
   7953 2C            [ 4] 1628     inc l 
   7954 36 08         [10] 1629    ld (hl), #0x08
                           1630 
                           1631    ;;-----------
   7956 11 00 C0      [10] 1632    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7959 DD 4E 00      [19] 1633     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   795C DD 46 01      [19] 1634     ld      b,  entity_y(ix)  
   795F 05            [ 4] 1635     dec b       
   7960 05            [ 4] 1636     dec b
   7961 05            [ 4] 1637     dec b
   7962 CD 6C B0      [17] 1638     call cpct_getScreenPtr_asm 
   7965 36 EA         [10] 1639     ld (hl), #0xEA
   7967 2C            [ 4] 1640     inc l
   7968 36 00         [10] 1641    ld (hl), #0x00
                           1642    ;;-----------
   796A 11 00 C0      [10] 1643    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   796D DD 4E 00      [19] 1644     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7970 DD 46 01      [19] 1645     ld      b,  entity_y(ix)  
   7973 05            [ 4] 1646     dec b       
   7974 05            [ 4] 1647     dec b
   7975 05            [ 4] 1648     dec b
   7976 05            [ 4] 1649     dec b
   7977 CD 6C B0      [17] 1650     call cpct_getScreenPtr_asm 
   797A 36 00         [10] 1651     ld (hl), #0x00
   797C 2C            [ 4] 1652     inc l
   797D 36 00         [10] 1653    ld (hl), #0x00
                           1654 ;;-----------
   797F 11 00 C0      [10] 1655    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7982 DD 4E 00      [19] 1656     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7985 DD 46 01      [19] 1657     ld      b,  entity_y(ix)  
   7988 05            [ 4] 1658     dec b       
   7989 05            [ 4] 1659     dec b
   798A 05            [ 4] 1660     dec b
   798B 05            [ 4] 1661     dec b
   798C 05            [ 4] 1662     dec b
   798D 05            [ 4] 1663     dec b
   798E 05            [ 4] 1664     dec b
   798F CD 6C B0      [17] 1665     call cpct_getScreenPtr_asm 
   7992 36 77         [10] 1666     ld (hl), #0x77
   7994 2C            [ 4] 1667     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 35.
Hexadecimal [16-Bits]



   7995 36 EE         [10] 1668    ld (hl), #0xEE
                           1669 ;;-----------
   7997 11 00 C0      [10] 1670    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   799A DD 4E 00      [19] 1671     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   799D DD 46 01      [19] 1672     ld      b,  entity_y(ix)  
   79A0 05            [ 4] 1673     dec b       
   79A1 05            [ 4] 1674     dec b
   79A2 05            [ 4] 1675     dec b
   79A3 05            [ 4] 1676     dec b
   79A4 05            [ 4] 1677     dec b
   79A5 05            [ 4] 1678     dec b
   79A6 05            [ 4] 1679     dec b
   79A7 05            [ 4] 1680     dec b
   79A8 CD 6C B0      [17] 1681     call cpct_getScreenPtr_asm 
   79AB 36 77         [10] 1682     ld (hl), #0x77
   79AD 2C            [ 4] 1683     inc l
   79AE 36 EE         [10] 1684    ld (hl), #0xEE
                           1685 ;;-----------
   79B0 11 00 C0      [10] 1686    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   79B3 DD 4E 00      [19] 1687     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   79B6 DD 46 01      [19] 1688     ld      b,  entity_y(ix)  
   79B9 05            [ 4] 1689     dec b       
   79BA 05            [ 4] 1690     dec b
   79BB 05            [ 4] 1691     dec b
   79BC 05            [ 4] 1692     dec b
   79BD 05            [ 4] 1693     dec b
   79BE 05            [ 4] 1694     dec b
   79BF 05            [ 4] 1695     dec b
   79C0 05            [ 4] 1696     dec b
   79C1 05            [ 4] 1697     dec b
   79C2 CD 6C B0      [17] 1698     call cpct_getScreenPtr_asm 
   79C5 36 76         [10] 1699     ld (hl), #0x76
   79C7 2C            [ 4] 1700     inc l
   79C8 36 E6         [10] 1701    ld (hl), #0xE6
                           1702 
                           1703    ;;-----------
   79CA 11 00 C0      [10] 1704    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   79CD DD 4E 00      [19] 1705     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   79D0 DD 46 01      [19] 1706     ld      b,  entity_y(ix)  
   79D3 05            [ 4] 1707     dec b       
   79D4 05            [ 4] 1708     dec b
   79D5 05            [ 4] 1709     dec b
   79D6 05            [ 4] 1710     dec b
   79D7 05            [ 4] 1711     dec b
   79D8 05            [ 4] 1712     dec b
   79D9 05            [ 4] 1713     dec b
   79DA 05            [ 4] 1714     dec b
   79DB 05            [ 4] 1715     dec b
   79DC 05            [ 4] 1716     dec b
   79DD CD 6C B0      [17] 1717     call cpct_getScreenPtr_asm 
   79E0 36 76         [10] 1718     ld (hl), #0x76
   79E2 2C            [ 4] 1719     inc l
   79E3 36 E6         [10] 1720    ld (hl), #0xE6
                           1721    ;;-----------
   79E5 11 00 C0      [10] 1722    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 36.
Hexadecimal [16-Bits]



   79E8 DD 4E 00      [19] 1723     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   79EB DD 46 01      [19] 1724     ld      b,  entity_y(ix)  
   79EE 05            [ 4] 1725     dec b       
   79EF 05            [ 4] 1726     dec b
   79F0 05            [ 4] 1727     dec b
   79F1 05            [ 4] 1728     dec b
   79F2 05            [ 4] 1729     dec b
   79F3 05            [ 4] 1730     dec b
   79F4 05            [ 4] 1731     dec b
   79F5 05            [ 4] 1732     dec b
   79F6 05            [ 4] 1733     dec b
   79F7 05            [ 4] 1734     dec b
   79F8 05            [ 4] 1735     dec b
   79F9 CD 6C B0      [17] 1736     call cpct_getScreenPtr_asm 
   79FC 36 77         [10] 1737     ld (hl), #0x77
   79FE 2C            [ 4] 1738     inc l
   79FF 36 EE         [10] 1739    ld (hl), #0xEE
   7A01 11 00 C0      [10] 1740     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7A04 DD 4E 00      [19] 1741     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7A07 DD 46 01      [19] 1742     ld      b,  entity_y(ix)  
   7A0A 05            [ 4] 1743     dec b       
   7A0B 05            [ 4] 1744     dec b
   7A0C 05            [ 4] 1745     dec b
   7A0D 05            [ 4] 1746     dec b
   7A0E 05            [ 4] 1747     dec b
   7A0F 05            [ 4] 1748     dec b
   7A10 05            [ 4] 1749     dec b
   7A11 05            [ 4] 1750     dec b
   7A12 05            [ 4] 1751     dec b
   7A13 05            [ 4] 1752     dec b
   7A14 05            [ 4] 1753     dec b
   7A15 05            [ 4] 1754     dec b
   7A16 CD 6C B0      [17] 1755     call cpct_getScreenPtr_asm 
   7A19 36 77         [10] 1756     ld (hl), #0x77
   7A1B 2C            [ 4] 1757     inc l
   7A1C 36 EE         [10] 1758    ld (hl), #0xEE
                           1759 
   7A1E C9            [10] 1760 ret
                           1761 
   7A1F                    1762 ataqueAereoDerecha2::
                           1763 
                           1764 
   7A1F 11 00 C0      [10] 1765     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7A22 DD 4E 00      [19] 1766     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7A25 DD 46 01      [19] 1767     ld      b,  entity_y(ix)  
   7A28 04            [ 4] 1768     inc b       
   7A29 04            [ 4] 1769     inc b
   7A2A 04            [ 4] 1770     inc b 
   7A2B 04            [ 4] 1771     inc b
   7A2C 04            [ 4] 1772     inc b
   7A2D 04            [ 4] 1773     inc b 
   7A2E 04            [ 4] 1774     inc b
   7A2F CD 6C B0      [17] 1775     call cpct_getScreenPtr_asm 
   7A32 36 03         [10] 1776     ld (hl), #0x03
   7A34 2C            [ 4] 1777     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 37.
Hexadecimal [16-Bits]



   7A35 36 0C         [10] 1778    ld (hl), #0x0C
                           1779 
                           1780 
                           1781    ;;-----------
   7A37 11 00 C0      [10] 1782    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7A3A DD 4E 00      [19] 1783     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7A3D DD 46 01      [19] 1784     ld      b,  entity_y(ix)  
   7A40 04            [ 4] 1785     inc b       
   7A41 04            [ 4] 1786     inc b
   7A42 04            [ 4] 1787     inc b 
   7A43 04            [ 4] 1788     inc b
   7A44 04            [ 4] 1789     inc b 
   7A45 04            [ 4] 1790     inc b
   7A46 CD 6C B0      [17] 1791     call cpct_getScreenPtr_asm 
   7A49 36 24         [10] 1792     ld (hl), #0x24
   7A4B 2C            [ 4] 1793     inc l
   7A4C 36 82         [10] 1794    ld (hl), #0x82
                           1795 
                           1796    ;;-------------
   7A4E 11 00 C0      [10] 1797    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7A51 DD 4E 00      [19] 1798     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7A54 DD 46 01      [19] 1799     ld      b,  entity_y(ix)  
   7A57 04            [ 4] 1800     inc b       
   7A58 04            [ 4] 1801     inc b
   7A59 04            [ 4] 1802     inc b 
   7A5A 04            [ 4] 1803     inc b
   7A5B 04            [ 4] 1804     inc b 
   7A5C CD 6C B0      [17] 1805     call cpct_getScreenPtr_asm 
   7A5F 36 14         [10] 1806     ld (hl), #0x14
   7A61 2C            [ 4] 1807     inc l
   7A62 36 42         [10] 1808    ld (hl), #0x42
                           1809 
                           1810    ;;---------------------
   7A64 11 00 C0      [10] 1811    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7A67 DD 4E 00      [19] 1812     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7A6A DD 46 01      [19] 1813     ld      b,  entity_y(ix)  
   7A6D 04            [ 4] 1814     inc b       
   7A6E 04            [ 4] 1815     inc b
   7A6F 04            [ 4] 1816     inc b 
   7A70 04            [ 4] 1817     inc b
   7A71 CD 6C B0      [17] 1818     call cpct_getScreenPtr_asm 
   7A74 36 47         [10] 1819     ld (hl), #0x47
   7A76 2C            [ 4] 1820     inc l
   7A77 36 2E         [10] 1821    ld (hl), #0x2E
                           1822 
                           1823    ;;-----------
   7A79 11 00 C0      [10] 1824    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7A7C DD 4E 00      [19] 1825     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7A7F DD 46 01      [19] 1826     ld      b,  entity_y(ix)  
   7A82 04            [ 4] 1827     inc b       
   7A83 04            [ 4] 1828     inc b
   7A84 04            [ 4] 1829     inc b
   7A85 CD 6C B0      [17] 1830     call cpct_getScreenPtr_asm 
   7A88 36 77         [10] 1831     ld (hl), #0x77
   7A8A 2C            [ 4] 1832     inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 38.
Hexadecimal [16-Bits]



   7A8B 36 EE         [10] 1833    ld (hl), #0xEE
                           1834 
                           1835    ;;-----------
   7A8D 11 00 C0      [10] 1836    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7A90 DD 4E 00      [19] 1837     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7A93 DD 46 01      [19] 1838     ld      b,  entity_y(ix)  
   7A96 04            [ 4] 1839     inc b       
   7A97 04            [ 4] 1840     inc b
   7A98 CD 6C B0      [17] 1841     call cpct_getScreenPtr_asm 
   7A9B 36 33         [10] 1842     ld (hl), #0x33
   7A9D 2C            [ 4] 1843     inc l
   7A9E 36 CC         [10] 1844    ld (hl), #0xCC
                           1845 
                           1846    ;;-----------
   7AA0 11 00 C0      [10] 1847    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7AA3 DD 4E 00      [19] 1848     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7AA6 DD 46 01      [19] 1849     ld      b,  entity_y(ix)  
   7AA9 04            [ 4] 1850     inc b 
   7AAA CD 6C B0      [17] 1851     call cpct_getScreenPtr_asm
   7AAD 36 77         [10] 1852     ld (hl), #0x77
   7AAF 2C            [ 4] 1853     inc l 
   7AB0 36 8E         [10] 1854    ld (hl), #0x8E
                           1855 
                           1856    ;;-----------
   7AB2 11 00 C0      [10] 1857    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7AB5 DD 4E 00      [19] 1858     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7AB8 DD 46 01      [19] 1859     ld      b,  entity_y(ix)  
   7ABB CD 6C B0      [17] 1860     call cpct_getScreenPtr_asm 
   7ABE 36 77         [10] 1861     ld (hl), #0x77
   7AC0 2C            [ 4] 1862     inc l
   7AC1 36 EE         [10] 1863    ld (hl), #0xEE
                           1864 
                           1865    ;;-----------
   7AC3 11 00 C0      [10] 1866    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7AC6 DD 4E 00      [19] 1867     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7AC9 DD 46 01      [19] 1868     ld      b,  entity_y(ix)  
   7ACC 05            [ 4] 1869     dec b
   7ACD CD 6C B0      [17] 1870     call cpct_getScreenPtr_asm
   7AD0 36 33         [10] 1871     ld (hl), #0x33
   7AD2 2C            [ 4] 1872     inc l 
   7AD3 36 CC         [10] 1873    ld (hl), #0xCC
                           1874 
                           1875    ;;-----------
   7AD5 11 00 C0      [10] 1876    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7AD8 DD 4E 00      [19] 1877     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7ADB DD 46 01      [19] 1878     ld      b,  entity_y(ix)  
   7ADE 05            [ 4] 1879     dec b       
   7ADF 05            [ 4] 1880     dec b
   7AE0 CD 6C B0      [17] 1881     call cpct_getScreenPtr_asm
   7AE3 36 EE         [10] 1882     ld (hl), #0xEE
   7AE5 2C            [ 4] 1883     inc l 
   7AE6 36 08         [10] 1884    ld (hl), #0x08
                           1885 
                           1886    ;;-----------
   7AE8 11 00 C0      [10] 1887    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 39.
Hexadecimal [16-Bits]



   7AEB DD 4E 00      [19] 1888     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7AEE DD 46 01      [19] 1889     ld      b,  entity_y(ix)  
   7AF1 05            [ 4] 1890     dec b       
   7AF2 05            [ 4] 1891     dec b
   7AF3 05            [ 4] 1892     dec b
   7AF4 CD 6C B0      [17] 1893     call cpct_getScreenPtr_asm 
   7AF7 36 EA         [10] 1894     ld (hl), #0xEA
   7AF9 2C            [ 4] 1895     inc l
   7AFA 36 00         [10] 1896    ld (hl), #0x00
                           1897    ;;-----------
   7AFC 11 00 C0      [10] 1898    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7AFF DD 4E 00      [19] 1899     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7B02 DD 46 01      [19] 1900     ld      b,  entity_y(ix)  
   7B05 05            [ 4] 1901     dec b       
   7B06 05            [ 4] 1902     dec b
   7B07 05            [ 4] 1903     dec b
   7B08 05            [ 4] 1904     dec b
                           1905     
   7B09 CD 6C B0      [17] 1906     call cpct_getScreenPtr_asm 
   7B0C 36 00         [10] 1907     ld (hl), #0x00
   7B0E 2C            [ 4] 1908     inc l
   7B0F 36 00         [10] 1909    ld (hl), #0x00
                           1910 ;;-----------
   7B11 11 00 C0      [10] 1911    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7B14 DD 4E 00      [19] 1912     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7B17 DD 46 01      [19] 1913     ld      b,  entity_y(ix)  
   7B1A 05            [ 4] 1914     dec b       
   7B1B 05            [ 4] 1915     dec b
   7B1C 05            [ 4] 1916     dec b
   7B1D 05            [ 4] 1917     dec b
   7B1E 05            [ 4] 1918     dec b
   7B1F 05            [ 4] 1919     dec b
   7B20 05            [ 4] 1920     dec b
   7B21 CD 6C B0      [17] 1921     call cpct_getScreenPtr_asm 
   7B24 36 70         [10] 1922     ld (hl), #0x70
   7B26 2C            [ 4] 1923     inc l
   7B27 36 E0         [10] 1924    ld (hl), #0xE0
                           1925 ;;-----------
   7B29 11 00 C0      [10] 1926    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7B2C DD 4E 00      [19] 1927     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7B2F DD 46 01      [19] 1928     ld      b,  entity_y(ix)  
   7B32 05            [ 4] 1929     dec b       
   7B33 05            [ 4] 1930     dec b
   7B34 05            [ 4] 1931     dec b
   7B35 05            [ 4] 1932     dec b
   7B36 05            [ 4] 1933     dec b
   7B37 05            [ 4] 1934     dec b
   7B38 05            [ 4] 1935     dec b
   7B39 05            [ 4] 1936     dec b
   7B3A CD 6C B0      [17] 1937     call cpct_getScreenPtr_asm 
   7B3D 36 70         [10] 1938     ld (hl), #0x70
   7B3F 2C            [ 4] 1939     inc l
   7B40 36 E0         [10] 1940    ld (hl), #0xE0
                           1941 ;;-----------
   7B42 11 00 C0      [10] 1942    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 40.
Hexadecimal [16-Bits]



   7B45 DD 4E 00      [19] 1943     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7B48 DD 46 01      [19] 1944     ld      b,  entity_y(ix)  
   7B4B 05            [ 4] 1945     dec b       
   7B4C 05            [ 4] 1946     dec b
   7B4D 05            [ 4] 1947     dec b
   7B4E 05            [ 4] 1948     dec b
   7B4F 05            [ 4] 1949     dec b
   7B50 05            [ 4] 1950     dec b
   7B51 05            [ 4] 1951     dec b
   7B52 05            [ 4] 1952     dec b
   7B53 05            [ 4] 1953     dec b
   7B54 CD 6C B0      [17] 1954     call cpct_getScreenPtr_asm 
   7B57 36 71         [10] 1955     ld (hl), #0x71
   7B59 2C            [ 4] 1956     inc l
   7B5A 36 E8         [10] 1957    ld (hl), #0xE8
                           1958 
                           1959    ;;-----------
   7B5C 11 00 C0      [10] 1960    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7B5F DD 4E 00      [19] 1961     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7B62 DD 46 01      [19] 1962     ld      b,  entity_y(ix)  
   7B65 05            [ 4] 1963     dec b       
   7B66 05            [ 4] 1964     dec b
   7B67 05            [ 4] 1965     dec b
   7B68 05            [ 4] 1966     dec b
   7B69 05            [ 4] 1967     dec b
   7B6A 05            [ 4] 1968     dec b
   7B6B 05            [ 4] 1969     dec b
   7B6C 05            [ 4] 1970     dec b
   7B6D 05            [ 4] 1971     dec b
   7B6E 05            [ 4] 1972     dec b
   7B6F CD 6C B0      [17] 1973     call cpct_getScreenPtr_asm 
   7B72 36 71         [10] 1974     ld (hl), #0x71
   7B74 2C            [ 4] 1975     inc l
   7B75 36 E8         [10] 1976    ld (hl), #0xE8
                           1977    ;;-----------
   7B77 11 00 C0      [10] 1978    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7B7A DD 4E 00      [19] 1979     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7B7D DD 46 01      [19] 1980     ld      b,  entity_y(ix)  
   7B80 05            [ 4] 1981     dec b       
   7B81 05            [ 4] 1982     dec b
   7B82 05            [ 4] 1983     dec b
   7B83 05            [ 4] 1984     dec b
   7B84 05            [ 4] 1985     dec b
   7B85 05            [ 4] 1986     dec b
   7B86 05            [ 4] 1987     dec b
   7B87 05            [ 4] 1988     dec b
   7B88 05            [ 4] 1989     dec b
   7B89 05            [ 4] 1990     dec b
   7B8A 05            [ 4] 1991     dec b
   7B8B CD 6C B0      [17] 1992     call cpct_getScreenPtr_asm 
   7B8E 36 70         [10] 1993     ld (hl), #0x70
   7B90 2C            [ 4] 1994     inc l
   7B91 36 E0         [10] 1995    ld (hl), #0xE0
   7B93 11 00 C0      [10] 1996     ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7B96 DD 4E 00      [19] 1997     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 41.
Hexadecimal [16-Bits]



   7B99 DD 46 01      [19] 1998     ld      b,  entity_y(ix)  
   7B9C 05            [ 4] 1999     dec b       
   7B9D 05            [ 4] 2000     dec b
   7B9E 05            [ 4] 2001     dec b
   7B9F 05            [ 4] 2002     dec b
   7BA0 05            [ 4] 2003     dec b
   7BA1 05            [ 4] 2004     dec b
   7BA2 05            [ 4] 2005     dec b
   7BA3 05            [ 4] 2006     dec b
   7BA4 05            [ 4] 2007     dec b
   7BA5 05            [ 4] 2008     dec b
   7BA6 05            [ 4] 2009     dec b
   7BA7 05            [ 4] 2010     dec b
   7BA8 CD 6C B0      [17] 2011     call cpct_getScreenPtr_asm 
   7BAB 36 70         [10] 2012     ld (hl), #0x70
   7BAD 2C            [ 4] 2013     inc l
   7BAE 36 E0         [10] 2014    ld (hl), #0xE0
                           2015 
   7BB0 C9            [10] 2016 ret
                           2017 
                           2018 
                           2019 
                           2020 
                           2021 
   7BB1                    2022 borraPersonajePos0::
                           2023 
   7BB1 11 00 C0      [10] 2024 ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   7BB4 DD 4E 00      [19] 2025     ld      c,  entity_x(ix)          ;;Coordenada X (tamaño en ancho)
   7BB7 DD 46 01      [19] 2026     ld      b,  entity_y(ix)          ;;Coordenada Y (tamaño en alto)
   7BBA 05            [ 4] 2027     dec b
   7BBB 05            [ 4] 2028     dec b 
   7BBC 05            [ 4] 2029     dec b
   7BBD 05            [ 4] 2030     dec b
   7BBE CD 6C B0      [17] 2031     call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
                           2032 
   7BC1 EB            [ 4] 2033     ex      de, hl  
                           2034                ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
   7BC2 3E 00         [ 7] 2035     ld      a,  #0x00        ;;Color (en la posición de la entidad)
   7BC4 0E 02         [ 7] 2036     ld      c,  #2        ;;Ancho (en la posición de la entidad)
   7BC6 06 0C         [ 7] 2037     ld      b,  #12      ;;Alto (en la posición de la entidad)
   7BC8 CD C1 AF      [17] 2038     call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc
                           2039 
   7BCB C9            [10] 2040 ret
