:- module(tm_example2, [transition/5]).

% Turing Machine computing ceiling(n/3)
% Assumes Input unary sequence of 0s

transition(q0,0,q2,x,r).
transition(q0,&,q6,&,r).

transition(q1,0,q2,a,r).
transition(q1,&,q6,&,l).

transition(q2,0,q2,0,r).
transition(q2,&,q3,&,l).

transition(q3,0,q4,&,l).
transition(q3,a,q6,0,l).
transition(q3,x,q6,0,r).

transition(q4,0,q5,&,l).
transition(q4,a,q6,0,l).
transition(q4,x,q6,0,r).

transition(q5,0,q5,0,l).
transition(q5,a,q1,a,r).
transition(q5,x,q1,x,r).

transition(q6,0,acc,0,s).
transition(q6,a,q6,0,l).
transition(q6,x,q6,0,r).
transition(q6,&,acc,&,s).