;;This file is part of Kubso.
;;
;;Kubso is free software: you can redistribute it and/or modify
;;it under the terms of the GNU General Public License as published by
;;the Free Software Foundation, either version 3 of the License, or
;;(at your option) any later version.
;;
;;Kubso is distributed in the hope that it will be useful,
;;but WITHOUT ANY WARRANTY; without even the implied warranty of
;;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;GNU General Public License for more details.
;;
;;You should have received a copy of the GNU General Public License
;;along with Kubso.  If not, see <https://www.gnu.org/licenses/>.
.include "cpctelera.h.s"
.include "cpcfunciones.h.s"
.include "manager/entity_manager.h.s"
.include "system/render_system.h.s"
.include "system/ataque.h.s"
.include "system/gameOver.h.s"
.include "system/renderPersonaje.h.s"
.include "system/colisiones.h.s"
.include "system/mainJuego.h.s"
.include "system/actualizarEnemigos.h.s"
.include "system/niveles.h.s"
.include "system/ataqueAereo.h.s"
.include "system/renderEnemigo1.h.s"
.include "system/renderEnemigo2.h.s"
.include "system/renderEnemigo3.h.s"
.include "system/renderEnemigo4.h.s"
.include "system/dibujarFondo.h.s"
.include "system/dibujarOlas2.h.s"
.include "system/dibujarOlas3.h.s"
.include "system/actualizarMina.h.s"
.include "system/pintarVidas.h.s"
.include "system/pintarScoreTiempoReal.h.s"
.include "system/renderEspada.h.s"
.include "system/renderCroco.h.s"
.include "system/renderEnemigo5A.h.s"


DefineEntity player, 20, 0x88, 2, 8, 0, 0, 0xFF
DefineEntity espada, 22, 0x88, 2, 3, 2, 0, 0x00
DefineEntity wallI, 4, 0x88, 2, 8, 0, 0, 0x0F  ;;en entity_estado guardamos enemigos terrestres asesinados y en VY enemigos aereos
DefineEntity wallD, 73, 0x88, 2, 8, 1, 2, 0x0F ;;en VX guardamos el nivel actual y en VY contador para pasar de nivel
DefineEntity enemy, 72, 0x88, 2, 8, 0, 0, 0xF0
DefineEntity croco, 0, 0x93, 2, 8, 1, 2, 0xF3
DefineEntity enemyIzq, 5, 0x88, 2, 8, 0, 0, 0xF0
DefineEntity enemyUp1, 43, 0x40, 2, 8, 0, 0, 0xF0
DefineEntity enemyUp2, 15, 0x40, 2, 8, 0, 0, 0xF0
DefineEntity enemyUp3, 30, 0x40, 2, 8, 0, 0, 0xF0
DefineEntity enemyUp4, 50, 0x40, 2, 8, 1, 1, 0xF0
DefineEntity enemyUp5, 20, 0x40, 2, 8, 1, 1, 0xF0
DefineEntity enemyIzq2, 5, 0x88, 2, 8, 0, 0, 0xFF
DefineEntity enemyIzq3, 0, 0x80, 2, 8, 1, 1, 0x00
DefineEntity enemyDer2, 72, 0x88, 2, 8, 0, 0, 0x0F
;;DefineEntity enemyDer3, 0, 0x80, 2, 8, 1, 1, 0x00

FraseIni1: .asciz "Some animals seem to have mutated";
FraseIni2: .asciz "Please, help us to eliminate them!";
Controls1: .asciz "Move left with A and Right with D";
Controls2: .asciz "Use Space to Sword-Attack,";
Controls3: .asciz "W to Missile-Attack,";
Controls4: .asciz "and S to place a Mine (Run Away!)";
Controls5: .asciz "GOOD LUCK!";

Level1: .asciz "LEVEL 1";
Level2: .asciz "LEVEL 2";
Level3: .asciz "LEVEL 3";
Level4: .asciz "LEVEL 4";
Level5: .asciz "LEVEL 5";
Level6: .asciz "KEEP ALIVE!";
ola: .db #1
olaUpDown: .db #1
olaCounter: .db #6
;;lastLevel: .db #0
cooldownMisil:: .db #1
letrasborradas:: .db #0
nivelactual:: .db #1
cargaNivel:: .db #1
cooldownEnemigo1:: .db #0
cooldownEnemigo2:: .db #0
vidas:: .db #3

;;Mina,   --0 no colocada, 1 colocada-- , --posicion X-- , --Estado: 1 encendida, 0 apagada o no plantada, 2 explotando-- , --Cooldown para encenderse la mina--
Mina:: .db #0, #0, #0, #0
;;Mensajes que se deben dar en el inicio antes de empezar 1ºEspera total, 2º Espera hasta que cambie el texto, 3º Espera de cambio de textos
Inicio:: .db #160, #60, #12
palette::
;;.db HW_BLACK          , HW_BLUE           , HW_BRIGHT_BLUE    ,   HW_RED    , HW_MAGENTA        , HW_MAUVE
.db HW_BLACK        , HW_BRIGHT_YELLOW            , HW_CYAN   ,   HW_BRIGHT_RED     , HW_MAGENTA        , HW_MAUVE
.db HW_BRIGHT_RED     , HW_RED        , HW_BRIGHT_MAGENTA ,   HW_BRIGHT_GREEN  , HW_CYAN           , HW_SKY_BLUE
.db HW_YELLOW         , HW_WHITE          , HW_PASTEL_BLUE    ,   HW_BRIGHT_RED ;;, HW_PINK           , HW_PASTEL_MAGENTA
paletteMuerte::
;;.db HW_BLACK          , HW_BLUE           , HW_BRIGHT_BLUE    ,   HW_RED    , HW_MAGENTA        , HW_MAUVE
.db HW_BRIGHT_RED        , HW_CYAN           , HW_BRIGHT_YELLOW    ,   HW_BLACK     , HW_MAGENTA        , HW_MAUVE
.db HW_BRIGHT_RED     , HW_RED        , HW_BRIGHT_MAGENTA ,   HW_BRIGHT_GREEN  , HW_CYAN           , HW_SKY_BLUE
.db HW_YELLOW         , HW_WHITE          , HW_PASTEL_BLUE    ,   HW_BRIGHT_RED ;;, HW_PINK           , HW_PASTEL_MAGENTA

;;.db HW_BLACK          , HW_BLUE           , HW_BRIGHT_BLUE    ,   HW_RED    , HW_MAGENTA        , HW_MAUVE

;;LOS 5 originales son:
;;.db HW_BLACK          , HW_BLUE           , HW_BRIGHT_BLUE    ,   HW_RED    , HW_MAGENTA        , HW_MAUVE
;;.db HW_BRIGHT_RED     , HW_PURPLE         , HW_BRIGHT_MAGENTA ,   HW_GREEN  , HW_CYAN           , HW_SKY_BLUE
;;.db HW_YELLOW         , HW_WHITE          , HW_PASTEL_BLUE    ,   HW_ORANGE ;;, HW_PINK           , HW_PASTEL_MAGENTA
;;.db HW_BRIGHT_GREEN   , HW_SEA_GREEN      , HW_BRIGHT_CYAN    ,   HW_LIME   , HW_PASTEL_GREEN   , HW_PASTEL_CYAN
;;.db HW_BRIGHT_YELLOW  , HW_PASTEL_YELLOW  , HW_BRIGHT_WHITE 

GameStart::



;;/////////DIBUJAMOS ESCENARIO/////////
call fondo
call tresVidas

;;ld      a, #0x49
;;buclesuelo:
;;    push af
;;    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  a              ;;Coordenada X 
;;    ld      b,  #0x90         ;;Coordenada Y 
;;    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
;;
;;    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
;;    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
;;    ld      c,  #1        ;;Ancho (en la posición de la entidad)
;;    ld      b,  #1         ;;Alto (en la posición de la entidad)
;;    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc
;;    
;;    pop af
;;    dec a
;;    jr nz, buclesuelo
;;
;;    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  #74              ;;Coordenada X 
;;    ld      b,  #0x85         ;;Coordenada Y 
;;    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
;;
;;    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
;;    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
;;    ld      c,  #2        ;;Ancho (en la posición de la entidad)
;;    ld      b,  #11         ;;Alto (en la posición de la entidad)
;;    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc
;;
;;    ld      de, #0xC000        ;;Puntero a la posición en pantalla (COOO sería el inicio de la pantalla)
;;    ld      c,  #0              ;;Coordenada X 
;;    ld      b,  #0x85         ;;Coordenada Y 
;;    call cpct_getScreenPtr_asm  ;;Función que calcula la dirección de memoria de video con esos parámetros
;;
;;    ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)
;;    ld      a,  #0x0F          ;;Color (en la posición de la entidad)
;;    ld      c,  #2        ;;Ancho (en la posición de la entidad)
;;    ld      b,  #11         ;;Alto (en la posición de la entidad)
;;    call cpct_drawSolidBox_asm  ;;Función de dibujado de cpc

;;/////////CREAMOS ENTIDADES/////////

  ;;call CPCT_HW_Colour
  ;;call cpct_getHWColour(HW_BLACK)
  ;;ld  c, #0
  ;;call cpct_setVideoMode_asm
  ;;call cpctm_setBorder_asm  HW_WHITE
  ld  hl, #palette
  ld  de, #16
  call cpct_setPalette_asm

;;call borrarOlas
;;call olas3

    

    ;;ex      de, hl             ;;Intercambia los 2 valores (supongo que la fucion de dibujo lo usará)


  


    




    ld    hl, #player
    call  entityman_create
    ld    hl, #espada
    call  entityman_create
    ld    hl, #wallI
    call entityman_create
    ld    hl, #wallD
    call entityman_create

ld    hl, #enemy
    call  entityman_create
    ld    hl, #croco
    call  entityman_create
    call pintarPersonajePos0
    call pintarEnemigo1

    ld    d, #0         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #24                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #FraseIni1    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #0         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #32                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                  ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #FraseIni2    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

    
    


    ;;BUCLE PRINCIPAL DEL JUEGO
    moverPersonaje:
    call ScoreReal

    ;;ACTUALIZAMOS OLA
    ld ix, #olaCounter
    dec 0(ix)
    jr z, cambiarOlas
    jr finOlas
    cambiarOlas:
    ld 0(ix), #6
    ld ix, #ola
    dec 0(ix)
    jr z, olaNiv1
    dec 0(ix)
    jr z, olaNiv2
    olaNiv1:  ;;En el nivel 1 y el 3 hacemos lo mismo
    call borrarOlas
    call olas2
    ld 0(ix), #2
    jr finOlas
    olaNiv2:
    ld ix, #olaUpDown
    dec 0(ix)
    jr z, olaNiv2Up
    ld 0(ix), #1
    call borrarOlas
    call olas
    jr finOlas
    olaNiv2Up:
    ld 0(ix), #3
    call borrarOlas
    call olas3
    jr finOlas

    finOlas:

    ;;COOLDOWN ESPADA
    ld ix, #espadaPos
    ld a, entity_vy(ix)
    sub a, #1
    jr z, restaCDEspada
    ld a, entity_vy(ix)
    sub a, #2
    jr z, restaCDEspada
    ld a, entity_vy(ix)
    sub a, #3
    jr z, restaCDEspada
    ld a, entity_vy(ix)
    sub a, #4
    jr nz, finComprobacionEspada
    ld ix, #estadoEspadaPrevio
    dec 0(ix)
    jr z, EstabaIzq
    call borrarEspadaDerecha
    jr restaCDEspada
    EstabaIzq:
    call borrarEspadaIzquierda
    restaCDEspada:
    ld a, entity_vy(ix)
    dec a
    ld entity_vy(ix), a

    finComprobacionEspada:

    ;;Comprobacion W
    ld ix, #cooldownMisil
    dec 0(ix)
    jr z, misilPreparado
    jr finComprobacionMisil
    misilPreparado:
    inc 0(ix)

    finComprobacionMisil:

    ;;ACTUALIZAMOS LA MINA
    call actualizarMina

ld ix, #cargaNivel
    ld a, 0(ix)
    dec a 
    jp nz, CargandoNivel

    ld ix, #wallDPos
    ld a, entity_vy(ix)
    inc a
    dec a
    jp z, cambiarnivel
    inc a 
    inc a 
    dec a
    jp nz, nocambiarnivel

  cambiarnivel:
    ld b, entity_estado(ix)
    inc b
    ld entity_estado(ix), b


   ;;;; ;;SI PULSAMOS P hackeamos al nivel 6
   ;; call  cpct_scanKeyboard_f_asm
   ;; ld  hl, #Key_P
   ;; call cpct_isKeyPressed_asm
   ;; jr z, noHack
   ;; ld ix, #wallDPos
   ;; ld entity_estado(ix), #6
   ;; ld entity_vy(ix), #99
   ;; noHack:

    

    call CompruebaNivel  ;;devuelve en a el nivel actual

    dec a
    jp z, nivel1
    dec a
    jp z, nivel2
    dec a
    jp z, nivel3
    dec a
    jp z, nivel4
    dec a
    jp z, nivel5
    dec a
    jp z, nivel6
    dec a
    jp z, nivel7

  nivel7:

    ;;ENTIDADES DE MANERA TEMPORAL
    ;;ld    hl, #enemyIzq
    ;;call  entityman_create
    ;;ld    hl, #enemyIzq2
    ;;call  entityman_create
    ;;ld    hl, #enemyUp1
    ;;call entityman_create
    ;;ld    hl, #enemyUp2
    ;;call entityman_create
    ;;ld    hl, #enemyUp3
    ;;call entityman_create

    ;;HASTA AQUI
ld ix, #nivelactual 
    ld a, 0(ix)
    sub a, #7
    jp nz, crearEntidadesNivel7
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2
    ld  ix, #enemyIzqPos2
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3
    ld ix, #playerPos
    call borraPersonajePos0
    ld entity_x(ix), #30
    call pintarPersonajePos0
    ld ix, #espadaPos
    ld entity_x(ix), #32
    ld  ix, #enemyDerPos2
    call borrarEnemigo4
    ld  entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo4
    ld  ix, #crocodile  ;;(enemy)
    call borrarCrocoPos5
    call borrarCrocoPos6
    call borrarCrocoPos7
    ld entity_estado(ix), #8
    ld entity_x(ix), #0
    ld entity_vy(ix), #5
    ld ix, #enemyUp1Pos
     call  borrarEnemigo5
     ld ix, #playerPos
    ld b, entity_x(ix)
    ld ix, #enemyUp1Pos
     ld entity_estado(ix), #1
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    
    ld entity_x(ix), b
    call  pintarEnemigo5

    ld ix, #enemyUp2Pos
     call  borrarEnemigo5
     ld ix, #playerPos
    ld b, entity_x(ix)
    inc b
    inc b
    inc b
    ld ix, #enemyUp2Pos
     ld entity_estado(ix), #1
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    
    ld entity_x(ix), b
    call  pintarEnemigo5

    ld ix, #enemyUp2Pos
     call  borrarEnemigo5
     ld ix, #playerPos
    ld b, entity_x(ix)
    dec b
    dec b
    dec b
    ld ix, #enemyUp2Pos
     ld entity_estado(ix), #1
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    
    ld entity_x(ix), b
    call  pintarEnemigo5

    jp InicializarNivel7


    crearEntidadesNivel7:
    ld    hl, #enemyUp1
    call entityman_create
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2
    ld  ix, #enemyIzqPos2
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3
    ld  ix, #enemyDerPos2
    call borrarEnemigo4
    ld  entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo4
    ld    hl, #enemyUp2
    call entityman_create
    ld    hl, #enemyUp3
    call entityman_create
    ld  ix, #crocodile  ;;(enemy)
    call borrarCrocoPos5
    call borrarCrocoPos6
    call borrarCrocoPos7
    ld entity_estado(ix), #8
    ld entity_x(ix), #0
    ld entity_vy(ix), #5
    ld ix, #enemyUp1Pos
     call  borrarEnemigo5
     ld ix, #playerPos
    ld b, entity_x(ix)
    ld ix, #enemyUp1Pos
     ld entity_estado(ix), #1
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    
    ld entity_x(ix), b
    call  pintarEnemigo5
    
    InicializarNivel7:
    
    ld entity_vy(ix), a
    ld ix, #cargaNivel
    ld 0(ix), #30
    ld ix, #nivelactual 
    ld 0(ix), #7

    ld ix, #wallDPos
    ld entity_vy(ix), #8


    ld    d, #3         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   ld    c, #32                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Level6    ;; IY = Pointer to the string 
   call cpct_drawStringM1_asm
    
    jp CargandoNivel

    nivel6:

    ;;ENTIDADES DE MANERA TEMPORAL
    ;;ld    hl, #enemyIzq
    ;;call  entityman_create
    ;;ld    hl, #enemyIzq2
    ;;call  entityman_create
    ;;ld    hl, #enemyUp1
    ;;call entityman_create
    ;;ld    hl, #enemyUp2
    ;;call entityman_create
    ;;ld    hl, #enemyUp3
    ;;call entityman_create

    ;;HASTA AQUI
ld ix, #nivelactual 
    ld a, 0(ix)
    sub a, #6
    jp nz, crearEntidadesNivel6
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2
    ld  ix, #enemyIzqPos2
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3
    ld ix, #playerPos
    call borraPersonajePos0
    ld entity_x(ix), #30
    call pintarPersonajePos0
    ld ix, #espadaPos
    ld entity_x(ix), #32
    ld  ix, #enemyDerPos2
    call borrarEnemigo4
    ld  entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo4
    ld  ix, #crocodile  ;;(enemy)
    call borrarCrocoPos5
    call borrarCrocoPos6
    call borrarCrocoPos7
    ld entity_estado(ix), #8
    ld entity_x(ix), #0
    ld entity_vy(ix), #5
    ld ix, #enemyUp1Pos
     call  borrarEnemigo5
     ld ix, #playerPos
    ld b, entity_x(ix)
    ld ix, #enemyUp1Pos
     ld entity_estado(ix), #1
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    
    ld entity_x(ix), b
    call  pintarEnemigo5
    jp InicializarNivel6

    crearEntidadesNivel6:
    ld    hl, #enemyUp1
    call entityman_create
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2
    ld  ix, #enemyIzqPos2
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3
    ld  ix, #enemyDerPos2
    ;;call borrarEnemigo4
    ld  entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo4
    ld  ix, #crocodile  ;;(enemy)
    call borrarCrocoPos5
    call borrarCrocoPos6
    call borrarCrocoPos7
    ld entity_estado(ix), #8
    ld entity_x(ix), #0
    ld entity_vy(ix), #5
    ld ix, #enemyUp1Pos
     call  borrarEnemigo5
     ld ix, #playerPos
    ld b, entity_x(ix)
    ld ix, #enemyUp1Pos
     ld entity_estado(ix), #1
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    
    ld entity_x(ix), b
    call  pintarEnemigo5
    
    InicializarNivel6:
    ;;ld entity_vy(ix), a
    ld ix, #cargaNivel
    ld 0(ix), #30
    ld ix, #nivelactual 
    ld 0(ix), #6

    ld ix, #wallDPos
    ld entity_vy(ix), #11


    ld    d, #3         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   ld    c, #32                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Level5    ;; IY = Pointer to the string 
   call cpct_drawStringM1_asm
    
    jp CargandoNivel

    jp nivelcomenzado
    nivel5:
    ld ix, #nivelactual 
    ld a, 0(ix)
    sub a, #5
    jp nz, crearEntidadesNivel5
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2
    ld  ix, #enemyIzqPos2
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3
    ld ix, #playerPos
    call borraPersonajePos0
    ld entity_x(ix), #30
    call pintarPersonajePos0
    ld ix, #espadaPos
    ld entity_x(ix), #32
    ld  ix, #enemyDerPos2
    ;;call borrarEnemigo4
    ld  entity_x(ix), #72
    ld  entity_estado(ix), #0
    ;;call pintarEnemigo4
    ld  ix, #crocodile  ;;(enemy)
    call borrarCrocoPos5
    call borrarCrocoPos6
    call borrarCrocoPos7
    ld entity_estado(ix), #8
    ld entity_x(ix), #0
    ld entity_vy(ix), #5
    ld ix, #enemyUp1Pos
     call  borrarEnemigo5
     ld ix, #playerPos
    ld b, entity_x(ix)
    ld ix, #enemyUp1Pos
     ld entity_estado(ix), #1
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    
    ld entity_x(ix), b
    call  pintarEnemigo5

    jp InicializarNivel5

    crearEntidadesNivel5:
    ld    hl, #enemyUp1
    call entityman_create
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2
    ld  ix, #enemyIzqPos2
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3
    ld  ix, #enemyDerPos2
    ;;call borrarEnemigo4
    ld  entity_x(ix), #72
    ld  entity_y(ix), #0x88
    ld  entity_estado(ix), #0
    ;;call pintarEnemigo4
    ld ix, #enemyUp1Pos
     call  borrarEnemigo5
     ld ix, #playerPos
    ld b, entity_x(ix)
    ld ix, #enemyUp1Pos
     ld entity_estado(ix), #1
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    
    ld entity_x(ix), b
    call  pintarEnemigo5
    
    InicializarNivel5:
    ;;ld entity_vy(ix), a
    ;;ld    hl, #enemyUp2
    ;;call entityman_create
    ;;ld    hl, #enemyUp3
    ;;call entityman_create
    ld    hl, #enemyDerPos2
    call entityman_create
    ld ix, #cargaNivel
    ld 0(ix), #30
    ld ix, #nivelactual 
    ld 0(ix), #5

    ld ix, #wallDPos
    ld entity_vy(ix), #8


    ld    d, #3         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   ld    c, #32                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Level4    ;; IY = Pointer to the string 
   call cpct_drawStringM1_asm
    
    jp CargandoNivel
    nivel4:
    ld ix, #nivelactual 
    ld a, 0(ix)
    sub a, #4
    jr nz, crearEntidadesNivel4
    
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2
    ld  ix, #enemyIzqPos2
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3
    ld ix, #playerPos
    call borraPersonajePos0
    ld entity_x(ix), #30
    call pintarPersonajePos0
    ld ix, #espadaPos
    ld entity_x(ix), #32

    
     ld ix, #enemyUp1Pos
     call  borrarEnemigo5
     ld ix, #playerPos
    ld b, entity_x(ix)
    ld ix, #enemyUp1Pos
     ld entity_estado(ix), #1
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    
    ld entity_x(ix), b
    call  pintarEnemigo5
     jr InicializarNivel4

    
    
    crearEntidadesNivel4:
    ld    hl, #enemyUp1
    call entityman_create
    ;;ld ix, #playerPos
    ;;ld a, entity_x(ix)
    ;;ld b, entity_y(ix)
    ;;ld ix, #enemyUp1
    ;;ld entity_x(ix), a
    ;;ld entity_y(ix), b
    
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2
    ld  ix, #enemyIzqPos2
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3

    InicializarNivel4:
    ld ix, #wallDPos
    ld entity_vy(ix), #6
    ld ix, #cargaNivel
    ld 0(ix), #30
    ld ix, #nivelactual 
    ld 0(ix), #4

    ld    d, #3         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   ld    c, #32                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Level3    ;; IY = Pointer to the string 
   call cpct_drawStringM1_asm
    
    jp CargandoNivel

    nivel3:
    ld ix, #nivelactual 
    ld a, 0(ix)
    sub a, #3
    jr nz, crearEntidadesNivel3
    
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2
    ld  ix, #enemyIzqPos2
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3
    ld ix, #playerPos
    call borraPersonajePos0
    ld entity_x(ix), #30
    call pintarPersonajePos0
    ld ix, #espadaPos
    ld entity_x(ix), #32
     jr InicializarNivel3
    ;;inc a
    ;;inc a 
    ;;inc a 
    ;;inc a 
    ;;inc a 
    ;;ld entity_vy(ix), a

    

    ;ld ix, #wallDPos
    ;ld a, entity_x(ix)
    ;dec a
    ;dec a
    ;jr z, crearEntidadDerecha

    ;ld    hl, #enemyIzq2
    ;call  entityman_create
    ;ld    hl, #enemyDer2
    ;call  entityman_create
    ;jr nivelcomenzado

    crearEntidadesNivel3:
    ld    hl, #enemyIzq2
    call  entityman_create
     call  entityman_create
    call pintarEnemigo3
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2

    InicializarNivel3:

    ld ix, #wallDPos
    ld entity_vy(ix), #4
    ld ix, #cargaNivel
    ld 0(ix), #30
    ld ix, #nivelactual 
    ld 0(ix), #3
    ;ld    hl, #enemyDer2
    ;call  entityman_create

    ld    d, #3         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   ld    c, #32                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Level2    ;; IY = Pointer to the string 
   call cpct_drawStringM1_asm

    jp CargandoNivel

    nivel2:
     
    ld ix, #nivelactual 
    ld a, 0(ix)
    dec a 
    dec a
    jr nz, crearEntidadesNivel2
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld  ix, #enemyPos  
     ld entity_x(ix), #72
     ld  entity_estado(ix), #0
     ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld ix, #playerPos
    call borraPersonajePos0
    ld entity_x(ix), #30
    call pintarPersonajePos0
    ld ix, #espadaPos
    ld entity_x(ix), #32
     jr InicializarNivel2
    crearEntidadesNivel2:
    ld 0(ix), #2
    ld    hl, #enemyIzq
    call  entityman_create
    call pintarEnemigo2
    
   
    InicializarNivel2:
    ld    d, #3         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   ld    c, #32                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Level1    ;; IY = Pointer to the string 
   call cpct_drawStringM1_asm
   

    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld  ix, #enemyPos  
     ld entity_x(ix), #72
     ld  entity_estado(ix), #0
     call pintarEnemigo1

    ld ix, #cargaNivel
    ld 0(ix), #30
    ld ix, #wallDPos
    ld entity_vy(ix), #3
    ld ix, #nivelactual 
    ld 0(ix), #2
    ;;inc a
    ;;inc a
    ;;inc a
    ;;ld entity_vy(ix), a

    jp CargandoNivel
    
    nivel1:
    
    ld ix, #wallDPos

    ;;incrementa las entidades que se necesitan matar
    ld a, entity_vy(ix)
    ;inc a
    ;inc a
    ld entity_vy(ix), a

    ;;incrementa el nivel
    


    nivelcomenzado:

    ;;call  entityman_getEntityArray_IX
    ;;call  entityman_getNumEntities_A
    ;;call  rendersys_update

    nocambiarnivel:

    call CompruebaNivel  ;;devuelve en a el nivel actual

    dec a
    jr z, actualizarEnemigosNivel1
    dec a
    jp z, actualizarEnemigosNivel2
    dec a
    jp z, actualizarEnemigosNivel3
    dec a
    jp z, actualizarEnemigosNivel4
    dec a
    jp z, actualizarEnemigosNivel5
    dec a
    jp z, actualizarEnemigosNivel6
    dec a
    jp z, actualizarEnemigosNivel7

    actualizarEnemigosNivel1:
    ld ix, #Inicio
    dec 0(ix)
    jp z, actualNiv1
    dec 1(ix)
    jp nz, NopintarControles
    dec 2(ix)
    jr z, pintarControles
    ld    d, #0         ;; D = Background PEN (0)
    ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #24                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #FraseIni1    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #0         ;; D = Background PEN (0)
    ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #32                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                  ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #FraseIni2    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ;;PINTAR---------------------------------------------------------------
    pintarControles:
    ld    d, #0         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #24                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Controls1    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #0         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #32                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                  ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Controls2    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #0         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #40                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Controls3    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #0         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                  ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Controls4    ;; IY = Pointer to the string 
   call cpct_drawStringM1_asm
   ld    d, #0         ;; D = Background PEN (0)
    ld    e, #1         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #72                  ;; B = y coordinate (24 = 0x18)
   ld    c, #30                  ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Controls5    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
    NopintarControles:
    jp noActualizar
    actualNiv1:
    inc 0(ix)
    ld ix, #letrasborradas
    ld a, 0(ix)
    dec a
    jp z, letrasBorradas
    ld 0(ix), #1
    ;;BORRAMOS LAS LETRAS
    ld    d, #0         ;; D = Background PEN (0)
    ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #24                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Controls1    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #0         ;; D = Background PEN (0)
    ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #32                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                  ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Controls2    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #0         ;; D = Background PEN (0)
    ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #40                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Controls3    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm

   ld    d, #0         ;; D = Background PEN (0)
    ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   ld    c, #7                  ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Controls4    ;; IY = Pointer to the string 
   call cpct_drawStringM1_asm
   ld    d, #0         ;; D = Background PEN (0)
    ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #72                  ;; B = y coordinate (24 = 0x18)
   ld    c, #30                  ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Controls5    ;; IY = Pointer to the string 
   
   call cpct_drawStringM1_asm
   letrasBorradas:
    call actualizarEnemigos1
    noActualizar:
    jr seguirmovimientoPersonaje

    actualizarEnemigosNivel2:
    call actualizarEnemigos2
    jr seguirmovimientoPersonaje

    actualizarEnemigosNivel3:
    call actualizarEnemigos3
    jr seguirmovimientoPersonaje

    actualizarEnemigosNivel4:
    call actualizarEnemigos4
    jr seguirmovimientoPersonaje

    actualizarEnemigosNivel5:
    call actualizarEnemigos5
    jr seguirmovimientoPersonaje

    actualizarEnemigosNivel6:
    call actualizarEnemigos6
    jr seguirmovimientoPersonaje

    actualizarEnemigosNivel7:
    call actualizarEnemigos7
    ld ix, #wallDPos
    ld entity_vy(ix), #190  ;;ponemos infinito el numero de enemigos a vencer
    jr seguirmovimientoPersonaje

    CargandoNivel:
    ld ix, #cargaNivel
    dec 0(ix)
    ld a, 0(ix)
    dec a
    jr nz, seguirmovimientoPersonaje
    ld    d, #0        ;; D = Background PEN (0)
    ld    e, #0         ;; E = Foreground PEN (3) ;;3 rojo, 2 azul, 1 amarillo, 0 fondo, mas de 3 multicolor

   call cpct_setDrawCharM1_asm   ;; Set draw char colours
     ;; Calculate a video-memory location for printing a string
   ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   ld    b, #48                  ;; B = y coordinate (24 = 0x18)
   ld    c, #32                ;; C = x coordinate (16 = 0x10)

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL

   ;; Print the string in video memory
   ;; HL already points to video memory, as it is the return
   ;; value from cpct_getScreenPtr_asm
   ld   iy, #Level6    ;; IY = Pointer to the string 
   call cpct_drawStringM1_asm

    seguirmovimientoPersonaje:
    

    pulsaD:
    call  cpct_scanKeyboard_f_asm
    ld  hl, #Key_D
    call cpct_isKeyPressed_asm
    jp z, pulsaA

    ;;Comprobamos si choca con el muro de la derecha
    ld  ix, #playerPos  ;;(player)
    ld  a, entity_x(ix)
    ld  ix, #wallDPos  ;;(wallD)
    ld  b, entity_x(ix)
    inc a   ;;incremento a para que choque cuando coincide el principo del cuadrado (misma X menos dos)
    inc a
    inc a 
    inc a 
    inc a 
    inc a 
    inc a
    inc a 
    restaAZ:
    dec a
    jr  nz, restaBZ
    dec b
    jr  nz, pintarMovimientoDerecha
    jp  sigue
    restaBZ:
    dec b    
    jr  nz,  restaAZ
    ;;------------

    pintarMovimientoDerecha:
    ld ix, #playerPos
    ld  entity_color(ix), #0x00
    call  entityman_getEntityArray_IX
    call  entityman_getNumEntities_A
    call borraPersonajePos0
    ld ix, #playerPos
    ld  entity_color(ix), #0xFF
    ld a, entity_x(ix)
    inc a
    ld  entity_x(ix),a
    call  entityman_getEntityArray_IX
    call  entityman_getNumEntities_A
    call  pintarPersonajePos0
    

    ld  ix, #playerPos  ;;(player)
    ld  a, entity_x(ix)
    ld  ix, #enemyPos  ;;(enemy)
    ld  b, entity_x(ix)
    inc a   ;;incremento a para que choque cuando coincide la mitad del cuadrado (misma X menos uno)
    restaAZ3:
    dec a
    jr  nz, restaBZ3
    dec b
    jr  nz, siguePintando
    jp  colision
    restaBZ3:
    dec b    
    jr  nz,  restaAZ3

    siguePintando:
    call mueveEspadaDerecha
    sigue:
    
    
    
    ;ld a, #20
   ;esperaD:
   ;push af
   ;call ataqueEspada
   ;halt
   ;pop af
   ;dec a
   ;jr nz, esperaD
   halt 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt 
    call ataqueEspada
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt
    call ataqueEspada 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt
    call ataqueEspada 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt 
    call ataqueEspada
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt
    call ataqueEspada 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
   jp   moverPersonaje

    pulsaA:
    call  cpct_scanKeyboard_f_asm
    ld  hl, #Key_A
    call cpct_isKeyPressed_asm
    jp z, pulsaW

    ;;Comprobamos si choca con el muro de la izquierda
    ld  ix, #playerPos  ;;(player)
    ld  a, entity_x(ix)
    ld  ix, #wallIPos  ;;(wallI)
    ld  b, entity_x(ix)
    dec a
    dec a   ;;decremento a para que choque cuando coincide el principo del cuadrado (misma X menos dos)
    dec a
    dec a 
    dec a
    dec a
    dec a 
    dec a
    restaAZ2:
    dec a
    jr  nz, restaBZ2
    dec b
    jr  nz, pintarMovimientoIzquierda
    jp  sigue2
    restaBZ2:
    dec b    
    jr  nz,  restaAZ2
    ;;----------------------

    pintarMovimientoIzquierda:
    ld ix, #playerPos
    ld  entity_color(ix), #0x00
    call  entityman_getEntityArray_IX
    call  entityman_getNumEntities_A
    ;;call  rendersys_update
    call borraPersonajePos0
    ld ix, #playerPos
    ld  entity_color(ix), #0xFF
    ld a, entity_x(ix)
    dec a
    ld  entity_x(ix),a
    call  entityman_getEntityArray_IX
    call  entityman_getNumEntities_A
    call  pintarPersonajePos1

    call mueveEspadaIzquierda
    sigue2:
    
   ;; ld a, #20
   ;;esperaA:
   ;; push af
   ;;call ataqueEspada
   ;;halt
   ;;pop af
   ;;dec a
   ;;jr nz, esperaA
   halt 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt 
    call ataqueEspada
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt
    call ataqueEspada 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt
    call ataqueEspada 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt 
    call ataqueEspada
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt
    call ataqueEspada 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    jp   moverPersonaje
   saltoALPrincipio:
   ;;Aqui tocara poner las esperas
   halt 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt 
    call ataqueEspada
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt
    call ataqueEspada 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt
    call ataqueEspada 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt 
    call ataqueEspada
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
    halt
    call ataqueEspada 
    halt
    call ataqueEspada
    halt
    call ataqueEspada
    call cpct_waitVSYNC_asm
    call ataqueEspada
  ;; halt 
  ;;  halt
  ;;  halt
  ;;  call cpct_waitVSYNC_asm
  ;;  halt 
  ;;  halt
  ;;  halt
  ;;  call cpct_waitVSYNC_asm
  ;;  halt 
  ;;  halt
  ;;  halt
  ;;  call cpct_waitVSYNC_asm
   jp   moverPersonaje

   pulsaW:
    call  cpct_scanKeyboard_f_asm
    ld  hl, #Key_W
    call cpct_isKeyPressed_asm
    jp z, pulsaS
    ld ix, #cooldownMisil
    dec 0(ix)
    jr z, ataqueMisil
    inc 0(ix)
    jp pulsaEspacio
    ataqueMisil:
    ld 0(ix), #5
    call ataqueAereo
    jp moverPersonaje
    ;ld ix, #playerPos
    ;ld  entity_color(ix), #0x00
    ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld ix, #playerPos
    ;ld  entity_color(ix), #0xFF
    ;ld a, entity_y(ix)
    ;dec a
    ;dec a
    ;dec a
    ;dec a
    ;dec a
    ;dec a
    ;ld  entity_y(ix),a
    ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
    ;ld b, #50
   ;esperaW1:
   ;halt
   ;dec b
   ;jr nz, esperaW1
   ;ld ix, #playerPos
    ;ld  entity_color(ix), #0x00
    ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
   ;ld ix, #playerPos
   ;ld  entity_color(ix), #0xFF
   ;ld a, entity_y(ix)
   ;dec a
   ;dec a
   ;dec a
   ;dec a
   ;ld  entity_y(ix),a
    ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
   ;ld b, #150
   ;esperaW2:
   ;halt
   ;dec b
   ;jr nz, esperaW2
   ;ld ix, #playerPos
   ; ld  entity_color(ix), #0x00
   ; call  entityman_getEntityArray_IX
   ; call  entityman_getNumEntities_A
   ; call  rendersys_update
   ;ld ix, #playerPos
   ;ld  entity_color(ix), #0xFF
   ;ld a, entity_y(ix)
   ;inc a
   ;inc a
   ;inc a
   ;inc a
   ;ld  entity_y(ix),a
   ; call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update
   ; ld b, #50
   ;esperaW3:
   ;halt
   ;dec b
   ;jr nz, esperaW3
   ;ld ix, #playerPos
   ; ld  entity_color(ix), #0x00
   ; call  entityman_getEntityArray_IX
   ; call  entityman_getNumEntities_A
   ; call  rendersys_update
   ;ld ix, #playerPos
   ;ld  entity_color(ix), #0xFF
   ;ld a, entity_y(ix)
   ;inc a
  ; inc a
  ; inc a
  ; inc a
  ; inc a
  ; inc a
    ;ld  entity_y(ix),a
    ;call  entityman_getEntityArray_IX
    ;call  entityman_getNumEntities_A
    ;call  rendersys_update

    ;ld a, #100
   ;esperaW:
   ;halt
   ;dec a
   ;jr nz, esperaW
   pulsaS:
   call  cpct_scanKeyboard_f_asm
    ld  hl, #Key_S
    call cpct_isKeyPressed_asm
    jp z, pulsaEspacio
    ld ix, #Mina
    dec 0(ix)
    jr nz, colocarMina
    inc 0(ix)
    jp pulsaEspacio
    colocarMina:
    ld ix, #playerPos
    ld a, entity_x(ix)
    ld ix, #Mina
    ld 1(ix),  a  ;;X
    ld 3(ix),  #7 ;;Cooldown activacion
    ld 0(ix), #1  ;;Estado
    ;;ColocarMina (simplemente pintar 4 pixeles amarillos)
    ld      de, #0xC000  
    ld ix, #playerPos     
    ld      c,  entity_x(ix)          
    ld      a,  entity_y(ix)
    add a, #7
    ld b, a
    call cpct_getScreenPtr_asm 
    ld (hl), #0xF0    

    jp saltoALPrincipio

   pulsaEspacio:
   call ataqueEspada

    jp  saltoALPrincipio
    colision::
    ;;ld ix, #Mina 
    ;;ld 2(ix), #0
    ;;ld 0(ix), #0
    ld ix, #vidas
    ld a, 0(ix)
    dec a 
    jp z, GameOver
    ld  hl, #paletteMuerte
  ld  de, #16
  call cpct_setPalette_asm
  ld a, #150
  EsperaMuerte:
  halt
  dec a
    jr nz, EsperaMuerte
 ld  hl, #palette
  ld  de, #16
  call cpct_setPalette_asm
  ;;BorrarMina
  ld ix, #muerteporMina
  dec 0(ix)
  jr nz, nomuertopormina
  call borrarExplosion
  nomuertopormina:
  ld ix, #Mina 
  call borrarExplosion
    ld 2(ix), #0
    ld 0(ix), #0
    ld ix, #vidas
    ld a, 0(ix)
    dec a 
    dec a 
    jr nz, DosVidas
    UnaVida:
    ld 0(ix), #1
    call unaVida 
    jr reiniciarNivel
    DosVidas:
    ld 0(ix), #2
    call dosVidas
    reiniciarNivel:
    ld ix, #nivelactual
    ld a, 0(ix)
    dec a
    jr z, vuelveniv1
    dec a
    jr z, vuelveniv2
    
    dec a
    jp z, vuelveniv3
    dec a
    jp z, vuelveniv4
    dec a
    jp z, vuelveniv5
    dec a
    jp z, vuelveniv6
    dec a
    jp z, vuelveniv7
    vuelveniv1:
    ld ix, #enemyPos
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld entity_estado(ix), #0
    call pintarEnemigo1
    ld ix, #playerPos
    call borraPersonajePos0
    ld entity_x(ix), #30
    ld ix, #espadaPos
    ld entity_x(ix), #32
    jp pintarMovimientoDerecha
    vuelveniv2:
    
    jp nivel2
    vuelveniv3:
    
    jp nivel3
    vuelveniv4:
    
    jp nivel4
    vuelveniv5:
    
    jp nivel5
    vuelveniv6:
    
    jp nivel6
    vuelveniv7:
    
    jp nivel7
    
    ;;jp moverPersonaje
    ld  ix, #enemyPos 
    call borrarEnemigo1
    ld entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo1
    ld  ix, #enemyIzqPos  
     call borrarEnemigo2
    ld entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo2
    ld  ix, #enemyIzqPos2
    call borrarEnemigo3
    ld  ix, #enemyIzqPos2
    ld  entity_x(ix), #5
    ld  entity_estado(ix), #0
    call pintarEnemigo3
    ld ix, #playerPos
    call borraPersonajePos0
    ld entity_x(ix), #30
    call pintarPersonajePos0
    ld ix, #espadaPos
    ld entity_x(ix), #32
    ld  ix, #enemyDerPos2
    call borrarEnemigo4
    ld  entity_x(ix), #72
    ld  entity_estado(ix), #0
    call pintarEnemigo4
    ld  ix, #crocodile  ;;(enemy)
    call borrarCrocoPos5
    call borrarCrocoPos6
    call borrarCrocoPos7
    ld entity_estado(ix), #8
    ld entity_x(ix), #0
    ld entity_vy(ix), #5
    ld ix, #enemyUp1Pos
     call  borrarEnemigo5
     ld ix, #playerPos
    ld b, entity_x(ix)
    ld ix, #enemyUp1Pos
     ld entity_estado(ix), #1
    ld entity_color(ix), #0xF0
    ld entity_y(ix), #0x40
    jp  GameOver