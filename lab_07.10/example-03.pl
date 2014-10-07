#read_list(L) :- read_list([]).

read_character :- get_char(Char), put_char(Char), nl, nl, nl,
		continue_reading(Char),
		read_character.
continue_reading(Ch) :- not(Ch=z).
