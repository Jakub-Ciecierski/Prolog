% The list PathFr is a path from Fr room to To room (with an empty visited list) 
% if 
% 1) there is a room X adjecent to the Fr room
% and
% 2) X has not been visited during the search of the patch 
% and
% 3) a list PathX is a path from X to To (X is pushed to the visited list) 
% and
% 4) PathFr is a concatenation of X and PathX 

module(rooms).
library(lists).

/* Stopping condition */
find_path([], X, X,_) :- writeln('STOP').
		
find_path(Pth, Fr, To, V) :- 
		Fr connects_with X, 			% Point 1

		is_list(V),						% Point 2
		\+ member(X,V),				% 
		writeln(['V=' | V]),
		V_X = [X|V],					% Point 3
		
		find_path(PthX, X, To, V_X), 		% Recursion
		
		Pth = [X|PthX].					% Point 5
		
		
		
