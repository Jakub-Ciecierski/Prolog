% Searching list
on(Item,[Item|Rest]) :- writeln('search complete').
on(Item,[DisregardHead|Tail]) :- on(Item,Tail),writeln('searching').

% Creating list

% Adding 'prolog' to head
% List2 = [prolog|List1]

% append([a,b,c],[one,two,three],Result).
% Result = [a,b,c,one,two,three]


my_append([],List,List).
my_append([Head|Tail],List2,[Head|Result]):- 
					my_append(Tail,List2,Result).