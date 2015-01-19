% This is the syntax for comments.
% MORTAL - The first illustrative Prolog program

mortal(X) :- person(X).

person(socrates).
person(plato).
person(aristotle).

mortal_report:-
  write('Known mortals are:'),nl,
  mortal(X),
  write(X),nl,
  fail.
  
  
easy(1).
easy(2).
easy(3).

gizmo(a,1).
gizmo(b,3).
gizmo(a,2).
gizmo(d,5).
gizmo(c,3).
gizmo(a,3).
gizmo(c,4).

harder(a,1).
harder(c,X).
harder(b,4).
harder(d,2).