% This is a layout of my house.

room(kitchen).
room(washroom1).
room(entrance_hall).
room(hall1).
room(wc1).
room(room1).
room(room2).
room(living_room).
room(stair1).
room(stair2).
room(fireroom).
room(drying_room).
room(cellar).
room(hall2).
room(store).
room(washroom2).
room(room3).
room(room4).
room(technical_room).

:- op(500,xfx,'connects_with').

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

stair1 connects_with hall1.
hall1 connects_with stair1.

stair2 connects_with hall1.
hall1 connects_with stair2.

stair1 connects_with hall2.
hall2 connects_with stair1.


