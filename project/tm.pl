:- module(tm, [compute/2]).
:- use_module(library(lists)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Interpreter of Turing Machine.
%	One tape, two-way infinite.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Usage of interpreter:
%	1) Find your turin machine of choice (e.g. tm_example1.pl )
%	2) Call use_module(tm_example1).
%	3) Call compute/2.
%		e.g compute([1,0,0,0], Output).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	The tape will be represented as follows:
%
%	Left - List of elements starting from one before Head,
%		ending on the left most non-blank symbol
%		(In normal TM representation that would be reserved,
%			but using that we can fetch the first element on the left from Head
%			very easily without having to revers the list all the time,
%			thus the Left list is reversed at the end of computation for Output)
%			
%	Head - Holds the symbol under the head marker
%
%	Right - List of elements starting from one after Head, ending
%		on the right most non-blank.
%
%	The Symbols of tape are:
%	1) Input alphabet
%	2) Type alphabet
%	3) Blank symbol represented with: &
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	How does the Interpreter work:
%
%	1) We start computation by calling:
%		compute(Input, Output)
%			where Input is the word we want to check acceptence,
%			represented in a list,
%			and Output is the tape after computation
%
%		e.g.:
%			compute([1,0,1,0], Output)
%	
%	2) config(State, Left, Head, Right)
%		is called recursively which in turn computes:
%			2.1) transition(State, Head, NewState, Write, Direction)
%					a good old transition function: 
%					( State x InputSymbol) -> (State x InputSymbol x Direction)
%			2.2) move(Direction, Left, Write, Right, NewLeft, NewHead, NewRight)
%					makes a move of the TM, changing the layout of the tape
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	The TM can move:
%		right, left or stop
%	A collection of five move/7 rules insure a correct movement of TM
%	Look for move/7 documentation for details
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%% Five move/7 rules, defining the change of tape layout %%%%%%%

% Case 1)
% TM stops
move(s,						% Direction
	Left,					% CurrentLeft
	CurrentHead,			% CurrentHead
	Right,					% CurrentRight
	Left,  					% NewLeft := same
	CurrentHead,			% NewHead := same
	Right).					% NewRight := same


% Case 2)
% TM moves right, into non-blank symbol
move(r,						% Direction
	Left,					% CurrentLeft
	CurrentHead,			% CurrentHead
	[NewHead|Tail],			% CurrentRight
	[CurrentHead|Left],  	% NewLeft := we append the CurrentHead to Left list
	NewHead,				% NewHead := is the first element of Right list
	Tail).					% NewRight := Same as Right, but without first symbol
					
% Case 3)
% TM moves right, into blank symbol, e.i Right is empty
move(r,						% Direction
	Left,					% CurrentLeft
	CurrentHead,			% CurrentHead
	[],						% CurrentRight
	[CurrentHead|Left],  	% NewLeft := to Left, we append the CurrentHead
	&,						% NewHead := blank symbol
	[]).					% NewRight := empty

% Case 4)
% TM moves left, into non-blank symbol
move(l,						% Direction
	[NewHead|Tail],			% CurrentLeft
	CurrentHead,			% CurrentHead
	Right,					% CurrentRight
	Tail,  					% NewLeft := same as Left but we remove first element
	NewHead,				% NewHead := we append CurrentHead to Right list
	[CurrentHead|Right]).	% NewRight := the first element on Left list
	
% Case 5)
% TM moves left, into blank symbol
move(l,						% Direction
	[],						% CurrentLeft
	CurrentHead,			% CurrentHead
	Right,					% CurrentRight
	[],  					% NewLeft := same as Left but we remove first element
	&,						% NewHead := we append CurrentHead to Right list
	[CurrentHead|Right]).	% NewRight := the first element on Left list
	

% The initial state of TM
initial(q0).

% Accepting states
accepting(acc).

% Rejecting states
rejecting(rej).

%	Starts the computation of TM
compute([Head | Tail], Output) :- 
	initial(Q), 						% Fetch the initial state
	config(Q,[],Head,Tail, Output).		% Left is empty at start
	

%	Represent current configuration of TM
%	1) Computes the transition function
%	2) Makes a move
%	3) Recursively calls next configuration
config(Q, Left, Head, Right, Output) :-
	transition(Q, Head, NewQ, Write, Direction),						% 1) transition
	move(Direction, Left, Write, Right, NewLeft, NewHead, NewRight),	% 2) move

	nl,write('Transtiong from: '), nl,
	write('State: '),write(Q), nl,
	write('Tape: '),reverse(Left,RevLeft),write(RevLeft),write(' '),write(Head),write(Right),nl,
	write('To: '), nl,
	write('State: '),write(NewQ), nl,
	write('Tape: '),reverse(NewLeft,RevNewLeft),write(RevNewLeft),write(' '),write(NewHead),write(' '),write(NewRight),nl,nl,
	
	config(NewQ, NewLeft, NewHead, NewRight, Output).					% 3) next config

% When we enter accepting state,
% Reverse the Left list to contruct proper tape layout
config(acc,Left, Head, Right, Output) :-
	write('Entered Accepting state'),
	reverse(Left, RevLeft),
	append(RevLeft, [Head|Right], Output),
	!. % The Cut will disable backtracking to other config/5

% When we enter rejecting state,
% inform about the rejection
config(rej,_,_,_,['Rejected!']) :- write('Entered Rejecting state').

config(_,_,_,_,['Rejected!']) :- write('No transition found').