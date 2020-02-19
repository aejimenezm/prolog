%ARBOL GENEALOGICO

%VARONES
%varon(x): x es varon
varon(guillermo).
varon(roberto).
varon(javier).
varon(carlos).

%MUJERES
%mujer(x): x es mujer
mujer(grethel).
mujer(elvia).
mujer(maria).

%relacion de padre
%padre(x,y): x es padre de y
padre(guillermo,javier).
padre(guillermo,grethel).
padre(roberto,maria).
padre(roberto,carlos).

%relacion de madre
%madre(x,y): x es madre de y
madre(maria,grethel).
madre(maria,javier).
madre(elvia,maria).
madre(elvia,carlos).

%REGLAS
diferente(X,Y):-not(X=Y).
%abuelo(X,Y): Xes abuelo dde Y.
abuelo(X,Y):-padre(X,Z),((padre(Z,Y));(madre(Z,Y))).

%abuela
abuela(X,Y):-madre(X,Z),((padre(Z,Y));(madre(Z,Y))).

%hijo(x,y):x es hijo de y
hijo(X,Y):-varon(X),(padre(Y,X);madre(Y,X)).

%hija(x,y):x es hija de y
hija(X,Y):-mujer(X),(padre(Y,X);madre(Y,X)).

%hermano(x,y): x es hermano de y
hermano(X,Y):-padre(Z,X),padre(Z,Y),madre(Z1,X),madre(Z1,Y),not(X=Y),varon(X).

%hermana
hermana(X,Y):-padre(Z,X),padre(Z,Y),madre(Z1,X),madre(Z1,Y),not(X=Y),mujer(X).


%sobrino(X,Y) : X ES SOBRINO DE Y
sobrino(X,Y):-hijo(X,P),(hermano(P,Y);hermana(P,Y)).

%sobrina (X,Y): X ES SOBRINA DE Y
% sobrina(X,Y):-hija(X,P),(hermano(P,Y);hermana(P,Y)),((madre(Y,HA),mujer(Y),padre(Z1,HA));(varon(Y),padre(Y,HB),madre(Z2,HB))).
sobrina(X,Y):-hija(X,P),(hermano(P,Y);hermana(P,Y)).


%tio(X,Y):x es tio de y
tio(X,Y):-varon(X),((padre(P,Y),hermano(X,P);madre(M,Y),hermano(X,M));(padre(X,M2),madre(AU,M2),(hermana(AU,M1),madre(M1,Y);hermana(AU,P1),padre(P1,Y)))).
%tio(X,hY):-varon(X),(sobrina(Y,X);sobrino(Y,X)).
%
tio(X,Y):-varon(X),(sobrina(Y,X);sobrino(Y,X)).


%tia
tia(X,Y):-mujer(X),((padre(P,Y),hermana(X,P);madre(M,Y),hermana(X,M));(madre(X,M2),padre(AU,M2),(hermano(AU,M1),madre(M1,Y);hermano(AU,P1),padre(P1,Y)))).
%primo(X,Y): X Es primo de Y
primo(X,Y):-(padre(Z,Y);madre(Z,X)),(padre(Z1,Y);madre(Z1,Y)),(hermana(Z,Z1);hermana(Z,Z1)),varon(X),diferente(X,Y).
%prima(X,Y): X Es prima de Y
prima(X,Y):-(padre(Z,Y);madre(Z,X)),(padre(Z1,Y);madre(Z1,Y)),(hermana(Z,Z1);hermana(Z,Z1)),mujer(X),diferente(X,Y).


%padrastro: X ES PADRASTRO DE Y
padrastro(X,Y):-not(hijo(Y,X);hija(Y,X)),padre(X,H),(madre(M,Y),madre(M,H)),varon(X),!.

%madrastra
madrastra(X,Y):-not(hijo(Y,X);hija(Y,X)),madre(X,H),(padre(P,Y),padre(P,H)),mujer(X),!.



%hermanastro(x,y):x es hermanastro de y
hermanastro(X,Y):-(((padre(P,X),padre(P,Y)),madre(M,X),madre(A,Y),not(M=A));(madre(M2,X),madre(M2,Y)),padre(P2,X),padre(A2,Y),not(P2=A2)),varon(X).

%hermanastra
hermanastra(X,Y):-(((padre(P,X),padre(P,Y)),madre(M,X),madre(A,Y),not(M=A));(madre(M2,X),madre(M2,Y)),padre(P2,X),padre(A2,Y),not(P2=A2)),mujer(X).

% ANCESTRO CASO BASE
ancestro(X,Y):-padre(X,Y).
ancestro(X,Y):-madre(X,Y).
ancestro(X,Y):-padre(X,Z),ancestro(Z,Y).
ancestro(X,Y):-madre(X,Z),ancestro(Z,Y).
%CASO RECUERRENTE
ancestro(X,Y):-(padre(X,Z);madre(X,Z)),ancestro(Z,Y).

%DESCENDIENTE
descendiente(X,Y):-ancestro(Y,X).

%hermanastra(X,Y):-(padre(Z,X);madre(Z,X)),(padre(Z,Y);madre(Z,Y)),not(X=Y),not(varon(Y)).





















