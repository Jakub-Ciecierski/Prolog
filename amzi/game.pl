# http://www.amzi.com/AdventureInProlog/a11lists.php

:-dynamic here/1.
:-dynamic have/1.
:-dynamic location/2.
:-dynamic turn_on/1.
:-dynamic turn_off/1.
:-dynamic turned_on/1.

room(kitchen).
room(office).
room(hall).
room('dining room').
room(cellar).

door(office, hall).
door(kitchen, office).
door(hall, 'dining room').
door(kitchen, cellar).
door('dining room', kitchen).

opened(office, hall).
opened(hall, 'dining room').
opened(kitchen, cellar).

opened(kitchen, office).
closed('dining room', kitchen).

location(desk, office).
location(apple, kitchen).
location(flashlight, desk).
location('washing machine', cellar).
location(nani, 'washing machine').
location(broccoli, kitchen).
location(crackers, kitchen).
location(computer, office).
location(envelope, desk).
location(stamp, envelope).
location(key, envelope).

% example with structures
location_s(object(candle, red, small, 1), kitchen).
location_s(object(apple, red, small, 1), kitchen).
location_s(object(apple, green, small, 1), kitchen).
location_s(object(table, blue, big, 50), kitchen).

edible(apple).
edible(crackers).

tastes_yucky(broccoli).

here(kitchen).

have(_):-!,fail.
turned_on(_):- !,fail.

is_contained_in(T1,T2) :-  
	location(T1,T2).

is_contained_in(T1,T2) :-
	location(X,T2),
	is_contained_in(T1,X).

connect(X,Y) :- door(X,Y).
connect(X,Y) :- door(Y,X).

is_opened(X,Y) :- opened(X,Y).
is_opened(X,Y) :- opened(Y,X).
is_opened(_,_) :- 
	write('The door is closed'), nl, fail.

is_closed(X,Y) :- closed(X,Y).
is_closed(X,Y) :- closed(Y,X).

where_food(X,Y) :-  
  location(X,Y),
  edible(X).
  
where_food(X,Y) :-
  location(X,Y),
  tastes_yucky(X).
  
list_things(Place) :-  
  location(X, Place),
  tab(2),
  write(X),
  nl,
  fail.
  
list_things(_).

list_connections(Place) :-
	connect(Place, X),
	tab(2),
	write(X),
	nl,
	fail.
list_connections(_).

look :-
	here(Place),	
	write('You are in the '), write(Place), nl,
	write('You can see:'), nl,
	list_things(Place),
	write('You can go to:'), nl,
	list_connections(Place).
 
look_in(Place) :-
	write('Inside the '), write(Place), nl,
	list_things(Place).
	
goto(Place) :-
	puzzle(goto(Place)),
	can_go(Place),
	move(Place),
	look,!.

can_go(Place):-	
	here(X),
	connect(X,Place),
	is_opened(X,Place).
	
can_go(Place):-
	write('You can''t get there from here.'), nl,
	fail.	

move(Place):-
	retract(here(X)),
	asserta(here(Place)).

take(X):-  
	can_take(X),
	take_object(X),!.

can_take(Thing) :-
	here(Place),
	is_contained_in(Thing,Place).

can_take(Thing) :-
	write('There is no '), write(Thing),
	write(' here.'),
	nl, fail.

take_object(X):-  
	retract(location(X,_)),
	asserta(have(X)),
	write('taken'), nl.
	
put(X):-
	have(X),
	here(Y),
	asserta(location(X,Y)),
	write(X), write(' has been put in '),write(Y).
	
put(X):-
	write('You dont have '), write(X).

inventory:-
	write('You have:'), nl,
	have(X),
	tab(3), write(X), nl,
	fail.
inventory.

turn_on(X):-
	have(X),
	asserta(turned_on(X)),
	write(X), write(' has been turned on'),!.
	
turn_off(X):-
	have(X),
	retract(turned_on(X)),
	write(X), write(' has been turned off').
	
puzzle(goto(cellar)):-
	have(flashlight),
	turned_on(flashlight),
	!.

puzzle(goto(cellar)):-
	write('It is too dark and scary there'),
	!, fail.

puzzle(_).
	

	