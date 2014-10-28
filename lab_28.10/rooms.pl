% This is a layout of my house.
% Change log:
% 2014-10-26
% stair1 ==> stairs1
% stair2 ==> stairs2
% wc2 added.
% opening between hall1 and stairs2 added.

:- module(rooms, [room/1, connects_with/2, op(500, xfx, connects_with)]).

room(kitchen).
room(washroom1).
room(entrance_hall).
room(hall1).
room(wc1).
room(room1).
room(room2).
room(living_room).
room(stairs1).
room(stairs2).
room(cellar_hall).
room(fireroom).
room(drying_room).
room(cellar).
room(hall2).
room(store).
room(wc2).
room(washroom2).
room(room3).
room(room4).
room(technical_room).

:- op(500,xfx,connects_with).

kitchen connects_with hall1.
hall1 connects_with kitchen.

washroom1 connects_with hall1.
hall1 connects_with washroom1.

entrance_hall connects_with hall1.
hall1 connects_with entrance_hall.

wc1 connects_with hall1.
hall1 connects_with wc1.

room1 connects_with hall1.
hall1 connects_with room1.

room2 connects_with hall1.
hall1 connects_with room2.

living_room connects_with hall1.
hall1 connects_with living_room.

stairs1 connects_with cellar_hall.
cellar_hall connects_with stairs1.

stairs1 connects_with hall1.
hall1 connects_with stairs1.

stairs2 connects_with hall1.
hall1 connects_with stairs2.

stairs2 connects_with hall2.
hall2 connects_with stairs2.

hall2 connects_with store.
store connects_with hall2.

hall2 connects_with wc2.
wc2 connects_with hall2.

hall2 connects_with washroom2.
washroom2 connects_with hall2.

hall2 connects_with room3.
room3 connects_with hall2.

hall2 connects_with room4.
room4 connects_with hall2.

hall2 connects_with technical_room.
technical_room connects_with hall2.

cellar_hall connects_with fireroom.
fireroom connects_with cellar_hall.

cellar_hall connects_with drying_room.
drying_room connects_with cellar_hall.

cellar_hall connects_with cellar.
cellar connects_with cellar_hall.

		

