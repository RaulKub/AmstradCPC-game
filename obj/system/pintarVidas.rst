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
   A231                      19 tresVidas::
                             20 
   A231 11 00 C0      [10]   21 ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A234 0E 00         [ 7]   22     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A236 06 BE         [ 7]   23     ld      b,  #190
   A238 CD 6C B0      [17]   24     call cpct_getScreenPtr_asm 
                             25     ;;PrimerCorazon
   A23B 2C            [ 4]   26     inc l
   A23C 36 70         [10]   27     ld (hl), #0x70
   A23E 2C            [ 4]   28     inc l
   A23F 36 70         [10]   29    ld (hl), #0x70
   A241 2C            [ 4]   30    inc l
   A242 36 00         [10]   31    ld (hl), #0x00
                             32    ;;SegundoCorazon
   A244 2C            [ 4]   33    inc l
   A245 36 70         [10]   34     ld (hl), #0x70
   A247 2C            [ 4]   35     inc l
   A248 36 70         [10]   36    ld (hl), #0x70
   A24A 2C            [ 4]   37    inc l
   A24B 36 00         [10]   38    ld (hl), #0x00
                             39     ;;TercerCorazon
   A24D 2C            [ 4]   40     inc l
   A24E 36 70         [10]   41     ld (hl), #0x70
   A250 2C            [ 4]   42     inc l
   A251 36 70         [10]   43    ld (hl), #0x70
   A253 2C            [ 4]   44    inc l
   A254 36 00         [10]   45    ld (hl), #0x00
                             46 
                             47    ;;2
                             48 
   A256 11 00 C0      [10]   49    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A259 0E 00         [ 7]   50     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A25B 06 BF         [ 7]   51     ld      b,  #191
   A25D CD 6C B0      [17]   52     call cpct_getScreenPtr_asm 
                             53     ;;PrimerCorazon
   A260 2C            [ 4]   54     inc l
   A261 36 F7         [10]   55     ld (hl), #0xF7
   A263 2C            [ 4]   56     inc l
   A264 36 F7         [10]   57    ld (hl), #0xF7
   A266 2C            [ 4]   58    inc l
   A267 36 80         [10]   59    ld (hl), #0x80
                             60    ;;SegundoCorazon
   A269 2C            [ 4]   61    inc l
   A26A 36 F7         [10]   62     ld (hl), #0xF7
   A26C 2C            [ 4]   63     inc l
   A26D 36 F7         [10]   64    ld (hl), #0xF7
   A26F 2C            [ 4]   65    inc l
   A270 36 80         [10]   66    ld (hl), #0x80
                             67     ;;TercerCorazon
   A272 2C            [ 4]   68     inc l
   A273 36 F7         [10]   69     ld (hl), #0xF7
   A275 2C            [ 4]   70     inc l
   A276 36 F7         [10]   71    ld (hl), #0xF7
   A278 2C            [ 4]   72    inc l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   A279 36 80         [10]   73    ld (hl), #0x80
                             74 
                             75     ;3
                             76 
   A27B 11 00 C0      [10]   77    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A27E 0E 00         [ 7]   78     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A280 06 C0         [ 7]   79     ld      b,  #192
   A282 CD 6C B0      [17]   80     call cpct_getScreenPtr_asm 
                             81     ;;PrimerCorazon
   A285 2C            [ 4]   82     inc l
   A286 36 F7         [10]   83     ld (hl), #0xF7
   A288 2C            [ 4]   84     inc l
   A289 36 FF         [10]   85    ld (hl), #0xFF
   A28B 2C            [ 4]   86    inc l
   A28C 36 80         [10]   87    ld (hl), #0x80
                             88    ;;SegundoCorazon
   A28E 2C            [ 4]   89    inc l
   A28F 36 F7         [10]   90     ld (hl), #0xF7
   A291 2C            [ 4]   91     inc l
   A292 36 FF         [10]   92    ld (hl), #0xFF
   A294 2C            [ 4]   93    inc l
   A295 36 80         [10]   94    ld (hl), #0x80
                             95     ;;TercerCorazon
   A297 2C            [ 4]   96     inc l
   A298 36 F7         [10]   97     ld (hl), #0xF7
   A29A 2C            [ 4]   98     inc l
   A29B 36 FF         [10]   99    ld (hl), #0xFF
   A29D 2C            [ 4]  100    inc l
   A29E 36 80         [10]  101    ld (hl), #0x80
                            102 
   A2A0 11 00 C0      [10]  103    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A2A3 0E 00         [ 7]  104     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A2A5 06 C1         [ 7]  105     ld      b,  #193
   A2A7 CD 6C B0      [17]  106     call cpct_getScreenPtr_asm 
                            107     ;;PrimerCorazon
   A2AA 2C            [ 4]  108     inc l
   A2AB 36 F7         [10]  109     ld (hl), #0xF7
   A2AD 2C            [ 4]  110     inc l
   A2AE 36 FF         [10]  111    ld (hl), #0xFF
   A2B0 2C            [ 4]  112    inc l
   A2B1 36 80         [10]  113    ld (hl), #0x80
                            114    ;;SegundoCorazon
   A2B3 2C            [ 4]  115    inc l
   A2B4 36 F7         [10]  116     ld (hl), #0xF7
   A2B6 2C            [ 4]  117     inc l
   A2B7 36 FF         [10]  118    ld (hl), #0xFF
   A2B9 2C            [ 4]  119    inc l
   A2BA 36 80         [10]  120    ld (hl), #0x80
                            121     ;;TercerCorazon
   A2BC 2C            [ 4]  122     inc l
   A2BD 36 F7         [10]  123     ld (hl), #0xF7
   A2BF 2C            [ 4]  124     inc l
   A2C0 36 FF         [10]  125    ld (hl), #0xFF
   A2C2 2C            [ 4]  126    inc l
   A2C3 36 80         [10]  127    ld (hl), #0x80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                            128 
                            129 
   A2C5 11 00 C0      [10]  130    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A2C8 0E 00         [ 7]  131     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A2CA 06 C2         [ 7]  132     ld      b,  #194
   A2CC CD 6C B0      [17]  133     call cpct_getScreenPtr_asm 
                            134     ;;PrimerCorazon
   A2CF 2C            [ 4]  135     inc l
   A2D0 36 73         [10]  136     ld (hl), #0x73
   A2D2 2C            [ 4]  137     inc l
   A2D3 36 FE         [10]  138    ld (hl), #0x7FE
   A2D5 2C            [ 4]  139    inc l
   A2D6 36 00         [10]  140    ld (hl), #0x00
                            141    ;;SegundoCorazon
   A2D8 2C            [ 4]  142    inc l
   A2D9 36 73         [10]  143     ld (hl), #0x73
   A2DB 2C            [ 4]  144     inc l
   A2DC 36 FE         [10]  145    ld (hl), #0x7FE
   A2DE 2C            [ 4]  146    inc l
   A2DF 36 00         [10]  147    ld (hl), #0x00
                            148     ;;TercerCorazon
   A2E1 2C            [ 4]  149     inc l
   A2E2 36 73         [10]  150     ld (hl), #0x73
   A2E4 2C            [ 4]  151     inc l
   A2E5 36 FE         [10]  152    ld (hl), #0x7FE
   A2E7 2C            [ 4]  153    inc l
   A2E8 36 00         [10]  154    ld (hl), #0x00
                            155 
                            156 
   A2EA 11 00 C0      [10]  157    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A2ED 0E 00         [ 7]  158     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A2EF 06 C3         [ 7]  159     ld      b,  #195
   A2F1 CD 6C B0      [17]  160     call cpct_getScreenPtr_asm 
                            161     ;;PrimerCorazon
   A2F4 2C            [ 4]  162     inc l
   A2F5 36 31         [10]  163     ld (hl), #0x31
   A2F7 2C            [ 4]  164     inc l
   A2F8 36 EC         [10]  165    ld (hl), #0xEC
   A2FA 2C            [ 4]  166    inc l
   A2FB 36 00         [10]  167    ld (hl), #0x00
                            168    ;;SegundoCorazon
   A2FD 2C            [ 4]  169    inc l
   A2FE 36 31         [10]  170     ld (hl), #0x31
   A300 2C            [ 4]  171     inc l
   A301 36 EC         [10]  172    ld (hl), #0xEC
   A303 2C            [ 4]  173    inc l
   A304 36 00         [10]  174    ld (hl), #0x00
                            175     ;;TercerCorazon
   A306 2C            [ 4]  176     inc l
   A307 36 31         [10]  177     ld (hl), #0x31
   A309 2C            [ 4]  178     inc l
   A30A 36 EC         [10]  179    ld (hl), #0xEC
   A30C 2C            [ 4]  180    inc l
   A30D 36 00         [10]  181    ld (hl), #0x00
                            182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   A30F 11 00 C0      [10]  183    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A312 0E 00         [ 7]  184     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A314 06 C4         [ 7]  185     ld      b,  #196
   A316 CD 6C B0      [17]  186     call cpct_getScreenPtr_asm 
                            187     ;;PrimerCorazon
   A319 2C            [ 4]  188     inc l
   A31A 36 10         [10]  189     ld (hl), #0x10
   A31C 2C            [ 4]  190     inc l
   A31D 36 C8         [10]  191    ld (hl), #0xC8
   A31F 2C            [ 4]  192    inc l
   A320 36 00         [10]  193    ld (hl), #0x00
                            194    ;;SegundoCorazon
   A322 2C            [ 4]  195    inc l
   A323 36 10         [10]  196     ld (hl), #0x10
   A325 2C            [ 4]  197     inc l
   A326 36 C8         [10]  198    ld (hl), #0xC8
   A328 2C            [ 4]  199    inc l
   A329 36 00         [10]  200    ld (hl), #0x00
                            201     ;;TercerCorazon
   A32B 2C            [ 4]  202     inc l
   A32C 36 10         [10]  203     ld (hl), #0x10
   A32E 2C            [ 4]  204     inc l
   A32F 36 C8         [10]  205    ld (hl), #0xC8
   A331 2C            [ 4]  206    inc l
   A332 36 00         [10]  207    ld (hl), #0x00
                            208 
                            209 
   A334 11 00 C0      [10]  210    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A337 0E 00         [ 7]  211     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A339 06 C5         [ 7]  212     ld      b,  #197
   A33B CD 6C B0      [17]  213     call cpct_getScreenPtr_asm 
                            214     ;;PrimerCorazon
   A33E 2C            [ 4]  215     inc l
   A33F 36 00         [10]  216     ld (hl), #0x00
   A341 2C            [ 4]  217     inc l
   A342 36 80         [10]  218    ld (hl), #0x80
   A344 2C            [ 4]  219    inc l
   A345 36 00         [10]  220    ld (hl), #0x00
                            221    ;;SegundoCorazon
   A347 2C            [ 4]  222    inc l
   A348 36 00         [10]  223     ld (hl), #0x00
   A34A 2C            [ 4]  224     inc l
   A34B 36 80         [10]  225    ld (hl), #0x80
   A34D 2C            [ 4]  226    inc l
   A34E 36 00         [10]  227    ld (hl), #0x00
                            228     ;;TercerCorazon
   A350 2C            [ 4]  229     inc l
   A351 36 00         [10]  230     ld (hl), #0x00
   A353 2C            [ 4]  231     inc l
   A354 36 80         [10]  232    ld (hl), #0x80
   A356 2C            [ 4]  233    inc l
   A357 36 00         [10]  234    ld (hl), #0x00
   A359 C9            [10]  235    ret
   A35A                     236    dosVidas::
                            237 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   A35A 11 00 C0      [10]  238 ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A35D 0E 00         [ 7]  239     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A35F 06 BE         [ 7]  240     ld      b,  #190
   A361 CD 6C B0      [17]  241     call cpct_getScreenPtr_asm 
                            242     ;;PrimerCorazon
   A364 2C            [ 4]  243     inc l
   A365 36 70         [10]  244     ld (hl), #0x70
   A367 2C            [ 4]  245     inc l
   A368 36 70         [10]  246    ld (hl), #0x70
   A36A 2C            [ 4]  247    inc l
   A36B 36 00         [10]  248    ld (hl), #0x00
                            249    ;;SegundoCorazon
   A36D 2C            [ 4]  250    inc l
   A36E 36 70         [10]  251     ld (hl), #0x70
   A370 2C            [ 4]  252     inc l
   A371 36 70         [10]  253    ld (hl), #0x70
   A373 2C            [ 4]  254    inc l
   A374 36 00         [10]  255    ld (hl), #0x00
                            256     ;;TercerCorazon
   A376 2C            [ 4]  257     inc l
   A377 36 70         [10]  258     ld (hl), #0x70
   A379 2C            [ 4]  259     inc l
   A37A 36 70         [10]  260    ld (hl), #0x70
   A37C 2C            [ 4]  261    inc l
   A37D 36 00         [10]  262    ld (hl), #0x00
                            263 
                            264    ;;2
                            265 
   A37F 11 00 C0      [10]  266    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A382 0E 00         [ 7]  267     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A384 06 BF         [ 7]  268     ld      b,  #191
   A386 CD 6C B0      [17]  269     call cpct_getScreenPtr_asm 
                            270     ;;PrimerCorazon
   A389 2C            [ 4]  271     inc l
   A38A 36 F7         [10]  272     ld (hl), #0xF7
   A38C 2C            [ 4]  273     inc l
   A38D 36 F7         [10]  274    ld (hl), #0xF7
   A38F 2C            [ 4]  275    inc l
   A390 36 80         [10]  276    ld (hl), #0x80
                            277    ;;SegundoCorazon
   A392 2C            [ 4]  278    inc l
   A393 36 F7         [10]  279     ld (hl), #0xF7
   A395 2C            [ 4]  280     inc l
   A396 36 F7         [10]  281    ld (hl), #0xF7
   A398 2C            [ 4]  282    inc l
   A399 36 80         [10]  283    ld (hl), #0x80
                            284     ;;TercerCorazon
   A39B 2C            [ 4]  285     inc l
   A39C 36 80         [10]  286     ld (hl), #0x80
   A39E 2C            [ 4]  287     inc l
   A39F 36 80         [10]  288    ld (hl), #0x80
   A3A1 2C            [ 4]  289    inc l
   A3A2 36 80         [10]  290    ld (hl), #0x80
                            291 
                            292     ;3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            293 
   A3A4 11 00 C0      [10]  294    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A3A7 0E 00         [ 7]  295     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A3A9 06 C0         [ 7]  296     ld      b,  #192
   A3AB CD 6C B0      [17]  297     call cpct_getScreenPtr_asm 
                            298     ;;PrimerCorazon
   A3AE 2C            [ 4]  299     inc l
   A3AF 36 F7         [10]  300     ld (hl), #0xF7
   A3B1 2C            [ 4]  301     inc l
   A3B2 36 FF         [10]  302    ld (hl), #0xFF
   A3B4 2C            [ 4]  303    inc l
   A3B5 36 80         [10]  304    ld (hl), #0x80
                            305    ;;SegundoCorazon
   A3B7 2C            [ 4]  306    inc l
   A3B8 36 F7         [10]  307     ld (hl), #0xF7
   A3BA 2C            [ 4]  308     inc l
   A3BB 36 FF         [10]  309    ld (hl), #0xFF
   A3BD 2C            [ 4]  310    inc l
   A3BE 36 80         [10]  311    ld (hl), #0x80
                            312     ;;TercerCorazon
   A3C0 2C            [ 4]  313     inc l
   A3C1 36 80         [10]  314     ld (hl), #0x80
   A3C3 2C            [ 4]  315     inc l
   A3C4 36 00         [10]  316    ld (hl), #0x00
   A3C6 2C            [ 4]  317    inc l
   A3C7 36 80         [10]  318    ld (hl), #0x80
                            319 
   A3C9 11 00 C0      [10]  320    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A3CC 0E 00         [ 7]  321     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A3CE 06 C1         [ 7]  322     ld      b,  #193
   A3D0 CD 6C B0      [17]  323     call cpct_getScreenPtr_asm 
                            324     ;;PrimerCorazon
   A3D3 2C            [ 4]  325     inc l
   A3D4 36 F7         [10]  326     ld (hl), #0xF7
   A3D6 2C            [ 4]  327     inc l
   A3D7 36 FF         [10]  328    ld (hl), #0xFF
   A3D9 2C            [ 4]  329    inc l
   A3DA 36 80         [10]  330    ld (hl), #0x80
                            331    ;;SegundoCorazon
   A3DC 2C            [ 4]  332    inc l
   A3DD 36 F7         [10]  333     ld (hl), #0xF7
   A3DF 2C            [ 4]  334     inc l
   A3E0 36 FF         [10]  335    ld (hl), #0xFF
   A3E2 2C            [ 4]  336    inc l
   A3E3 36 80         [10]  337    ld (hl), #0x80
                            338     ;;TercerCorazon
   A3E5 2C            [ 4]  339     inc l
   A3E6 36 80         [10]  340     ld (hl), #0x80
   A3E8 2C            [ 4]  341     inc l
   A3E9 36 00         [10]  342    ld (hl), #0x00
   A3EB 2C            [ 4]  343    inc l
   A3EC 36 80         [10]  344    ld (hl), #0x80
                            345 
                            346 
   A3EE 11 00 C0      [10]  347    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   A3F1 0E 00         [ 7]  348     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A3F3 06 C2         [ 7]  349     ld      b,  #194
   A3F5 CD 6C B0      [17]  350     call cpct_getScreenPtr_asm 
                            351     ;;PrimerCorazon
   A3F8 2C            [ 4]  352     inc l
   A3F9 36 73         [10]  353     ld (hl), #0x73
   A3FB 2C            [ 4]  354     inc l
   A3FC 36 FE         [10]  355    ld (hl), #0x7FE
   A3FE 2C            [ 4]  356    inc l
   A3FF 36 00         [10]  357    ld (hl), #0x00
                            358    ;;SegundoCorazon
   A401 2C            [ 4]  359    inc l
   A402 36 73         [10]  360     ld (hl), #0x73
   A404 2C            [ 4]  361     inc l
   A405 36 FE         [10]  362    ld (hl), #0x7FE
   A407 2C            [ 4]  363    inc l
   A408 36 00         [10]  364    ld (hl), #0x00
                            365     ;;TercerCorazon
   A40A 2C            [ 4]  366     inc l
   A40B 36 40         [10]  367     ld (hl), #0x40
   A40D 2C            [ 4]  368     inc l
   A40E 36 10         [10]  369    ld (hl), #0x10
   A410 2C            [ 4]  370    inc l
   A411 36 00         [10]  371    ld (hl), #0x00
                            372 
                            373 
   A413 11 00 C0      [10]  374    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A416 0E 00         [ 7]  375     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A418 06 C3         [ 7]  376     ld      b,  #195
   A41A CD 6C B0      [17]  377     call cpct_getScreenPtr_asm 
                            378     ;;PrimerCorazon
   A41D 2C            [ 4]  379     inc l
   A41E 36 31         [10]  380     ld (hl), #0x31
   A420 2C            [ 4]  381     inc l
   A421 36 EC         [10]  382    ld (hl), #0xEC
   A423 2C            [ 4]  383    inc l
   A424 36 00         [10]  384    ld (hl), #0x00
                            385    ;;SegundoCorazon
   A426 2C            [ 4]  386    inc l
   A427 36 31         [10]  387     ld (hl), #0x31
   A429 2C            [ 4]  388     inc l
   A42A 36 EC         [10]  389    ld (hl), #0xEC
   A42C 2C            [ 4]  390    inc l
   A42D 36 00         [10]  391    ld (hl), #0x00
                            392     ;;TercerCorazon
   A42F 2C            [ 4]  393     inc l
   A430 36 20         [10]  394     ld (hl), #0x20
   A432 2C            [ 4]  395     inc l
   A433 36 20         [10]  396    ld (hl), #0x20
   A435 2C            [ 4]  397    inc l
   A436 36 00         [10]  398    ld (hl), #0x00
                            399 
   A438 11 00 C0      [10]  400    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A43B 0E 00         [ 7]  401     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A43D 06 C4         [ 7]  402     ld      b,  #196
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   A43F CD 6C B0      [17]  403     call cpct_getScreenPtr_asm 
                            404     ;;PrimerCorazon
   A442 2C            [ 4]  405     inc l
   A443 36 10         [10]  406     ld (hl), #0x10
   A445 2C            [ 4]  407     inc l
   A446 36 C8         [10]  408    ld (hl), #0xC8
   A448 2C            [ 4]  409    inc l
   A449 36 00         [10]  410    ld (hl), #0x00
                            411    ;;SegundoCorazon
   A44B 2C            [ 4]  412    inc l
   A44C 36 10         [10]  413     ld (hl), #0x10
   A44E 2C            [ 4]  414     inc l
   A44F 36 C8         [10]  415    ld (hl), #0xC8
   A451 2C            [ 4]  416    inc l
   A452 36 00         [10]  417    ld (hl), #0x00
                            418     ;;TercerCorazon
   A454 2C            [ 4]  419     inc l
   A455 36 10         [10]  420     ld (hl), #0x10
   A457 2C            [ 4]  421     inc l
   A458 36 40         [10]  422    ld (hl), #0x40
   A45A 2C            [ 4]  423    inc l
   A45B 36 00         [10]  424    ld (hl), #0x00
                            425 
                            426 
   A45D 11 00 C0      [10]  427    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A460 0E 00         [ 7]  428     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A462 06 C5         [ 7]  429     ld      b,  #197
   A464 CD 6C B0      [17]  430     call cpct_getScreenPtr_asm 
                            431     ;;PrimerCorazon
   A467 2C            [ 4]  432     inc l
   A468 36 00         [10]  433     ld (hl), #0x00
   A46A 2C            [ 4]  434     inc l
   A46B 36 80         [10]  435    ld (hl), #0x80
   A46D 2C            [ 4]  436    inc l
   A46E 36 00         [10]  437    ld (hl), #0x00
                            438    ;;SegundoCorazon
   A470 2C            [ 4]  439    inc l
   A471 36 00         [10]  440     ld (hl), #0x00
   A473 2C            [ 4]  441     inc l
   A474 36 80         [10]  442    ld (hl), #0x80
   A476 2C            [ 4]  443    inc l
   A477 36 00         [10]  444    ld (hl), #0x00
                            445     ;;TercerCorazon
   A479 2C            [ 4]  446     inc l
   A47A 36 00         [10]  447     ld (hl), #0x00
   A47C 2C            [ 4]  448     inc l
   A47D 36 80         [10]  449    ld (hl), #0x80
   A47F 2C            [ 4]  450    inc l
   A480 36 00         [10]  451    ld (hl), #0x00
   A482 C9            [10]  452    ret
                            453 
   A483                     454    unaVida::
   A483 11 00 C0      [10]  455    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A486 0E 00         [ 7]  456     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A488 06 BE         [ 7]  457     ld      b,  #190
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   A48A CD 6C B0      [17]  458     call cpct_getScreenPtr_asm 
                            459     ;;PrimerCorazon
   A48D 2C            [ 4]  460     inc l
   A48E 36 70         [10]  461     ld (hl), #0x70
   A490 2C            [ 4]  462     inc l
   A491 36 70         [10]  463    ld (hl), #0x70
   A493 2C            [ 4]  464    inc l
   A494 36 00         [10]  465    ld (hl), #0x00
                            466    ;;SegundoCorazon
   A496 2C            [ 4]  467    inc l
   A497 36 70         [10]  468     ld (hl), #0x70
   A499 2C            [ 4]  469     inc l
   A49A 36 70         [10]  470    ld (hl), #0x70
   A49C 2C            [ 4]  471    inc l
   A49D 36 00         [10]  472    ld (hl), #0x00
                            473     ;;TercerCorazon
   A49F 2C            [ 4]  474     inc l
   A4A0 36 70         [10]  475     ld (hl), #0x70
   A4A2 2C            [ 4]  476     inc l
   A4A3 36 70         [10]  477    ld (hl), #0x70
   A4A5 2C            [ 4]  478    inc l
   A4A6 36 00         [10]  479    ld (hl), #0x00
                            480 
                            481    ;;2
                            482 
   A4A8 11 00 C0      [10]  483    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A4AB 0E 00         [ 7]  484     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A4AD 06 BF         [ 7]  485     ld      b,  #191
   A4AF CD 6C B0      [17]  486     call cpct_getScreenPtr_asm 
                            487     ;;PrimerCorazon
   A4B2 2C            [ 4]  488     inc l
   A4B3 36 F7         [10]  489     ld (hl), #0xF7
   A4B5 2C            [ 4]  490     inc l
   A4B6 36 F7         [10]  491    ld (hl), #0xF7
   A4B8 2C            [ 4]  492    inc l
   A4B9 36 80         [10]  493    ld (hl), #0x80
                            494    ;;SegundoCorazon
   A4BB 2C            [ 4]  495    inc l
   A4BC 36 80         [10]  496     ld (hl), #0x80
   A4BE 2C            [ 4]  497     inc l
   A4BF 36 80         [10]  498    ld (hl), #0x80
   A4C1 2C            [ 4]  499    inc l
   A4C2 36 80         [10]  500    ld (hl), #0x80
                            501 
                            502     ;;TercerCorazon
   A4C4 2C            [ 4]  503     inc l
   A4C5 36 80         [10]  504     ld (hl), #0x80
   A4C7 2C            [ 4]  505     inc l
   A4C8 36 80         [10]  506    ld (hl), #0x80
   A4CA 2C            [ 4]  507    inc l
   A4CB 36 80         [10]  508    ld (hl), #0x80
                            509 
                            510     ;3
                            511 
   A4CD 11 00 C0      [10]  512    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   A4D0 0E 00         [ 7]  513     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A4D2 06 C0         [ 7]  514     ld      b,  #192
   A4D4 CD 6C B0      [17]  515     call cpct_getScreenPtr_asm 
                            516     ;;PrimerCorazon
   A4D7 2C            [ 4]  517     inc l
   A4D8 36 F7         [10]  518     ld (hl), #0xF7
   A4DA 2C            [ 4]  519     inc l
   A4DB 36 FF         [10]  520    ld (hl), #0xFF
   A4DD 2C            [ 4]  521    inc l
   A4DE 36 80         [10]  522    ld (hl), #0x80
                            523    ;;SegundoCorazon
   A4E0 2C            [ 4]  524    inc l
   A4E1 36 80         [10]  525     ld (hl), #0x80
   A4E3 2C            [ 4]  526     inc l
   A4E4 36 00         [10]  527    ld (hl), #0x00
   A4E6 2C            [ 4]  528    inc l
   A4E7 36 80         [10]  529    ld (hl), #0x80
                            530     ;;TercerCorazon
   A4E9 2C            [ 4]  531     inc l
   A4EA 36 80         [10]  532     ld (hl), #0x80
   A4EC 2C            [ 4]  533     inc l
   A4ED 36 00         [10]  534    ld (hl), #0x00
   A4EF 2C            [ 4]  535    inc l
   A4F0 36 80         [10]  536    ld (hl), #0x80
                            537 
   A4F2 11 00 C0      [10]  538    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A4F5 0E 00         [ 7]  539     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A4F7 06 C1         [ 7]  540     ld      b,  #193
   A4F9 CD 6C B0      [17]  541     call cpct_getScreenPtr_asm 
                            542     ;;PrimerCorazon
   A4FC 2C            [ 4]  543     inc l
   A4FD 36 F7         [10]  544     ld (hl), #0xF7
   A4FF 2C            [ 4]  545     inc l
   A500 36 FF         [10]  546    ld (hl), #0xFF
   A502 2C            [ 4]  547    inc l
   A503 36 80         [10]  548    ld (hl), #0x80
                            549    ;;SegundoCorazon
   A505 2C            [ 4]  550    inc l
   A506 36 80         [10]  551     ld (hl), #0x80
   A508 2C            [ 4]  552     inc l
   A509 36 00         [10]  553    ld (hl), #0x00
   A50B 2C            [ 4]  554    inc l
   A50C 36 80         [10]  555    ld (hl), #0x80
                            556     ;;TercerCorazon
   A50E 2C            [ 4]  557     inc l
   A50F 36 80         [10]  558     ld (hl), #0x80
   A511 2C            [ 4]  559     inc l
   A512 36 00         [10]  560    ld (hl), #0x00
   A514 2C            [ 4]  561    inc l
   A515 36 80         [10]  562    ld (hl), #0x80
                            563 
                            564 
   A517 11 00 C0      [10]  565    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A51A 0E 00         [ 7]  566     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A51C 06 C2         [ 7]  567     ld      b,  #194
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   A51E CD 6C B0      [17]  568     call cpct_getScreenPtr_asm 
                            569     ;;PrimerCorazon
   A521 2C            [ 4]  570     inc l
   A522 36 73         [10]  571     ld (hl), #0x73
   A524 2C            [ 4]  572     inc l
   A525 36 FE         [10]  573    ld (hl), #0x7FE
   A527 2C            [ 4]  574    inc l
   A528 36 00         [10]  575    ld (hl), #0x00
                            576    ;;SegundoCorazon
   A52A 2C            [ 4]  577    inc l
   A52B 36 40         [10]  578     ld (hl), #0x40
   A52D 2C            [ 4]  579     inc l
   A52E 36 10         [10]  580    ld (hl), #0x10
   A530 2C            [ 4]  581    inc l
   A531 36 00         [10]  582    ld (hl), #0x00
                            583     ;;TercerCorazon
   A533 2C            [ 4]  584     inc l
   A534 36 40         [10]  585     ld (hl), #0x40
   A536 2C            [ 4]  586     inc l
   A537 36 10         [10]  587    ld (hl), #0x10
   A539 2C            [ 4]  588    inc l
   A53A 36 00         [10]  589    ld (hl), #0x00
                            590 
                            591 
   A53C 11 00 C0      [10]  592    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A53F 0E 00         [ 7]  593     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A541 06 C3         [ 7]  594     ld      b,  #195
   A543 CD 6C B0      [17]  595     call cpct_getScreenPtr_asm 
                            596     ;;PrimerCorazon
   A546 2C            [ 4]  597     inc l
   A547 36 31         [10]  598     ld (hl), #0x31
   A549 2C            [ 4]  599     inc l
   A54A 36 EC         [10]  600    ld (hl), #0xEC
   A54C 2C            [ 4]  601    inc l
   A54D 36 00         [10]  602    ld (hl), #0x00
                            603    ;;SegundoCorazon
   A54F 2C            [ 4]  604    inc l
   A550 36 20         [10]  605     ld (hl), #0x20
   A552 2C            [ 4]  606     inc l
   A553 36 20         [10]  607    ld (hl), #0x20
   A555 2C            [ 4]  608    inc l
   A556 36 00         [10]  609    ld (hl), #0x00
                            610     ;;TercerCorazon
   A558 2C            [ 4]  611     inc l
   A559 36 20         [10]  612     ld (hl), #0x20
   A55B 2C            [ 4]  613     inc l
   A55C 36 20         [10]  614    ld (hl), #0x20
   A55E 2C            [ 4]  615    inc l
   A55F 36 00         [10]  616    ld (hl), #0x00
                            617 
   A561 11 00 C0      [10]  618    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A564 0E 00         [ 7]  619     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A566 06 C4         [ 7]  620     ld      b,  #196
   A568 CD 6C B0      [17]  621     call cpct_getScreenPtr_asm 
                            622     ;;PrimerCorazon
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   A56B 2C            [ 4]  623     inc l
   A56C 36 10         [10]  624     ld (hl), #0x10
   A56E 2C            [ 4]  625     inc l
   A56F 36 C8         [10]  626    ld (hl), #0xC8
   A571 2C            [ 4]  627    inc l
   A572 36 00         [10]  628    ld (hl), #0x00
                            629    ;;SegundoCorazon
   A574 2C            [ 4]  630    inc l
   A575 36 10         [10]  631     ld (hl), #0x10
   A577 2C            [ 4]  632     inc l
   A578 36 40         [10]  633    ld (hl), #0x40
   A57A 2C            [ 4]  634    inc l
   A57B 36 00         [10]  635    ld (hl), #0x00
                            636     ;;TercerCorazon
   A57D 2C            [ 4]  637     inc l
   A57E 36 10         [10]  638     ld (hl), #0x10
   A580 2C            [ 4]  639     inc l
   A581 36 40         [10]  640    ld (hl), #0x40
   A583 2C            [ 4]  641    inc l
   A584 36 00         [10]  642    ld (hl), #0x00
                            643 
                            644 
   A586 11 00 C0      [10]  645    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
   A589 0E 00         [ 7]  646     ld      c,  #0          ;;Coordenada X (tamaño en ancho)
   A58B 06 C5         [ 7]  647     ld      b,  #197
   A58D CD 6C B0      [17]  648     call cpct_getScreenPtr_asm 
                            649     ;;PrimerCorazon
   A590 2C            [ 4]  650     inc l
   A591 36 00         [10]  651     ld (hl), #0x00
   A593 2C            [ 4]  652     inc l
   A594 36 80         [10]  653    ld (hl), #0x80
   A596 2C            [ 4]  654    inc l
   A597 36 00         [10]  655    ld (hl), #0x00
                            656    ;;SegundoCorazon
   A599 2C            [ 4]  657    inc l
   A59A 36 00         [10]  658     ld (hl), #0x00
   A59C 2C            [ 4]  659     inc l
   A59D 36 80         [10]  660    ld (hl), #0x80
   A59F 2C            [ 4]  661    inc l
   A5A0 36 00         [10]  662    ld (hl), #0x00
                            663     ;;TercerCorazon
   A5A2 2C            [ 4]  664     inc l
   A5A3 36 00         [10]  665     ld (hl), #0x00
   A5A5 2C            [ 4]  666     inc l
   A5A6 36 80         [10]  667    ld (hl), #0x80
   A5A8 2C            [ 4]  668    inc l
   A5A9 36 00         [10]  669    ld (hl), #0x00
   A5AB C9            [10]  670    ret
