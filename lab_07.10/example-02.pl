person(alice).
person(husband).
person(brother).
person(son).
person(daughter).


were_not_together(alice,husband).
were_not_together(husband,alice).

could_be_together(X,Y):- nl, person(X), write(X),nl,nl,nl,
person(Y),
not(were_not_together(X,Y)), 
X\==Y.
