:- module(tm_example1, [transition/5]).

% Turing Machine accepting binary words with each 0 being followed by one or two 1s
%
% Words in the language:
% 101101111, 10, 111
%
% Words not in the language
% 0, 100
%
% Assumes binary input of sequence of 0s and 1s

transition(q0, 0, rej, 0, s).
transition(q0, 1, q1, 1, r).
transition(q0, &, acc, &, s).

transition(q1, 0, q0, 0, r).
transition(q1, 1, q11, 1, r).
transition(q1, &, acc, &, s).

transition(q11, 0, q0, 0, r).
transition(q11, 1, q2, 1, r).
transition(q11, &, acc, &, s).

transition(q2, 0, rej, 0, s).
transition(q2, 1, q2, 1, r).
transition(q2, &, acc, &, s).
