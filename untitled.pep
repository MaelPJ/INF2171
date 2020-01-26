BR main

message: .ASCII "Saisissez un numéro de carte de crédit à valider de 8 chiffres.\x00"
msgcarte: .ASCII "Le numéro de la carte à valider: \x00" 
msg_err: .ASCII "Le chiffre n'est pas valide\x00" 
msg_val: .ASCII "Résultat de l'étape 3:La carte est valide\x00" 
msg_inva: .ASCII "Résultat de l'étape 3:La carte est invalide\x00" 
FINLIGNE: .EQUATE 0x000A

numero1: .BLOCK 8
numero2: .BLOCK 8
numero3: .BLOCK 8
numero4: .BLOCK 8
numero5: .BLOCK 8
numero6: .BLOCK 8
numero7: .BLOCK 8
numero8: .BLOCK 8


main: STRO message, d
      CHARO FINLIGNE, i 
      DECI numero1, d
      DECI numero2, d
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
STOP
.END
