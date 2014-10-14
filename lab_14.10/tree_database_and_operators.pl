/* The tree database 
example from "prolog :- tutorial" by John R. Fisher,
http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/contents.html
*/ 

:- op(500,xfx,'is_parent_of'). 

a is_parent_of b.
c is_parent_of g.
f is_parent_of l.
j is_parent_of q. 
a is_parent_of c.
c is_parent_of h.
f is_parent_of m.
j is_parent_of r. 
a is_parent_of d.
c is_parent_of i.
h is_parent_of n.
j is_parent_of s. 
b is_parent_of e.
d is_parent_of j.
i is_parent_of o.
m is_parent_of t. 
b is_parent_of f.
e is_parent_of k.
i is_parent_of p. 
 
:- op(500, xfx, 'is_sibling_of').

X is_sibling_of Y :- Z is_parent_of X, Z is_parent_of Y, X \== Y.

/* X and Y are on the same level in the tree. */ 
:-op(500,xfx,'is_on_the_same_level_as').

X is_on_the_same_level_as X :- !.
X is_on_the_same_level_as Y :- X1 is_parent_of X,
			Y1 is_parent_of Y,
			X1 is_on_the_same_level_as Y1.

/* Depth of node in the tree. */ 
:- op(500,xfx,'has_depth'). 

% a has_depth 0 :- !.

X has_depth 0 :- X is_parent_of _, not(_ is_parent_of X).

/* What will result from removing "X is_parent_of _" ? */

X has_depth D :- P is_parent_of X,
		P has_depth D1,
		D is D1 + 1.

/* Locate node by finding a path from root down to the node. */ 
locate(Node) :- path_to(Node), 
                write(Node), 
                nl. 

path_to(N) :- N has_depth 0, !.
path_to(N) :- P is_parent_of N,
           path_to(P),
           write(P), write(' --> ').


