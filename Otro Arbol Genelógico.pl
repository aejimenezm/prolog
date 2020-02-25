hombre(alejandrocordova).
hombre(alejandrolopez).
hombre(davidcordova).
hombre(abellopez).
hombre(ramirolopez).
hombre(maynormiranda).
hombre(denilsoncordova).
hombre(franklincordova).
hombre(leopoldocordova).
hombre(elfito).
hombre(ramiromiranda).

hombre(gabrielcordova).
hombre(carloscordova).

mujer(elviacordova).
mujer(marilucordova).
mujer(celestemiranda).
mujer(marlenymiranda).
mujer(milvimiranda).
mujer(rebecacordova).
mujer(julissamiranda).
mujer(jennifercordova).
mujer(carlotamiranda).
mujer(lichacordova).
mujer(gladyscordova).
mujer(blancalopez).

mujer(marisolmiranda).
mujer(carlamiranda).

pareja(alejandrolopez,marlenymiranda).
pareja(elfito,celestemiranda).
pareja(maynormiranda,gladyscordova).
pareja(abellopez,blancalopez).
pareja(ramiromiranda,carlotamiranda).

pareja(gabrielcordova,marisolmiranda).
pareja(carloscordova,carlamiranda).

progenitor(alejandrolopez,alejandrocordova).
progenitor(alejandrolopez,davidcordova).
progenitor(abellopez,denilsoncordova).
progenitor(ramirolopez,rebecacordova).
progenitor(maynormiranda,franklincordova).
progenitor(maynormiranda,julissamiranda).
progenitor(leopoldocordova,alejandrolopez).
progenitor(leopoldocordova,abellopez).
progenitor(leopoldocordova,ramirolopez).
progenitor(leopoldocordova,elviacordova).
progenitor(leopoldocordova,marilucordova).
progenitor(ramiromiranda,marlenymiranda).
progenitor(ramiromiranda,celestemiranda).
progenitor(ramiromiranda,maynormiranda).
progenitor(marlenymiranda,alejandrocordova).

progenitor(marlenymiranda,davidcordova).
progenitor(elviacordova,milvimiranda).
progenitor(marilucordova,jennifercordova).
progenitor(lichacordova,alejandrolopez).
progenitor(lichacordova,abellopez).
progenitor(lichacordova,ramirolopez).
progenitor(lichacordova,lichacordova).
progenitor(lichacordova,marilucordova).
progenitor(carlotamiranda,maynormiranda).
progenitor(carlotamiranda,celestemiranda).
progenitor(carlotamiranda,marlenymiranda).

progenitor(gabrielcordova,carlotamiranda).
progenitor(marisolmiranda,carlotamiranda).
progenitor(carloscordova,leopoldocordova).
progenitor(carlamiranda,leopoldocordova).

padre(X,Y):-hombre(X),progenitor(X,Y).
madre(X,Y):-mujer(X),progenitor(X,Y).




hermanos(X,Y):-progenitor(Z,X),progenitor(Z,Y), not(X==Y).
hermano(X,Y):-hombre(X),hermanos(X,Y).
hermana(X,Y):-mujer(X),hermanos(X,Y).
esposo(X,Y):-pareja(X,Y),hombre(X).
esposa(X,Y):-pareja(X,Y),mujer(X).
suegro(X,Y):-padre(X,Z),pareja(Y,Z).
suegra(X,Y):-madre(X,Z),esposos(Y,Z).
yerno(X,Y):-suegro(Y,X);suegra(Y,X),hombre(X).
nuera(X,Y):-suegro(Y,X);suegra(Y,X),mujer(X).
cunados(X,Y):-((pareja(X,Z),hermanos(Z,Y));(pareja(Y,Z),hermanos(Z,X))).
cunado(X,Y):-cunados(X,Y),hombre(X).
cunada(X,Y):-cunados(X,Y),mujer(X).
abuelo(X,Y):-progenitor(Z,Y),padre(X,Z).
abuela(X,Y):-progenitor(Z,Y),madre(X,Z).
nieto(X,Y):-progenitor(Y,Z),progenitor(Z,X),hombre(X).
nieta(X,Y):-progenitor(Y,Z),progenitor(Z,X),mujer(X).
tio(X,Y):-progenitor(Z,Y),(hermano(X,Z);cunado(X,Z)).
tia(X,Y):-progenitor(Z,Y),(hermana(X,Z);cunada(X,Z)).
primo(X,Y):-progenitor(Z,X),progenitor(W,Y),hermanos(Z,W),hombre(X).
prima(X,Y):-progenitor(Z,X),progenitor(W,Y),hermanos(Z,W),mujer(X).

bisabuela(X,Y):-madre(X,Z),abuelo(Z,Y).
bisabuela(X,Y):-madre(X,Z),abuela(Z,Y).
bisabuelo(X,Y):-padre(X,Z),abuelo(Z,Y).
bisabuelo(X,Y):-padre(X,Z),abuela(Z,Y).
