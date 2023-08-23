
null    BRA start
        DAT 33 // !
        DAT 100 // d
        DAT 108 // l
        DAT 114 // r
        DAT 111 // o
        DAT 119 // w
        DAT 32 // space
        DAT 44 // , 
        DAT 111 // o
        DAT 108 // l
        DAT 108 // l
        DAT 101 // e
string  DAT 72 // start of string in reverse
length  DAT length
start   LDA zero
        STA null
        LDA length
        SUB one
        ADD load
        STA loop
loop    DAT 
        BRZ zero
        OTC
        LDA loop 
        SUB one
        STA loop
        BRA loop
zero    DAT 0
one     DAT 1
load    DAT 500
