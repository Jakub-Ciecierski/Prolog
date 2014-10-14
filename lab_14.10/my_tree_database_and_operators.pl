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


is_root(X) :- X is_parent_of _, not(_ is_parent_of X),!.

:- op(500,xfx,'is_sibbling_of').

is_sibbling_of(X,Y) :- Z is_parent_of X, Z is_parent_of Y.

:- op(500,xfx,'is_on_same_level').

a is_on_same_level a.

is_on_same_level(X,Y) :- X is_sibbling_of Y.

is_on_same_level(X,Y) :- X1 is_parent_of X, Y1 is_parent_of Y,
							is_on_same_level(X1,Y1).

