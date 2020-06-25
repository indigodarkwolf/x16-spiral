.segment "INIT"
.segment "STARTUP"
.segment "ONCE"
.segment "CODE"
.data
start_data:
.code

;=================================================
;=================================================
; 
;   Headers
;
;-------------------------------------------------

.include "debug.inc"
.include "vera.inc"
.include "system.inc"
.include "math.inc"
.include "kernal.inc"

;=================================================
; Macros
;
;-------------------------------------------------

DEFAULT_SCREEN_ADDR = 0
DEFAULT_SCREEN_SIZE = (128*64)*2

;=================================================
;=================================================
; 
;   main code
;
;-------------------------------------------------
.code
start:
    SYS_INIT_BANK
    SYS_INIT_IRQ
    SYS_RAND_SEED $34, $56, $fe
    SYS_CONFIGURE_MOUSE 0

    jsr graphics_init
    jsr math_init

    lda #2
    jsr graphics_fade_out
    jsr splash_do

    jmp *

;=================================================
;=================================================
; 
;   Libs
;
;-------------------------------------------------
.include "system.asm"
.include "graphics.asm"
.include "splash.asm"
.include "vera.asm"
.include "math.asm"

.code
DEBUG_LABEL end_of_code