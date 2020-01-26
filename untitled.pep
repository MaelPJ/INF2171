
; Programme qui valide les huits chiffres d'un numero de carte de credit,
; qui doit tous etres des chiffres decimals entre 0 et 9, à l'exception du
; chiffre le plus significatif qui doit être supérieur à 0 et vérifie si la
; la somme totale de  la somme de chaque chiffre en position impaire en commençant 
; à partir du chiffre le moins significatif plus la somme des chiffres contenu dans les
; nombres résultant de la multiplication par deux des chiffres de la carte restant est
; un multiple de 10. Si tel est le cas, le numéro de la carte est validé.
; 11 février 2020, Maël Pilon-Joly, peops_finding911@hotmail.com, PILM04049303 

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
num1_2: .BLOCK 8 ; variable 2e étape de validation
num1d10: .BLOCK 8
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



somme: .WORD 0 ; 1e validation
somme2: .WORD 0 ; 2e validation

somme1: .WORD 0
somme3: .WORD 0
somme5: .WORD 0
somme7: .WORD 0










main: STRO message, d



CHARO FINLIGNE, i 



STRO message2, d



CHARO FINLIGNE, i


        
A:DECI numero1, d ; entree numero carte

LDA numero1, d
       
CPA 9, i
       
BRGT B ; condition vers branchement si numero1 est plus grand que 9
CPA 1, i
BRLT B ; condition vers branchement si numero1 est plus petit que 1

STA numero1, d

BR C

B: STRO msg_err, d
   CHARO FINLIGNE,i ; saut de ligne 

   BR A; boucle de validation
      
C: DECI numero2, d

LDA 0, d
LDA numero2, d
CPA 9, i
BRGT D ; condition  vers branchement si numero1 est plus grand que 9
CPA 0, i ; comparaison
BRLT D
STA numero2, d
BR E

D: STRO msg_err, d
   CHARO FINLIGNE, i ; saut de ligne
   BR C; boucle de validation
 
   
E:DECI numero3, d



LDA 0, d
LDA numero3, d
CPA 9, i
BRGT F ; condition  vers branchement si numero1 est plus grand que 9
CPA 0, i ; comparaison
BRLT F
STA numero3, d
BR G

F: STRO msg_err, d
   CHARO FINLIGNE, i ; saut de ligne
   BR E; boucle de validation

 


G:DECI numero4, d



LDA 0, d
LDA numero4, d
CPA 9, i
BRGT H ; condition  vers branchement si numero1 est plus grand que 9
CPA 0, i ; comparaison
BRLT H
STA numero4, d
BR I

H: STRO msg_err, d
   CHARO FINLIGNE, i ; saut de ligne
   BR E; boucle de validation

 


I:DECI numero5, d



LDA 0, d
LDA numero5, d
CPA 9, i
BRGT J ; condition  vers branchement si numero1 est plus grand que 9
CPA 0, i ; comparaison
BRLT J
STA numero5, d
BR K

J: STRO msg_err, d
   CHARO FINLIGNE, i ; saut de ligne
   BR I; boucle de validation

 


K:DECI numero6, d



LDA 0, d
LDA numero6, d
CPA 9, i
BRGT L ; condition  vers branchement si numero1 est plus grand que 9
CPA 0, i ; comparaison
BRLT L
STA numero6, d
BR M

L: STRO msg_err, d
   CHARO FINLIGNE, i ; saut de ligne
   BR K; boucle de validation

 


M:DECI numero7, d



LDA 0, d
LDA numero7, d
CPA 9, i
BRGT N ; condition  vers branchement si numero1 est plus grand que 9
CPA 0, i ; comparaison
BRLT N
STA numero7, d
BR O

N: STRO msg_err, d
   CHARO FINLIGNE, i ; saut de ligne
   BR M; boucle de validation

 

        
O:DECI numero8, d


LDA 0, d
LDA numero8, d
CPA 9, i
BRGT P ; condition  vers branchement si numero1 est plus grand que 9
CPA 0, i ; comparaison
BRLT P
STA numero2, d
BR Q

P: STRO msg_err, d
   CHARO FINLIGNE, i ; saut de ligne
   BR O; boucle de validation

 



          
Q:STRO msgcarte, d



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



LDA 0, d ; balayage de l'accumulateur



LDA numero3, d



ASLA



STA num3_2, d



LDA 0, d ; balayage de l'accumulateur



LDA numero5, d



ASLA



STA num5_2, d


LDA 0, d ; balayage de l'accumulateur



LDA numero7, d



ASLA



STA num7_2, d
; algorithme pour la deuxième étape de vérification
LDA 0, d
LDA num1_2, d ; ajout du 1e nombre à l'accumulateur
CPA 10, i
BRGE Ajout1 ; ajout de 1 à somme1
LDA somme1, d
ADDA num1_2, d
STA somme1, d
BR Fin1 
Ajout1: SUBA 9, i
STA somme1, d
Fin1:LDA num3_2, d ; ajout du 2e nombre à l'accumulateur
CPA 10, i
BRGE Ajout3 ; ajout de 1 à somme3
LDA somme3, d
ADDA num3_2, d
STA somme3, d
BR Fin3
Ajout3: SUBA 9, i
STA somme3, d
Fin3:LDA num5_2, d ; ajout du 3e nombre à l'accumulateur
CPA 10, i
BRGE Ajout5 ; ajout de 1 à somme5
LDA somme5, d
ADDA num5_2, d
STA somme5, d
BR Fin5
Ajout5: SUBA 9, i
STA somme5, d
Fin5:LDA num7_2, d ; ajout du 4e nombre à l'accumulateur
CPA 10, i
BRGE Ajout7 ; ajout de 1 à somme7
LDA somme7, d
ADDA num7_2, d
STA somme7, d
BR Fin7 
Ajout7: SUBA 9, i
STA somme7, d
Fin7:LDA 0, i
LDA somme2, d ; sommation de la 2e etape
ADDA somme1, d
ADDA somme3, d
ADDA somme5, d
ADDA somme7, d
STA somme2, d ; rangement de la somme dans somme2
CHARO FINLIGNE,i  
STRO msgres2, d
DECO somme2, d
STOP 
.END
