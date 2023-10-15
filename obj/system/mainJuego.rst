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



                             15 .include "cpctelera.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;; All CPCtelera include files
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             20 .include "macros/allmacros.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             19 .include "macros/cpct_maths.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Math Macros
                             21 ;;
                             22 ;;    Useful assembler macros for doing common math operations
                             23 ;;
                             24 
                             25 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             26 ;; Macro: add_REGPAIR_a 
                             27 ;;
                             28 ;;    Performs the operation REGPAIR = REGPAIR + A. REGPAIR is any given pair of 8-bit registers.
                             29 ;;
                             30 ;; ASM Definition:
                             31 ;;    .macro <add_REGPAIR_a> RH, RL
                             32 ;;
                             33 ;; Parameters:
                             34 ;;    RH    - Register 1 of the REGPAIR. Holds higher-byte value
                             35 ;;    RL    - Register 2 of the REGPAIR. Holds lower-byte value
                             36 ;; 
                             37 ;; Input Registers: 
                             38 ;;    RH:RL - 16-value used as left-operand and final storage for the sum
                             39 ;;    A     - Second sum operand
                             40 ;;
                             41 ;; Return Value:
                             42 ;;    RH:RL - Holds the sum of RH:RL + A
                             43 ;;
                             44 ;; Details:
                             45 ;;    This macro performs the sum of RH:RL + A and stores it directly on RH:RL.
                             46 ;; It uses only RH:RL and A to perform the operation.
                             47 ;;
                             48 ;; Modified Registers: 
                             49 ;;    A, RH, RL
                             50 ;;
                             51 ;; Required memory:
                             52 ;;    5 bytes
                             53 ;;
                             54 ;; Time Measures:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             55 ;; (start code)
                             56 ;;  Case | microSecs(us) | CPU Cycles
                             57 ;; ------------------------------------
                             58 ;;  Any  |       5       |     20
                             59 ;; ------------------------------------
                             60 ;; (end code)
                             61 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             62 .macro add_REGPAIR_a rh, rl
                             63    ;; First Perform RH = E + A
                             64    add rl    ;; [1] A' = RL + A 
                             65    ld  rl, a ;; [1] RL' = A' = RL + A. It might generate Carry that must be added to RH
                             66    
                             67    ;; Then Perform RH = RH + Carry 
                             68    adc rh    ;; [1] A'' = A' + RH + Carry = RL + A + RH + Carry
                             69    sub rl    ;; [1] Remove RL'. A''' = A'' - RL' = RL + A + RH + Carry - (RL + A) = RH + Carry
                             70    ld  rh, a ;; [1] Save into RH (RH' = A''' = RH + Carry)
                             71 .endm
                             72 
                             73 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             74 ;; Macro: add_de_a
                             75 ;;
                             76 ;;    Performs the operation DE = DE + A
                             77 ;;
                             78 ;; ASM Definition:
                             79 ;;    .macro <add_de_a>
                             80 ;;
                             81 ;; Parameters:
                             82 ;;    None
                             83 ;; 
                             84 ;; Input Registers: 
                             85 ;;    DE    - First sum operand and Destination Register
                             86 ;;    A     - Second sum operand
                             87 ;;
                             88 ;; Return Value:
                             89 ;;    DE - Holds the sum of DE + A
                             90 ;;
                             91 ;; Details:
                             92 ;;    This macro performs the sum of DE + A and stores it directly on DE.
                             93 ;; It uses only DE and A to perform the operation.
                             94 ;;    This macro is a direct instantiation of the macro <add_REGPAIR_a>.
                             95 ;;
                             96 ;; Modified Registers: 
                             97 ;;    A, DE
                             98 ;;
                             99 ;; Required memory:
                            100 ;;    5 bytes
                            101 ;;
                            102 ;; Time Measures:
                            103 ;; (start code)
                            104 ;;  Case | microSecs(us) | CPU Cycles
                            105 ;; ------------------------------------
                            106 ;;  Any  |       5       |     20
                            107 ;; ------------------------------------
                            108 ;; (end code)
                            109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                            110 .macro add_de_a
                            111    add_REGPAIR_a  d, e
                            112 .endm
                            113 
                            114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            115 ;; Macro: add_hl_a
                            116 ;;
                            117 ;;    Performs the operation HL = HL + A
                            118 ;;
                            119 ;; ASM Definition:
                            120 ;;    .macro <add_hl_a>
                            121 ;;
                            122 ;; Parameters:
                            123 ;;    None
                            124 ;; 
                            125 ;; Input Registers: 
                            126 ;;    HL    - First sum operand and Destination Register
                            127 ;;    A     - Second sum operand
                            128 ;;
                            129 ;; Return Value:
                            130 ;;    HL - Holds the sum of HL + A
                            131 ;;
                            132 ;; Details:
                            133 ;;    This macro performs the sum of HL + A and stores it directly on HL.
                            134 ;; It uses only HL and A to perform the operation.
                            135 ;;    This macro is a direct instantiation of the macro <add_REGPAIR_a>.
                            136 ;;
                            137 ;; Modified Registers: 
                            138 ;;    A, HL
                            139 ;;
                            140 ;; Required memory:
                            141 ;;    5 bytes
                            142 ;;
                            143 ;; Time Measures:
                            144 ;; (start code)
                            145 ;;  Case | microSecs(us) | CPU Cycles
                            146 ;; ------------------------------------
                            147 ;;  Any  |       5       |     20
                            148 ;; ------------------------------------
                            149 ;; (end code)
                            150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            151 .macro add_hl_a
                            152    add_REGPAIR_a  h, l
                            153 .endm
                            154 
                            155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            156 ;; Macro: add_bc_a
                            157 ;;
                            158 ;;    Performs the operation BC = BC + A
                            159 ;;
                            160 ;; ASM Definition:
                            161 ;;    .macro <add_bc_a>
                            162 ;;
                            163 ;; Parameters:
                            164 ;;    None
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                            165 ;; 
                            166 ;; Input Registers: 
                            167 ;;    BC    - First sum operand and Destination Register
                            168 ;;    A     - Second sum operand
                            169 ;;
                            170 ;; Return Value:
                            171 ;;    BC - Holds the sum of BC + A
                            172 ;;
                            173 ;; Details:
                            174 ;;    This macro performs the sum of BC + A and stores it directly on BC.
                            175 ;; It uses only BC and A to perform the operation.
                            176 ;;    This macro is a direct instantiation of the macro <add_REGPAIR_a>.
                            177 ;;
                            178 ;; Modified Registers: 
                            179 ;;    A, BC
                            180 ;;
                            181 ;; Required memory:
                            182 ;;    5 bytes
                            183 ;;
                            184 ;; Time Measures:
                            185 ;; (start code)
                            186 ;;  Case | microSecs(us) | CPU Cycles
                            187 ;; ------------------------------------
                            188 ;;  Any  |       5       |     20
                            189 ;; ------------------------------------
                            190 ;; (end code)
                            191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            192 .macro add_bc_a
                            193    add_REGPAIR_a  b, c
                            194 .endm
                            195 
                            196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            197 ;; Macro: sub_REGPAIR_a 
                            198 ;;
                            199 ;;    Performs the operation REGPAIR = REGPAIR - A. REGPAIR is any given pair of 8-bit registers.
                            200 ;;
                            201 ;; ASM Definition:
                            202 ;;    .macro <sub_REGPAIR_a> RH, RL
                            203 ;;
                            204 ;; Parameters:
                            205 ;;    RH    - Register 1 of the REGPAIR. Holds higher-byte value
                            206 ;;    RL    - Register 2 of the REGPAIR. Holds lower-byte value
                            207 ;;  ?JMPLBL - Optional Jump label. A temporal one will be produced if none is given.
                            208 ;; 
                            209 ;; Input Registers: 
                            210 ;;    RH:RL - 16-value used as left-operand and final storage for the subtraction
                            211 ;;    A     - Second subtraction operand (A > 0)
                            212 ;;
                            213 ;; Preconditions:
                            214 ;;    A > 0 - Value in register A is considered to be unsigned and must be greater
                            215 ;;            than 0 for this macro to work properly.
                            216 ;;
                            217 ;; Return Value:
                            218 ;;    RH:RL - Holds the result of RH:RL - A
                            219 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            220 ;; Details:
                            221 ;;    This macro performs the subtraction of RH:RL - A and stores it directly on RH:RL.
                            222 ;; It uses only RH:RL and A to perform the operation.
                            223 ;;    With respect to the optional label ?JMPLBL, it is often better not to provide 
                            224 ;; this parameter. A temporal local symbol will be automatically generated for that label.
                            225 ;; Only provide it when you have a specific reason to do that.
                            226 ;;
                            227 ;; Modified Registers: 
                            228 ;;    A, RH, RL
                            229 ;;
                            230 ;; Required memory:
                            231 ;;    7 bytes
                            232 ;;
                            233 ;; Time Measures:
                            234 ;; (start code)
                            235 ;;  Case | microSecs(us) | CPU Cycles
                            236 ;; ------------------------------------
                            237 ;;  Any  |       7       |     28
                            238 ;; ------------------------------------
                            239 ;; (end code)
                            240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            241 .macro sub_REGPAIR_a rh, rl, ?jmplbl
                            242    ;; First Perform A' = A - 1 - RL 
                            243    ;; (Inverse subtraction minus 1, used  to test for Carry, needed to know when to subtract 1 from RH)
                            244    dec    a          ;; [1] --A (In case A == RL, inverse subtraction should produce carry not to decrement RH)
                            245    sub   rl          ;; [1] A' = A - 1 - RL
                            246    jr     c, jmplbl  ;; [2/3] If A <= RL, Carry will be produced, and no decrement of RH is required, so jump over it
                            247      dec   rh        ;; [1] --RH (A > RL, so RH must be decremented)
                            248 jmplbl:   
                            249    ;; Now invert A to get the subtraction we wanted 
                            250    ;; { RL' = -A' - 1 = -(A - 1 - RL) - 1 = RL - A }
                            251    cpl            ;; [1] A'' = RL - A (Original subtraction we wanted, calculated trough one's complement of A')
                            252    ld    rl, a    ;; [1] Save into RL (RL' = RL - A)
                            253 .endm
                            254 
                            255 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            256 ;; Macro: sub_de_a 
                            257 ;;
                            258 ;;    Performs the operation DE = DE - A. DE is any given pair of 8-bit registers.
                            259 ;;
                            260 ;; ASM Definition:
                            261 ;;    .macro <sub_de_a>
                            262 ;; 
                            263 ;; Input Registers: 
                            264 ;;    DE - 16-value used as left-operand and final storage for the subtraction
                            265 ;;    A  - Second subtraction operand
                            266 ;;
                            267 ;; Return Value:
                            268 ;;    DE - Holds the result of DE - A
                            269 ;;
                            270 ;; Details:
                            271 ;;    This macro performs the subtraction of DE - A and stores it directly on DE.
                            272 ;; It uses only DE and A to perform the operation.
                            273 ;;
                            274 ;; Modified Registers: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                            275 ;;    A, DE
                            276 ;;
                            277 ;; Required memory:
                            278 ;;    7 bytes
                            279 ;;
                            280 ;; Time Measures:
                            281 ;; (start code)
                            282 ;;  Case | microSecs(us) | CPU Cycles
                            283 ;; ------------------------------------
                            284 ;;  Any  |       7       |     28
                            285 ;; ------------------------------------
                            286 ;; (end code)
                            287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            288 .macro sub_de_a
                            289    sub_REGPAIR_a  d, e
                            290 .endm
                            291 
                            292 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            293 ;; Macro: sub_hl_a 
                            294 ;;
                            295 ;;    Performs the operation HL = HL - A. HL is any given pair of 8-bit registers.
                            296 ;;
                            297 ;; ASM Definition:
                            298 ;;    .macro <sub_hl_a>
                            299 ;; 
                            300 ;; Input Registers: 
                            301 ;;    HL - 16-value used as left-operand and final storage for the subtraction
                            302 ;;    A  - Second subtraction operand
                            303 ;;
                            304 ;; Return Value:
                            305 ;;    HL - Holds the result of HL - A
                            306 ;;
                            307 ;; Details:
                            308 ;;    This macro performs the subtraction of HL - A and stores it directly on HL.
                            309 ;; It uses only HL and A to perform the operation.
                            310 ;;
                            311 ;; Modified Registers: 
                            312 ;;    A, HL
                            313 ;;
                            314 ;; Required memory:
                            315 ;;    7 bytes
                            316 ;;
                            317 ;; Time Measures:
                            318 ;; (start code)
                            319 ;;  Case | microSecs(us) | CPU Cycles
                            320 ;; ------------------------------------
                            321 ;;  Any  |       7       |     28
                            322 ;; ------------------------------------
                            323 ;; (end code)
                            324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            325 .macro sub_hl_a
                            326    sub_REGPAIR_a  h, l
                            327 .endm
                            328 
                            329 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            330 ;; Macro: sub_bc_a 
                            331 ;;
                            332 ;;    Performs the operation BC = BC - A. BC is any given pair of 8-bit registers.
                            333 ;;
                            334 ;; ASM Definition:
                            335 ;;    .macro <sub_bc_a>
                            336 ;; 
                            337 ;; Input Registers: 
                            338 ;;    BC - 16-value used as left-operand and final storage for the subtraction
                            339 ;;    A  - Second subtraction operand
                            340 ;;
                            341 ;; Return Value:
                            342 ;;    BC - Holds the result of BC - A
                            343 ;;
                            344 ;; Details:
                            345 ;;    This macro performs the subtraction of BC - A and stores it directly on BC.
                            346 ;; It uses only BC and A to perform the operation.
                            347 ;;
                            348 ;; Modified Registers: 
                            349 ;;    A, BC
                            350 ;;
                            351 ;; Required memory:
                            352 ;;    7 bytes
                            353 ;;
                            354 ;; Time Measures:
                            355 ;; (start code)
                            356 ;;  Case | microSecs(us) | CPU Cycles
                            357 ;; ------------------------------------
                            358 ;;  Any  |       7       |     28
                            359 ;; ------------------------------------
                            360 ;; (end code)
                            361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            362 .macro sub_bc_a
                            363    sub_REGPAIR_a  b, c
                            364 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                             20 .include "macros/cpct_opcodeConstants.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Opcodes
                             21 ;;
                             22 ;;    Constant definitions of Z80 opcodes. This will be normally used as data
                             23 ;; for self-modifying code.
                             24 ;;
                             25 
                             26 ;; Constant: opc_JR
                             27 ;;    Opcode for "JR xx" instruction. Requires 1-byte parameter (xx)
                     0018    28 opc_JR   = 0x18
                             29 
                             30 ;; Constant: opc_LD_D
                             31 ;;    Opcode for "LD d, xx" instruction. Requires 1-byte parameter (xx)
                     0016    32 opc_LD_D = 0x16
                             33 
                             34 ;; Constant: opc_EI
                             35 ;;    Opcode for "EI" instruction. 
                     00FB    36 opc_EI = 0xFB
                             37 
                             38 ;; Constant: opc_DI
                             39 ;;    Opcode for "DI" instruction. 
                     00F3    40 opc_DI = 0xF3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                             21 .include "macros/cpct_reverseBits.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Reverse Bits
                             21 ;;
                             22 ;;    Useful macros for bit reversing and selecting in different ways. Only
                             23 ;; valid to be used from assembly language (not from C).
                             24 ;;
                             25 
                             26 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             27 ;; Macro: cpctm_reverse_and_select_bits_of_A
                             28 ;;
                             29 ;;    Reorders the bits of A and mixes them letting the user select the 
                             30 ;; new order for the bits by using a selection mask.
                             31 ;;
                             32 ;; Parameters:
                             33 ;;    TReg          - An 8-bits register that will be used for intermediate calculations.
                             34 ;; This register may be one of these: B, C, D, E, H, L
                             35 ;;    SelectionMask - An 8-bits mask that will be used to select the bits to get from 
                             36 ;; the reordered bits. It might be an 8-bit register or even (hl).
                             37 ;; 
                             38 ;; Input Registers: 
                             39 ;;    A     - Byte to be reversed
                             40 ;;    TReg  - Should have a copy of A (same exact value)
                             41 ;;
                             42 ;; Return Value:
                             43 ;;    A - Resulting value with bits reversed and selected 
                             44 ;;
                             45 ;; Details:
                             46 ;;    This macro reorders the bits in A and mixes them with the same bits in
                             47 ;; their original order by using a *SelectionMask*. The process is as follows:
                             48 ;;
                             49 ;;    1. Consider the 8 bits of A = TReg = [01234567]
                             50 ;;    2. Reorder the 8 bits of A, producing A2 = [32547610]
                             51 ;;    2. Reorder the bits of TReg, producing TReg2 = [76103254]
                             52 ;;    3. Combines both reorders into final result using a *SelectionMask*. Each 
                             53 ;; 0 bit from the selection mask means "select bit from A2", whereas each 1 bit
                             54 ;; means "select bit from TReg2".
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



                             55 ;;
                             56 ;;    For instance, a selection mask 0b11001100 will produce this result:
                             57 ;;
                             58 ;; (start code)
                             59 ;;       A2 = [ 32 54 76 10 ]
                             60 ;;    TReg2 = [ 76 10 32 54 ]
                             61 ;;  SelMask = [ 11 00 11 00 ] // 1 = TReg2-bits, 0 = A2-bits
                             62 ;;  ---------------------------
                             63 ;;   Result = [ 76 54 32 10 ]
                             64 ;; (end code)
                             65 ;;
                             66 ;;    Therefore, mask 0b11001100 produces the effect of reversing the bits of A
                             67 ;; completely. Other masks will produce different reorders of the bits in A, for
                             68 ;; different requirements or needs.
                             69 ;;
                             70 ;; Modified Registers: 
                             71 ;;    AF, TReg
                             72 ;;
                             73 ;; Required memory:
                             74 ;;    16 bytes
                             75 ;;
                             76 ;; Time Measures:
                             77 ;; (start code)
                             78 ;;  Case | microSecs(us) | CPU Cycles
                             79 ;; ------------------------------------
                             80 ;;  Any  |      16       |     64
                             81 ;; ------------------------------------
                             82 ;; (end code)
                             83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             84 .macro cpctm_reverse_and_select_bits_of_A  TReg, SelectionMask
                             85    rlca            ;; [1] | Rotate left twice so that...
                             86    rlca            ;; [1] | ... A=[23456701]
                             87 
                             88    ;; Mix bits of TReg and A so that all bits are in correct relative order
                             89    ;; but displaced from their final desired location
                             90    xor TReg        ;; [1] TReg = [01234567] (original value)
                             91    and #0b01010101 ;; [2]    A = [23456701] (bits rotated twice left)
                             92    xor TReg        ;; [1]   A2 = [03254761] (TReg mixed with A to get bits in order)
                             93    
                             94    ;; Now get bits 54 and 10 in their right location and save them into TReg
                             95    rlca            ;; [1]    A = [ 32 54 76 10 ] (54 and 10 are in their desired place)
                             96    ld TReg, a      ;; [1] TReg = A (Save this bit location into TReg)
                             97    
                             98    ;; Now get bits 76 and 32 in their right location in A
                             99    rrca            ;; [1] | Rotate A right 4 times to...
                            100    rrca            ;; [1] | ... get bits 76 and 32 located at their ...
                            101    rrca            ;; [1] | ... desired location :
                            102    rrca            ;; [1] | ... A = [ 76 10 32 54 ] (76 and 32 are in their desired place)
                            103    
                            104    ;; Finally, mix bits from TReg and A to get all bits reversed and selected
                            105    xor TReg          ;; [1] TReg = [32547610] (Mixed bits with 54 & 10 in their right place)
                            106    and SelectionMask ;; [2]    A = [76103254] (Mixed bits with 76 & 32 in their right place)
                            107    xor TReg          ;; [1]   A2 = [xxxxxxxx] final value: bits of A reversed and selected using *SelectionMask*
                            108 .endm
                            109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



                            110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            111 ;; Macro: cpctm_reverse_bits_of_A 
                            112 ;; Macro: cpctm_reverse_mode_2_pixels_of_A
                            113 ;;
                            114 ;;    Reverses the 8-bits of A, from [01234567] to [76543210]. This also reverses
                            115 ;; all pixels contained in A when A is in screen pixel format, mode 2.
                            116 ;;
                            117 ;; Parameters:
                            118 ;;    TReg - An 8-bits register that will be used for intermediate calculations.
                            119 ;; This register may be one of these: B, C, D, E, H, L
                            120 ;; 
                            121 ;; Input Registers: 
                            122 ;;    A    - Byte to be reversed
                            123 ;;    TReg - Should have a copy of A (same exact value)
                            124 ;;
                            125 ;; Return Value:
                            126 ;;    A - Resulting value with bits reversed 
                            127 ;;
                            128 ;; Requires:
                            129 ;;   - Uses the macro <cpctm_reverse_and_select_bits_of_A>.
                            130 ;;
                            131 ;; Details:
                            132 ;;    This macro reverses the bits in A. If bits of A = [01234567], the final
                            133 ;; result after processing this macro will be A = [76543210]. Register TReg is
                            134 ;; used for intermediate calculations and its value is destroyed.
                            135 ;;
                            136 ;; Modified Registers: 
                            137 ;;    AF, TReg
                            138 ;;
                            139 ;; Required memory:
                            140 ;;    16 bytes
                            141 ;;
                            142 ;; Time Measures:
                            143 ;; (start code)
                            144 ;;  Case | microSecs(us) | CPU Cycles
                            145 ;; ------------------------------------
                            146 ;;  Any  |      16       |     64
                            147 ;; ------------------------------------
                            148 ;; (end code)
                            149 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            150 .macro cpctm_reverse_bits_of_A  TReg
                            151    cpctm_reverse_and_select_bits_of_A  TReg, #0b11001100
                            152 .endm
                            153 .macro cpctm_reverse_mode_2_pixels_of_A   TReg
                            154    cpctm_reverse_bits_of_A  TReg
                            155 .endm
                            156 
                            157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            158 ;; Macro: cpctm_reverse_mode_1_pixels_of_A
                            159 ;;
                            160 ;;    Reverses the order of pixel values contained in register A, assuming A is 
                            161 ;; in screen pixel format, mode 1.
                            162 ;;
                            163 ;; Parameters:
                            164 ;;    TReg - An 8-bits register that will be used for intermediate calculations.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



                            165 ;; This register may be one of these: B, C, D, E, H, L
                            166 ;; 
                            167 ;; Input Registers: 
                            168 ;;    A    - Byte with pixel values to be reversed
                            169 ;;    TReg - Should have a copy of A (same exact value)
                            170 ;;
                            171 ;; Return Value:
                            172 ;;    A - Resulting byte with the 4 pixels values reversed in order
                            173 ;;
                            174 ;; Requires:
                            175 ;;   - Uses the macro <cpctm_reverse_and_select_bits_of_A>.
                            176 ;;
                            177 ;; Details:
                            178 ;;    This macro considers that A contains a byte that codifies 4 pixels in 
                            179 ;; screen pixel format, mode 1. It modifies A to reverse the order of its 4 
                            180 ;; contained pixel values left-to-right (1234 -> 4321). With respect to the 
                            181 ;; order of the 8-bits of A, the concrete operations performed is:
                            182 ;; (start code)
                            183 ;;    A = [01234567] == reverse-pixels ==> [32107654] = A2
                            184 ;; (end code)
                            185 ;;    You may want to check <cpct_px2byteM1> to know how bits codify both pixels
                            186 ;; in one single byte for screen pixel format, mode 1.
                            187 ;;
                            188 ;;    *TReg* is an 8-bit register that will be used for intermediate calculations,
                            189 ;; destroying its original value (that should be same as A, at the start).
                            190 ;;
                            191 ;; Modified Registers: 
                            192 ;;    AF, TReg
                            193 ;;
                            194 ;; Required memory:
                            195 ;;    16 bytes
                            196 ;;
                            197 ;; Time Measures:
                            198 ;; (start code)
                            199 ;;  Case | microSecs(us) | CPU Cycles
                            200 ;; ------------------------------------
                            201 ;;  Any  |      16       |     64
                            202 ;; ------------------------------------
                            203 ;; (end code)
                            204 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            205 .macro cpctm_reverse_mode_1_pixels_of_A  TReg
                            206    cpctm_reverse_and_select_bits_of_A  TReg, #0b00110011
                            207 .endm
                            208 
                            209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            210 ;; Macro: cpctm_reverse_mode_0_pixels_of_A
                            211 ;;
                            212 ;;    Reverses the order of pixel values contained in register A, assuming A is 
                            213 ;; in screen pixel format, mode 0.
                            214 ;;
                            215 ;; Parameters:
                            216 ;;    TReg - An 8-bits register that will be used for intermediate calculations.
                            217 ;; This register may be one of these: B, C, D, E, H, L
                            218 ;; 
                            219 ;; Input Registers: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



                            220 ;;    A    - Byte with pixel values to be reversed
                            221 ;;    TReg - Should have a copy of A (same exact value)
                            222 ;;
                            223 ;; Return Value:
                            224 ;;    A - Resulting byte with the 2 pixels values reversed in order
                            225 ;;
                            226 ;; Details:
                            227 ;;    This macro considers that A contains a byte that codifies 2 pixels in 
                            228 ;; screen pixel format, mode 0. It modifies A to reverse the order of its 2 
                            229 ;; contained pixel values left-to-right (12 -> 21). With respect to the 
                            230 ;; order of the 8-bits of A, the concrete operation performed is:
                            231 ;; (start code)
                            232 ;;    A = [01234567] == reverse-pixels ==> [10325476] = A2
                            233 ;; (end code)
                            234 ;;    You may want to check <cpct_px2byteM0> to know how bits codify both pixels
                            235 ;; in one single byte for screen pixel format, mode 0.
                            236 ;;
                            237 ;;    *TReg* is an 8-bit register that will be used for intermediate calculations,
                            238 ;; destroying its original value (that should be same as A, at the start).
                            239 ;;
                            240 ;; Modified Registers: 
                            241 ;;    AF, TReg
                            242 ;;
                            243 ;; Required memory:
                            244 ;;    7 bytes
                            245 ;;
                            246 ;; Time Measures:
                            247 ;; (start code)
                            248 ;;  Case | microSecs(us) | CPU Cycles
                            249 ;; ------------------------------------
                            250 ;;  Any  |       7       |     28
                            251 ;; ------------------------------------
                            252 ;; (end code)
                            253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            254 .macro cpctm_reverse_mode_0_pixels_of_A  TReg
                            255    rlca            ;; [1] | Rotate A twice to the left to get bits ordered...
                            256    rlca            ;; [1] | ... in the way we need for mixing, A = [23456701]
                            257   
                            258    ;; Mix TReg with A to get pixels reversed by reordering bits
                            259    xor TReg        ;; [1] | TReg = [01234567]
                            260    and #0b01010101 ;; [2] |    A = [23456701]
                            261    xor TReg        ;; [1] |   A2 = [03254761]
                            262    rrca            ;; [1] Rotate right to get pixels reversed A = [10325476]
                            263 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



                             22 .include "macros/cpct_undocumentedOpcodes.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Undocumented Opcodes
                             21 ;;
                             22 ;;    Macros to clarify source code when using undocumented opcodes. Only
                             23 ;; valid to be used from assembly language (not from C).
                             24 ;;
                             25 
                             26 ;; Macro: jr__0
                             27 ;;    Opcode for "JR #0" instruction
                             28 ;; 
                             29 .macro jr__0
                             30    .DW #0x0018  ;; JR #00 (Normally used as a modifiable jump, as jr 0 is an infinite loop)
                             31 .endm
                             32 
                             33 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             35 ;; SLL Instructions
                             36 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             37 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             38 
                             39 ;; Macro: sll__b
                             40 ;;    Opcode for "SLL b" instruction
                             41 ;; 
                             42 .macro sll__b
                             43    .db #0xCB, #0x30  ;; Opcode for sll b
                             44 .endm
                             45 
                             46 ;; Macro: sll__c
                             47 ;;    Opcode for "SLL c" instruction
                             48 ;; 
                             49 .macro sll__c
                             50    .db #0xCB, #0x31  ;; Opcode for sll c
                             51 .endm
                             52 
                             53 ;; Macro: sll__d
                             54 ;;    Opcode for "SLL d" instruction
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



                             55 ;; 
                             56 .macro sll__d
                             57    .db #0xCB, #0x32  ;; Opcode for sll d
                             58 .endm
                             59 
                             60 ;; Macro: sll__e
                             61 ;;    Opcode for "SLL e" instruction
                             62 ;; 
                             63 .macro sll__e
                             64    .db #0xCB, #0x33  ;; Opcode for sll e
                             65 .endm
                             66 
                             67 ;; Macro: sll__h
                             68 ;;    Opcode for "SLL h" instruction
                             69 ;; 
                             70 .macro sll__h
                             71    .db #0xCB, #0x34  ;; Opcode for sll h
                             72 .endm
                             73 
                             74 ;; Macro: sll__l
                             75 ;;    Opcode for "SLL l" instruction
                             76 ;; 
                             77 .macro sll__l
                             78    .db #0xCB, #0x35  ;; Opcode for sll l
                             79 .endm
                             80 
                             81 ;; Macro: sll___hl_
                             82 ;;    Opcode for "SLL (hl)" instruction
                             83 ;; 
                             84 .macro sll___hl_
                             85    .db #0xCB, #0x36  ;; Opcode for sll (hl)
                             86 .endm
                             87 
                             88 ;; Macro: sll__a
                             89 ;;    Opcode for "SLL a" instruction
                             90 ;; 
                             91 .macro sll__a
                             92    .db #0xCB, #0x37  ;; Opcode for sll a
                             93 .endm
                             94 
                             95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             96 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             97 ;; IXL Related Macros
                             98 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             99 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            100 
                            101 ;; Macro: ld__ixl    Value
                            102 ;;    Opcode for "LD ixl, Value" instruction
                            103 ;;  
                            104 ;; Parameters:
                            105 ;;    Value - An inmediate 8-bits value that will be loaded into ixl
                            106 ;; 
                            107 .macro ld__ixl    Value 
                            108    .db #0xDD, #0x2E, Value  ;; Opcode for ld ixl, Value
                            109 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



                            110 
                            111 ;; Macro: ld__ixl_a
                            112 ;;    Opcode for "LD ixl, a" instruction
                            113 ;; 
                            114 .macro ld__ixl_a
                            115    .dw #0x6FDD  ;; Opcode for ld ixl, a
                            116 .endm
                            117 
                            118 ;; Macro: ld__ixl_b
                            119 ;;    Opcode for "LD ixl, B" instruction
                            120 ;; 
                            121 .macro ld__ixl_b
                            122    .dw #0x68DD  ;; Opcode for ld ixl, b
                            123 .endm
                            124 
                            125 ;; Macro: ld__ixl_c
                            126 ;;    Opcode for "LD ixl, C" instruction
                            127 ;; 
                            128 .macro ld__ixl_c
                            129    .dw #0x69DD  ;; Opcode for ld ixl, c
                            130 .endm
                            131 
                            132 ;; Macro: ld__ixl_d
                            133 ;;    Opcode for "LD ixl, D" instruction
                            134 ;; 
                            135 .macro ld__ixl_d
                            136    .dw #0x6ADD  ;; Opcode for ld ixl, d
                            137 .endm
                            138 
                            139 ;; Macro: ld__ixl_e
                            140 ;;    Opcode for "LD ixl, E" instruction
                            141 ;; 
                            142 .macro ld__ixl_e
                            143    .dw #0x6BDD  ;; Opcode for ld ixl, e
                            144 .endm
                            145 
                            146 ;; Macro: ld__ixl_ixh
                            147 ;;    Opcode for "LD ixl, IXH" instruction
                            148 ;; 
                            149 .macro ld__ixl_ixh
                            150    .dw #0x6CDD  ;; Opcode for ld ixl, ixh
                            151 .endm
                            152 
                            153 ;; Macro: ld__a_ixl
                            154 ;;    Opcode for "LD A, ixl" instruction
                            155 ;; 
                            156 .macro ld__a_ixl
                            157    .dw #0x7DDD  ;; Opcode for ld a, ixl
                            158 .endm
                            159 
                            160 ;; Macro: ld__b_ixl
                            161 ;;    Opcode for "LD B, ixl" instruction
                            162 ;; 
                            163 .macro ld__b_ixl
                            164    .dw #0x45DD  ;; Opcode for ld b, ixl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



                            165 .endm
                            166 
                            167 ;; Macro: ld__c_ixl
                            168 ;;    Opcode for "LD c, ixl" instruction
                            169 ;; 
                            170 .macro ld__c_ixl
                            171    .dw #0x4DDD  ;; Opcode for ld c, ixl
                            172 .endm
                            173 
                            174 ;; Macro: ld__d_ixl
                            175 ;;    Opcode for "LD D, ixl" instruction
                            176 ;; 
                            177 .macro ld__d_ixl
                            178    .dw #0x55DD  ;; Opcode for ld d, ixl
                            179 .endm
                            180 
                            181 ;; Macro: ld__e_ixl
                            182 ;;    Opcode for "LD e, ixl" instruction
                            183 ;; 
                            184 .macro ld__e_ixl
                            185    .dw #0x5DDD  ;; Opcode for ld e, ixl
                            186 .endm
                            187 
                            188 ;; Macro: add__ixl
                            189 ;;    Opcode for "Add ixl" instruction
                            190 ;; 
                            191 .macro add__ixl
                            192    .dw #0x85DD  ;; Opcode for add ixl
                            193 .endm
                            194 
                            195 ;; Macro: sub__ixl
                            196 ;;    Opcode for "SUB ixl" instruction
                            197 ;; 
                            198 .macro sub__ixl
                            199    .dw #0x95DD  ;; Opcode for sub ixl
                            200 .endm
                            201 
                            202 ;; Macro: adc__ixl
                            203 ;;    Opcode for "ADC ixl" instruction
                            204 ;; 
                            205 .macro adc__ixl
                            206    .dw #0x8DDD  ;; Opcode for adc ixl
                            207 .endm
                            208 
                            209 ;; Macro: sbc__ixl
                            210 ;;    Opcode for "SBC ixl" instruction
                            211 ;; 
                            212 .macro sbc__ixl
                            213    .dw #0x9DDD  ;; Opcode for sbc ixl
                            214 .endm
                            215 
                            216 ;; Macro: and__ixl
                            217 ;;    Opcode for "AND ixl" instruction
                            218 ;; 
                            219 .macro and__ixl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 21.
Hexadecimal [16-Bits]



                            220    .dw #0xA5DD  ;; Opcode for and ixl
                            221 .endm
                            222 
                            223 ;; Macro: or__ixl
                            224 ;;    Opcode for "OR ixl" instruction
                            225 ;; 
                            226 .macro or__ixl
                            227    .dw #0xB5DD  ;; Opcode for or ixl
                            228 .endm
                            229 
                            230 ;; Macro: xor__ixl
                            231 ;;    Opcode for "XOR ixl" instruction
                            232 ;; 
                            233 .macro xor__ixl
                            234    .dw #0xADDD  ;; Opcode for xor ixl
                            235 .endm
                            236 
                            237 ;; Macro: cp__ixl
                            238 ;;    Opcode for "CP ixl" instruction
                            239 ;; 
                            240 .macro cp__ixl
                            241    .dw #0xBDDD  ;; Opcode for cp ixl
                            242 .endm
                            243 
                            244 ;; Macro: dec__ixl
                            245 ;;    Opcode for "DEC ixl" instruction
                            246 ;; 
                            247 .macro dec__ixl
                            248    .dw #0x2DDD  ;; Opcode for dec ixl
                            249 .endm
                            250 
                            251 ;; Macro: inc__ixl
                            252 ;;    Opcode for "INC ixl" instruction
                            253 ;; 
                            254 .macro inc__ixl
                            255    .dw #0x2CDD  ;; Opcode for inc ixl
                            256 .endm
                            257 
                            258 
                            259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            261 ;; IXH Related Macros
                            262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            263 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            264 
                            265 ;; Macro: ld__ixh    Value
                            266 ;;    Opcode for "LD IXH, Value" instruction
                            267 ;;  
                            268 ;; Parameters:
                            269 ;;    Value - An inmediate 8-bits value that will be loaded into IXH
                            270 ;; 
                            271 .macro ld__ixh    Value 
                            272    .db #0xDD, #0x26, Value  ;; Opcode for ld ixh, Value
                            273 .endm
                            274 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 22.
Hexadecimal [16-Bits]



                            275 ;; Macro: ld__ixh_a
                            276 ;;    Opcode for "LD IXH, a" instruction
                            277 ;; 
                            278 .macro ld__ixh_a
                            279    .dw #0x67DD  ;; Opcode for ld ixh, a
                            280 .endm
                            281 
                            282 ;; Macro: ld__ixh_b
                            283 ;;    Opcode for "LD IXH, B" instruction
                            284 ;; 
                            285 .macro ld__ixh_b
                            286    .dw #0x60DD  ;; Opcode for ld ixh, b
                            287 .endm
                            288 
                            289 ;; Macro: ld__ixh_c
                            290 ;;    Opcode for "LD IXH, C" instruction
                            291 ;; 
                            292 .macro ld__ixh_c
                            293    .dw #0x61DD  ;; Opcode for ld ixh, c
                            294 .endm
                            295 
                            296 ;; Macro: ld__ixh_d
                            297 ;;    Opcode for "LD IXH, D" instruction
                            298 ;; 
                            299 .macro ld__ixh_d
                            300    .dw #0x62DD  ;; Opcode for ld ixh, d
                            301 .endm
                            302 
                            303 ;; Macro: ld__ixh_e
                            304 ;;    Opcode for "LD IXH, E" instruction
                            305 ;; 
                            306 .macro ld__ixh_e
                            307    .dw #0x63DD  ;; Opcode for ld ixh, e
                            308 .endm
                            309 
                            310 ;; Macro: ld__ixh_ixl
                            311 ;;    Opcode for "LD IXH, IXL" instruction
                            312 ;; 
                            313 .macro ld__ixh_ixl
                            314    .dw #0x65DD  ;; Opcode for ld ixh, ixl
                            315 .endm
                            316 
                            317 ;; Macro: ld__a_ixh
                            318 ;;    Opcode for "LD A, IXH" instruction
                            319 ;; 
                            320 .macro ld__a_ixh
                            321    .dw #0x7CDD  ;; Opcode for ld a, ixh
                            322 .endm
                            323 
                            324 ;; Macro: ld__b_ixh
                            325 ;;    Opcode for "LD B, IXH" instruction
                            326 ;; 
                            327 .macro ld__b_ixh
                            328    .dw #0x44DD  ;; Opcode for ld b, ixh
                            329 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 23.
Hexadecimal [16-Bits]



                            330 
                            331 ;; Macro: ld__c_ixh
                            332 ;;    Opcode for "LD c, IXH" instruction
                            333 ;; 
                            334 .macro ld__c_ixh
                            335    .dw #0x4CDD  ;; Opcode for ld c, ixh
                            336 .endm
                            337 
                            338 ;; Macro: ld__d_ixh
                            339 ;;    Opcode for "LD D, IXH" instruction
                            340 ;; 
                            341 .macro ld__d_ixh
                            342    .dw #0x54DD  ;; Opcode for ld d, ixh
                            343 .endm
                            344 
                            345 ;; Macro: ld__e_ixh
                            346 ;;    Opcode for "LD e, IXH" instruction
                            347 ;; 
                            348 .macro ld__e_ixh
                            349    .dw #0x5CDD  ;; Opcode for ld e, ixh
                            350 .endm
                            351 
                            352 ;; Macro: add__ixh
                            353 ;;    Opcode for "ADD IXH" instruction
                            354 ;; 
                            355 .macro add__ixh
                            356    .dw #0x84DD  ;; Opcode for add ixh
                            357 .endm
                            358 
                            359 ;; Macro: sub__ixh
                            360 ;;    Opcode for "SUB IXH" instruction
                            361 ;; 
                            362 .macro sub__ixh
                            363    .dw #0x94DD  ;; Opcode for sub ixh
                            364 .endm
                            365 
                            366 ;; Macro: adc__ixh
                            367 ;;    Opcode for "ADC IXH" instruction
                            368 ;; 
                            369 .macro adc__ixh
                            370    .dw #0x8CDD  ;; Opcode for adc ixh
                            371 .endm
                            372 
                            373 ;; Macro: sbc__ixh
                            374 ;;    Opcode for "SBC IXH" instruction
                            375 ;; 
                            376 .macro sbc__ixh
                            377    .dw #0x9CDD  ;; Opcode for sbc ixh
                            378 .endm
                            379 
                            380 ;; Macro: and__ixh
                            381 ;;    Opcode for "AND IXH" instruction
                            382 ;; 
                            383 .macro and__ixh
                            384    .dw #0xA4DD  ;; Opcode for and ixh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 24.
Hexadecimal [16-Bits]



                            385 .endm
                            386 
                            387 ;; Macro: or__ixh
                            388 ;;    Opcode for "OR IXH" instruction
                            389 ;; 
                            390 .macro or__ixh
                            391    .dw #0xB4DD  ;; Opcode for or ixh
                            392 .endm
                            393 
                            394 ;; Macro: xor__ixh
                            395 ;;    Opcode for "XOR IXH" instruction
                            396 ;; 
                            397 .macro xor__ixh
                            398    .dw #0xACDD  ;; Opcode for xor ixh
                            399 .endm
                            400 
                            401 ;; Macro: cp__ixh
                            402 ;;    Opcode for "CP IXH" instruction
                            403 ;; 
                            404 .macro cp__ixh
                            405    .dw #0xBCDD  ;; Opcode for cp ixh
                            406 .endm
                            407 
                            408 ;; Macro: dec__ixh
                            409 ;;    Opcode for "DEC IXH" instruction
                            410 ;; 
                            411 .macro dec__ixh
                            412    .dw #0x25DD  ;; Opcode for dec ixh
                            413 .endm
                            414 
                            415 ;; Macro: inc__ixh
                            416 ;;    Opcode for "INC IXH" instruction
                            417 ;; 
                            418 .macro inc__ixh
                            419    .dw #0x24DD  ;; Opcode for inc ixh
                            420 .endm
                            421 
                            422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            424 ;; IYL Related Macros
                            425 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            427 
                            428 ;; Macro: ld__iyl    Value
                            429 ;;    Opcode for "LD iyl, Value" instruction
                            430 ;;  
                            431 ;; Parameters:
                            432 ;;    Value - An inmediate 8-bits value that will be loaded into iyl
                            433 ;; 
                            434 .macro ld__iyl    Value 
                            435    .db #0xFD, #0x2E, Value  ;; Opcode for ld iyl, Value
                            436 .endm
                            437 
                            438 ;; Macro: ld__iyl_a
                            439 ;;    Opcode for "LD iyl, a" instruction
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 25.
Hexadecimal [16-Bits]



                            440 ;; 
                            441 .macro ld__iyl_a
                            442    .dw #0x6FFD  ;; Opcode for ld iyl, a
                            443 .endm
                            444 
                            445 ;; Macro: ld__iyl_b
                            446 ;;    Opcode for "LD iyl, B" instruction
                            447 ;; 
                            448 .macro ld__iyl_b
                            449    .dw #0x68FD  ;; Opcode for ld iyl, b
                            450 .endm
                            451 
                            452 ;; Macro: ld__iyl_c
                            453 ;;    Opcode for "LD iyl, C" instruction
                            454 ;; 
                            455 .macro ld__iyl_c
                            456    .dw #0x69FD  ;; Opcode for ld iyl, c
                            457 .endm
                            458 
                            459 ;; Macro: ld__iyl_d
                            460 ;;    Opcode for "LD iyl, D" instruction
                            461 ;; 
                            462 .macro ld__iyl_d
                            463    .dw #0x6AFD  ;; Opcode for ld iyl, d
                            464 .endm
                            465 
                            466 ;; Macro: ld__iyl_e
                            467 ;;    Opcode for "LD iyl, E" instruction
                            468 ;; 
                            469 .macro ld__iyl_e
                            470    .dw #0x6BFD  ;; Opcode for ld iyl, e
                            471 .endm
                            472 
                            473 ;; Macro: ld__iyl_iyh
                            474 ;;    Opcode for "LD iyl, IXL" instruction
                            475 ;; 
                            476 .macro ld__iyl_iyh
                            477    .dw #0x6CFD  ;; Opcode for ld iyl, ixl
                            478 .endm
                            479 
                            480 ;; Macro: ld__a_iyl
                            481 ;;    Opcode for "LD A, iyl" instruction
                            482 ;; 
                            483 .macro ld__a_iyl
                            484    .dw #0x7DFD  ;; Opcode for ld a, iyl
                            485 .endm
                            486 
                            487 ;; Macro: ld__b_iyl
                            488 ;;    Opcode for "LD B, iyl" instruction
                            489 ;; 
                            490 .macro ld__b_iyl
                            491    .dw #0x45FD  ;; Opcode for ld b, iyl
                            492 .endm
                            493 
                            494 ;; Macro: ld__c_iyl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 26.
Hexadecimal [16-Bits]



                            495 ;;    Opcode for "LD c, iyl" instruction
                            496 ;; 
                            497 .macro ld__c_iyl
                            498    .dw #0x4DFD  ;; Opcode for ld c, iyl
                            499 .endm
                            500 
                            501 ;; Macro: ld__d_iyl
                            502 ;;    Opcode for "LD D, iyl" instruction
                            503 ;; 
                            504 .macro ld__d_iyl
                            505    .dw #0x55FD  ;; Opcode for ld d, iyl
                            506 .endm
                            507 
                            508 ;; Macro: ld__e_iyl
                            509 ;;    Opcode for "LD e, iyl" instruction
                            510 ;; 
                            511 .macro ld__e_iyl
                            512    .dw #0x5DFD  ;; Opcode for ld e, iyl
                            513 .endm
                            514 
                            515 ;; Macro: add__iyl
                            516 ;;    Opcode for "Add iyl" instruction
                            517 ;; 
                            518 .macro add__iyl
                            519    .dw #0x85FD  ;; Opcode for add iyl
                            520 .endm
                            521 
                            522 ;; Macro: sub__iyl
                            523 ;;    Opcode for "SUB iyl" instruction
                            524 ;; 
                            525 .macro sub__iyl
                            526    .dw #0x95FD  ;; Opcode for sub iyl
                            527 .endm
                            528 
                            529 ;; Macro: adc__iyl
                            530 ;;    Opcode for "ADC iyl" instruction
                            531 ;; 
                            532 .macro adc__iyl
                            533    .dw #0x8DFD  ;; Opcode for adc iyl
                            534 .endm
                            535 
                            536 ;; Macro: sbc__iyl
                            537 ;;    Opcode for "SBC iyl" instruction
                            538 ;; 
                            539 .macro sbc__iyl
                            540    .dw #0x9DFD  ;; Opcode for sbc iyl
                            541 .endm
                            542 
                            543 ;; Macro: and__iyl
                            544 ;;    Opcode for "AND iyl" instruction
                            545 ;; 
                            546 .macro and__iyl
                            547    .dw #0xA5FD  ;; Opcode for and iyl
                            548 .endm
                            549 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 27.
Hexadecimal [16-Bits]



                            550 ;; Macro: or__iyl
                            551 ;;    Opcode for "OR iyl" instruction
                            552 ;; 
                            553 .macro or__iyl
                            554    .dw #0xB5FD  ;; Opcode for or iyl
                            555 .endm
                            556 
                            557 ;; Macro: xor__iyl
                            558 ;;    Opcode for "XOR iyl" instruction
                            559 ;; 
                            560 .macro xor__iyl
                            561    .dw #0xADFD  ;; Opcode for xor iyl
                            562 .endm
                            563 
                            564 ;; Macro: cp__iyl
                            565 ;;    Opcode for "CP iyl" instruction
                            566 ;; 
                            567 .macro cp__iyl
                            568    .dw #0xBDFD  ;; Opcode for cp iyl
                            569 .endm
                            570 
                            571 ;; Macro: dec__iyl
                            572 ;;    Opcode for "DEC iyl" instruction
                            573 ;; 
                            574 .macro dec__iyl
                            575    .dw #0x2DFD  ;; Opcode for dec iyl
                            576 .endm
                            577 
                            578 ;; Macro: inc__iyl
                            579 ;;    Opcode for "INC iyl" instruction
                            580 ;; 
                            581 .macro inc__iyl
                            582    .dw #0x2CFD  ;; Opcode for inc iyl
                            583 .endm
                            584 
                            585 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            587 ;; IYH Related Macros
                            588 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            589 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            590 
                            591 ;; Macro: ld__iyh    Value
                            592 ;;    Opcode for "LD iyh, Value" instruction
                            593 ;;  
                            594 ;; Parameters:
                            595 ;;    Value - An inmediate 8-bits value that will be loaded into iyh
                            596 ;; 
                            597 .macro ld__iyh    Value 
                            598    .db #0xFD, #0x26, Value  ;; Opcode for ld iyh, Value
                            599 .endm
                            600 
                            601 ;; Macro: ld__iyh_a
                            602 ;;    Opcode for "LD iyh, a" instruction
                            603 ;; 
                            604 .macro ld__iyh_a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 28.
Hexadecimal [16-Bits]



                            605    .dw #0x67FD  ;; Opcode for ld iyh, a
                            606 .endm
                            607 
                            608 ;; Macro: ld__iyh_b
                            609 ;;    Opcode for "LD iyh, B" instruction
                            610 ;; 
                            611 .macro ld__iyh_b
                            612    .dw #0x60FD  ;; Opcode for ld iyh, b
                            613 .endm
                            614 
                            615 ;; Macro: ld__iyh_c
                            616 ;;    Opcode for "LD iyh, C" instruction
                            617 ;; 
                            618 .macro ld__iyh_c
                            619    .dw #0x61FD  ;; Opcode for ld iyh, c
                            620 .endm
                            621 
                            622 ;; Macro: ld__iyh_d
                            623 ;;    Opcode for "LD iyh, D" instruction
                            624 ;; 
                            625 .macro ld__iyh_d
                            626    .dw #0x62FD  ;; Opcode for ld iyh, d
                            627 .endm
                            628 
                            629 ;; Macro: ld__iyh_e
                            630 ;;    Opcode for "LD iyh, E" instruction
                            631 ;; 
                            632 .macro ld__iyh_e
                            633    .dw #0x63FD  ;; Opcode for ld iyh, e
                            634 .endm
                            635 
                            636 ;; Macro: ld__iyh_iyl
                            637 ;;    Opcode for "LD iyh, IyL" instruction
                            638 ;; 
                            639 .macro ld__iyh_iyl
                            640    .dw #0x65FD  ;; Opcode for ld iyh, iyl
                            641 .endm
                            642 
                            643 ;; Macro: ld__a_iyh
                            644 ;;    Opcode for "LD A, iyh" instruction
                            645 ;; 
                            646 .macro ld__a_iyh
                            647    .dw #0x7CFD  ;; Opcode for ld a, iyh
                            648 .endm
                            649 
                            650 ;; Macro: ld__b_iyh
                            651 ;;    Opcode for "LD B, iyh" instruction
                            652 ;; 
                            653 .macro ld__b_iyh
                            654    .dw #0x44FD  ;; Opcode for ld b, iyh
                            655 .endm
                            656 
                            657 ;; Macro: ld__c_iyh
                            658 ;;    Opcode for "LD c, iyh" instruction
                            659 ;; 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 29.
Hexadecimal [16-Bits]



                            660 .macro ld__c_iyh
                            661    .dw #0x4CFD  ;; Opcode for ld c, iyh
                            662 .endm
                            663 
                            664 ;; Macro: ld__d_iyh
                            665 ;;    Opcode for "LD D, iyh" instruction
                            666 ;; 
                            667 .macro ld__d_iyh
                            668    .dw #0x54FD  ;; Opcode for ld d, iyh
                            669 .endm
                            670 
                            671 ;; Macro: ld__e_iyh
                            672 ;;    Opcode for "LD e, iyh" instruction
                            673 ;; 
                            674 .macro ld__e_iyh
                            675    .dw #0x5CFD  ;; Opcode for ld e, iyh
                            676 .endm
                            677 
                            678 ;; Macro: add__iyh
                            679 ;;    Opcode for "Add iyh" instruction
                            680 ;; 
                            681 .macro add__iyh
                            682    .dw #0x84FD  ;; Opcode for add iyh
                            683 .endm
                            684 
                            685 ;; Macro: sub__iyh
                            686 ;;    Opcode for "SUB iyh" instruction
                            687 ;; 
                            688 .macro sub__iyh
                            689    .dw #0x94FD  ;; Opcode for sub iyh
                            690 .endm
                            691 
                            692 ;; Macro: adc__iyh
                            693 ;;    Opcode for "ADC iyh" instruction
                            694 ;; 
                            695 .macro adc__iyh
                            696    .dw #0x8CFD  ;; Opcode for adc iyh
                            697 .endm
                            698 
                            699 ;; Macro: sbc__iyh
                            700 ;;    Opcode for "SBC iyh" instruction
                            701 ;; 
                            702 .macro sbc__iyh
                            703    .dw #0x9CFD  ;; Opcode for sbc iyh
                            704 .endm
                            705 
                            706 ;; Macro: and__iyh
                            707 ;;    Opcode for "AND iyh" instruction
                            708 ;; 
                            709 .macro and__iyh
                            710    .dw #0xA4FD  ;; Opcode for and iyh
                            711 .endm
                            712 
                            713 ;; Macro: or__iyh
                            714 ;;    Opcode for "OR iyh" instruction
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 30.
Hexadecimal [16-Bits]



                            715 ;; 
                            716 .macro or__iyh
                            717    .dw #0xB4FD  ;; Opcode for or iyh
                            718 .endm
                            719 
                            720 ;; Macro: xor__iyh
                            721 ;;    Opcode for "XOR iyh" instruction
                            722 ;; 
                            723 .macro xor__iyh
                            724    .dw #0xACFD  ;; Opcode for xor iyh
                            725 .endm
                            726 
                            727 ;; Macro: cp__iyh
                            728 ;;    Opcode for "CP iyh" instruction
                            729 ;; 
                            730 .macro cp__iyh
                            731    .dw #0xBCFD  ;; Opcode for cp iyh
                            732 .endm
                            733 
                            734 ;; Macro: dec__iyh
                            735 ;;    Opcode for "DEC iyh" instruction
                            736 ;; 
                            737 .macro dec__iyh
                            738    .dw #0x25FD  ;; Opcode for dec iyh
                            739 .endm
                            740 
                            741 ;; Macro: inc__iyh
                            742 ;;    Opcode for "INC iyh" instruction
                            743 ;; 
                            744 .macro inc__iyh
                            745    .dw #0x24FD  ;; Opcode for inc iyh
                            746 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 31.
Hexadecimal [16-Bits]



                             23 .include "macros/cpct_pushpop.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2020 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Push - Pop Macros
                             21 ;;
                             22 ;;    Useful macros to simplify push-pop save/restore operations
                             23 ;;
                             24 
                             25 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             26 ;; Macro: cpctm_push RO, R1, R2, R3, R4, R5
                             27 ;;
                             28 ;;    Pushes any given registers (up to 6) into the stack
                             29 ;;
                             30 ;; ASM Definition:
                             31 ;;    .macro <cpctm_push> R0, R1, R2, R3, R4, R5
                             32 ;;
                             33 ;; Parameters:
                             34 ;;    R0-R5 - Any number of 16-bit pushable registers, up to 6
                             35 ;;
                             36 ;; Details:
                             37 ;;    This macro converts the list of 16-bit registers given as parameters into a list
                             38 ;; of 'push' operations to push all of them into the stack. The registers are pushed
                             39 ;; into the stack in the same order as they are given in the parameter list.
                             40 ;;    The macro accepts any number of registers up to the maximum of 6 that are 
                             41 ;; predefined as parameters. However, you may use it with 1, 2, 3, 4 or 5 registers
                             42 ;; as parameters. There is no need to give the 6 parameters: only those given will 
                             43 ;; be considered.
                             44 ;;
                             45 ;; Modified Registers: 
                             46 ;;    none
                             47 ;;
                             48 ;; Required memory:
                             49 ;;    1 byte per register given (2 if they are IX or IY)
                             50 ;;
                             51 ;; Time Measures:
                             52 ;; (start code)
                             53 ;;  Case     | microSecs(us) | CPU Cycles
                             54 ;; ------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 32.
Hexadecimal [16-Bits]



                             55 ;;  Per Reg  |       4       |     16
                             56 ;; ------------------------------------
                             57 ;;  Per IX/IY|       5       |     20
                             58 ;; ------------------------------------
                             59 ;; (end code)
                             60 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             61 .macro cpctm_push r0, r1, r2, r3, r4, r5
                             62    .narg v
                             63    .if v
                             64    push r0
                             65    .if v-1
                             66    push r1
                             67    .if v-2
                             68    push r2
                             69    .if v-3
                             70    push r3
                             71    .if v-4
                             72    push r4
                             73    .if v-5
                             74    push r5
                             75    .else
                             76    .mexit
                             77    .endif
                             78    .else
                             79    .mexit
                             80    .endif
                             81    .else
                             82    .mexit
                             83    .endif
                             84    .else
                             85    .mexit
                             86    .endif
                             87    .else
                             88    .mexit
                             89    .endif
                             90    .else
                             91    .mexit
                             92    .endif
                             93 .endm
                             94 
                             95 
                             96 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             97 ;; Macro: cpctm_pop RO, R1, R2, R3, R4, R5
                             98 ;;
                             99 ;;    Pops any given registers (up to 6) from the stack
                            100 ;;
                            101 ;; ASM Definition:
                            102 ;;    .macro <cpctm_pop> R0, R1, R2, R3, R4, R5
                            103 ;;
                            104 ;; Parameters:
                            105 ;;    R0-R5 - Any number of 16-bit pushable/popable registers, up to 6
                            106 ;;
                            107 ;; Details:
                            108 ;;    This macro converts the list of 16-bit registers given as parameters into a list
                            109 ;; of 'pop' operations to pop all of them from the stack. The registers are poped
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 33.
Hexadecimal [16-Bits]



                            110 ;; in the same order as they are given in the parameter list.
                            111 ;;    The macro accepts any number of registers up to the maximum of 6 that are 
                            112 ;; predefined as parameters. However, you may use it with 1, 2, 3, 4 or 5 registers
                            113 ;; as parameters. There is no need to give the 6 parameters: only those given will 
                            114 ;; be considered.
                            115 ;;
                            116 ;; Modified Registers: 
                            117 ;;    R0, R1, R2, R3, R4, R5 (Those given as parameters are loaded from the stack)
                            118 ;;
                            119 ;; Required memory:
                            120 ;;    1 byte per register given (2 if they are IX or IY)
                            121 ;;
                            122 ;; Time Measures:
                            123 ;; (start code)
                            124 ;;  Case     | microSecs(us) | CPU Cycles
                            125 ;; ------------------------------------
                            126 ;;  Per Reg  |       3       |     12
                            127 ;; ------------------------------------
                            128 ;;  Per IX/IY|       5       |     20
                            129 ;; ------------------------------------
                            130 ;; (end code)
                            131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            132 .macro cpctm_pop r0, r1, r2, r3, r4, r5
                            133    .narg v
                            134    .if v
                            135    pop r0
                            136    .if v-1
                            137    pop r1
                            138    .if v-2
                            139    pop r2
                            140    .if v-3
                            141    pop r3
                            142    .if v-4
                            143    pop r4
                            144    .if v-5
                            145    pop r5
                            146    .else
                            147    .mexit
                            148    .endif
                            149    .else
                            150    .mexit
                            151    .endif
                            152    .else
                            153    .mexit
                            154    .endif
                            155    .else
                            156    .mexit
                            157    .endif
                            158    .else
                            159    .mexit
                            160    .endif
                            161    .else
                            162    .mexit
                            163    .endif
                            164 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 34.
Hexadecimal [16-Bits]



                             24 
                             25 ;;//////////////////////////////////////////////////////////////////////
                             26 ;; Group: General Useful Macros
                             27 ;;//////////////////////////////////////////////////////////////////////
                             28 
                             29 ;;
                             30 ;; Macro: cpctm_produceHalts_asm
                             31 ;;
                             32 ;;   Produce a set of consecutive halt instructions in order to wait for 
                             33 ;; a given number of interrupts.
                             34 ;;
                             35 ;; C Definition:
                             36 ;;   .macro <cpctm_produceHalts_asm> *N*
                             37 ;;
                             38 ;; Input Parameters:
                             39 ;;   (_) N - Number of consecutive halts to be produced
                             40 ;;
                             41 ;; Known issues:
                             42 ;;    * *N* must be a constant expression that can evaluate to a number
                             43 ;; at compile time.
                             44 ;;    * If the code generated by this macro is executed with interrupts
                             45 ;; being disabled, your CPU will effectively hang forever.
                             46 ;;    * This macro can only be used from assembler code. For C callings
                             47 ;; use <cpctm_produceHalts> instead.
                             48 ;;
                             49 ;; Size of generated code:
                             50 ;;    * *N* bytes (1 byte each halt instruction produced)
                             51 ;;
                             52 ;; Time Measures:
                             53 ;;    * Time depends on the exact moment of execution and the status of
                             54 ;; interrupts. *N* interrupts will pass.
                             55 ;;
                             56 ;; Details:
                             57 ;;    This macro produces a set of *N* consecutive *halt* assembly 
                             58 ;; instructions. Each *halt* instruction stops de Z80 CPU until 
                             59 ;; an interrupt is received. Therefore, this waits for *N* interrupts
                             60 ;; to be produced. This can be used for waiting or synchronization 
                             61 ;; purposes.
                             62 ;;
                             63 ;;    Please, take into account that this is a macro, and not a function.
                             64 ;; Each time this macro is used in your code it will produce the requested
                             65 ;; amount of halts. That can produce more code than you effectively need.
                             66 ;; For a unique function that controls a loop of *halt* waiting use
                             67 ;; <cpct_waitHalts> instead.
                             68 ;;
                             69 ;;
                             70 .macro cpctm_produceHalts N
                             71    .rept N
                             72       halt
                             73    .endm
                             74 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 35.
Hexadecimal [16-Bits]



                             21 .include "keyboard/keyboard.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 .module cpct_keyboard
                             19 
                             20 ;;
                             21 ;; Constant: Key Definitions (asm)
                             22 ;;
                             23 ;;    Definitions of the KeyCodes required by <cpct_isKeyPressed> 
                             24 ;; function for assembler programs. These are 16-bit values that define 
                             25 ;; matrix line in the keyboard layout (Most Significant Byte) and bit to
                             26 ;; be tested in that matrix line status for the given key (Least Significant
                             27 ;; byte). Each matrix line in the keyboard returns a byte containing the
                             28 ;; status of 8 keys, 1 bit each.
                             29 ;;
                             30 ;; CPCtelera include file:
                             31 ;;    _keyboard/keyboard.h.s_
                             32 ;;
                             33 ;; Keycode constant names:
                             34 ;; (start code)
                             35 ;;  KeyCode | Constant        || KeyCode | Constant      || KeyCode |  Constant
                             36 ;; -------------------------------------------------------------------------------
                             37 ;;   0x0100 | Key_CursorUp    ||  0x0803 | Key_P         ||  0x4006 |  Key_B
                             38 ;;          |                 ||         |               ||     ''  |  Joy1_Fire3
                             39 ;;   0x0200 | Key_CursorRight ||  0x1003 | Key_SemiColon ||  0x8006 |  Key_V
                             40 ;;   0x0400 | Key_CursorDown  ||  0x2003 | Key_Colon     ||  0x0107 |  Key_4
                             41 ;;   0x0800 | Key_F9          ||  0x4003 | Key_Slash     ||  0x0207 |  Key_3
                             42 ;;   0x1000 | Key_F6          ||  0x8003 | Key_Dot       ||  0x0407 |  Key_E
                             43 ;;   0x2000 | Key_F3          ||  0x0104 | Key_0         ||  0x0807 |  Key_W
                             44 ;;   0x4000 | Key_Enter       ||  0x0204 | Key_9         ||  0x1007 |  Key_S
                             45 ;;   0x8000 | Key_FDot        ||  0x0404 | Key_O         ||  0x2007 |  Key_D
                             46 ;;   0x0101 | Key_CursorLeft  ||  0x0804 | Key_I         ||  0x4007 |  Key_C
                             47 ;;   0x0201 | Key_Copy        ||  0x1004 | Key_L         ||  0x8007 |  Key_X
                             48 ;;   0x0401 | Key_F7          ||  0x2004 | Key_K         ||  0x0108 |  Key_1
                             49 ;;   0x0801 | Key_F8          ||  0x4004 | Key_M         ||  0x0208 |  Key_2
                             50 ;;   0x1001 | Key_F5          ||  0x8004 | Key_Comma     ||  0x0408 |  Key_Esc
                             51 ;;   0x2001 | Key_F1          ||  0x0105 | Key_8         ||  0x0808 |  Key_Q
                             52 ;;   0x4001 | Key_F2          ||  0x0205 | Key_7         ||  0x1008 |  Key_Tab
                             53 ;;   0x8001 | Key_F0          ||  0x0405 | Key_U         ||  0x2008 |  Key_A
                             54 ;;   0x0102 | Key_Clr         ||  0x0805 | Key_Y         ||  0x4008 |  Key_CapsLock
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 36.
Hexadecimal [16-Bits]



                             55 ;;   0x0202 | Key_OpenBracket ||  0x1005 | Key_H         ||  0x8008 |  Key_Z
                             56 ;;   0x0402 | Key_Return      ||  0x2005 | Key_J         ||  0x0109 |  Joy0_Up
                             57 ;;   0x0802 | Key_CloseBracket||  0x4005 | Key_N         ||  0x0209 |  Joy0_Down
                             58 ;;   0x1002 | Key_F4          ||  0x8005 | Key_Space     ||  0x0409 |  Joy0_Left
                             59 ;;   0x2002 | Key_Shift       ||  0x0106 | Key_6         ||  0x0809 |  Joy0_Right
                             60 ;;          |                 ||     ''  | Joy1_Up       ||         |
                             61 ;;   0x4002 | Key_BackSlash   ||  0x0206 | Key_5         ||  0x1009 |  Joy0_Fire1
                             62 ;;          |                 ||     ''  | Joy1_Down     ||         |
                             63 ;;   0x8002 | Key_Control     ||  0x0406 | Key_R         ||  0x2009 |  Joy0_Fire2
                             64 ;;          |                 ||     ''  | Joy1_Left     ||         |
                             65 ;;   0x0103 | Key_Caret       ||  0x0806 | Key_T         ||  0x4009 |  Joy0_Fire3
                             66 ;;          |                 ||     ''  | Joy1 Right    ||
                             67 ;;   0x0203 | Key_Hyphen      ||  0x1006 | Key_G         ||  0x8009 |  Key_Del
                             68 ;;          |                 ||     ''  | Joy1_Fire1    ||
                             69 ;;   0x0403 | Key_At          ||  0x2006 | Key_F         ||
                             70 ;;          |                 ||     ''  | Joy1_Fire2    ||
                             71 ;; -------------------------------------------------------------------------------
                             72 ;;  Table 1. KeyCodes defined for each possible key, ordered by KeyCode
                             73 ;; (end)
                             74 ;;
                             75 
                             76 ;; Matrix Line 0x00
                     0100    77 Key_CursorUp     = #0x0100  ;; Bit 0 (01h) => | 0000 0001 |
                     0200    78 Key_CursorRight  = #0x0200  ;; Bit 1 (02h) => | 0000 0010 |
                     0400    79 Key_CursorDown   = #0x0400  ;; Bit 2 (04h) => | 0000 0100 |
                     0800    80 Key_F9           = #0x0800  ;; Bit 3 (08h) => | 0000 1000 |
                     1000    81 Key_F6           = #0x1000  ;; Bit 4 (10h) => | 0001 0000 |
                     2000    82 Key_F3           = #0x2000  ;; Bit 5 (20h) => | 0010 0000 |
                     4000    83 Key_Enter        = #0x4000  ;; Bit 6 (40h) => | 0100 0000 |
                     8000    84 Key_FDot         = #0x8000  ;; Bit 7 (80h) => | 1000 0000 |
                             85 ;; Matrix Line 0x01
                     0101    86 Key_CursorLeft   = #0x0101
                     0201    87 Key_Copy         = #0x0201
                     0401    88 Key_F7           = #0x0401
                     0801    89 Key_F8           = #0x0801
                     1001    90 Key_F5           = #0x1001
                     2001    91 Key_F1           = #0x2001
                     4001    92 Key_F2           = #0x4001
                     8001    93 Key_F0           = #0x8001
                             94 ;; Matrix Line 0x02
                     0102    95 Key_Clr          = #0x0102
                     0202    96 Key_OpenBracket  = #0x0202
                     0402    97 Key_Return       = #0x0402
                     0802    98 Key_CloseBracket = #0x0802
                     1002    99 Key_F4           = #0x1002
                     2002   100 Key_Shift        = #0x2002
                     4002   101 Key_BackSlash    = #0x4002
                     8002   102 Key_Control      = #0x8002
                            103 ;; Matrix Line 0x03
                     0103   104 Key_Caret        = #0x0103
                     0203   105 Key_Hyphen       = #0x0203
                     0403   106 Key_At           = #0x0403
                     0803   107 Key_P            = #0x0803
                     1003   108 Key_SemiColon    = #0x1003
                     2003   109 Key_Colon        = #0x2003
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 37.
Hexadecimal [16-Bits]



                     4003   110 Key_Slash        = #0x4003
                     8003   111 Key_Dot          = #0x8003
                            112 ;; Matrix Line 0x04
                     0104   113 Key_0            = #0x0104
                     0204   114 Key_9            = #0x0204
                     0404   115 Key_O            = #0x0404
                     0804   116 Key_I            = #0x0804
                     1004   117 Key_L            = #0x1004
                     2004   118 Key_K            = #0x2004
                     4004   119 Key_M            = #0x4004
                     8004   120 Key_Comma        = #0x8004
                            121 ;; Matrix Line 0x05
                     0105   122 Key_8            = #0x0105
                     0205   123 Key_7            = #0x0205
                     0405   124 Key_U            = #0x0405
                     0805   125 Key_Y            = #0x0805
                     1005   126 Key_H            = #0x1005
                     2005   127 Key_J            = #0x2005
                     4005   128 Key_N            = #0x4005
                     8005   129 Key_Space        = #0x8005
                            130 ;; Matrix Line 0x06
                     0106   131 Key_6            = #0x0106
                     0106   132 Joy1_Up          = #0x0106
                     0206   133 Key_5            = #0x0206
                     0206   134 Joy1_Down        = #0x0206
                     0406   135 Key_R            = #0x0406
                     0406   136 Joy1_Left        = #0x0406
                     0806   137 Key_T            = #0x0806
                     0806   138 Joy1_Right       = #0x0806
                     1006   139 Key_G            = #0x1006
                     1006   140 Joy1_Fire1       = #0x1006
                     2006   141 Key_F            = #0x2006
                     2006   142 Joy1_Fire2       = #0x2006
                     4006   143 Key_B            = #0x4006
                     4006   144 Joy1_Fire3       = #0x4006
                     8006   145 Key_V            = #0x8006
                            146 ;; Matrix Line 0x07
                     0107   147 Key_4            = #0x0107
                     0207   148 Key_3            = #0x0207
                     0407   149 Key_E            = #0x0407
                     0807   150 Key_W            = #0x0807
                     1007   151 Key_S            = #0x1007
                     2007   152 Key_D            = #0x2007
                     4007   153 Key_C            = #0x4007
                     8007   154 Key_X            = #0x8007
                            155 ;; Matrix Line 0x08
                     0108   156 Key_1            = #0x0108
                     0208   157 Key_2            = #0x0208
                     0408   158 Key_Esc          = #0x0408
                     0808   159 Key_Q            = #0x0808
                     1008   160 Key_Tab          = #0x1008
                     2008   161 Key_A            = #0x2008
                     4008   162 Key_CapsLock     = #0x4008
                     8008   163 Key_Z            = #0x8008
                            164 ;; Matrix Line 0x09
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 38.
Hexadecimal [16-Bits]



                     0109   165 Joy0_Up          = #0x0109
                     0209   166 Joy0_Down        = #0x0209
                     0409   167 Joy0_Left        = #0x0409
                     0809   168 Joy0_Right       = #0x0809
                     1009   169 Joy0_Fire1       = #0x1009
                     2009   170 Joy0_Fire2       = #0x2009
                     4009   171 Joy0_Fire3       = #0x4009
                     8009   172 Key_Del          = #0x8009
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 39.
Hexadecimal [16-Bits]



                             22 .include "video/videomode.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 .module cpct_video
                             19    
                             20 ;;
                             21 ;; Includes
                             22 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 40.
Hexadecimal [16-Bits]



                             23 .include "video/video_macros.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;//////////////////////////////////////////////////////////////////////
                             20 ;;//////////////////////////////////////////////////////////////////////
                             21 ;; File: Macros (asm)
                             22 ;;//////////////////////////////////////////////////////////////////////
                             23 ;;//////////////////////////////////////////////////////////////////////
                             24 
                             25 ;;//////////////////////////////////////////////////////////////////////
                             26 ;; Group: Video memory manipulation
                             27 ;;//////////////////////////////////////////////////////////////////////
                             28 
                             29 ;;
                             30 ;; Constant: CPCT_VMEM_START_ASM
                             31 ;;
                             32 ;;    The address where screen video memory starts by default in the Amstrad CPC.
                             33 ;;
                             34 ;;    This address is exactly 0xC000, and this macro represents this number but
                             35 ;; automatically converted to <u8>* (Pointer to unsigned byte). You can use this
                             36 ;; macro for any function requiring the start of video memory, like 
                             37 ;; <cpct_getScreenPtr>.
                             38 ;;
                     C000    39 CPCT_VMEM_START_ASM = 0xC000
                             40 
                             41 ;;
                             42 ;; Constants: Video Memory Pages
                             43 ;;
                             44 ;; Useful constants defining some typical Video Memory Pages to be used as 
                             45 ;; parameters for <cpct_setVideoMemoryPage>
                             46 ;;
                             47 ;; cpct_pageCO - Video Memory Page 0xC0 (0xC0··)
                             48 ;; cpct_page8O - Video Memory Page 0x80 (0x80··)
                             49 ;; cpct_page4O - Video Memory Page 0x40 (0x40··)
                             50 ;; cpct_page0O - Video Memory Page 0x00 (0x00··)
                             51 ;;
                     0030    52 cpct_pageC0_asm = 0x30
                     0020    53 cpct_page80_asm = 0x20
                     0010    54 cpct_page40_asm = 0x10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 41.
Hexadecimal [16-Bits]



                     0000    55 cpct_page00_asm = 0x00
                             56 
                             57 ;;
                             58 ;; Macro: cpctm_memPage6_asm
                             59 ;;
                             60 ;;    Macro that encodes a video memory page in the 6 Least Significant bits (LSb)
                             61 ;; of a byte, required as parameter for <cpct_setVideoMemoryPage>. It loads resulting
                             62 ;; value into a given 8-bits register.
                             63 ;;
                             64 ;; ASM Definition:
                             65 ;; .macro <cpct_memPage6_asm> *REG8*, *PAGE*
                             66 ;;
                             67 ;; Parameters (1 byte):
                             68 ;; (__) REG8 - 8bits register where result will be loaded
                             69 ;; (1B) PAGE - Video memory page wanted 
                             70 ;;
                             71 ;; Known issues:
                             72 ;;   * This macro can only be used from assembler code. It is not accessible from 
                             73 ;; C scope. For C programs, please refer to <cpct_memPage6>
                             74 ;;   * This macro will work *only* with constant values, as its value needs to
                             75 ;; be calculated in compilation time. If fed with variable values, it will give 
                             76 ;; an assembler error.
                             77 ;;
                             78 ;; Destroyed Registers:
                             79 ;;    REG8
                             80 ;;
                             81 ;; Size of generated code:
                             82 ;;    2 bytes 
                             83 ;;
                             84 ;; Time Measures:
                             85 ;;    * 2 microseconds
                             86 ;;    * 8 CPU Cycles
                             87 ;;
                             88 ;; Details:
                             89 ;;  This is just a macro that shifts *PAGE* 2 bits to the right, to leave it
                             90 ;; with just 6 significant bits. For more information, check functions
                             91 ;; <cpct_setVideoMemoryPage> and <cpct_setVideoMemoryOffset>.
                             92 ;;
                             93 .macro cpctm_memPage6_asm REG8, PAGE 
                             94    ld REG8, #PAGE / 4      ;; [2] REG8 = PAGE/4
                             95 .endm
                             96 
                             97 ;;
                             98 ;; Macro: cpctm_screenPtr_asm
                             99 ;;
                            100 ;;    Macro that calculates the video memory location (byte pointer) of a 
                            101 ;; given pair of coordinates (*X*, *Y*). Value resulting from calculation 
                            102 ;; will be loaded into a 16-bits register.
                            103 ;;
                            104 ;; ASM Definition:
                            105 ;;    .macro <cpctm_screenPtr_asm> *REG16*, *VMEM*, *X*, *Y*
                            106 ;;
                            107 ;; Parameters:
                            108 ;;    (__) REG16 - 16-bits register where the resulting value will be loaded
                            109 ;;    (2B) VMEM  - Start of video memory buffer where (*X*, *Y*) coordinates will be calculated
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 42.
Hexadecimal [16-Bits]



                            110 ;;    (1B) X     - X Coordinate of the video memory location *in bytes* (*BEWARE! NOT in pixels!*)
                            111 ;;    (1B) Y     - Y Coordinate of the video memory location in pixels / bytes (they are same amount)
                            112 ;;
                            113 ;; Parameter Restrictions:
                            114 ;;    * *REG16* has to be a 16-bits register that can perform ld REG16, #value.
                            115 ;;    * *VMEM* will normally be the start of the video memory buffer where you want to 
                            116 ;; draw something. It could theoretically be any 16-bits value. 
                            117 ;;    * *X* must be in the range [0-79] for normal screen sizes (modes 0,1,2). Screen is
                            118 ;; always 80 bytes wide in these modes and this function is byte-aligned, so you have to 
                            119 ;; give it a byte coordinate (*NOT a pixel one!*).
                            120 ;;    * *Y* must be in the range [0-199] for normal screen sizes (modes 0,1,2). Screen is 
                            121 ;; always 200 pixels high in these modes. Pixels and bytes always coincide in vertical
                            122 ;; resolution, so this coordinate is the same in bytes that in pixels.
                            123 ;;    * If you give incorrect values to this function, the returned pointer could
                            124 ;; point anywhere in memory. This function will not cause any damage by itself, 
                            125 ;; but you may destroy important parts of your memory if you use its result to 
                            126 ;; write to memory, and you gave incorrect parameters by mistake. Take always
                            127 ;; care.
                            128 ;;
                            129 ;; Known issues:
                            130 ;;   * This macro can only be used from assembler code. It is not accessible from 
                            131 ;; C scope. For C programs, please refer to <cpct_getScreenPtr>
                            132 ;;   * This macro will work *only* with constant values, as calculations need to be 
                            133 ;; performed at assembler time.
                            134 ;;
                            135 ;; Destroyed Registers:
                            136 ;;    REG16
                            137 ;;
                            138 ;; Size of generated code:
                            139 ;;    3 bytes 
                            140 ;;
                            141 ;; Time Measures:
                            142 ;;    * 3 microseconds
                            143 ;;    * 12 CPU Cycles
                            144 ;;
                            145 ;; Details:
                            146 ;;    This macro does the same calculation than the function <cpct_getScreenPtr>. However,
                            147 ;; as it is a macro, if all 3 parameters (*VMEM*, *X*, *Y*) are constants, the calculation
                            148 ;; will be done at compile-time. This will free the binary from code or data, just putting in
                            149 ;; the result of this calculation (2 bytes with the resulting address). It is highly 
                            150 ;; recommended to use this macro instead of the function <cpct_getScreenPtr> when values
                            151 ;; involved are all constant. 
                            152 ;;
                            153 ;; Recommendations:
                            154 ;;    All constant values - Use this macro <cpctm_screenPtr_asm>
                            155 ;;    Any variable value  - Use the function <cpct_getScreenPtr>
                            156 ;;
                            157 .macro cpctm_screenPtr_asm REG16, VMEM, X, Y 
                            158    ld REG16, #VMEM + 80 * (Y / 8) + 2048 * (Y & 7) + X   ;; [3] REG16 = screenPtr
                            159 .endm
                            160 
                            161 ;;
                            162 ;; Macro: cpctm_setCRTCReg
                            163 ;;
                            164 ;;    Macro that sets a new value for a given CRTC register.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 43.
Hexadecimal [16-Bits]



                            165 ;;
                            166 ;; ASM Definition:
                            167 ;;    .macro <cpctm_setCRTCReg> *HEXREG*, *HEXVAL*
                            168 ;;
                            169 ;; Parameters:
                            170 ;;    (1B) HEXREG - New value to be set for the register (in hexadecimal)
                            171 ;;    (1B) HEXVAL - Number of the register to be set (in hexadecimal)
                            172 ;;
                            173 ;; Parameter Restrictions:
                            174 ;;    * *HEXREG* has to be an hexadecimal value from 00 to 1F
                            175 ;;    * *HEXVAL* has to be an hexadecimal value. Its valid range will depend
                            176 ;;          upon the selected register that will be modified. 
                            177 ;;
                            178 ;; Known issues:
                            179 ;;   * This macro can *only* be used from assembler code. It is not accessible from 
                            180 ;; C scope. 
                            181 ;;   * This macro can only be used with *constant values*. As given values are 
                            182 ;; concatenated with a number, they must also be hexadecimal numbers. If a 
                            183 ;; register or other value is given, this macro will not work.
                            184 ;;   * Using values out of range have unpredicted behaviour and can even 
                            185 ;; potentially cause damage to real Amstrad CPC monitors. Please, use with care.
                            186 ;;
                            187 ;; Destroyed Registers:
                            188 ;;    BC
                            189 ;;
                            190 ;; Size of generated code:
                            191 ;;    10 bytes 
                            192 ;;
                            193 ;; Time Measures:
                            194 ;;    * 14 microseconds
                            195 ;;    * 56 CPU Cycles
                            196 ;;
                            197 ;; Details:
                            198 ;;    This macro expands to two CRTC commands: Register selection and Register setting.
                            199 ;; It selects the register given as first parameter, then sets its new value to 
                            200 ;; that given as second parameter. Both given parameters must be of exactly 1 byte
                            201 ;; in size and the have to be provided in hexadecimal. This is due to the way
                            202 ;; that macro expansion and concatenation works. Given values will be concatenated
                            203 ;; with another 8-bit hexadecimal value to form a unique 16-bits hexadecimal value.
                            204 ;; Therefore, any parameter given will always be considered hexadecimal.
                            205 ;;
                            206 .macro cpctm_setCRTCReg_asm HEXREG, HEXVAL
                            207    ld    bc, #0xBC'HEXREG  ;; [3] B=0xBC CRTC Select Register, C=register number to be selected
                            208    out  (c), c             ;; [4] Select register
                            209    ld    bc, #0xBD'HEXVAL  ;; [3] B=0xBD CRTC Set Register, C=Value to be set
                            210    out  (c), c             ;; [4] Set the value
                            211 .endm
                            212 
                            213 ;;//////////////////////////////////////////////////////////////////////
                            214 ;; Group: Setting the border
                            215 ;;//////////////////////////////////////////////////////////////////////
                            216 
                            217 ;;
                            218 ;; Macro: cpctm_setBorder_asm
                            219 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 44.
Hexadecimal [16-Bits]



                            220 ;;   Changes the colour of the screen border.
                            221 ;;
                            222 ;; ASM Definition:
                            223 ;;   .macro <cpctm_setBorder_asm> HWC 
                            224 ;;
                            225 ;; Input Parameters (1 Byte):
                            226 ;;   (1B) HWC - Hardware colour value for the screen border in *hexadecimal [00-1B]*.
                            227 ;;
                            228 ;; Known issues:
                            229 ;;   * *Beware!* *HWC* colour value must be given in *hexadecimal*, as it is
                            230 ;; substituted in place, and must be in the range [00-1B].
                            231 ;;   * This macro can only be used from assembler code. It is not accessible from 
                            232 ;; C scope. For C programs, please refer to <cpct_setBorder>
                            233 ;;   * This macro will work *only* with constant values, as calculations need to be 
                            234 ;; performed at assembler time.
                            235 ;;
                            236 ;; Destroyed Registers:
                            237 ;;    AF, B, HL
                            238 ;;
                            239 ;; Size of generated code:
                            240 ;;    * 16 bytes 
                            241 ;;     6b - generated code
                            242 ;;    10b - cpct_setPALColour_asm code
                            243 ;;
                            244 ;; Time Measures:
                            245 ;;    * 28 microseconds
                            246 ;;    * 112 CPU Cycles
                            247 ;;
                            248 ;; Details:
                            249 ;;   This is not a real function, but an assembler macro. Beware of using it along
                            250 ;; with complex expressions or calculations, as it may expand in non-desired
                            251 ;; ways.
                            252 ;;
                            253 ;;   For more information, check the real function <cpct_setPALColour>, which
                            254 ;; is called when using <cpctm_setBorder_asm> (It is called using 16 as *pen*
                            255 ;; argument, which identifies the border).
                            256 ;;
                            257 .macro cpctm_setBorder_asm HWC
                            258    .radix h
                            259    cpctm_setBorder_raw_asm \HWC ;; [28] Macro that does the job, but requires a number value to be passed
                            260    .radix d
                            261 .endm
                            262 .macro cpctm_setBorder_raw_asm HWC
                            263    .globl cpct_setPALColour_asm
                            264    ld   hl, #0x'HWC'10         ;; [3]  H=Hardware value of desired colour, L=Border INK (16)
                            265    call cpct_setPALColour_asm  ;; [25] Set Palette colour of the border
                            266 .endm
                            267 
                            268 ;;//////////////////////////////////////////////////////////////////////
                            269 ;; Group: Screen clearing
                            270 ;;//////////////////////////////////////////////////////////////////////
                            271 
                            272 ;;
                            273 ;; Macro: cpctm_clearScreen_asm
                            274 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 45.
Hexadecimal [16-Bits]



                            275 ;;    Macro to simplify clearing the screen.
                            276 ;;
                            277 ;; ASM Definition:
                            278 ;;   .macro <cpct_clearScreen_asm> COL
                            279 ;;
                            280 ;; Input Parameters (1 byte):
                            281 ;;   (1B) COL - Colour pattern to be used for screen clearing. 
                            282 ;;
                            283 ;; Parameters:
                            284 ;;    *COL* - Any 8-bits value or the A register are valid. Typically, a 0x00 is used 
                            285 ;; to fill up all the screen with 0's (firmware colour 0). However, you may use it in 
                            286 ;; combination with <cpct_px2byteM0>, <cpct_px2byteM1> or a manually created colour pattern.
                            287 ;;
                            288 ;; Known issues:
                            289 ;;   * This macro can only be used from assembler code. It is not accessible from 
                            290 ;; C scope. For C programs, please refer to <cpct_clearScreen>
                            291 ;;
                            292 ;; Details:
                            293 ;;   Fills up all the standard screen (range [0xC000-0xFFFF]) with *COL* byte, the colour 
                            294 ;; pattern given.
                            295 ;;
                            296 ;; Destroyed Registers:
                            297 ;;    BC, DE, HL
                            298 ;;
                            299 ;; Size of generated code:
                            300 ;;    13 bytes 
                            301 ;;
                            302 ;; Time Measures:
                            303 ;;    98309 microseconds (*4.924 VSYNCs* on a 50Hz display).
                            304 ;;    393236 CPU Cycles 
                            305 ;;
                            306 .macro cpctm_clearScreen_asm COL
                            307    ld    hl, #0xC000    ;; [3] HL Points to Start of Video Memory
                            308    ld    de, #0xC001    ;; [3] DE Points to the next byte
                            309    ld    bc, #0x4000    ;; [3] BC = 16384 bytes to be copied
                            310    ld   (hl), #COL      ;; [3] First Byte = given Colour
                            311    ldir                 ;; [98297] Perform the copy
                            312 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 46.
Hexadecimal [16-Bits]



                             24 .include "video/colours.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;//////////////////////////////////////////////////////////////////////
                             20 ;;//////////////////////////////////////////////////////////////////////
                             21 ;; File: Colours (asm)
                             22 ;;//////////////////////////////////////////////////////////////////////
                             23 ;;//////////////////////////////////////////////////////////////////////
                             24 ;;
                             25 ;;    Constants and utilities to manage the 27 colours from
                             26 ;; the CPC Palette comfortably in assembler.
                             27 ;;
                             28 ;;
                             29 
                             30 ;; Constant: Firmware colour values
                             31 ;;
                             32 ;;    Enumerates all 27 firmware colours for assembler programs
                             33 ;;
                             34 ;; Values:
                             35 ;; (start code)
                             36 ;;   [=================================================]
                             37 ;;   | Identifier        | Val| Identifier        | Val|
                             38 ;;   |-------------------------------------------------|
                             39 ;;   | FW_BLACK          |  0 | FW_BLUE           |  1 |
                             40 ;;   | FW_BRIGHT_BLUE    |  2 | FW_RED            |  3 |
                             41 ;;   | FW_MAGENTA        |  4 | FW_MAUVE          |  5 |
                             42 ;;   | FW_BRIGHT_RED     |  6 | FW_PURPLE         |  7 |
                             43 ;;   | FW_BRIGHT_MAGENTA |  8 | FW_GREEN          |  9 |
                             44 ;;   | FW_CYAN           | 10 | FW_SKY_BLUE       | 11 |
                             45 ;;   | FW_YELLOW         | 12 | FW_WHITE          | 13 |
                             46 ;;   | FW_PASTEL_BLUE    | 14 | FW_ORANGE         | 15 |
                             47 ;;   | FW_PINK           | 16 | FW_PASTEL_MAGENTA | 17 |
                             48 ;;   | FW_BRIGHT_GREEN   | 18 | FW_SEA_GREEN      | 19 |
                             49 ;;   | FW_BRIGHT_CYAN    | 20 | FW_LIME           | 21 |
                             50 ;;   | FW_PASTEL_GREEN   | 22 | FW_PASTEL_CYAN    | 23 |
                             51 ;;   | FW_BRIGHT_YELLOW  | 24 | FW_PASTEL_YELLOW  | 25 |
                             52 ;;   | FW_BRIGHT_WHITE   | 26 |                   |    |
                             53 ;;   [=================================================]
                             54 ;; (end code)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 47.
Hexadecimal [16-Bits]



                             55 
                     0000    56 FW_BLACK          =  0
                     0001    57 FW_BLUE           =  1
                     0002    58 FW_BRIGHT_BLUE    =  2
                     0003    59 FW_RED            =  3
                     0004    60 FW_MAGENTA        =  4
                     0005    61 FW_MAUVE          =  5
                     0006    62 FW_BRIGHT_RED     =  6
                     0007    63 FW_PURPLE         =  7
                     0008    64 FW_BRIGHT_MAGENTA =  8
                     0009    65 FW_GREEN          =  9
                     000A    66 FW_CYAN           = 10
                     000B    67 FW_SKY_BLUE       = 11
                     000C    68 FW_YELLOW         = 12
                     000D    69 FW_WHITE          = 13
                     000E    70 FW_PASTEL_BLUE    = 14
                     000F    71 FW_ORANGE         = 15
                     0010    72 FW_PINK           = 16
                     0011    73 FW_PASTEL_MAGENTA = 17
                     0012    74 FW_BRIGHT_GREEN   = 18
                     0013    75 FW_SEA_GREEN      = 19
                     0014    76 FW_BRIGHT_CYAN    = 20
                     0015    77 FW_LIME           = 21
                     0016    78 FW_PASTEL_GREEN   = 22
                     0017    79 FW_PASTEL_CYAN    = 23
                     0018    80 FW_BRIGHT_YELLOW  = 24
                     0019    81 FW_PASTEL_YELLOW  = 25
                     001A    82 FW_BRIGHT_WHITE   = 26
                             83 
                             84 ;; Constant: Hardware colour values
                             85 ;;
                             86 ;;    Enumerates all 27 hardware colours for assembler programs
                             87 ;;
                             88 ;; Values:
                             89 ;; (start code)
                             90 ;;   [=====================================================]
                             91 ;;   | Identifier        | Value| Identifier        | Value|
                             92 ;;   |-----------------------------------------------------|
                             93 ;;   | HW_BLACK          | 0x14 | HW_BLUE           | 0x04 |
                             94 ;;   | HW_BRIGHT_BLUE    | 0x15 | HW_RED            | 0x1C |
                             95 ;;   | HW_MAGENTA        | 0x18 | HW_MAUVE          | 0x1D |
                             96 ;;   | HW_BRIGHT_RED     | 0x0C | HW_PURPLE         | 0x05 |
                             97 ;;   | HW_BRIGHT_MAGENTA | 0x0D | HW_GREEN          | 0x16 |
                             98 ;;   | HW_CYAN           | 0x06 | HW_SKY_BLUE       | 0x17 |
                             99 ;;   | HW_YELLOW         | 0x1E | HW_WHITE          | 0x00 |
                            100 ;;   | HW_PASTEL_BLUE    | 0x1F | HW_ORANGE         | 0x0E |
                            101 ;;   | HW_PINK           | 0x07 | HW_PASTEL_MAGENTA | 0x0F |
                            102 ;;   | HW_BRIGHT_GREEN   | 0x12 | HW_SEA_GREEN      | 0x02 |
                            103 ;;   | HW_BRIGHT_CYAN    | 0x13 | HW_LIME           | 0x1A |
                            104 ;;   | HW_PASTEL_GREEN   | 0x19 | HW_PASTEL_CYAN    | 0x1B |
                            105 ;;   | HW_BRIGHT_YELLOW  | 0x0A | HW_PASTEL_YELLOW  | 0x03 |
                            106 ;;   | HW_BRIGHT_WHITE   | 0x0B |                   |      |
                            107 ;;   [=====================================================]
                            108 ;; (end code)
                            109 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 48.
Hexadecimal [16-Bits]



                     0014   110 HW_BLACK          = 0x14
                     0004   111 HW_BLUE           = 0x04
                     0015   112 HW_BRIGHT_BLUE    = 0x15
                     001C   113 HW_RED            = 0x1C
                     0018   114 HW_MAGENTA        = 0x18
                     001D   115 HW_MAUVE          = 0x1D
                     000C   116 HW_BRIGHT_RED     = 0x0C
                     0005   117 HW_PURPLE         = 0x05
                     000D   118 HW_BRIGHT_MAGENTA = 0x0D
                     0016   119 HW_GREEN          = 0x16
                     0006   120 HW_CYAN           = 0x06
                     0017   121 HW_SKY_BLUE       = 0x17
                     001E   122 HW_YELLOW         = 0x1E
                     0000   123 HW_WHITE          = 0x00
                     001F   124 HW_PASTEL_BLUE    = 0x1F
                     000E   125 HW_ORANGE         = 0x0E
                     0007   126 HW_PINK           = 0x07
                     000F   127 HW_PASTEL_MAGENTA = 0x0F
                     0012   128 HW_BRIGHT_GREEN   = 0x12
                     0002   129 HW_SEA_GREEN      = 0x02
                     0013   130 HW_BRIGHT_CYAN    = 0x13
                     001A   131 HW_LIME           = 0x1A
                     0019   132 HW_PASTEL_GREEN   = 0x19
                     001B   133 HW_PASTEL_CYAN    = 0x1B
                     000A   134 HW_BRIGHT_YELLOW  = 0x0A
                     0003   135 HW_PASTEL_YELLOW  = 0x03
                     000B   136 HW_BRIGHT_WHITE   = 0x0B
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 49.
Hexadecimal [16-Bits]



                             25 
                             26 ;;
                             27 ;; Constant values
                             28 ;;
                     7F00    29 GA_port        = 0x7F00  ;; 16-bit Port of the Gate Array (for the use with BC register)
                     007F    30 GA_port_byte   = 0x7F    ;; 8-bit Port of the Gate Array
                     0000    31 PAL_PENR       = 0x00    ;; Command to select a PEN register in the PAL chip
                     0040    32 PAL_INKR       = 0x40    ;; Command to set the INK of a previously selected PEN register in the PAL chip
                     00F5    33 PPI_PORT_B     = 0xF5    ;; Port B of the PPI, used to read Vsync/Jumpers/PrinterBusy/CasIn/Exp information
                     00BC    34 CRTC_SELECTREG = 0xBC    ;; CRTC Port and command "Select Register"
                     00BD    35 CRTC_SETVAL    = 0xBD    ;; CRTC Port and command "Set Value"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 50.
Hexadecimal [16-Bits]



                             23 .include "sprites/sprites.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;#####################################################################
                             20 ;;### MODULE: Sprites
                             21 ;;#####################################################################
                             22 ;;### Functions, macros and definitions used for managing sprites
                             23 ;;### in assembler code
                             24 ;;#####################################################################
                             25 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 51.
Hexadecimal [16-Bits]



                             26 .include "sprites/flipping/flipping_macros.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;#####################################################################
                             20 ;;### MODULE: Sprites
                             21 ;;### SUBMODULE: flipping.macros
                             22 ;;#####################################################################
                             23 ;;### Macros used to speed up calculations required for to assist
                             24 ;;### flipping functions. Assembler version.
                             25 ;;#####################################################################
                             26 
                             27 ;;
                             28 ;; Macro: cpctm_ld_spbloff
                             29 ;;
                             30 ;;    Macro that calculates the offset to add to a sprite pointer to point 
                             31 ;; to its bottom left pixel.
                             32 ;;
                             33 ;; ASM Definition:
                             34 ;;    .macro <cpctm_ld_spbloff> *REG*, *W*, *H*
                             35 ;;
                             36 ;; Acronym stands for:
                             37 ;;    ld_sbloff = Load Sprite Bottom Left Offset
                             38 ;;
                             39 ;; Parameters:
                             40 ;;    (1-2B) REG - Register that will load the resulting offset (8 or 16 bits)
                             41 ;;    (1B) W     - Width of the sprite in *bytes*
                             42 ;;    (1B) H     - Height of the sprite in pixels
                             43 ;;
                             44 ;; Parameter Restrictions:
                             45 ;;    *REG* - Must be a valid 8/16 bits register that can be immediately loaded
                             46 ;; using ld REG, #immediate.
                             47 ;;    *W*   - Must be an immediate value representing the width of the sprite 
                             48 ;; in *bytes* (Beware! Not in pixels). For sprites having interlaced mask, you 
                             49 ;; may input 2 times the width of the sprite for appropriate results.
                             50 ;;    *H*   - Must be an immediate value representing the height of the sprite 
                             51 ;; in pixels.
                             52 ;;
                             53 ;; Returns:
                             54 ;; (start code)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 52.
Hexadecimal [16-Bits]



                             55 ;;    REG = W * (H - 1) ;; Register loaded with the offset
                             56 ;; (end code)
                             57 ;;
                             58 ;; Details:
                             59 ;;    This macro calculates the offset of the initial byte of the last row 
                             60 ;; of a given sprite (i.e. its bottom-left byte), with respect to its first
                             61 ;; byte (top-left corner). This value can easily be added to any sprite 
                             62 ;; pointer to get a pointer to the bottom-left byte. This pointer is required
                             63 ;; byte many flipping functions (like <cpct_vflipSprite>). Values for width
                             64 ;; and height of the sprite must be constant immediate values. Otherwise, this
                             65 ;; macro will generate incorrect code that will fail to compile. 
                             66 ;;    The macro calculates *W* * (*H*-1) at compile-time and loads it into
                             67 ;; the given register. Please, take into account that the macro does no check
                             68 ;; about the size of the resulting values. If multiplication results in a value
                             69 ;; greater than 255, you will need to load it into a 16-bit register. You must
                             70 ;; take care of the expected size of the offset value.
                             71 ;;
                             72 ;; Known issues:
                             73 ;;    * This is a assembler macro. It cannot be called or used from C code.
                             74 ;;
                             75 .macro cpctm_ld_spbloff REG, W, H
                             76    ld    REG, #W * (H-1)
                             77 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 53.
Hexadecimal [16-Bits]



                             16 .include "cpcfunciones.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 54.
Hexadecimal [16-Bits]



                             17 .include "manager/entity_manager.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 55.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 56.
Hexadecimal [16-Bits]



                             19 .include "system/ataque.h.s"
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
                             15 .globl  ataqueEspada
                             16 .globl  mueveEspadaDerecha
                             17 .globl  mueveEspadaIzquierda
                             18 .globl  estadoEspadaPrevio
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 57.
Hexadecimal [16-Bits]



                             20 .include "system/gameOver.h.s"
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
                             15 .globl GameOver
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 58.
Hexadecimal [16-Bits]



                             21 .include "system/renderPersonaje.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 59.
Hexadecimal [16-Bits]



                             22 .include "system/colisiones.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 60.
Hexadecimal [16-Bits]



                             23 .include "system/mainJuego.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 61.
Hexadecimal [16-Bits]



                             24 .include "system/actualizarEnemigos.h.s"
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
                             15 ;;.globl actualizarEnemigos
                             16 .globl actualizarEnemigos1
                             17 .globl actualizarEnemigos2
                             18 .globl actualizarEnemigos3
                             19 .globl actualizarEnemigos4
                             20 .globl actualizarEnemigos5
                             21 .globl actualizarEnemigos6
                             22 .globl actualizarEnemigos7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 62.
Hexadecimal [16-Bits]



                             25 .include "system/niveles.h.s"
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
                             15 .globl CompruebaNivel
                             16 
                     0001    17 NivelActual = #1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 63.
Hexadecimal [16-Bits]



                             26 .include "system/ataqueAereo.h.s"
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
                             16 .globl ataqueAereo
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 64.
Hexadecimal [16-Bits]



                             27 .include "system/renderEnemigo1.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 65.
Hexadecimal [16-Bits]



                             28 .include "system/renderEnemigo2.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 66.
Hexadecimal [16-Bits]



                             29 .include "system/renderEnemigo3.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 67.
Hexadecimal [16-Bits]



                             30 .include "system/renderEnemigo4.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 68.
Hexadecimal [16-Bits]



                             31 .include "system/dibujarFondo.h.s"
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
                             15 .globl fondo
                             16 .globl olas
                             17 .globl borrarOlas
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 69.
Hexadecimal [16-Bits]



                             32 .include "system/dibujarOlas2.h.s"
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
                             15 .globl olas2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 70.
Hexadecimal [16-Bits]



                             33 .include "system/dibujarOlas3.h.s"
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
                             15 .globl olas3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 71.
Hexadecimal [16-Bits]



                             34 .include "system/actualizarMina.h.s"
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
                             15 .globl actualizarMina
                             16 .globl muerteporMina
                             17 .globl borrarExplosion
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 72.
Hexadecimal [16-Bits]



                             35 .include "system/pintarVidas.h.s"
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
                             15 .globl tresVidas
                             16 .globl dosVidas
                             17 .globl unaVida
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 73.
Hexadecimal [16-Bits]



                             36 .include "system/pintarScoreTiempoReal.h.s"
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
                             15 .globl ScoreReal
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 74.
Hexadecimal [16-Bits]



                             37 .include "system/renderEspada.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 75.
Hexadecimal [16-Bits]



                             38 .include "system/renderCroco.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 76.
Hexadecimal [16-Bits]



                             39 .include "system/renderEnemigo5A.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 77.
Hexadecimal [16-Bits]



                             40 
                             41 
   8DF0                      42 DefineEntity player, 20, 0x88, 2, 8, 0, 0, 0xFF
   0000                       1 player::
   8DF0 14                    2    .db  20
   8DF1 88                    3    .db  0x88
   8DF2 02                    4    .db  2
   8DF3 08                    5    .db  8
   8DF4 00                    6    .db  0
   8DF5 00                    7    .db  0
   8DF6 FF                    8    .db  0xFF
   8DF7                      43 DefineEntity espada, 22, 0x88, 2, 3, 2, 0, 0x00
   0007                       1 espada::
   8DF7 16                    2    .db  22
   8DF8 88                    3    .db  0x88
   8DF9 02                    4    .db  2
   8DFA 03                    5    .db  3
   8DFB 02                    6    .db  2
   8DFC 00                    7    .db  0
   8DFD 00                    8    .db  0x00
   8DFE                      44 DefineEntity wallI, 4, 0x88, 2, 8, 0, 0, 0x0F  ;;en entity_estado guardamos enemigos terrestres asesinados y en VY enemigos aereos
   000E                       1 wallI::
   8DFE 04                    2    .db  4
   8DFF 88                    3    .db  0x88
   8E00 02                    4    .db  2
   8E01 08                    5    .db  8
   8E02 00                    6    .db  0
   8E03 00                    7    .db  0
   8E04 0F                    8    .db  0x0F
   8E05                      45 DefineEntity wallD, 73, 0x88, 2, 8, 1, 2, 0x0F ;;en VX guardamos el nivel actual y en VY contador para pasar de nivel
   0015                       1 wallD::
   8E05 49                    2    .db  73
   8E06 88                    3    .db  0x88
   8E07 02                    4    .db  2
   8E08 08                    5    .db  8
   8E09 01                    6    .db  1
   8E0A 02                    7    .db  2
   8E0B 0F                    8    .db  0x0F
   8E0C                      46 DefineEntity enemy, 72, 0x88, 2, 8, 0, 0, 0xF0
   001C                       1 enemy::
   8E0C 48                    2    .db  72
   8E0D 88                    3    .db  0x88
   8E0E 02                    4    .db  2
   8E0F 08                    5    .db  8
   8E10 00                    6    .db  0
   8E11 00                    7    .db  0
   8E12 F0                    8    .db  0xF0
   8E13                      47 DefineEntity croco, 0, 0x93, 2, 8, 1, 2, 0xF3
   0023                       1 croco::
   8E13 00                    2    .db  0
   8E14 93                    3    .db  0x93
   8E15 02                    4    .db  2
   8E16 08                    5    .db  8
   8E17 01                    6    .db  1
   8E18 02                    7    .db  2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 78.
Hexadecimal [16-Bits]



   8E19 F3                    8    .db  0xF3
   8E1A                      48 DefineEntity enemyIzq, 5, 0x88, 2, 8, 0, 0, 0xF0
   002A                       1 enemyIzq::
   8E1A 05                    2    .db  5
   8E1B 88                    3    .db  0x88
   8E1C 02                    4    .db  2
   8E1D 08                    5    .db  8
   8E1E 00                    6    .db  0
   8E1F 00                    7    .db  0
   8E20 F0                    8    .db  0xF0
   8E21                      49 DefineEntity enemyUp1, 43, 0x40, 2, 8, 0, 0, 0xF0
   0031                       1 enemyUp1::
   8E21 2B                    2    .db  43
   8E22 40                    3    .db  0x40
   8E23 02                    4    .db  2
   8E24 08                    5    .db  8
   8E25 00                    6    .db  0
   8E26 00                    7    .db  0
   8E27 F0                    8    .db  0xF0
   8E28                      50 DefineEntity enemyUp2, 15, 0x40, 2, 8, 0, 0, 0xF0
   0038                       1 enemyUp2::
   8E28 0F                    2    .db  15
   8E29 40                    3    .db  0x40
   8E2A 02                    4    .db  2
   8E2B 08                    5    .db  8
   8E2C 00                    6    .db  0
   8E2D 00                    7    .db  0
   8E2E F0                    8    .db  0xF0
   8E2F                      51 DefineEntity enemyUp3, 30, 0x40, 2, 8, 0, 0, 0xF0
   003F                       1 enemyUp3::
   8E2F 1E                    2    .db  30
   8E30 40                    3    .db  0x40
   8E31 02                    4    .db  2
   8E32 08                    5    .db  8
   8E33 00                    6    .db  0
   8E34 00                    7    .db  0
   8E35 F0                    8    .db  0xF0
   8E36                      52 DefineEntity enemyUp4, 50, 0x40, 2, 8, 1, 1, 0xF0
   0046                       1 enemyUp4::
   8E36 32                    2    .db  50
   8E37 40                    3    .db  0x40
   8E38 02                    4    .db  2
   8E39 08                    5    .db  8
   8E3A 01                    6    .db  1
   8E3B 01                    7    .db  1
   8E3C F0                    8    .db  0xF0
   8E3D                      53 DefineEntity enemyUp5, 20, 0x40, 2, 8, 1, 1, 0xF0
   004D                       1 enemyUp5::
   8E3D 14                    2    .db  20
   8E3E 40                    3    .db  0x40
   8E3F 02                    4    .db  2
   8E40 08                    5    .db  8
   8E41 01                    6    .db  1
   8E42 01                    7    .db  1
   8E43 F0                    8    .db  0xF0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 79.
Hexadecimal [16-Bits]



   8E44                      54 DefineEntity enemyIzq2, 5, 0x88, 2, 8, 0, 0, 0xFF
   0054                       1 enemyIzq2::
   8E44 05                    2    .db  5
   8E45 88                    3    .db  0x88
   8E46 02                    4    .db  2
   8E47 08                    5    .db  8
   8E48 00                    6    .db  0
   8E49 00                    7    .db  0
   8E4A FF                    8    .db  0xFF
   8E4B                      55 DefineEntity enemyIzq3, 0, 0x80, 2, 8, 1, 1, 0x00
   005B                       1 enemyIzq3::
   8E4B 00                    2    .db  0
   8E4C 80                    3    .db  0x80
   8E4D 02                    4    .db  2
   8E4E 08                    5    .db  8
   8E4F 01                    6    .db  1
   8E50 01                    7    .db  1
   8E51 00                    8    .db  0x00
   8E52                      56 DefineEntity enemyDer2, 72, 0x88, 2, 8, 0, 0, 0x0F
   0062                       1 enemyDer2::
   8E52 48                    2    .db  72
   8E53 88                    3    .db  0x88
   8E54 02                    4    .db  2
   8E55 08                    5    .db  8
   8E56 00                    6    .db  0
   8E57 00                    7    .db  0
   8E58 0F                    8    .db  0x0F
                             57 ;;DefineEntity enemyDer3, 0, 0x80, 2, 8, 1, 1, 0x00
                             58 
   8E59 53 6F 6D 65 20 61    59 FraseIni1: .asciz "Some animals seem to have mutated";
        6E 69 6D 61 6C 73
        20 73 65 65 6D 20
        74 6F 20 68 61 76
        65 20 6D 75 74 61
        74 65 64 00
   8E7B 50 6C 65 61 73 65    60 FraseIni2: .asciz "Please, help us to eliminate them!";
        2C 20 68 65 6C 70
        20 75 73 20 74 6F
        20 65 6C 69 6D 69
        6E 61 74 65 20 74
        68 65 6D 21 00
   8E9E 4D 6F 76 65 20 6C    61 Controls1: .asciz "Move left with A and Right with D";
        65 66 74 20 77 69
        74 68 20 41 20 61
        6E 64 20 52 69 67
        68 74 20 77 69 74
        68 20 44 00
   8EC0 55 73 65 20 53 70    62 Controls2: .asciz "Use Space to Sword-Attack,";
        61 63 65 20 74 6F
        20 53 77 6F 72 64
        2D 41 74 74 61 63
        6B 2C 00
   8EDB 57 20 74 6F 20 4D    63 Controls3: .asciz "W to Missile-Attack,";
        69 73 73 69 6C 65
        2D 41 74 74 61 63
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 80.
Hexadecimal [16-Bits]



        6B 2C 00
   8EF0 61 6E 64 20 53 20    64 Controls4: .asciz "and S to place a Mine (Run Away!)";
        74 6F 20 70 6C 61
        63 65 20 61 20 4D
        69 6E 65 20 28 52
        75 6E 20 41 77 61
        79 21 29 00
   8F12 47 4F 4F 44 20 4C    65 Controls5: .asciz "GOOD LUCK!";
        55 43 4B 21 00
                             66 
   8F1D 4C 45 56 45 4C 20    67 Level1: .asciz "LEVEL 1";
        31 00
   8F25 4C 45 56 45 4C 20    68 Level2: .asciz "LEVEL 2";
        32 00
   8F2D 4C 45 56 45 4C 20    69 Level3: .asciz "LEVEL 3";
        33 00
   8F35 4C 45 56 45 4C 20    70 Level4: .asciz "LEVEL 4";
        34 00
   8F3D 4C 45 56 45 4C 20    71 Level5: .asciz "LEVEL 5";
        35 00
   8F45 4B 45 45 50 20 41    72 Level6: .asciz "KEEP ALIVE!";
        4C 49 56 45 21 00
   8F51 01                   73 ola: .db #1
   8F52 01                   74 olaUpDown: .db #1
   8F53 06                   75 olaCounter: .db #6
                             76 ;;lastLevel: .db #0
   8F54 01                   77 cooldownMisil:: .db #1
   8F55 00                   78 letrasborradas:: .db #0
   8F56 01                   79 nivelactual:: .db #1
   8F57 01                   80 cargaNivel:: .db #1
   8F58 00                   81 cooldownEnemigo1:: .db #0
   8F59 00                   82 cooldownEnemigo2:: .db #0
   8F5A 03                   83 vidas:: .db #3
                             84 
                             85 ;;Mina,   --0 no colocada, 1 colocada-- , --posicion X-- , --Estado: 1 encendida, 0 apagada o no plantada, 2 explotando-- , --Cooldown para encenderse la mina--
   8F5B 00 00 00 00          86 Mina:: .db #0, #0, #0, #0
                             87 ;;Mensajes que se deben dar en el inicio antes de empezar 1ºEspera total, 2º Espera hasta que cambie el texto, 3º Espera de cambio de textos
   8F5F A0 3C 0C             88 Inicio:: .db #160, #60, #12
   8F62                      89 palette::
                             90 ;;.db HW_BLACK          , HW_BLUE           , HW_BRIGHT_BLUE    ,   HW_RED    , HW_MAGENTA        , HW_MAUVE
   8F62 14 0A 06 0C 18 1D    91 .db HW_BLACK        , HW_BRIGHT_YELLOW            , HW_CYAN   ,   HW_BRIGHT_RED     , HW_MAGENTA        , HW_MAUVE
   8F68 0C 1C 0D 12 06 17    92 .db HW_BRIGHT_RED     , HW_RED        , HW_BRIGHT_MAGENTA ,   HW_BRIGHT_GREEN  , HW_CYAN           , HW_SKY_BLUE
   8F6E 1E 00 1F 0C          93 .db HW_YELLOW         , HW_WHITE          , HW_PASTEL_BLUE    ,   HW_BRIGHT_RED ;;, HW_PINK           , HW_PASTEL_MAGENTA
   8F72                      94 paletteMuerte::
                             95 ;;.db HW_BLACK          , HW_BLUE           , HW_BRIGHT_BLUE    ,   HW_RED    , HW_MAGENTA        , HW_MAUVE
   8F72 0C 06 0A 14 18 1D    96 .db HW_BRIGHT_RED        , HW_CYAN           , HW_BRIGHT_YELLOW    ,   HW_BLACK     , HW_MAGENTA        , HW_MAUVE
   8F78 0C 1C 0D 12 06 17    97 .db HW_BRIGHT_RED     , HW_RED        , HW_BRIGHT_MAGENTA ,   HW_BRIGHT_GREEN  , HW_CYAN           , HW_SKY_BLUE
   8F7E 1E 00 1F 0C          98 .db HW_YELLOW         , HW_WHITE          , HW_PASTEL_BLUE    ,   HW_BRIGHT_RED ;;, HW_PINK           , HW_PASTEL_MAGENTA
                             99 
                            100 ;;.db HW_BLACK          , HW_BLUE           , HW_BRIGHT_BLUE    ,   HW_RED    , HW_MAGENTA        , HW_MAUVE
                            101 
                            102 ;;LOS 5 originales son:
                            103 ;;.db HW_BLACK          , HW_BLUE           , HW_BRIGHT_BLUE    ,   HW_RED    , HW_MAGENTA        , HW_MAUVE
                            104 ;;.db HW_BRIGHT_RED     , HW_PURPLE         , HW_BRIGHT_MAGENTA ,   HW_GREEN  , HW_CYAN           , HW_SKY_BLUE
                            105 ;;.db HW_YELLOW         , HW_WHITE          , HW_PASTEL_BLUE    ,   HW_ORANGE ;;, HW_PINK           , HW_PASTEL_MAGENTA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 81.
Hexadecimal [16-Bits]



                            106 ;;.db HW_BRIGHT_GREEN   , HW_SEA_GREEN      , HW_BRIGHT_CYAN    ,   HW_LIME   , HW_PASTEL_GREEN   , HW_PASTEL_CYAN
                            107 ;;.db HW_BRIGHT_YELLOW  , HW_PASTEL_YELLOW  , HW_BRIGHT_WHITE 
                            108 
   8F82                     109 GameStart::
                            110 
                            111 
                            112 
                            113 ;;/////////DIBUJAMOS ESCENARIO/////////
   8F82 CD 3A 9D      [17]  114 call fondo
   8F85 CD 31 A2      [17]  115 call tresVidas
                            116 
                            117 ;;ld      a, #0x49
                            118 ;;buclesuelo:
                            119 ;;    push af
                            120 ;;    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            121 ;;    ld      c,  a              ;;Coordenada X 
                            122 ;;    ld      b,  #0x90         ;;Coordenada Y 
                            123 ;;    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
                            124 ;;
                            125 ;;    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
                            126 ;;    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
                            127 ;;    ld      c,  #1        ;;Ancho (en la posición de la entidad)
                            128 ;;    ld      b,  #1         ;;Alto (en la posición de la entidad)
                            129 ;;    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc
                            130 ;;    
                            131 ;;    pop af
                            132 ;;    dec a
                            133 ;;    jr nz, buclesuelo
                            134 ;;
                            135 ;;    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            136 ;;    ld      c,  #74              ;;Coordenada X 
                            137 ;;    ld      b,  #0x85         ;;Coordenada Y 
                            138 ;;    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
                            139 ;;
                            140 ;;    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
                            141 ;;    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
                            142 ;;    ld      c,  #2        ;;Ancho (en la posición de la entidad)
                            143 ;;    ld      b,  #11         ;;Alto (en la posición de la entidad)
                            144 ;;    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc
                            145 ;;
                            146 ;;    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
                            147 ;;    ld      c,  #0              ;;Coordenada X 
                            148 ;;    ld      b,  #0x85         ;;Coordenada Y 
                            149 ;;    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
                            150 ;;
                            151 ;;    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
                            152 ;;    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
                            153 ;;    ld      c,  #2        ;;Ancho (en la posición de la entidad)
                            154 ;;    ld      b,  #11         ;;Alto (en la posición de la entidad)
                            155 ;;    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc
                            156 
                            157 ;;/////////CREAMOS ENTIDADES/////////
                            158 
                            159   ;;call CPCT_HW_Colour
                            160   ;;call cpct_getHWColour(HW_BLACK)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 82.
Hexadecimal [16-Bits]



                            161   ;;ld  c, #0
                            162   ;;call cpct_setVideoMode_asm
                            163   ;;call cpctm_setBorder_asm  HW_WHITE
   8F88 21 62 8F      [10]  164   ld  hl, #palette
   8F8B 11 10 00      [10]  165   ld  de, #16
   8F8E CD 50 AE      [17]  166   call cpct_setPalette_asm
                            167 
                            168 ;;call borrarOlas
                            169 ;;call olas3
                            170 
                            171     
                            172 
                            173     ;;ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
                            174 
                            175 
                            176   
                            177 
                            178 
                            179     
                            180 
                            181 
                            182 
                            183 
   8F91 21 F0 8D      [10]  184     ld    hl, #player
   8F94 CD AA 41      [17]  185     call  entityman_create
   8F97 21 F7 8D      [10]  186     ld    hl, #espada
   8F9A CD AA 41      [17]  187     call  entityman_create
   8F9D 21 FE 8D      [10]  188     ld    hl, #wallI
   8FA0 CD AA 41      [17]  189     call entityman_create
   8FA3 21 05 8E      [10]  190     ld    hl, #wallD
   8FA6 CD AA 41      [17]  191     call entityman_create
                            192 
   8FA9 21 0C 8E      [10]  193 ld    hl, #enemy
   8FAC CD AA 41      [17]  194     call  entityman_create
   8FAF 21 13 8E      [10]  195     ld    hl, #croco
   8FB2 CD AA 41      [17]  196     call  entityman_create
   8FB5 CD 2E 70      [17]  197     call pintarPersonajePos0
   8FB8 CD F6 7E      [17]  198     call pintarEnemigo1
                            199 
   8FBB 16 00         [ 7]  200     ld    d, #0         ;; D = Background PEN (0)
   8FBD 1E 01         [ 7]  201     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                            202 
   8FBF CD 88 B0      [17]  203    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                            204      ;; Calculate a video-memory location for printing a string
   8FC2 11 00 C0      [10]  205    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   8FC5 06 18         [ 7]  206    ld    b, #24                  ;; B = y coordinate (24 = 0x18)
   8FC7 0E 07         [ 7]  207    ld    c, #7                ;; C = x coordinate (16 = 0x10)
                            208 
   8FC9 CD 6C B0      [17]  209    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                            210 
                            211    ;; Print the string in video memory
                            212    ;; HL already points to video memory, as it is the return
                            213    ;; value from cpct_getScreenPtr_asm
   8FCC FD 21 59 8E   [14]  214    ld   iy, #FraseIni1    ;; IY = Pointer to the string 
                            215    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 83.
Hexadecimal [16-Bits]



   8FD0 CD 63 AE      [17]  216    call cpct_drawStringM1_asm
                            217 
   8FD3 16 00         [ 7]  218    ld    d, #0         ;; D = Background PEN (0)
   8FD5 1E 01         [ 7]  219     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                            220 
   8FD7 CD 88 B0      [17]  221    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                            222      ;; Calculate a video-memory location for printing a string
   8FDA 11 00 C0      [10]  223    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   8FDD 06 20         [ 7]  224    ld    b, #32                  ;; B = y coordinate (24 = 0x18)
   8FDF 0E 07         [ 7]  225    ld    c, #7                  ;; C = x coordinate (16 = 0x10)
                            226 
   8FE1 CD 6C B0      [17]  227    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                            228 
                            229    ;; Print the string in video memory
                            230    ;; HL already points to video memory, as it is the return
                            231    ;; value from cpct_getScreenPtr_asm
   8FE4 FD 21 7B 8E   [14]  232    ld   iy, #FraseIni2    ;; IY = Pointer to the string 
                            233    
   8FE8 CD 63 AE      [17]  234    call cpct_drawStringM1_asm
                            235 
                            236     
                            237     
                            238 
                            239 
                            240     ;;BUCLE PRINCIPAL DEL JUEGO
   8FEB                     241     moverPersonaje:
   8FEB CD 55 68      [17]  242     call ScoreReal
                            243 
                            244     ;;ACTUALIZAMOS OLA
   8FEE DD 21 53 8F   [14]  245     ld ix, #olaCounter
   8FF2 DD 35 00      [23]  246     dec 0(ix)
   8FF5 28 02         [12]  247     jr z, cambiarOlas
   8FF7 18 3F         [12]  248     jr finOlas
   8FF9                     249     cambiarOlas:
   8FF9 DD 36 00 06   [19]  250     ld 0(ix), #6
   8FFD DD 21 51 8F   [14]  251     ld ix, #ola
   9001 DD 35 00      [23]  252     dec 0(ix)
   9004 28 05         [12]  253     jr z, olaNiv1
   9006 DD 35 00      [23]  254     dec 0(ix)
   9009 28 0C         [12]  255     jr z, olaNiv2
   900B                     256     olaNiv1:  ;;En el nivel 1 y el 3 hacemos lo mismo
   900B CD 5F A0      [17]  257     call borrarOlas
   900E CD D5 6E      [17]  258     call olas2
   9011 DD 36 00 02   [19]  259     ld 0(ix), #2
   9015 18 21         [12]  260     jr finOlas
   9017                     261     olaNiv2:
   9017 DD 21 52 8F   [14]  262     ld ix, #olaUpDown
   901B DD 35 00      [23]  263     dec 0(ix)
   901E 28 0C         [12]  264     jr z, olaNiv2Up
   9020 DD 36 00 01   [19]  265     ld 0(ix), #1
   9024 CD 5F A0      [17]  266     call borrarOlas
   9027 CD 06 9F      [17]  267     call olas
   902A 18 0C         [12]  268     jr finOlas
   902C                     269     olaNiv2Up:
   902C DD 36 00 03   [19]  270     ld 0(ix), #3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 84.
Hexadecimal [16-Bits]



   9030 CD 5F A0      [17]  271     call borrarOlas
   9033 CD 44 47      [17]  272     call olas3
   9036 18 00         [12]  273     jr finOlas
                            274 
   9038                     275     finOlas:
                            276 
                            277     ;;COOLDOWN ESPADA
   9038 DD 21 0A 40   [14]  278     ld ix, #espadaPos
   903C DD 7E 05      [19]  279     ld a, entity_vy(ix)
   903F D6 01         [ 7]  280     sub a, #1
   9041 28 26         [12]  281     jr z, restaCDEspada
   9043 DD 7E 05      [19]  282     ld a, entity_vy(ix)
   9046 D6 02         [ 7]  283     sub a, #2
   9048 28 1F         [12]  284     jr z, restaCDEspada
   904A DD 7E 05      [19]  285     ld a, entity_vy(ix)
   904D D6 03         [ 7]  286     sub a, #3
   904F 28 18         [12]  287     jr z, restaCDEspada
   9051 DD 7E 05      [19]  288     ld a, entity_vy(ix)
   9054 D6 04         [ 7]  289     sub a, #4
   9056 20 18         [12]  290     jr nz, finComprobacionEspada
   9058 DD 21 A0 7D   [14]  291     ld ix, #estadoEspadaPrevio
   905C DD 35 00      [23]  292     dec 0(ix)
   905F 28 05         [12]  293     jr z, EstabaIzq
   9061 CD C0 AA      [17]  294     call borrarEspadaDerecha
   9064 18 03         [12]  295     jr restaCDEspada
   9066                     296     EstabaIzq:
   9066 CD EC AA      [17]  297     call borrarEspadaIzquierda
   9069                     298     restaCDEspada:
   9069 DD 7E 05      [19]  299     ld a, entity_vy(ix)
   906C 3D            [ 4]  300     dec a
   906D DD 77 05      [19]  301     ld entity_vy(ix), a
                            302 
   9070                     303     finComprobacionEspada:
                            304 
                            305     ;;Comprobacion W
   9070 DD 21 54 8F   [14]  306     ld ix, #cooldownMisil
   9074 DD 35 00      [23]  307     dec 0(ix)
   9077 28 02         [12]  308     jr z, misilPreparado
   9079 18 03         [12]  309     jr finComprobacionMisil
   907B                     310     misilPreparado:
   907B DD 34 00      [23]  311     inc 0(ix)
                            312 
   907E                     313     finComprobacionMisil:
                            314 
                            315     ;;ACTUALIZAMOS LA MINA
   907E CD A3 54      [17]  316     call actualizarMina
                            317 
   9081 DD 21 57 8F   [14]  318 ld ix, #cargaNivel
   9085 DD 7E 00      [19]  319     ld a, 0(ix)
   9088 3D            [ 4]  320     dec a 
   9089 C2 3E 99      [10]  321     jp nz, CargandoNivel
                            322 
   908C DD 21 18 40   [14]  323     ld ix, #wallDPos
   9090 DD 7E 05      [19]  324     ld a, entity_vy(ix)
   9093 3C            [ 4]  325     inc a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 85.
Hexadecimal [16-Bits]



   9094 3D            [ 4]  326     dec a
   9095 CA 9E 90      [10]  327     jp z, cambiarnivel
   9098 3C            [ 4]  328     inc a 
   9099 3C            [ 4]  329     inc a 
   909A 3D            [ 4]  330     dec a
   909B C2 AB 97      [10]  331     jp nz, nocambiarnivel
                            332 
   909E                     333   cambiarnivel:
   909E DD 46 04      [19]  334     ld b, entity_estado(ix)
   90A1 04            [ 4]  335     inc b
   90A2 DD 70 04      [19]  336     ld entity_estado(ix), b
                            337 
                            338 
                            339    ;;;; ;;SI PULSAMOS P hackeamos al nivel 6
                            340    ;; call  cpct_scanKeyboard_f_asm
                            341    ;; ld  hl, #Key_P
                            342    ;; call cpct_isKeyPressed_asm
                            343    ;; jr z, noHack
                            344    ;; ld ix, #wallDPos
                            345    ;; ld entity_estado(ix), #6
                            346    ;; ld entity_vy(ix), #99
                            347    ;; noHack:
                            348 
                            349     
                            350 
   90A5 CD 9D 48      [17]  351     call CompruebaNivel  ;;devuelve en a el nivel actual
                            352 
   90A8 3D            [ 4]  353     dec a
   90A9 CA A1 97      [10]  354     jp z, nivel1
   90AC 3D            [ 4]  355     dec a
   90AD CA 0A 97      [10]  356     jp z, nivel2
   90B0 3D            [ 4]  357     dec a
   90B1 CA 4A 96      [10]  358     jp z, nivel3
   90B4 3D            [ 4]  359     dec a
   90B5 CA 56 95      [10]  360     jp z, nivel4
   90B8 3D            [ 4]  361     dec a
   90B9 CA 01 94      [10]  362     jp z, nivel5
   90BC 3D            [ 4]  363     dec a
   90BD CA 91 92      [10]  364     jp z, nivel6
   90C0 3D            [ 4]  365     dec a
   90C1 CA C4 90      [10]  366     jp z, nivel7
                            367 
   90C4                     368   nivel7:
                            369 
                            370     ;;ENTIDADES DE MANERA TEMPORAL
                            371     ;;ld    hl, #enemyIzq
                            372     ;;call  entityman_create
                            373     ;;ld    hl, #enemyIzq2
                            374     ;;call  entityman_create
                            375     ;;ld    hl, #enemyUp1
                            376     ;;call entityman_create
                            377     ;;ld    hl, #enemyUp2
                            378     ;;call entityman_create
                            379     ;;ld    hl, #enemyUp3
                            380     ;;call entityman_create
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 86.
Hexadecimal [16-Bits]



                            381 
                            382     ;;HASTA AQUI
   90C4 DD 21 56 8F   [14]  383 ld ix, #nivelactual 
   90C8 DD 7E 00      [19]  384     ld a, 0(ix)
   90CB D6 07         [ 7]  385     sub a, #7
   90CD C2 C0 91      [10]  386     jp nz, crearEntidadesNivel7
   90D0 DD 21 1F 40   [14]  387     ld  ix, #enemyPos 
   90D4 CD BC 82      [17]  388     call borrarEnemigo1
   90D7 DD 36 00 48   [19]  389     ld entity_x(ix), #72
   90DB DD 36 04 00   [19]  390     ld  entity_estado(ix), #0
   90DF CD F6 7E      [17]  391     call pintarEnemigo1
   90E2 DD 21 2D 40   [14]  392     ld  ix, #enemyIzqPos  
   90E6 CD B8 8C      [17]  393      call borrarEnemigo2
   90E9 DD 36 00 05   [19]  394     ld entity_x(ix), #5
   90ED DD 36 04 00   [19]  395     ld  entity_estado(ix), #0
   90F1 CD F2 88      [17]  396     call pintarEnemigo2
   90F4 DD 21 34 40   [14]  397     ld  ix, #enemyIzqPos2
   90F8 CD BA 87      [17]  398     call borrarEnemigo3
   90FB DD 21 34 40   [14]  399     ld  ix, #enemyIzqPos2
   90FF DD 36 00 05   [19]  400     ld  entity_x(ix), #5
   9103 DD 36 04 00   [19]  401     ld  entity_estado(ix), #0
   9107 CD F4 83      [17]  402     call pintarEnemigo3
   910A DD 21 03 40   [14]  403     ld ix, #playerPos
   910E CD B1 7B      [17]  404     call borraPersonajePos0
   9111 DD 36 00 1E   [19]  405     ld entity_x(ix), #30
   9115 CD 2E 70      [17]  406     call pintarPersonajePos0
   9118 DD 21 0A 40   [14]  407     ld ix, #espadaPos
   911C DD 36 00 20   [19]  408     ld entity_x(ix), #32
   9120 DD 21 50 40   [14]  409     ld  ix, #enemyDerPos2
   9124 CD 72 A9      [17]  410     call borrarEnemigo4
   9127 DD 36 00 48   [19]  411     ld  entity_x(ix), #72
   912B DD 36 04 00   [19]  412     ld  entity_estado(ix), #0
   912F CD AC A5      [17]  413     call pintarEnemigo4
   9132 DD 21 26 40   [14]  414     ld  ix, #crocodile  ;;(enemy)
   9136 CD 7E 65      [17]  415     call borrarCrocoPos5
   9139 CD 0F 66      [17]  416     call borrarCrocoPos6
   913C CD A0 66      [17]  417     call borrarCrocoPos7
   913F DD 36 04 08   [19]  418     ld entity_estado(ix), #8
   9143 DD 36 00 00   [19]  419     ld entity_x(ix), #0
   9147 DD 36 05 05   [19]  420     ld entity_vy(ix), #5
   914B DD 21 3B 40   [14]  421     ld ix, #enemyUp1Pos
   914F CD 0C 46      [17]  422      call  borrarEnemigo5
   9152 DD 21 03 40   [14]  423      ld ix, #playerPos
   9156 DD 46 00      [19]  424     ld b, entity_x(ix)
   9159 DD 21 3B 40   [14]  425     ld ix, #enemyUp1Pos
   915D DD 36 04 01   [19]  426      ld entity_estado(ix), #1
   9161 DD 36 06 F0   [19]  427     ld entity_color(ix), #0xF0
   9165 DD 36 01 40   [19]  428     ld entity_y(ix), #0x40
                            429     
   9169 DD 70 00      [19]  430     ld entity_x(ix), b
   916C CD 4D 42      [17]  431     call  pintarEnemigo5
                            432 
   916F DD 21 42 40   [14]  433     ld ix, #enemyUp2Pos
   9173 CD 0C 46      [17]  434      call  borrarEnemigo5
   9176 DD 21 03 40   [14]  435      ld ix, #playerPos
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 87.
Hexadecimal [16-Bits]



   917A DD 46 00      [19]  436     ld b, entity_x(ix)
   917D 04            [ 4]  437     inc b
   917E 04            [ 4]  438     inc b
   917F 04            [ 4]  439     inc b
   9180 DD 21 42 40   [14]  440     ld ix, #enemyUp2Pos
   9184 DD 36 04 01   [19]  441      ld entity_estado(ix), #1
   9188 DD 36 06 F0   [19]  442     ld entity_color(ix), #0xF0
   918C DD 36 01 40   [19]  443     ld entity_y(ix), #0x40
                            444     
   9190 DD 70 00      [19]  445     ld entity_x(ix), b
   9193 CD 4D 42      [17]  446     call  pintarEnemigo5
                            447 
   9196 DD 21 42 40   [14]  448     ld ix, #enemyUp2Pos
   919A CD 0C 46      [17]  449      call  borrarEnemigo5
   919D DD 21 03 40   [14]  450      ld ix, #playerPos
   91A1 DD 46 00      [19]  451     ld b, entity_x(ix)
   91A4 05            [ 4]  452     dec b
   91A5 05            [ 4]  453     dec b
   91A6 05            [ 4]  454     dec b
   91A7 DD 21 42 40   [14]  455     ld ix, #enemyUp2Pos
   91AB DD 36 04 01   [19]  456      ld entity_estado(ix), #1
   91AF DD 36 06 F0   [19]  457     ld entity_color(ix), #0xF0
   91B3 DD 36 01 40   [19]  458     ld entity_y(ix), #0x40
                            459     
   91B7 DD 70 00      [19]  460     ld entity_x(ix), b
   91BA CD 4D 42      [17]  461     call  pintarEnemigo5
                            462 
   91BD C3 5B 92      [10]  463     jp InicializarNivel7
                            464 
                            465 
   91C0                     466     crearEntidadesNivel7:
   91C0 21 21 8E      [10]  467     ld    hl, #enemyUp1
   91C3 CD AA 41      [17]  468     call entityman_create
   91C6 DD 21 1F 40   [14]  469     ld  ix, #enemyPos 
   91CA CD BC 82      [17]  470     call borrarEnemigo1
   91CD DD 36 00 48   [19]  471     ld entity_x(ix), #72
   91D1 DD 36 04 00   [19]  472     ld  entity_estado(ix), #0
   91D5 CD F6 7E      [17]  473     call pintarEnemigo1
   91D8 DD 21 2D 40   [14]  474     ld  ix, #enemyIzqPos  
   91DC CD B8 8C      [17]  475      call borrarEnemigo2
   91DF DD 36 00 05   [19]  476     ld entity_x(ix), #5
   91E3 DD 36 04 00   [19]  477     ld  entity_estado(ix), #0
   91E7 CD F2 88      [17]  478     call pintarEnemigo2
   91EA DD 21 34 40   [14]  479     ld  ix, #enemyIzqPos2
   91EE CD BA 87      [17]  480     call borrarEnemigo3
   91F1 DD 21 34 40   [14]  481     ld  ix, #enemyIzqPos2
   91F5 DD 36 00 05   [19]  482     ld  entity_x(ix), #5
   91F9 DD 36 04 00   [19]  483     ld  entity_estado(ix), #0
   91FD CD F4 83      [17]  484     call pintarEnemigo3
   9200 DD 21 50 40   [14]  485     ld  ix, #enemyDerPos2
   9204 CD 72 A9      [17]  486     call borrarEnemigo4
   9207 DD 36 00 48   [19]  487     ld  entity_x(ix), #72
   920B DD 36 04 00   [19]  488     ld  entity_estado(ix), #0
   920F CD AC A5      [17]  489     call pintarEnemigo4
   9212 21 28 8E      [10]  490     ld    hl, #enemyUp2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 88.
Hexadecimal [16-Bits]



   9215 CD AA 41      [17]  491     call entityman_create
   9218 21 2F 8E      [10]  492     ld    hl, #enemyUp3
   921B CD AA 41      [17]  493     call entityman_create
   921E DD 21 26 40   [14]  494     ld  ix, #crocodile  ;;(enemy)
   9222 CD 7E 65      [17]  495     call borrarCrocoPos5
   9225 CD 0F 66      [17]  496     call borrarCrocoPos6
   9228 CD A0 66      [17]  497     call borrarCrocoPos7
   922B DD 36 04 08   [19]  498     ld entity_estado(ix), #8
   922F DD 36 00 00   [19]  499     ld entity_x(ix), #0
   9233 DD 36 05 05   [19]  500     ld entity_vy(ix), #5
   9237 DD 21 3B 40   [14]  501     ld ix, #enemyUp1Pos
   923B CD 0C 46      [17]  502      call  borrarEnemigo5
   923E DD 21 03 40   [14]  503      ld ix, #playerPos
   9242 DD 46 00      [19]  504     ld b, entity_x(ix)
   9245 DD 21 3B 40   [14]  505     ld ix, #enemyUp1Pos
   9249 DD 36 04 01   [19]  506      ld entity_estado(ix), #1
   924D DD 36 06 F0   [19]  507     ld entity_color(ix), #0xF0
   9251 DD 36 01 40   [19]  508     ld entity_y(ix), #0x40
                            509     
   9255 DD 70 00      [19]  510     ld entity_x(ix), b
   9258 CD 4D 42      [17]  511     call  pintarEnemigo5
                            512     
   925B                     513     InicializarNivel7:
                            514     
   925B DD 77 05      [19]  515     ld entity_vy(ix), a
   925E DD 21 57 8F   [14]  516     ld ix, #cargaNivel
   9262 DD 36 00 1E   [19]  517     ld 0(ix), #30
   9266 DD 21 56 8F   [14]  518     ld ix, #nivelactual 
   926A DD 36 00 07   [19]  519     ld 0(ix), #7
                            520 
   926E DD 21 18 40   [14]  521     ld ix, #wallDPos
   9272 DD 36 05 08   [19]  522     ld entity_vy(ix), #8
                            523 
                            524 
   9276 16 03         [ 7]  525     ld    d, #3         ;; D = Background PEN (0)
   9278 1E 01         [ 7]  526     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                            527 
   927A CD 88 B0      [17]  528    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                            529      ;; Calculate a video-memory location for printing a string
   927D 11 00 C0      [10]  530    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9280 06 30         [ 7]  531    ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   9282 0E 20         [ 7]  532    ld    c, #32                ;; C = x coordinate (16 = 0x10)
                            533 
   9284 CD 6C B0      [17]  534    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                            535 
                            536    ;; Print the string in video memory
                            537    ;; HL already points to video memory, as it is the return
                            538    ;; value from cpct_getScreenPtr_asm
   9287 FD 21 45 8F   [14]  539    ld   iy, #Level6    ;; IY = Pointer to the string 
   928B CD 63 AE      [17]  540    call cpct_drawStringM1_asm
                            541     
   928E C3 3E 99      [10]  542     jp CargandoNivel
                            543 
   9291                     544     nivel6:
                            545 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 89.
Hexadecimal [16-Bits]



                            546     ;;ENTIDADES DE MANERA TEMPORAL
                            547     ;;ld    hl, #enemyIzq
                            548     ;;call  entityman_create
                            549     ;;ld    hl, #enemyIzq2
                            550     ;;call  entityman_create
                            551     ;;ld    hl, #enemyUp1
                            552     ;;call entityman_create
                            553     ;;ld    hl, #enemyUp2
                            554     ;;call entityman_create
                            555     ;;ld    hl, #enemyUp3
                            556     ;;call entityman_create
                            557 
                            558     ;;HASTA AQUI
   9291 DD 21 56 8F   [14]  559 ld ix, #nivelactual 
   9295 DD 7E 00      [19]  560     ld a, 0(ix)
   9298 D6 06         [ 7]  561     sub a, #6
   929A C2 3F 93      [10]  562     jp nz, crearEntidadesNivel6
   929D DD 21 1F 40   [14]  563     ld  ix, #enemyPos 
   92A1 CD BC 82      [17]  564     call borrarEnemigo1
   92A4 DD 36 00 48   [19]  565     ld entity_x(ix), #72
   92A8 DD 36 04 00   [19]  566     ld  entity_estado(ix), #0
   92AC CD F6 7E      [17]  567     call pintarEnemigo1
   92AF DD 21 2D 40   [14]  568     ld  ix, #enemyIzqPos  
   92B3 CD B8 8C      [17]  569      call borrarEnemigo2
   92B6 DD 36 00 05   [19]  570     ld entity_x(ix), #5
   92BA DD 36 04 00   [19]  571     ld  entity_estado(ix), #0
   92BE CD F2 88      [17]  572     call pintarEnemigo2
   92C1 DD 21 34 40   [14]  573     ld  ix, #enemyIzqPos2
   92C5 CD BA 87      [17]  574     call borrarEnemigo3
   92C8 DD 21 34 40   [14]  575     ld  ix, #enemyIzqPos2
   92CC DD 36 00 05   [19]  576     ld  entity_x(ix), #5
   92D0 DD 36 04 00   [19]  577     ld  entity_estado(ix), #0
   92D4 CD F4 83      [17]  578     call pintarEnemigo3
   92D7 DD 21 03 40   [14]  579     ld ix, #playerPos
   92DB CD B1 7B      [17]  580     call borraPersonajePos0
   92DE DD 36 00 1E   [19]  581     ld entity_x(ix), #30
   92E2 CD 2E 70      [17]  582     call pintarPersonajePos0
   92E5 DD 21 0A 40   [14]  583     ld ix, #espadaPos
   92E9 DD 36 00 20   [19]  584     ld entity_x(ix), #32
   92ED DD 21 50 40   [14]  585     ld  ix, #enemyDerPos2
   92F1 CD 72 A9      [17]  586     call borrarEnemigo4
   92F4 DD 36 00 48   [19]  587     ld  entity_x(ix), #72
   92F8 DD 36 04 00   [19]  588     ld  entity_estado(ix), #0
   92FC CD AC A5      [17]  589     call pintarEnemigo4
   92FF DD 21 26 40   [14]  590     ld  ix, #crocodile  ;;(enemy)
   9303 CD 7E 65      [17]  591     call borrarCrocoPos5
   9306 CD 0F 66      [17]  592     call borrarCrocoPos6
   9309 CD A0 66      [17]  593     call borrarCrocoPos7
   930C DD 36 04 08   [19]  594     ld entity_estado(ix), #8
   9310 DD 36 00 00   [19]  595     ld entity_x(ix), #0
   9314 DD 36 05 05   [19]  596     ld entity_vy(ix), #5
   9318 DD 21 3B 40   [14]  597     ld ix, #enemyUp1Pos
   931C CD 0C 46      [17]  598      call  borrarEnemigo5
   931F DD 21 03 40   [14]  599      ld ix, #playerPos
   9323 DD 46 00      [19]  600     ld b, entity_x(ix)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 90.
Hexadecimal [16-Bits]



   9326 DD 21 3B 40   [14]  601     ld ix, #enemyUp1Pos
   932A DD 36 04 01   [19]  602      ld entity_estado(ix), #1
   932E DD 36 06 F0   [19]  603     ld entity_color(ix), #0xF0
   9332 DD 36 01 40   [19]  604     ld entity_y(ix), #0x40
                            605     
   9336 DD 70 00      [19]  606     ld entity_x(ix), b
   9339 CD 4D 42      [17]  607     call  pintarEnemigo5
   933C C3 CB 93      [10]  608     jp InicializarNivel6
                            609 
   933F                     610     crearEntidadesNivel6:
   933F 21 21 8E      [10]  611     ld    hl, #enemyUp1
   9342 CD AA 41      [17]  612     call entityman_create
   9345 DD 21 1F 40   [14]  613     ld  ix, #enemyPos 
   9349 CD BC 82      [17]  614     call borrarEnemigo1
   934C DD 36 00 48   [19]  615     ld entity_x(ix), #72
   9350 DD 36 04 00   [19]  616     ld  entity_estado(ix), #0
   9354 CD F6 7E      [17]  617     call pintarEnemigo1
   9357 DD 21 2D 40   [14]  618     ld  ix, #enemyIzqPos  
   935B CD B8 8C      [17]  619      call borrarEnemigo2
   935E DD 36 00 05   [19]  620     ld entity_x(ix), #5
   9362 DD 36 04 00   [19]  621     ld  entity_estado(ix), #0
   9366 CD F2 88      [17]  622     call pintarEnemigo2
   9369 DD 21 34 40   [14]  623     ld  ix, #enemyIzqPos2
   936D CD BA 87      [17]  624     call borrarEnemigo3
   9370 DD 21 34 40   [14]  625     ld  ix, #enemyIzqPos2
   9374 DD 36 00 05   [19]  626     ld  entity_x(ix), #5
   9378 DD 36 04 00   [19]  627     ld  entity_estado(ix), #0
   937C CD F4 83      [17]  628     call pintarEnemigo3
   937F DD 21 50 40   [14]  629     ld  ix, #enemyDerPos2
                            630     ;;call borrarEnemigo4
   9383 DD 36 00 48   [19]  631     ld  entity_x(ix), #72
   9387 DD 36 04 00   [19]  632     ld  entity_estado(ix), #0
   938B CD AC A5      [17]  633     call pintarEnemigo4
   938E DD 21 26 40   [14]  634     ld  ix, #crocodile  ;;(enemy)
   9392 CD 7E 65      [17]  635     call borrarCrocoPos5
   9395 CD 0F 66      [17]  636     call borrarCrocoPos6
   9398 CD A0 66      [17]  637     call borrarCrocoPos7
   939B DD 36 04 08   [19]  638     ld entity_estado(ix), #8
   939F DD 36 00 00   [19]  639     ld entity_x(ix), #0
   93A3 DD 36 05 05   [19]  640     ld entity_vy(ix), #5
   93A7 DD 21 3B 40   [14]  641     ld ix, #enemyUp1Pos
   93AB CD 0C 46      [17]  642      call  borrarEnemigo5
   93AE DD 21 03 40   [14]  643      ld ix, #playerPos
   93B2 DD 46 00      [19]  644     ld b, entity_x(ix)
   93B5 DD 21 3B 40   [14]  645     ld ix, #enemyUp1Pos
   93B9 DD 36 04 01   [19]  646      ld entity_estado(ix), #1
   93BD DD 36 06 F0   [19]  647     ld entity_color(ix), #0xF0
   93C1 DD 36 01 40   [19]  648     ld entity_y(ix), #0x40
                            649     
   93C5 DD 70 00      [19]  650     ld entity_x(ix), b
   93C8 CD 4D 42      [17]  651     call  pintarEnemigo5
                            652     
   93CB                     653     InicializarNivel6:
                            654     ;;ld entity_vy(ix), a
   93CB DD 21 57 8F   [14]  655     ld ix, #cargaNivel
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 91.
Hexadecimal [16-Bits]



   93CF DD 36 00 1E   [19]  656     ld 0(ix), #30
   93D3 DD 21 56 8F   [14]  657     ld ix, #nivelactual 
   93D7 DD 36 00 06   [19]  658     ld 0(ix), #6
                            659 
   93DB DD 21 18 40   [14]  660     ld ix, #wallDPos
   93DF DD 36 05 0B   [19]  661     ld entity_vy(ix), #11
                            662 
                            663 
   93E3 16 03         [ 7]  664     ld    d, #3         ;; D = Background PEN (0)
   93E5 1E 01         [ 7]  665     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                            666 
   93E7 CD 88 B0      [17]  667    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                            668      ;; Calculate a video-memory location for printing a string
   93EA 11 00 C0      [10]  669    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   93ED 06 30         [ 7]  670    ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   93EF 0E 20         [ 7]  671    ld    c, #32                ;; C = x coordinate (16 = 0x10)
                            672 
   93F1 CD 6C B0      [17]  673    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                            674 
                            675    ;; Print the string in video memory
                            676    ;; HL already points to video memory, as it is the return
                            677    ;; value from cpct_getScreenPtr_asm
   93F4 FD 21 3D 8F   [14]  678    ld   iy, #Level5    ;; IY = Pointer to the string 
   93F8 CD 63 AE      [17]  679    call cpct_drawStringM1_asm
                            680     
   93FB C3 3E 99      [10]  681     jp CargandoNivel
                            682 
   93FE C3 AB 97      [10]  683     jp nivelcomenzado
   9401                     684     nivel5:
   9401 DD 21 56 8F   [14]  685     ld ix, #nivelactual 
   9405 DD 7E 00      [19]  686     ld a, 0(ix)
   9408 D6 05         [ 7]  687     sub a, #5
   940A C2 A9 94      [10]  688     jp nz, crearEntidadesNivel5
   940D DD 21 1F 40   [14]  689     ld  ix, #enemyPos 
   9411 CD BC 82      [17]  690     call borrarEnemigo1
   9414 DD 36 00 48   [19]  691     ld entity_x(ix), #72
   9418 DD 36 04 00   [19]  692     ld  entity_estado(ix), #0
   941C CD F6 7E      [17]  693     call pintarEnemigo1
   941F DD 21 2D 40   [14]  694     ld  ix, #enemyIzqPos  
   9423 CD B8 8C      [17]  695      call borrarEnemigo2
   9426 DD 36 00 05   [19]  696     ld entity_x(ix), #5
   942A DD 36 04 00   [19]  697     ld  entity_estado(ix), #0
   942E CD F2 88      [17]  698     call pintarEnemigo2
   9431 DD 21 34 40   [14]  699     ld  ix, #enemyIzqPos2
   9435 CD BA 87      [17]  700     call borrarEnemigo3
   9438 DD 21 34 40   [14]  701     ld  ix, #enemyIzqPos2
   943C DD 36 00 05   [19]  702     ld  entity_x(ix), #5
   9440 DD 36 04 00   [19]  703     ld  entity_estado(ix), #0
   9444 CD F4 83      [17]  704     call pintarEnemigo3
   9447 DD 21 03 40   [14]  705     ld ix, #playerPos
   944B CD B1 7B      [17]  706     call borraPersonajePos0
   944E DD 36 00 1E   [19]  707     ld entity_x(ix), #30
   9452 CD 2E 70      [17]  708     call pintarPersonajePos0
   9455 DD 21 0A 40   [14]  709     ld ix, #espadaPos
   9459 DD 36 00 20   [19]  710     ld entity_x(ix), #32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 92.
Hexadecimal [16-Bits]



   945D DD 21 50 40   [14]  711     ld  ix, #enemyDerPos2
                            712     ;;call borrarEnemigo4
   9461 DD 36 00 48   [19]  713     ld  entity_x(ix), #72
   9465 DD 36 04 00   [19]  714     ld  entity_estado(ix), #0
                            715     ;;call pintarEnemigo4
   9469 DD 21 26 40   [14]  716     ld  ix, #crocodile  ;;(enemy)
   946D CD 7E 65      [17]  717     call borrarCrocoPos5
   9470 CD 0F 66      [17]  718     call borrarCrocoPos6
   9473 CD A0 66      [17]  719     call borrarCrocoPos7
   9476 DD 36 04 08   [19]  720     ld entity_estado(ix), #8
   947A DD 36 00 00   [19]  721     ld entity_x(ix), #0
   947E DD 36 05 05   [19]  722     ld entity_vy(ix), #5
   9482 DD 21 3B 40   [14]  723     ld ix, #enemyUp1Pos
   9486 CD 0C 46      [17]  724      call  borrarEnemigo5
   9489 DD 21 03 40   [14]  725      ld ix, #playerPos
   948D DD 46 00      [19]  726     ld b, entity_x(ix)
   9490 DD 21 3B 40   [14]  727     ld ix, #enemyUp1Pos
   9494 DD 36 04 01   [19]  728      ld entity_estado(ix), #1
   9498 DD 36 06 F0   [19]  729     ld entity_color(ix), #0xF0
   949C DD 36 01 40   [19]  730     ld entity_y(ix), #0x40
                            731     
   94A0 DD 70 00      [19]  732     ld entity_x(ix), b
   94A3 CD 4D 42      [17]  733     call  pintarEnemigo5
                            734 
   94A6 C3 1D 95      [10]  735     jp InicializarNivel5
                            736 
   94A9                     737     crearEntidadesNivel5:
   94A9 21 21 8E      [10]  738     ld    hl, #enemyUp1
   94AC CD AA 41      [17]  739     call entityman_create
   94AF DD 21 1F 40   [14]  740     ld  ix, #enemyPos 
   94B3 CD BC 82      [17]  741     call borrarEnemigo1
   94B6 DD 36 00 48   [19]  742     ld entity_x(ix), #72
   94BA DD 36 04 00   [19]  743     ld  entity_estado(ix), #0
   94BE CD F6 7E      [17]  744     call pintarEnemigo1
   94C1 DD 21 2D 40   [14]  745     ld  ix, #enemyIzqPos  
   94C5 CD B8 8C      [17]  746      call borrarEnemigo2
   94C8 DD 36 00 05   [19]  747     ld entity_x(ix), #5
   94CC DD 36 04 00   [19]  748     ld  entity_estado(ix), #0
   94D0 CD F2 88      [17]  749     call pintarEnemigo2
   94D3 DD 21 34 40   [14]  750     ld  ix, #enemyIzqPos2
   94D7 CD BA 87      [17]  751     call borrarEnemigo3
   94DA DD 21 34 40   [14]  752     ld  ix, #enemyIzqPos2
   94DE DD 36 00 05   [19]  753     ld  entity_x(ix), #5
   94E2 DD 36 04 00   [19]  754     ld  entity_estado(ix), #0
   94E6 CD F4 83      [17]  755     call pintarEnemigo3
   94E9 DD 21 50 40   [14]  756     ld  ix, #enemyDerPos2
                            757     ;;call borrarEnemigo4
   94ED DD 36 00 48   [19]  758     ld  entity_x(ix), #72
   94F1 DD 36 01 88   [19]  759     ld  entity_y(ix), #0x88
   94F5 DD 36 04 00   [19]  760     ld  entity_estado(ix), #0
                            761     ;;call pintarEnemigo4
   94F9 DD 21 3B 40   [14]  762     ld ix, #enemyUp1Pos
   94FD CD 0C 46      [17]  763      call  borrarEnemigo5
   9500 DD 21 03 40   [14]  764      ld ix, #playerPos
   9504 DD 46 00      [19]  765     ld b, entity_x(ix)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 93.
Hexadecimal [16-Bits]



   9507 DD 21 3B 40   [14]  766     ld ix, #enemyUp1Pos
   950B DD 36 04 01   [19]  767      ld entity_estado(ix), #1
   950F DD 36 06 F0   [19]  768     ld entity_color(ix), #0xF0
   9513 DD 36 01 40   [19]  769     ld entity_y(ix), #0x40
                            770     
   9517 DD 70 00      [19]  771     ld entity_x(ix), b
   951A CD 4D 42      [17]  772     call  pintarEnemigo5
                            773     
   951D                     774     InicializarNivel5:
                            775     ;;ld entity_vy(ix), a
                            776     ;;ld    hl, #enemyUp2
                            777     ;;call entityman_create
                            778     ;;ld    hl, #enemyUp3
                            779     ;;call entityman_create
   951D 21 50 40      [10]  780     ld    hl, #enemyDerPos2
   9520 CD AA 41      [17]  781     call entityman_create
   9523 DD 21 57 8F   [14]  782     ld ix, #cargaNivel
   9527 DD 36 00 1E   [19]  783     ld 0(ix), #30
   952B DD 21 56 8F   [14]  784     ld ix, #nivelactual 
   952F DD 36 00 05   [19]  785     ld 0(ix), #5
                            786 
   9533 DD 21 18 40   [14]  787     ld ix, #wallDPos
   9537 DD 36 05 08   [19]  788     ld entity_vy(ix), #8
                            789 
                            790 
   953B 16 03         [ 7]  791     ld    d, #3         ;; D = Background PEN (0)
   953D 1E 01         [ 7]  792     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                            793 
   953F CD 88 B0      [17]  794    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                            795      ;; Calculate a video-memory location for printing a string
   9542 11 00 C0      [10]  796    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9545 06 30         [ 7]  797    ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   9547 0E 20         [ 7]  798    ld    c, #32                ;; C = x coordinate (16 = 0x10)
                            799 
   9549 CD 6C B0      [17]  800    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                            801 
                            802    ;; Print the string in video memory
                            803    ;; HL already points to video memory, as it is the return
                            804    ;; value from cpct_getScreenPtr_asm
   954C FD 21 35 8F   [14]  805    ld   iy, #Level4    ;; IY = Pointer to the string 
   9550 CD 63 AE      [17]  806    call cpct_drawStringM1_asm
                            807     
   9553 C3 3E 99      [10]  808     jp CargandoNivel
   9556                     809     nivel4:
   9556 DD 21 56 8F   [14]  810     ld ix, #nivelactual 
   955A DD 7E 00      [19]  811     ld a, 0(ix)
   955D D6 04         [ 7]  812     sub a, #4
   955F 20 76         [12]  813     jr nz, crearEntidadesNivel4
                            814     
   9561 DD 21 1F 40   [14]  815     ld  ix, #enemyPos 
   9565 CD BC 82      [17]  816     call borrarEnemigo1
   9568 DD 36 00 48   [19]  817     ld entity_x(ix), #72
   956C DD 36 04 00   [19]  818     ld  entity_estado(ix), #0
   9570 CD F6 7E      [17]  819     call pintarEnemigo1
   9573 DD 21 2D 40   [14]  820     ld  ix, #enemyIzqPos  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 94.
Hexadecimal [16-Bits]



   9577 CD B8 8C      [17]  821      call borrarEnemigo2
   957A DD 36 00 05   [19]  822     ld entity_x(ix), #5
   957E DD 36 04 00   [19]  823     ld  entity_estado(ix), #0
   9582 CD F2 88      [17]  824     call pintarEnemigo2
   9585 DD 21 34 40   [14]  825     ld  ix, #enemyIzqPos2
   9589 CD BA 87      [17]  826     call borrarEnemigo3
   958C DD 21 34 40   [14]  827     ld  ix, #enemyIzqPos2
   9590 DD 36 00 05   [19]  828     ld  entity_x(ix), #5
   9594 DD 36 04 00   [19]  829     ld  entity_estado(ix), #0
   9598 CD F4 83      [17]  830     call pintarEnemigo3
   959B DD 21 03 40   [14]  831     ld ix, #playerPos
   959F CD B1 7B      [17]  832     call borraPersonajePos0
   95A2 DD 36 00 1E   [19]  833     ld entity_x(ix), #30
   95A6 CD 2E 70      [17]  834     call pintarPersonajePos0
   95A9 DD 21 0A 40   [14]  835     ld ix, #espadaPos
   95AD DD 36 00 20   [19]  836     ld entity_x(ix), #32
                            837 
                            838     
   95B1 DD 21 3B 40   [14]  839      ld ix, #enemyUp1Pos
   95B5 CD 0C 46      [17]  840      call  borrarEnemigo5
   95B8 DD 21 03 40   [14]  841      ld ix, #playerPos
   95BC DD 46 00      [19]  842     ld b, entity_x(ix)
   95BF DD 21 3B 40   [14]  843     ld ix, #enemyUp1Pos
   95C3 DD 36 04 01   [19]  844      ld entity_estado(ix), #1
   95C7 DD 36 06 F0   [19]  845     ld entity_color(ix), #0xF0
   95CB DD 36 01 40   [19]  846     ld entity_y(ix), #0x40
                            847     
   95CF DD 70 00      [19]  848     ld entity_x(ix), b
   95D2 CD 4D 42      [17]  849     call  pintarEnemigo5
   95D5 18 40         [12]  850      jr InicializarNivel4
                            851 
                            852     
                            853     
   95D7                     854     crearEntidadesNivel4:
   95D7 21 21 8E      [10]  855     ld    hl, #enemyUp1
   95DA CD AA 41      [17]  856     call entityman_create
                            857     ;;ld ix, #playerPos
                            858     ;;ld a, entity_x(ix)
                            859     ;;ld b, entity_y(ix)
                            860     ;;ld ix, #enemyUp1
                            861     ;;ld entity_x(ix), a
                            862     ;;ld entity_y(ix), b
                            863     
   95DD DD 21 1F 40   [14]  864     ld  ix, #enemyPos 
   95E1 CD BC 82      [17]  865     call borrarEnemigo1
   95E4 DD 36 00 48   [19]  866     ld entity_x(ix), #72
   95E8 DD 36 04 00   [19]  867     ld  entity_estado(ix), #0
   95EC CD F6 7E      [17]  868     call pintarEnemigo1
   95EF DD 21 2D 40   [14]  869     ld  ix, #enemyIzqPos  
   95F3 CD B8 8C      [17]  870      call borrarEnemigo2
   95F6 DD 36 00 05   [19]  871     ld entity_x(ix), #5
   95FA DD 36 04 00   [19]  872     ld  entity_estado(ix), #0
   95FE CD F2 88      [17]  873     call pintarEnemigo2
   9601 DD 21 34 40   [14]  874     ld  ix, #enemyIzqPos2
   9605 CD BA 87      [17]  875     call borrarEnemigo3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 95.
Hexadecimal [16-Bits]



   9608 DD 21 34 40   [14]  876     ld  ix, #enemyIzqPos2
   960C DD 36 00 05   [19]  877     ld  entity_x(ix), #5
   9610 DD 36 04 00   [19]  878     ld  entity_estado(ix), #0
   9614 CD F4 83      [17]  879     call pintarEnemigo3
                            880 
   9617                     881     InicializarNivel4:
   9617 DD 21 18 40   [14]  882     ld ix, #wallDPos
   961B DD 36 05 06   [19]  883     ld entity_vy(ix), #6
   961F DD 21 57 8F   [14]  884     ld ix, #cargaNivel
   9623 DD 36 00 1E   [19]  885     ld 0(ix), #30
   9627 DD 21 56 8F   [14]  886     ld ix, #nivelactual 
   962B DD 36 00 04   [19]  887     ld 0(ix), #4
                            888 
   962F 16 03         [ 7]  889     ld    d, #3         ;; D = Background PEN (0)
   9631 1E 01         [ 7]  890     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                            891 
   9633 CD 88 B0      [17]  892    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                            893      ;; Calculate a video-memory location for printing a string
   9636 11 00 C0      [10]  894    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9639 06 30         [ 7]  895    ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   963B 0E 20         [ 7]  896    ld    c, #32                ;; C = x coordinate (16 = 0x10)
                            897 
   963D CD 6C B0      [17]  898    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                            899 
                            900    ;; Print the string in video memory
                            901    ;; HL already points to video memory, as it is the return
                            902    ;; value from cpct_getScreenPtr_asm
   9640 FD 21 2D 8F   [14]  903    ld   iy, #Level3    ;; IY = Pointer to the string 
   9644 CD 63 AE      [17]  904    call cpct_drawStringM1_asm
                            905     
   9647 C3 3E 99      [10]  906     jp CargandoNivel
                            907 
   964A                     908     nivel3:
   964A DD 21 56 8F   [14]  909     ld ix, #nivelactual 
   964E DD 7E 00      [19]  910     ld a, 0(ix)
   9651 D6 03         [ 7]  911     sub a, #3
   9653 20 52         [12]  912     jr nz, crearEntidadesNivel3
                            913     
   9655 DD 21 1F 40   [14]  914     ld  ix, #enemyPos 
   9659 CD BC 82      [17]  915     call borrarEnemigo1
   965C DD 36 00 48   [19]  916     ld entity_x(ix), #72
   9660 DD 36 04 00   [19]  917     ld  entity_estado(ix), #0
   9664 CD F6 7E      [17]  918     call pintarEnemigo1
   9667 DD 21 2D 40   [14]  919     ld  ix, #enemyIzqPos  
   966B CD B8 8C      [17]  920      call borrarEnemigo2
   966E DD 36 00 05   [19]  921     ld entity_x(ix), #5
   9672 DD 36 04 00   [19]  922     ld  entity_estado(ix), #0
   9676 CD F2 88      [17]  923     call pintarEnemigo2
   9679 DD 21 34 40   [14]  924     ld  ix, #enemyIzqPos2
   967D CD BA 87      [17]  925     call borrarEnemigo3
   9680 DD 21 34 40   [14]  926     ld  ix, #enemyIzqPos2
   9684 DD 36 00 05   [19]  927     ld  entity_x(ix), #5
   9688 DD 36 04 00   [19]  928     ld  entity_estado(ix), #0
   968C CD F4 83      [17]  929     call pintarEnemigo3
   968F DD 21 03 40   [14]  930     ld ix, #playerPos
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 96.
Hexadecimal [16-Bits]



   9693 CD B1 7B      [17]  931     call borraPersonajePos0
   9696 DD 36 00 1E   [19]  932     ld entity_x(ix), #30
   969A CD 2E 70      [17]  933     call pintarPersonajePos0
   969D DD 21 0A 40   [14]  934     ld ix, #espadaPos
   96A1 DD 36 00 20   [19]  935     ld entity_x(ix), #32
   96A5 18 30         [12]  936      jr InicializarNivel3
                            937     ;;inc a
                            938     ;;inc a 
                            939     ;;inc a 
                            940     ;;inc a 
                            941     ;;inc a 
                            942     ;;ld entity_vy(ix), a
                            943 
                            944     
                            945 
                            946     ;ld ix, #wallDPos
                            947     ;ld a, entity_x(ix)
                            948     ;dec a
                            949     ;dec a
                            950     ;jr z, crearEntidadDerecha
                            951 
                            952     ;ld    hl, #enemyIzq2
                            953     ;call  entityman_create
                            954     ;ld    hl, #enemyDer2
                            955     ;call  entityman_create
                            956     ;jr nivelcomenzado
                            957 
   96A7                     958     crearEntidadesNivel3:
   96A7 21 44 8E      [10]  959     ld    hl, #enemyIzq2
   96AA CD AA 41      [17]  960     call  entityman_create
   96AD CD AA 41      [17]  961      call  entityman_create
   96B0 CD F4 83      [17]  962     call pintarEnemigo3
   96B3 DD 21 1F 40   [14]  963     ld  ix, #enemyPos 
   96B7 CD BC 82      [17]  964     call borrarEnemigo1
   96BA DD 36 00 48   [19]  965     ld entity_x(ix), #72
   96BE DD 36 04 00   [19]  966     ld  entity_estado(ix), #0
   96C2 CD F6 7E      [17]  967     call pintarEnemigo1
   96C5 DD 21 2D 40   [14]  968     ld  ix, #enemyIzqPos  
   96C9 CD B8 8C      [17]  969      call borrarEnemigo2
   96CC DD 36 00 05   [19]  970     ld entity_x(ix), #5
   96D0 DD 36 04 00   [19]  971     ld  entity_estado(ix), #0
   96D4 CD F2 88      [17]  972     call pintarEnemigo2
                            973 
   96D7                     974     InicializarNivel3:
                            975 
   96D7 DD 21 18 40   [14]  976     ld ix, #wallDPos
   96DB DD 36 05 04   [19]  977     ld entity_vy(ix), #4
   96DF DD 21 57 8F   [14]  978     ld ix, #cargaNivel
   96E3 DD 36 00 1E   [19]  979     ld 0(ix), #30
   96E7 DD 21 56 8F   [14]  980     ld ix, #nivelactual 
   96EB DD 36 00 03   [19]  981     ld 0(ix), #3
                            982     ;ld    hl, #enemyDer2
                            983     ;call  entityman_create
                            984 
   96EF 16 03         [ 7]  985     ld    d, #3         ;; D = Background PEN (0)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 97.
Hexadecimal [16-Bits]



   96F1 1E 01         [ 7]  986     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                            987 
   96F3 CD 88 B0      [17]  988    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                            989      ;; Calculate a video-memory location for printing a string
   96F6 11 00 C0      [10]  990    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   96F9 06 30         [ 7]  991    ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   96FB 0E 20         [ 7]  992    ld    c, #32                ;; C = x coordinate (16 = 0x10)
                            993 
   96FD CD 6C B0      [17]  994    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                            995 
                            996    ;; Print the string in video memory
                            997    ;; HL already points to video memory, as it is the return
                            998    ;; value from cpct_getScreenPtr_asm
   9700 FD 21 25 8F   [14]  999    ld   iy, #Level2    ;; IY = Pointer to the string 
   9704 CD 63 AE      [17] 1000    call cpct_drawStringM1_asm
                           1001 
   9707 C3 3E 99      [10] 1002     jp CargandoNivel
                           1003 
   970A                    1004     nivel2:
                           1005      
   970A DD 21 56 8F   [14] 1006     ld ix, #nivelactual 
   970E DD 7E 00      [19] 1007     ld a, 0(ix)
   9711 3D            [ 4] 1008     dec a 
   9712 3D            [ 4] 1009     dec a
   9713 20 36         [12] 1010     jr nz, crearEntidadesNivel2
   9715 DD 21 1F 40   [14] 1011     ld  ix, #enemyPos 
   9719 CD BC 82      [17] 1012     call borrarEnemigo1
   971C DD 21 1F 40   [14] 1013     ld  ix, #enemyPos  
   9720 DD 36 00 48   [19] 1014      ld entity_x(ix), #72
   9724 DD 36 04 00   [19] 1015      ld  entity_estado(ix), #0
   9728 DD 21 2D 40   [14] 1016      ld  ix, #enemyIzqPos  
   972C CD B8 8C      [17] 1017      call borrarEnemigo2
   972F DD 36 00 05   [19] 1018     ld entity_x(ix), #5
   9733 DD 21 03 40   [14] 1019     ld ix, #playerPos
   9737 CD B1 7B      [17] 1020     call borraPersonajePos0
   973A DD 36 00 1E   [19] 1021     ld entity_x(ix), #30
   973E CD 2E 70      [17] 1022     call pintarPersonajePos0
   9741 DD 21 0A 40   [14] 1023     ld ix, #espadaPos
   9745 DD 36 00 20   [19] 1024     ld entity_x(ix), #32
   9749 18 0D         [12] 1025      jr InicializarNivel2
   974B                    1026     crearEntidadesNivel2:
   974B DD 36 00 02   [19] 1027     ld 0(ix), #2
   974F 21 1A 8E      [10] 1028     ld    hl, #enemyIzq
   9752 CD AA 41      [17] 1029     call  entityman_create
   9755 CD F2 88      [17] 1030     call pintarEnemigo2
                           1031     
                           1032    
   9758                    1033     InicializarNivel2:
   9758 16 03         [ 7] 1034     ld    d, #3         ;; D = Background PEN (0)
   975A 1E 01         [ 7] 1035     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1036 
   975C CD 88 B0      [17] 1037    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1038      ;; Calculate a video-memory location for printing a string
   975F 11 00 C0      [10] 1039    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9762 06 30         [ 7] 1040    ld    b, #48                  ;; B = y coordinate (24 = 0x18)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 98.
Hexadecimal [16-Bits]



   9764 0E 20         [ 7] 1041    ld    c, #32                ;; C = x coordinate (16 = 0x10)
                           1042 
   9766 CD 6C B0      [17] 1043    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1044 
                           1045    ;; Print the string in video memory
                           1046    ;; HL already points to video memory, as it is the return
                           1047    ;; value from cpct_getScreenPtr_asm
   9769 FD 21 1D 8F   [14] 1048    ld   iy, #Level1    ;; IY = Pointer to the string 
   976D CD 63 AE      [17] 1049    call cpct_drawStringM1_asm
                           1050    
                           1051 
   9770 DD 21 1F 40   [14] 1052     ld  ix, #enemyPos 
   9774 CD BC 82      [17] 1053     call borrarEnemigo1
   9777 DD 21 1F 40   [14] 1054     ld  ix, #enemyPos  
   977B DD 36 00 48   [19] 1055      ld entity_x(ix), #72
   977F DD 36 04 00   [19] 1056      ld  entity_estado(ix), #0
   9783 CD F6 7E      [17] 1057      call pintarEnemigo1
                           1058 
   9786 DD 21 57 8F   [14] 1059     ld ix, #cargaNivel
   978A DD 36 00 1E   [19] 1060     ld 0(ix), #30
   978E DD 21 18 40   [14] 1061     ld ix, #wallDPos
   9792 DD 36 05 03   [19] 1062     ld entity_vy(ix), #3
   9796 DD 21 56 8F   [14] 1063     ld ix, #nivelactual 
   979A DD 36 00 02   [19] 1064     ld 0(ix), #2
                           1065     ;;inc a
                           1066     ;;inc a
                           1067     ;;inc a
                           1068     ;;ld entity_vy(ix), a
                           1069 
   979E C3 3E 99      [10] 1070     jp CargandoNivel
                           1071     
   97A1                    1072     nivel1:
                           1073     
   97A1 DD 21 18 40   [14] 1074     ld ix, #wallDPos
                           1075 
                           1076     ;;incrementa las entidades que se necesitan matar
   97A5 DD 7E 05      [19] 1077     ld a, entity_vy(ix)
                           1078     ;inc a
                           1079     ;inc a
   97A8 DD 77 05      [19] 1080     ld entity_vy(ix), a
                           1081 
                           1082     ;;incrementa el nivel
                           1083     
                           1084 
                           1085 
   97AB                    1086     nivelcomenzado:
                           1087 
                           1088     ;;call  entityman_getEntityArray_IX
                           1089     ;;call  entityman_getNumEntities_A
                           1090     ;;call  rendersys_update
                           1091 
   97AB                    1092     nocambiarnivel:
                           1093 
   97AB CD 9D 48      [17] 1094     call CompruebaNivel  ;;devuelve en a el nivel actual
                           1095 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 99.
Hexadecimal [16-Bits]



   97AE 3D            [ 4] 1096     dec a
   97AF 28 18         [12] 1097     jr z, actualizarEnemigosNivel1
   97B1 3D            [ 4] 1098     dec a
   97B2 CA 18 99      [10] 1099     jp z, actualizarEnemigosNivel2
   97B5 3D            [ 4] 1100     dec a
   97B6 CA 1D 99      [10] 1101     jp z, actualizarEnemigosNivel3
   97B9 3D            [ 4] 1102     dec a
   97BA CA 22 99      [10] 1103     jp z, actualizarEnemigosNivel4
   97BD 3D            [ 4] 1104     dec a
   97BE CA 27 99      [10] 1105     jp z, actualizarEnemigosNivel5
   97C1 3D            [ 4] 1106     dec a
   97C2 CA 2C 99      [10] 1107     jp z, actualizarEnemigosNivel6
   97C5 3D            [ 4] 1108     dec a
   97C6 CA 31 99      [10] 1109     jp z, actualizarEnemigosNivel7
                           1110 
   97C9                    1111     actualizarEnemigosNivel1:
   97C9 DD 21 5F 8F   [14] 1112     ld ix, #Inicio
   97CD DD 35 00      [23] 1113     dec 0(ix)
   97D0 CA 89 98      [10] 1114     jp z, actualNiv1
   97D3 DD 35 01      [23] 1115     dec 1(ix)
   97D6 C2 86 98      [10] 1116     jp nz, NopintarControles
   97D9 DD 35 02      [23] 1117     dec 2(ix)
   97DC 28 30         [12] 1118     jr z, pintarControles
   97DE 16 00         [ 7] 1119     ld    d, #0         ;; D = Background PEN (0)
   97E0 1E 00         [ 7] 1120     ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1121 
   97E2 CD 88 B0      [17] 1122    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1123      ;; Calculate a video-memory location for printing a string
   97E5 11 00 C0      [10] 1124    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   97E8 06 18         [ 7] 1125    ld    b, #24                  ;; B = y coordinate (24 = 0x18)
   97EA 0E 07         [ 7] 1126    ld    c, #7                ;; C = x coordinate (16 = 0x10)
                           1127 
   97EC CD 6C B0      [17] 1128    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1129 
                           1130    ;; Print the string in video memory
                           1131    ;; HL already points to video memory, as it is the return
                           1132    ;; value from cpct_getScreenPtr_asm
   97EF FD 21 59 8E   [14] 1133    ld   iy, #FraseIni1    ;; IY = Pointer to the string 
                           1134    
   97F3 CD 63 AE      [17] 1135    call cpct_drawStringM1_asm
                           1136 
   97F6 16 00         [ 7] 1137    ld    d, #0         ;; D = Background PEN (0)
   97F8 1E 00         [ 7] 1138     ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1139 
   97FA CD 88 B0      [17] 1140    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1141      ;; Calculate a video-memory location for printing a string
   97FD 11 00 C0      [10] 1142    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9800 06 20         [ 7] 1143    ld    b, #32                  ;; B = y coordinate (24 = 0x18)
   9802 0E 07         [ 7] 1144    ld    c, #7                  ;; C = x coordinate (16 = 0x10)
                           1145 
   9804 CD 6C B0      [17] 1146    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1147 
                           1148    ;; Print the string in video memory
                           1149    ;; HL already points to video memory, as it is the return
                           1150    ;; value from cpct_getScreenPtr_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 100.
Hexadecimal [16-Bits]



   9807 FD 21 7B 8E   [14] 1151    ld   iy, #FraseIni2    ;; IY = Pointer to the string 
                           1152    
   980B CD 63 AE      [17] 1153    call cpct_drawStringM1_asm
                           1154 
                           1155    ;;PINTAR---------------------------------------------------------------
   980E                    1156     pintarControles:
   980E 16 00         [ 7] 1157     ld    d, #0         ;; D = Background PEN (0)
   9810 1E 01         [ 7] 1158     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1159 
   9812 CD 88 B0      [17] 1160    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1161      ;; Calculate a video-memory location for printing a string
   9815 11 00 C0      [10] 1162    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9818 06 18         [ 7] 1163    ld    b, #24                  ;; B = y coordinate (24 = 0x18)
   981A 0E 07         [ 7] 1164    ld    c, #7                ;; C = x coordinate (16 = 0x10)
                           1165 
   981C CD 6C B0      [17] 1166    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1167 
                           1168    ;; Print the string in video memory
                           1169    ;; HL already points to video memory, as it is the return
                           1170    ;; value from cpct_getScreenPtr_asm
   981F FD 21 9E 8E   [14] 1171    ld   iy, #Controls1    ;; IY = Pointer to the string 
                           1172    
   9823 CD 63 AE      [17] 1173    call cpct_drawStringM1_asm
                           1174 
   9826 16 00         [ 7] 1175    ld    d, #0         ;; D = Background PEN (0)
   9828 1E 01         [ 7] 1176     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1177 
   982A CD 88 B0      [17] 1178    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1179      ;; Calculate a video-memory location for printing a string
   982D 11 00 C0      [10] 1180    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9830 06 20         [ 7] 1181    ld    b, #32                  ;; B = y coordinate (24 = 0x18)
   9832 0E 07         [ 7] 1182    ld    c, #7                  ;; C = x coordinate (16 = 0x10)
                           1183 
   9834 CD 6C B0      [17] 1184    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1185 
                           1186    ;; Print the string in video memory
                           1187    ;; HL already points to video memory, as it is the return
                           1188    ;; value from cpct_getScreenPtr_asm
   9837 FD 21 C0 8E   [14] 1189    ld   iy, #Controls2    ;; IY = Pointer to the string 
                           1190    
   983B CD 63 AE      [17] 1191    call cpct_drawStringM1_asm
                           1192 
   983E 16 00         [ 7] 1193    ld    d, #0         ;; D = Background PEN (0)
   9840 1E 01         [ 7] 1194     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1195 
   9842 CD 88 B0      [17] 1196    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1197      ;; Calculate a video-memory location for printing a string
   9845 11 00 C0      [10] 1198    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9848 06 28         [ 7] 1199    ld    b, #40                  ;; B = y coordinate (24 = 0x18)
   984A 0E 07         [ 7] 1200    ld    c, #7                ;; C = x coordinate (16 = 0x10)
                           1201 
   984C CD 6C B0      [17] 1202    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1203 
                           1204    ;; Print the string in video memory
                           1205    ;; HL already points to video memory, as it is the return
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 101.
Hexadecimal [16-Bits]



                           1206    ;; value from cpct_getScreenPtr_asm
   984F FD 21 DB 8E   [14] 1207    ld   iy, #Controls3    ;; IY = Pointer to the string 
                           1208    
   9853 CD 63 AE      [17] 1209    call cpct_drawStringM1_asm
                           1210 
   9856 16 00         [ 7] 1211    ld    d, #0         ;; D = Background PEN (0)
   9858 1E 01         [ 7] 1212     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1213 
   985A CD 88 B0      [17] 1214    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1215      ;; Calculate a video-memory location for printing a string
   985D 11 00 C0      [10] 1216    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9860 06 30         [ 7] 1217    ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   9862 0E 07         [ 7] 1218    ld    c, #7                  ;; C = x coordinate (16 = 0x10)
                           1219 
   9864 CD 6C B0      [17] 1220    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1221 
                           1222    ;; Print the string in video memory
                           1223    ;; HL already points to video memory, as it is the return
                           1224    ;; value from cpct_getScreenPtr_asm
   9867 FD 21 F0 8E   [14] 1225    ld   iy, #Controls4    ;; IY = Pointer to the string 
   986B CD 63 AE      [17] 1226    call cpct_drawStringM1_asm
   986E 16 00         [ 7] 1227    ld    d, #0         ;; D = Background PEN (0)
   9870 1E 01         [ 7] 1228     ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1229 
   9872 CD 88 B0      [17] 1230    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1231      ;; Calculate a video-memory location for printing a string
   9875 11 00 C0      [10] 1232    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9878 06 48         [ 7] 1233    ld    b, #72                  ;; B = y coordinate (24 = 0x18)
   987A 0E 1E         [ 7] 1234    ld    c, #30                  ;; C = x coordinate (16 = 0x10)
                           1235 
   987C CD 6C B0      [17] 1236    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1237 
                           1238    ;; Print the string in video memory
                           1239    ;; HL already points to video memory, as it is the return
                           1240    ;; value from cpct_getScreenPtr_asm
   987F FD 21 12 8F   [14] 1241    ld   iy, #Controls5    ;; IY = Pointer to the string 
                           1242    
   9883 CD 63 AE      [17] 1243    call cpct_drawStringM1_asm
   9886                    1244     NopintarControles:
   9886 C3 16 99      [10] 1245     jp noActualizar
   9889                    1246     actualNiv1:
   9889 DD 34 00      [23] 1247     inc 0(ix)
   988C DD 21 55 8F   [14] 1248     ld ix, #letrasborradas
   9890 DD 7E 00      [19] 1249     ld a, 0(ix)
   9893 3D            [ 4] 1250     dec a
   9894 CA 13 99      [10] 1251     jp z, letrasBorradas
   9897 DD 36 00 01   [19] 1252     ld 0(ix), #1
                           1253     ;;BORRAMOS LAS LETRAS
   989B 16 00         [ 7] 1254     ld    d, #0         ;; D = Background PEN (0)
   989D 1E 00         [ 7] 1255     ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1256 
   989F CD 88 B0      [17] 1257    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1258      ;; Calculate a video-memory location for printing a string
   98A2 11 00 C0      [10] 1259    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   98A5 06 18         [ 7] 1260    ld    b, #24                  ;; B = y coordinate (24 = 0x18)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 102.
Hexadecimal [16-Bits]



   98A7 0E 07         [ 7] 1261    ld    c, #7                ;; C = x coordinate (16 = 0x10)
                           1262 
   98A9 CD 6C B0      [17] 1263    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1264 
                           1265    ;; Print the string in video memory
                           1266    ;; HL already points to video memory, as it is the return
                           1267    ;; value from cpct_getScreenPtr_asm
   98AC FD 21 9E 8E   [14] 1268    ld   iy, #Controls1    ;; IY = Pointer to the string 
                           1269    
   98B0 CD 63 AE      [17] 1270    call cpct_drawStringM1_asm
                           1271 
   98B3 16 00         [ 7] 1272    ld    d, #0         ;; D = Background PEN (0)
   98B5 1E 00         [ 7] 1273     ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1274 
   98B7 CD 88 B0      [17] 1275    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1276      ;; Calculate a video-memory location for printing a string
   98BA 11 00 C0      [10] 1277    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   98BD 06 20         [ 7] 1278    ld    b, #32                  ;; B = y coordinate (24 = 0x18)
   98BF 0E 07         [ 7] 1279    ld    c, #7                  ;; C = x coordinate (16 = 0x10)
                           1280 
   98C1 CD 6C B0      [17] 1281    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1282 
                           1283    ;; Print the string in video memory
                           1284    ;; HL already points to video memory, as it is the return
                           1285    ;; value from cpct_getScreenPtr_asm
   98C4 FD 21 C0 8E   [14] 1286    ld   iy, #Controls2    ;; IY = Pointer to the string 
                           1287    
   98C8 CD 63 AE      [17] 1288    call cpct_drawStringM1_asm
                           1289 
   98CB 16 00         [ 7] 1290    ld    d, #0         ;; D = Background PEN (0)
   98CD 1E 00         [ 7] 1291     ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1292 
   98CF CD 88 B0      [17] 1293    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1294      ;; Calculate a video-memory location for printing a string
   98D2 11 00 C0      [10] 1295    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   98D5 06 28         [ 7] 1296    ld    b, #40                  ;; B = y coordinate (24 = 0x18)
   98D7 0E 07         [ 7] 1297    ld    c, #7                ;; C = x coordinate (16 = 0x10)
                           1298 
   98D9 CD 6C B0      [17] 1299    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1300 
                           1301    ;; Print the string in video memory
                           1302    ;; HL already points to video memory, as it is the return
                           1303    ;; value from cpct_getScreenPtr_asm
   98DC FD 21 DB 8E   [14] 1304    ld   iy, #Controls3    ;; IY = Pointer to the string 
                           1305    
   98E0 CD 63 AE      [17] 1306    call cpct_drawStringM1_asm
                           1307 
   98E3 16 00         [ 7] 1308    ld    d, #0         ;; D = Background PEN (0)
   98E5 1E 00         [ 7] 1309     ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1310 
   98E7 CD 88 B0      [17] 1311    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1312      ;; Calculate a video-memory location for printing a string
   98EA 11 00 C0      [10] 1313    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   98ED 06 30         [ 7] 1314    ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   98EF 0E 07         [ 7] 1315    ld    c, #7                  ;; C = x coordinate (16 = 0x10)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 103.
Hexadecimal [16-Bits]



                           1316 
   98F1 CD 6C B0      [17] 1317    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1318 
                           1319    ;; Print the string in video memory
                           1320    ;; HL already points to video memory, as it is the return
                           1321    ;; value from cpct_getScreenPtr_asm
   98F4 FD 21 F0 8E   [14] 1322    ld   iy, #Controls4    ;; IY = Pointer to the string 
   98F8 CD 63 AE      [17] 1323    call cpct_drawStringM1_asm
   98FB 16 00         [ 7] 1324    ld    d, #0         ;; D = Background PEN (0)
   98FD 1E 00         [ 7] 1325     ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1326 
   98FF CD 88 B0      [17] 1327    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1328      ;; Calculate a video-memory location for printing a string
   9902 11 00 C0      [10] 1329    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9905 06 48         [ 7] 1330    ld    b, #72                  ;; B = y coordinate (24 = 0x18)
   9907 0E 1E         [ 7] 1331    ld    c, #30                  ;; C = x coordinate (16 = 0x10)
                           1332 
   9909 CD 6C B0      [17] 1333    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1334 
                           1335    ;; Print the string in video memory
                           1336    ;; HL already points to video memory, as it is the return
                           1337    ;; value from cpct_getScreenPtr_asm
   990C FD 21 12 8F   [14] 1338    ld   iy, #Controls5    ;; IY = Pointer to the string 
                           1339    
   9910 CD 63 AE      [17] 1340    call cpct_drawStringM1_asm
   9913                    1341    letrasBorradas:
   9913 CD 76 4D      [17] 1342     call actualizarEnemigos1
   9916                    1343     noActualizar:
   9916 18 4B         [12] 1344     jr seguirmovimientoPersonaje
                           1345 
   9918                    1346     actualizarEnemigosNivel2:
   9918 CD A2 4D      [17] 1347     call actualizarEnemigos2
   991B 18 46         [12] 1348     jr seguirmovimientoPersonaje
                           1349 
   991D                    1350     actualizarEnemigosNivel3:
   991D CD F9 4D      [17] 1351     call actualizarEnemigos3
   9920 18 41         [12] 1352     jr seguirmovimientoPersonaje
                           1353 
   9922                    1354     actualizarEnemigosNivel4:
   9922 CD 70 4E      [17] 1355     call actualizarEnemigos4
   9925 18 3C         [12] 1356     jr seguirmovimientoPersonaje
                           1357 
   9927                    1358     actualizarEnemigosNivel5:
   9927 CD EE 4E      [17] 1359     call actualizarEnemigos5
   992A 18 37         [12] 1360     jr seguirmovimientoPersonaje
                           1361 
   992C                    1362     actualizarEnemigosNivel6:
   992C CD 3C 50      [17] 1363     call actualizarEnemigos6
   992F 18 32         [12] 1364     jr seguirmovimientoPersonaje
                           1365 
   9931                    1366     actualizarEnemigosNivel7:
   9931 CD AA 51      [17] 1367     call actualizarEnemigos7
   9934 DD 21 18 40   [14] 1368     ld ix, #wallDPos
   9938 DD 36 05 BE   [19] 1369     ld entity_vy(ix), #190  ;;ponemos infinito el numero de enemigos a vencer
   993C 18 25         [12] 1370     jr seguirmovimientoPersonaje
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 104.
Hexadecimal [16-Bits]



                           1371 
   993E                    1372     CargandoNivel:
   993E DD 21 57 8F   [14] 1373     ld ix, #cargaNivel
   9942 DD 35 00      [23] 1374     dec 0(ix)
   9945 DD 7E 00      [19] 1375     ld a, 0(ix)
   9948 3D            [ 4] 1376     dec a
   9949 20 18         [12] 1377     jr nz, seguirmovimientoPersonaje
   994B 16 00         [ 7] 1378     ld    d, #0        ;; D = Background PEN (0)
   994D 1E 00         [ 7] 1379     ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor
                           1380 
   994F CD 88 B0      [17] 1381    call cpct_setDrawCharM1_asm   ;; Set draw char colours
                           1382      ;; Calculate a video-memory location for printing a string
   9952 11 00 C0      [10] 1383    ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   9955 06 30         [ 7] 1384    ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   9957 0E 20         [ 7] 1385    ld    c, #32                ;; C = x coordinate (16 = 0x10)
                           1386 
   9959 CD 6C B0      [17] 1387    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                           1388 
                           1389    ;; Print the string in video memory
                           1390    ;; HL already points to video memory, as it is the return
                           1391    ;; value from cpct_getScreenPtr_asm
   995C FD 21 45 8F   [14] 1392    ld   iy, #Level6    ;; IY = Pointer to the string 
   9960 CD 63 AE      [17] 1393    call cpct_drawStringM1_asm
                           1394 
   9963                    1395     seguirmovimientoPersonaje:
                           1396     
                           1397 
   9963                    1398     pulsaD:
   9963 CD DA AD      [17] 1399     call  cpct_scanKeyboard_f_asm
   9966 21 07 20      [10] 1400     ld  hl, #Key_D
   9969 CD 44 AE      [17] 1401     call cpct_isKeyPressed_asm
   996C CA 44 9A      [10] 1402     jp z, pulsaA
                           1403 
                           1404     ;;Comprobamos si choca con el muro de la derecha
   996F DD 21 03 40   [14] 1405     ld  ix, #playerPos  ;;(player)
   9973 DD 7E 00      [19] 1406     ld  a, entity_x(ix)
   9976 DD 21 18 40   [14] 1407     ld  ix, #wallDPos  ;;(wallD)
   997A DD 46 00      [19] 1408     ld  b, entity_x(ix)
   997D 3C            [ 4] 1409     inc a   ;;incremento a para que choque cuando coincide el principo del cuadrado (misma X menos dos)
   997E 3C            [ 4] 1410     inc a
   997F 3C            [ 4] 1411     inc a 
   9980 3C            [ 4] 1412     inc a 
   9981 3C            [ 4] 1413     inc a 
   9982 3C            [ 4] 1414     inc a 
   9983 3C            [ 4] 1415     inc a
   9984 3C            [ 4] 1416     inc a 
   9985                    1417     restaAZ:
   9985 3D            [ 4] 1418     dec a
   9986 20 06         [12] 1419     jr  nz, restaBZ
   9988 05            [ 4] 1420     dec b
   9989 20 06         [12] 1421     jr  nz, pintarMovimientoDerecha
   998B C3 D8 99      [10] 1422     jp  sigue
   998E                    1423     restaBZ:
   998E 05            [ 4] 1424     dec b    
   998F 20 F4         [12] 1425     jr  nz,  restaAZ
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 105.
Hexadecimal [16-Bits]



                           1426     ;;------------
                           1427 
   9991                    1428     pintarMovimientoDerecha:
   9991 DD 21 03 40   [14] 1429     ld ix, #playerPos
   9995 DD 36 06 00   [19] 1430     ld  entity_color(ix), #0x00
   9999 CD A1 41      [17] 1431     call  entityman_getEntityArray_IX
   999C CD A6 41      [17] 1432     call  entityman_getNumEntities_A
   999F CD B1 7B      [17] 1433     call borraPersonajePos0
   99A2 DD 21 03 40   [14] 1434     ld ix, #playerPos
   99A6 DD 36 06 FF   [19] 1435     ld  entity_color(ix), #0xFF
   99AA DD 7E 00      [19] 1436     ld a, entity_x(ix)
   99AD 3C            [ 4] 1437     inc a
   99AE DD 77 00      [19] 1438     ld  entity_x(ix),a
   99B1 CD A1 41      [17] 1439     call  entityman_getEntityArray_IX
   99B4 CD A6 41      [17] 1440     call  entityman_getNumEntities_A
   99B7 CD 2E 70      [17] 1441     call  pintarPersonajePos0
                           1442     
                           1443 
   99BA DD 21 03 40   [14] 1444     ld  ix, #playerPos  ;;(player)
   99BE DD 7E 00      [19] 1445     ld  a, entity_x(ix)
   99C1 DD 21 1F 40   [14] 1446     ld  ix, #enemyPos  ;;(enemy)
   99C5 DD 46 00      [19] 1447     ld  b, entity_x(ix)
   99C8 3C            [ 4] 1448     inc a   ;;incremento a para que choque cuando coincide la mitad del cuadrado (misma X menos uno)
   99C9                    1449     restaAZ3:
   99C9 3D            [ 4] 1450     dec a
   99CA 20 06         [12] 1451     jr  nz, restaBZ3
   99CC 05            [ 4] 1452     dec b
   99CD 20 06         [12] 1453     jr  nz, siguePintando
   99CF C3 EA 9B      [10] 1454     jp  colision
   99D2                    1455     restaBZ3:
   99D2 05            [ 4] 1456     dec b    
   99D3 20 F4         [12] 1457     jr  nz,  restaAZ3
                           1458 
   99D5                    1459     siguePintando:
   99D5 CD A0 7E      [17] 1460     call mueveEspadaDerecha
   99D8                    1461     sigue:
                           1462     
                           1463     
                           1464     
                           1465     ;ld a, #20
                           1466    ;esperaD:
                           1467    ;push af
                           1468    ;call ataqueEspada
                           1469    ;halt
                           1470    ;pop af
                           1471    ;dec a
                           1472    ;jr nz, esperaD
   99D8 76            [ 4] 1473    halt 
   99D9 76            [ 4] 1474     halt
   99DA CD A1 7D      [17] 1475     call ataqueEspada
   99DD 76            [ 4] 1476     halt
   99DE CD A1 7D      [17] 1477     call ataqueEspada
   99E1 CD 81 AF      [17] 1478     call cpct_waitVSYNC_asm
   99E4 CD A1 7D      [17] 1479     call ataqueEspada
   99E7 76            [ 4] 1480     halt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 106.
Hexadecimal [16-Bits]



   99E8 CD A1 7D      [17] 1481     call ataqueEspada
   99EB 76            [ 4] 1482     halt
   99EC CD A1 7D      [17] 1483     call ataqueEspada
   99EF 76            [ 4] 1484     halt
   99F0 CD A1 7D      [17] 1485     call ataqueEspada
   99F3 CD 81 AF      [17] 1486     call cpct_waitVSYNC_asm
   99F6 CD A1 7D      [17] 1487     call ataqueEspada
   99F9 76            [ 4] 1488     halt
   99FA CD A1 7D      [17] 1489     call ataqueEspada 
   99FD 76            [ 4] 1490     halt
   99FE CD A1 7D      [17] 1491     call ataqueEspada
   9A01 76            [ 4] 1492     halt
   9A02 CD A1 7D      [17] 1493     call ataqueEspada
   9A05 CD 81 AF      [17] 1494     call cpct_waitVSYNC_asm
   9A08 CD A1 7D      [17] 1495     call ataqueEspada
   9A0B 76            [ 4] 1496     halt
   9A0C CD A1 7D      [17] 1497     call ataqueEspada 
   9A0F 76            [ 4] 1498     halt
   9A10 CD A1 7D      [17] 1499     call ataqueEspada
   9A13 76            [ 4] 1500     halt
   9A14 CD A1 7D      [17] 1501     call ataqueEspada
   9A17 CD 81 AF      [17] 1502     call cpct_waitVSYNC_asm
   9A1A CD A1 7D      [17] 1503     call ataqueEspada
   9A1D 76            [ 4] 1504     halt 
   9A1E CD A1 7D      [17] 1505     call ataqueEspada
   9A21 76            [ 4] 1506     halt
   9A22 CD A1 7D      [17] 1507     call ataqueEspada
   9A25 76            [ 4] 1508     halt
   9A26 CD A1 7D      [17] 1509     call ataqueEspada
   9A29 CD 81 AF      [17] 1510     call cpct_waitVSYNC_asm
   9A2C CD A1 7D      [17] 1511     call ataqueEspada
   9A2F 76            [ 4] 1512     halt
   9A30 CD A1 7D      [17] 1513     call ataqueEspada 
   9A33 76            [ 4] 1514     halt
   9A34 CD A1 7D      [17] 1515     call ataqueEspada
   9A37 76            [ 4] 1516     halt
   9A38 CD A1 7D      [17] 1517     call ataqueEspada
   9A3B CD 81 AF      [17] 1518     call cpct_waitVSYNC_asm
   9A3E CD A1 7D      [17] 1519     call ataqueEspada
   9A41 C3 EB 8F      [10] 1520    jp   moverPersonaje
                           1521 
   9A44                    1522     pulsaA:
   9A44 CD DA AD      [17] 1523     call  cpct_scanKeyboard_f_asm
   9A47 21 08 20      [10] 1524     ld  hl, #Key_A
   9A4A CD 44 AE      [17] 1525     call cpct_isKeyPressed_asm
   9A4D CA 76 9B      [10] 1526     jp z, pulsaW
                           1527 
                           1528     ;;Comprobamos si choca con el muro de la izquierda
   9A50 DD 21 03 40   [14] 1529     ld  ix, #playerPos  ;;(player)
   9A54 DD 7E 00      [19] 1530     ld  a, entity_x(ix)
   9A57 DD 21 11 40   [14] 1531     ld  ix, #wallIPos  ;;(wallI)
   9A5B DD 46 00      [19] 1532     ld  b, entity_x(ix)
   9A5E 3D            [ 4] 1533     dec a
   9A5F 3D            [ 4] 1534     dec a   ;;decremento a para que choque cuando coincide el principo del cuadrado (misma X menos dos)
   9A60 3D            [ 4] 1535     dec a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 107.
Hexadecimal [16-Bits]



   9A61 3D            [ 4] 1536     dec a 
   9A62 3D            [ 4] 1537     dec a
   9A63 3D            [ 4] 1538     dec a
   9A64 3D            [ 4] 1539     dec a 
   9A65 3D            [ 4] 1540     dec a
   9A66                    1541     restaAZ2:
   9A66 3D            [ 4] 1542     dec a
   9A67 20 06         [12] 1543     jr  nz, restaBZ2
   9A69 05            [ 4] 1544     dec b
   9A6A 20 06         [12] 1545     jr  nz, pintarMovimientoIzquierda
   9A6C C3 9E 9A      [10] 1546     jp  sigue2
   9A6F                    1547     restaBZ2:
   9A6F 05            [ 4] 1548     dec b    
   9A70 20 F4         [12] 1549     jr  nz,  restaAZ2
                           1550     ;;----------------------
                           1551 
   9A72                    1552     pintarMovimientoIzquierda:
   9A72 DD 21 03 40   [14] 1553     ld ix, #playerPos
   9A76 DD 36 06 00   [19] 1554     ld  entity_color(ix), #0x00
   9A7A CD A1 41      [17] 1555     call  entityman_getEntityArray_IX
   9A7D CD A6 41      [17] 1556     call  entityman_getNumEntities_A
                           1557     ;;call  rendersys_update
   9A80 CD B1 7B      [17] 1558     call borraPersonajePos0
   9A83 DD 21 03 40   [14] 1559     ld ix, #playerPos
   9A87 DD 36 06 FF   [19] 1560     ld  entity_color(ix), #0xFF
   9A8B DD 7E 00      [19] 1561     ld a, entity_x(ix)
   9A8E 3D            [ 4] 1562     dec a
   9A8F DD 77 00      [19] 1563     ld  entity_x(ix),a
   9A92 CD A1 41      [17] 1564     call  entityman_getEntityArray_IX
   9A95 CD A6 41      [17] 1565     call  entityman_getNumEntities_A
   9A98 CD CC 72      [17] 1566     call  pintarPersonajePos1
                           1567 
   9A9B CD CB 7E      [17] 1568     call mueveEspadaIzquierda
   9A9E                    1569     sigue2:
                           1570     
                           1571    ;; ld a, #20
                           1572    ;;esperaA:
                           1573    ;; push af
                           1574    ;;call ataqueEspada
                           1575    ;;halt
                           1576    ;;pop af
                           1577    ;;dec a
                           1578    ;;jr nz, esperaA
   9A9E 76            [ 4] 1579    halt 
   9A9F 76            [ 4] 1580     halt
   9AA0 CD A1 7D      [17] 1581     call ataqueEspada
   9AA3 76            [ 4] 1582     halt
   9AA4 CD A1 7D      [17] 1583     call ataqueEspada
   9AA7 CD 81 AF      [17] 1584     call cpct_waitVSYNC_asm
   9AAA CD A1 7D      [17] 1585     call ataqueEspada
   9AAD 76            [ 4] 1586     halt 
   9AAE CD A1 7D      [17] 1587     call ataqueEspada
   9AB1 76            [ 4] 1588     halt
   9AB2 CD A1 7D      [17] 1589     call ataqueEspada
   9AB5 76            [ 4] 1590     halt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 108.
Hexadecimal [16-Bits]



   9AB6 CD A1 7D      [17] 1591     call ataqueEspada
   9AB9 CD 81 AF      [17] 1592     call cpct_waitVSYNC_asm
   9ABC CD A1 7D      [17] 1593     call ataqueEspada
   9ABF 76            [ 4] 1594     halt
   9AC0 CD A1 7D      [17] 1595     call ataqueEspada 
   9AC3 76            [ 4] 1596     halt
   9AC4 CD A1 7D      [17] 1597     call ataqueEspada
   9AC7 76            [ 4] 1598     halt
   9AC8 CD A1 7D      [17] 1599     call ataqueEspada
   9ACB CD 81 AF      [17] 1600     call cpct_waitVSYNC_asm
   9ACE CD A1 7D      [17] 1601     call ataqueEspada
   9AD1 76            [ 4] 1602     halt
   9AD2 CD A1 7D      [17] 1603     call ataqueEspada 
   9AD5 76            [ 4] 1604     halt
   9AD6 CD A1 7D      [17] 1605     call ataqueEspada
   9AD9 76            [ 4] 1606     halt
   9ADA CD A1 7D      [17] 1607     call ataqueEspada
   9ADD CD 81 AF      [17] 1608     call cpct_waitVSYNC_asm
   9AE0 CD A1 7D      [17] 1609     call ataqueEspada
   9AE3 76            [ 4] 1610     halt 
   9AE4 CD A1 7D      [17] 1611     call ataqueEspada
   9AE7 76            [ 4] 1612     halt
   9AE8 CD A1 7D      [17] 1613     call ataqueEspada
   9AEB 76            [ 4] 1614     halt
   9AEC CD A1 7D      [17] 1615     call ataqueEspada
   9AEF CD 81 AF      [17] 1616     call cpct_waitVSYNC_asm
   9AF2 CD A1 7D      [17] 1617     call ataqueEspada
   9AF5 76            [ 4] 1618     halt
   9AF6 CD A1 7D      [17] 1619     call ataqueEspada 
   9AF9 76            [ 4] 1620     halt
   9AFA CD A1 7D      [17] 1621     call ataqueEspada
   9AFD 76            [ 4] 1622     halt
   9AFE CD A1 7D      [17] 1623     call ataqueEspada
   9B01 CD 81 AF      [17] 1624     call cpct_waitVSYNC_asm
   9B04 CD A1 7D      [17] 1625     call ataqueEspada
   9B07 C3 EB 8F      [10] 1626     jp   moverPersonaje
   9B0A                    1627    saltoALPrincipio:
                           1628    ;;Aqui tocara poner las esperas
   9B0A 76            [ 4] 1629    halt 
   9B0B 76            [ 4] 1630     halt
   9B0C CD A1 7D      [17] 1631     call ataqueEspada
   9B0F 76            [ 4] 1632     halt
   9B10 CD A1 7D      [17] 1633     call ataqueEspada
   9B13 CD 81 AF      [17] 1634     call cpct_waitVSYNC_asm
   9B16 CD A1 7D      [17] 1635     call ataqueEspada
   9B19 76            [ 4] 1636     halt 
   9B1A CD A1 7D      [17] 1637     call ataqueEspada
   9B1D 76            [ 4] 1638     halt
   9B1E CD A1 7D      [17] 1639     call ataqueEspada
   9B21 76            [ 4] 1640     halt
   9B22 CD A1 7D      [17] 1641     call ataqueEspada
   9B25 CD 81 AF      [17] 1642     call cpct_waitVSYNC_asm
   9B28 CD A1 7D      [17] 1643     call ataqueEspada
   9B2B 76            [ 4] 1644     halt
   9B2C CD A1 7D      [17] 1645     call ataqueEspada 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 109.
Hexadecimal [16-Bits]



   9B2F 76            [ 4] 1646     halt
   9B30 CD A1 7D      [17] 1647     call ataqueEspada
   9B33 76            [ 4] 1648     halt
   9B34 CD A1 7D      [17] 1649     call ataqueEspada
   9B37 CD 81 AF      [17] 1650     call cpct_waitVSYNC_asm
   9B3A CD A1 7D      [17] 1651     call ataqueEspada
   9B3D 76            [ 4] 1652     halt
   9B3E CD A1 7D      [17] 1653     call ataqueEspada 
   9B41 76            [ 4] 1654     halt
   9B42 CD A1 7D      [17] 1655     call ataqueEspada
   9B45 76            [ 4] 1656     halt
   9B46 CD A1 7D      [17] 1657     call ataqueEspada
   9B49 CD 81 AF      [17] 1658     call cpct_waitVSYNC_asm
   9B4C CD A1 7D      [17] 1659     call ataqueEspada
   9B4F 76            [ 4] 1660     halt 
   9B50 CD A1 7D      [17] 1661     call ataqueEspada
   9B53 76            [ 4] 1662     halt
   9B54 CD A1 7D      [17] 1663     call ataqueEspada
   9B57 76            [ 4] 1664     halt
   9B58 CD A1 7D      [17] 1665     call ataqueEspada
   9B5B CD 81 AF      [17] 1666     call cpct_waitVSYNC_asm
   9B5E CD A1 7D      [17] 1667     call ataqueEspada
   9B61 76            [ 4] 1668     halt
   9B62 CD A1 7D      [17] 1669     call ataqueEspada 
   9B65 76            [ 4] 1670     halt
   9B66 CD A1 7D      [17] 1671     call ataqueEspada
   9B69 76            [ 4] 1672     halt
   9B6A CD A1 7D      [17] 1673     call ataqueEspada
   9B6D CD 81 AF      [17] 1674     call cpct_waitVSYNC_asm
   9B70 CD A1 7D      [17] 1675     call ataqueEspada
                           1676   ;; halt 
                           1677   ;;  halt
                           1678   ;;  halt
                           1679   ;;  call cpct_waitVSYNC_asm
                           1680   ;;  halt 
                           1681   ;;  halt
                           1682   ;;  halt
                           1683   ;;  call cpct_waitVSYNC_asm
                           1684   ;;  halt 
                           1685   ;;  halt
                           1686   ;;  halt
                           1687   ;;  call cpct_waitVSYNC_asm
   9B73 C3 EB 8F      [10] 1688    jp   moverPersonaje
                           1689 
   9B76                    1690    pulsaW:
   9B76 CD DA AD      [17] 1691     call  cpct_scanKeyboard_f_asm
   9B79 21 07 08      [10] 1692     ld  hl, #Key_W
   9B7C CD 44 AE      [17] 1693     call cpct_isKeyPressed_asm
   9B7F CA 9B 9B      [10] 1694     jp z, pulsaS
   9B82 DD 21 54 8F   [14] 1695     ld ix, #cooldownMisil
   9B86 DD 35 00      [23] 1696     dec 0(ix)
   9B89 28 06         [12] 1697     jr z, ataqueMisil
   9B8B DD 34 00      [23] 1698     inc 0(ix)
   9B8E C3 E4 9B      [10] 1699     jp pulsaEspacio
   9B91                    1700     ataqueMisil:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 110.
Hexadecimal [16-Bits]



   9B91 DD 36 00 05   [19] 1701     ld 0(ix), #5
   9B95 CD 2B 6B      [17] 1702     call ataqueAereo
   9B98 C3 EB 8F      [10] 1703     jp moverPersonaje
                           1704     ;ld ix, #playerPos
                           1705     ;ld  entity_color(ix), #0x00
                           1706     ;call  entityman_getEntityArray_IX
                           1707     ;call  entityman_getNumEntities_A
                           1708     ;call  rendersys_update
                           1709     ;ld ix, #playerPos
                           1710     ;ld  entity_color(ix), #0xFF
                           1711     ;ld a, entity_y(ix)
                           1712     ;dec a
                           1713     ;dec a
                           1714     ;dec a
                           1715     ;dec a
                           1716     ;dec a
                           1717     ;dec a
                           1718     ;ld  entity_y(ix),a
                           1719     ;call  entityman_getEntityArray_IX
                           1720     ;call  entityman_getNumEntities_A
                           1721     ;call  rendersys_update
                           1722     ;ld b, #50
                           1723    ;esperaW1:
                           1724    ;halt
                           1725    ;dec b
                           1726    ;jr nz, esperaW1
                           1727    ;ld ix, #playerPos
                           1728     ;ld  entity_color(ix), #0x00
                           1729     ;call  entityman_getEntityArray_IX
                           1730     ;call  entityman_getNumEntities_A
                           1731     ;call  rendersys_update
                           1732    ;ld ix, #playerPos
                           1733    ;ld  entity_color(ix), #0xFF
                           1734    ;ld a, entity_y(ix)
                           1735    ;dec a
                           1736    ;dec a
                           1737    ;dec a
                           1738    ;dec a
                           1739    ;ld  entity_y(ix),a
                           1740     ;call  entityman_getEntityArray_IX
                           1741     ;call  entityman_getNumEntities_A
                           1742     ;call  rendersys_update
                           1743    ;ld b, #150
                           1744    ;esperaW2:
                           1745    ;halt
                           1746    ;dec b
                           1747    ;jr nz, esperaW2
                           1748    ;ld ix, #playerPos
                           1749    ; ld  entity_color(ix), #0x00
                           1750    ; call  entityman_getEntityArray_IX
                           1751    ; call  entityman_getNumEntities_A
                           1752    ; call  rendersys_update
                           1753    ;ld ix, #playerPos
                           1754    ;ld  entity_color(ix), #0xFF
                           1755    ;ld a, entity_y(ix)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 111.
Hexadecimal [16-Bits]



                           1756    ;inc a
                           1757    ;inc a
                           1758    ;inc a
                           1759    ;inc a
                           1760    ;ld  entity_y(ix),a
                           1761    ; call  entityman_getEntityArray_IX
                           1762     ;call  entityman_getNumEntities_A
                           1763     ;call  rendersys_update
                           1764    ; ld b, #50
                           1765    ;esperaW3:
                           1766    ;halt
                           1767    ;dec b
                           1768    ;jr nz, esperaW3
                           1769    ;ld ix, #playerPos
                           1770    ; ld  entity_color(ix), #0x00
                           1771    ; call  entityman_getEntityArray_IX
                           1772    ; call  entityman_getNumEntities_A
                           1773    ; call  rendersys_update
                           1774    ;ld ix, #playerPos
                           1775    ;ld  entity_color(ix), #0xFF
                           1776    ;ld a, entity_y(ix)
                           1777    ;inc a
                           1778   ; inc a
                           1779   ; inc a
                           1780   ; inc a
                           1781   ; inc a
                           1782   ; inc a
                           1783     ;ld  entity_y(ix),a
                           1784     ;call  entityman_getEntityArray_IX
                           1785     ;call  entityman_getNumEntities_A
                           1786     ;call  rendersys_update
                           1787 
                           1788     ;ld a, #100
                           1789    ;esperaW:
                           1790    ;halt
                           1791    ;dec a
                           1792    ;jr nz, esperaW
   9B9B                    1793    pulsaS:
   9B9B CD DA AD      [17] 1794    call  cpct_scanKeyboard_f_asm
   9B9E 21 07 10      [10] 1795     ld  hl, #Key_S
   9BA1 CD 44 AE      [17] 1796     call cpct_isKeyPressed_asm
   9BA4 CA E4 9B      [10] 1797     jp z, pulsaEspacio
   9BA7 DD 21 5B 8F   [14] 1798     ld ix, #Mina
   9BAB DD 35 00      [23] 1799     dec 0(ix)
   9BAE 20 06         [12] 1800     jr nz, colocarMina
   9BB0 DD 34 00      [23] 1801     inc 0(ix)
   9BB3 C3 E4 9B      [10] 1802     jp pulsaEspacio
   9BB6                    1803     colocarMina:
   9BB6 DD 21 03 40   [14] 1804     ld ix, #playerPos
   9BBA DD 7E 00      [19] 1805     ld a, entity_x(ix)
   9BBD DD 21 5B 8F   [14] 1806     ld ix, #Mina
   9BC1 DD 77 01      [19] 1807     ld 1(ix),  a  ;;X
   9BC4 DD 36 03 07   [19] 1808     ld 3(ix),  #7 ;;Cooldown activacion
   9BC8 DD 36 00 01   [19] 1809     ld 0(ix), #1  ;;Estado
                           1810     ;;ColocarMina (simplemente pintar 4 pixeles amarillos)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 112.
Hexadecimal [16-Bits]



   9BCC 11 00 C0      [10] 1811     ld      de, #0xC000  
   9BCF DD 21 03 40   [14] 1812     ld ix, #playerPos     
   9BD3 DD 4E 00      [19] 1813     ld      c,  entity_x(ix)          
   9BD6 DD 7E 01      [19] 1814     ld      a,  entity_y(ix)
   9BD9 C6 07         [ 7] 1815     add a, #7
   9BDB 47            [ 4] 1816     ld b, a
   9BDC CD 6C B0      [17] 1817     call cpct_getScreenPtr_asm 
   9BDF 36 F0         [10] 1818     ld (hl), #0xF0    
                           1819 
   9BE1 C3 0A 9B      [10] 1820     jp saltoALPrincipio
                           1821 
   9BE4                    1822    pulsaEspacio:
   9BE4 CD A1 7D      [17] 1823    call ataqueEspada
                           1824 
   9BE7 C3 0A 9B      [10] 1825     jp  saltoALPrincipio
   9BEA                    1826     colision::
                           1827     ;;ld ix, #Mina 
                           1828     ;;ld 2(ix), #0
                           1829     ;;ld 0(ix), #0
   9BEA DD 21 5A 8F   [14] 1830     ld ix, #vidas
   9BEE DD 7E 00      [19] 1831     ld a, 0(ix)
   9BF1 3D            [ 4] 1832     dec a 
   9BF2 CA 1C 4A      [10] 1833     jp z, GameOver
   9BF5 21 72 8F      [10] 1834     ld  hl, #paletteMuerte
   9BF8 11 10 00      [10] 1835   ld  de, #16
   9BFB CD 50 AE      [17] 1836   call cpct_setPalette_asm
   9BFE 3E 96         [ 7] 1837   ld a, #150
   9C00                    1838   EsperaMuerte:
   9C00 76            [ 4] 1839   halt
   9C01 3D            [ 4] 1840   dec a
   9C02 20 FC         [12] 1841     jr nz, EsperaMuerte
   9C04 21 62 8F      [10] 1842  ld  hl, #palette
   9C07 11 10 00      [10] 1843   ld  de, #16
   9C0A CD 50 AE      [17] 1844   call cpct_setPalette_asm
                           1845   ;;BorrarMina
   9C0D DD 21 A2 54   [14] 1846   ld ix, #muerteporMina
   9C11 DD 35 00      [23] 1847   dec 0(ix)
   9C14 20 03         [12] 1848   jr nz, nomuertopormina
   9C16 CD 5D 5C      [17] 1849   call borrarExplosion
   9C19                    1850   nomuertopormina:
   9C19 DD 21 5B 8F   [14] 1851   ld ix, #Mina 
   9C1D CD 5D 5C      [17] 1852   call borrarExplosion
   9C20 DD 36 02 00   [19] 1853     ld 2(ix), #0
   9C24 DD 36 00 00   [19] 1854     ld 0(ix), #0
   9C28 DD 21 5A 8F   [14] 1855     ld ix, #vidas
   9C2C DD 7E 00      [19] 1856     ld a, 0(ix)
   9C2F 3D            [ 4] 1857     dec a 
   9C30 3D            [ 4] 1858     dec a 
   9C31 20 09         [12] 1859     jr nz, DosVidas
   9C33                    1860     UnaVida:
   9C33 DD 36 00 01   [19] 1861     ld 0(ix), #1
   9C37 CD 83 A4      [17] 1862     call unaVida 
   9C3A 18 07         [12] 1863     jr reiniciarNivel
   9C3C                    1864     DosVidas:
   9C3C DD 36 00 02   [19] 1865     ld 0(ix), #2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 113.
Hexadecimal [16-Bits]



   9C40 CD 5A A3      [17] 1866     call dosVidas
   9C43                    1867     reiniciarNivel:
   9C43 DD 21 56 8F   [14] 1868     ld ix, #nivelactual
   9C47 DD 7E 00      [19] 1869     ld a, 0(ix)
   9C4A 3D            [ 4] 1870     dec a
   9C4B 28 17         [12] 1871     jr z, vuelveniv1
   9C4D 3D            [ 4] 1872     dec a
   9C4E 28 3C         [12] 1873     jr z, vuelveniv2
                           1874     
   9C50 3D            [ 4] 1875     dec a
   9C51 CA 8F 9C      [10] 1876     jp z, vuelveniv3
   9C54 3D            [ 4] 1877     dec a
   9C55 CA 92 9C      [10] 1878     jp z, vuelveniv4
   9C58 3D            [ 4] 1879     dec a
   9C59 CA 95 9C      [10] 1880     jp z, vuelveniv5
   9C5C 3D            [ 4] 1881     dec a
   9C5D CA 98 9C      [10] 1882     jp z, vuelveniv6
   9C60 3D            [ 4] 1883     dec a
   9C61 CA 9B 9C      [10] 1884     jp z, vuelveniv7
   9C64                    1885     vuelveniv1:
   9C64 DD 21 1F 40   [14] 1886     ld ix, #enemyPos
   9C68 CD BC 82      [17] 1887     call borrarEnemigo1
   9C6B DD 36 00 48   [19] 1888     ld entity_x(ix), #72
   9C6F DD 36 04 00   [19] 1889     ld entity_estado(ix), #0
   9C73 CD F6 7E      [17] 1890     call pintarEnemigo1
   9C76 DD 21 03 40   [14] 1891     ld ix, #playerPos
   9C7A CD B1 7B      [17] 1892     call borraPersonajePos0
   9C7D DD 36 00 1E   [19] 1893     ld entity_x(ix), #30
   9C81 DD 21 0A 40   [14] 1894     ld ix, #espadaPos
   9C85 DD 36 00 20   [19] 1895     ld entity_x(ix), #32
   9C89 C3 91 99      [10] 1896     jp pintarMovimientoDerecha
   9C8C                    1897     vuelveniv2:
                           1898     
   9C8C C3 0A 97      [10] 1899     jp nivel2
   9C8F                    1900     vuelveniv3:
                           1901     
   9C8F C3 4A 96      [10] 1902     jp nivel3
   9C92                    1903     vuelveniv4:
                           1904     
   9C92 C3 56 95      [10] 1905     jp nivel4
   9C95                    1906     vuelveniv5:
                           1907     
   9C95 C3 01 94      [10] 1908     jp nivel5
   9C98                    1909     vuelveniv6:
                           1910     
   9C98 C3 91 92      [10] 1911     jp nivel6
   9C9B                    1912     vuelveniv7:
                           1913     
   9C9B C3 C4 90      [10] 1914     jp nivel7
                           1915     
                           1916     ;;jp moverPersonaje
   9C9E DD 21 1F 40   [14] 1917     ld  ix, #enemyPos 
   9CA2 CD BC 82      [17] 1918     call borrarEnemigo1
   9CA5 DD 36 00 48   [19] 1919     ld entity_x(ix), #72
   9CA9 DD 36 04 00   [19] 1920     ld  entity_estado(ix), #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 114.
Hexadecimal [16-Bits]



   9CAD CD F6 7E      [17] 1921     call pintarEnemigo1
   9CB0 DD 21 2D 40   [14] 1922     ld  ix, #enemyIzqPos  
   9CB4 CD B8 8C      [17] 1923      call borrarEnemigo2
   9CB7 DD 36 00 05   [19] 1924     ld entity_x(ix), #5
   9CBB DD 36 04 00   [19] 1925     ld  entity_estado(ix), #0
   9CBF CD F2 88      [17] 1926     call pintarEnemigo2
   9CC2 DD 21 34 40   [14] 1927     ld  ix, #enemyIzqPos2
   9CC6 CD BA 87      [17] 1928     call borrarEnemigo3
   9CC9 DD 21 34 40   [14] 1929     ld  ix, #enemyIzqPos2
   9CCD DD 36 00 05   [19] 1930     ld  entity_x(ix), #5
   9CD1 DD 36 04 00   [19] 1931     ld  entity_estado(ix), #0
   9CD5 CD F4 83      [17] 1932     call pintarEnemigo3
   9CD8 DD 21 03 40   [14] 1933     ld ix, #playerPos
   9CDC CD B1 7B      [17] 1934     call borraPersonajePos0
   9CDF DD 36 00 1E   [19] 1935     ld entity_x(ix), #30
   9CE3 CD 2E 70      [17] 1936     call pintarPersonajePos0
   9CE6 DD 21 0A 40   [14] 1937     ld ix, #espadaPos
   9CEA DD 36 00 20   [19] 1938     ld entity_x(ix), #32
   9CEE DD 21 50 40   [14] 1939     ld  ix, #enemyDerPos2
   9CF2 CD 72 A9      [17] 1940     call borrarEnemigo4
   9CF5 DD 36 00 48   [19] 1941     ld  entity_x(ix), #72
   9CF9 DD 36 04 00   [19] 1942     ld  entity_estado(ix), #0
   9CFD CD AC A5      [17] 1943     call pintarEnemigo4
   9D00 DD 21 26 40   [14] 1944     ld  ix, #crocodile  ;;(enemy)
   9D04 CD 7E 65      [17] 1945     call borrarCrocoPos5
   9D07 CD 0F 66      [17] 1946     call borrarCrocoPos6
   9D0A CD A0 66      [17] 1947     call borrarCrocoPos7
   9D0D DD 36 04 08   [19] 1948     ld entity_estado(ix), #8
   9D11 DD 36 00 00   [19] 1949     ld entity_x(ix), #0
   9D15 DD 36 05 05   [19] 1950     ld entity_vy(ix), #5
   9D19 DD 21 3B 40   [14] 1951     ld ix, #enemyUp1Pos
   9D1D CD 0C 46      [17] 1952      call  borrarEnemigo5
   9D20 DD 21 03 40   [14] 1953      ld ix, #playerPos
   9D24 DD 46 00      [19] 1954     ld b, entity_x(ix)
   9D27 DD 21 3B 40   [14] 1955     ld ix, #enemyUp1Pos
   9D2B DD 36 04 01   [19] 1956      ld entity_estado(ix), #1
   9D2F DD 36 06 F0   [19] 1957     ld entity_color(ix), #0xF0
   9D33 DD 36 01 40   [19] 1958     ld entity_y(ix), #0x40
   9D37 C3 1C 4A      [10] 1959     jp  GameOver
