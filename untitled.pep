
BR main




message: .ASCII "Saisissez un numéro de carte de crédit à valider de 8 chiffres.\x00"

message2: .ASCII "Un chiffre à la fois, SVP.\x00"

msgcarte: .ASCII "Le numéro de la carte à valider:\x00" 

msgres1: .ASCII "Résultat de l'étape 1:\x00"

msgres2: .ASCII "Résultat de l'étape 2: \x00"

msg_err: .ASCII "Le chiffre n'est pas valide\x00" 

msg_val: .ASCII "Résultat de l'étape 3:La carte est valide\x00" 

msg_inva: .ASCII "Résultat de l'étape 3:La carte est invalide\x00" 

FINLIGNE: .EQUATE 0x000A



numero1: .BLOCK 8

num1_2: .BLOCK 8

numero2: .BLOCK 8

numero3: .BLOCK 8

num3_2: .BLOCK 8

numero4: .BLOCK 8

numero5: .BLOCK 8

num5_2: .BLOCK 8

numero6: .BLOCK 8

numero7: .BLOCK 8

num7_2: .BLOCK 8

numero8: .BLOCK 8

somme: .WORD 0





main: STRO message, d

CHARO FINLIGNE, i 

STRO message2, d

CHARO FINLIGNE, i

DECI numero1, d ; entree numero carte
LDA numero1, d
CPA 9, i
BRGT B
STA numero1, d
BR C
B: STRO msg_err, d

C: DECI numero2, d

DECI numero3, d

DECI numero4, d

DECI numero5, d

DECI numero6, d

DECI numero7, d

DECI numero8, d

STRO msgcarte, d

DECO numero1, d

DECO numero2, d

DECO numero3, d

DECO numero4, d

DECO numero5, d

DECO numero6, d

DECO numero7, d

DECO numero8, d

LDA somme, d

ADDA numero2, d

ADDA numero4, d

ADDA numero6, d

ADDA numero8, d

STA somme, d

CHARO FINLIGNE, i

STRO msgres1, d

DECO somme, d ; verification etape 1

LDA 0, d ; balayage de l'accumulateur

LDA numero1, d

ASLA

STA num1_2, d

CHARO FINLIGNE, i

DECO num1_2, d

LDA 0, d ; balayage de l'accumulateur

LDA numero3, d

ASLA

STA num3_2, d

CHARO FINLIGNE, i

DECO num3_2, d

LDA 0, d ; balayage de l'accumulateur

LDA numero5, d

ASLA

STA num5_2, d

CHARO FINLIGNE, i

DECO num5_2, d

LDA 0, d ; balayage de l'accumulateur

LDA numero7, d

ASLA

STA num7_2, d

CHARO FINLIGNE, i

DECO num7_2, d



STOP

.END
