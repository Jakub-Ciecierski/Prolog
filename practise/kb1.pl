eatsBrain(tom).

dances(tom).
dances(anna).

runFast(anna).
runFast(jaime).

hasGun(anna).
hasGun(jaime).

likes(jaime,anna).
likes(anna,jaime).

zombie(X) :- eatsBrain(X), dances(X).
zombieKiller(X) :- runFast(X), hasGun(X).
partners(X,Y) :- zombieKiller(X), zombieKiller(Y), likes(X,Y), likes(Y,X).
