BR main

message: .ASCII "Saisissez un num�ro de carte de cr�dit � valider de 8 chiffres.\x00"
msg_err: .ASCII "Le chiffre n'est pas valide\x00" 
msg_val: .ASCII "R�sultat de l'�tape 3:La carte est valide\x00" 
msg_inva: .ASCII "R�sultat de l'�tape 3:La carte est invalide\x00" 
FINLIGNE: .EQUATE 0x000A

numero1: .BLOCK 1
numero2: .BLOCK 1
numero3: .BLOCK 1
numero4: .BLOCK 1
numero5: .BLOCK 1
numero6: .BLOCK 1
numero7: .BLOCK 1
numero8: .BLOCK 1


main: STRO message,d
      CHARO FINLIGNE,i 
      DECI numero, d

      DECO numero, d
STOP
.END