:- module(rooms_rules_op, [p_is_path_from_Fr_to_To/3]).
:- reexport(rooms).
p_is_path_from_Fr_to_To(Path, Fr, To) :- p_is_path_from_Fr_to_To_(Path, Fr, To, []).
p_is_path_from_Fr_to_To([], X, X).

% --- COMMENTS ------
% The above is an example of a module definition.
% Namespace is local. In SWI-prolog is not like in some other prologs.
% To use names, we have to export them, what module predicate does.

% In definition of p_is_path_from_Fr_to_To(Path, Fr, To), the p_is_path_from_Fr_to_To(Path, Fr, To)
% is defined using a local p_is_path_from_Fr_to_To_(Path, Fr, To, []) (please notice
% the underscore character at the end!

library(lists).

% usage find_path(Beg, End, [], LeftPath).
p_is_path_from_Fr_to_To_([], To, To, _).
%p_is_path_from_Fr_to_To_([To], Fr, To, _) :- Fr connects_with To, !.
p_is_path_from_Fr_to_To_(Path, Fr, To, VL) :- Fr connects_with X,
				is_list(VL), \+ member(X, VL),
				p_is_path_from_Fr_to_To_(PathX, X, To, [X | VL]),
				[X | PathX] = Path.
