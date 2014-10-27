%:- module(rooms, [room/1, connects_with/2, op(500, xfx, connects_with)]).

intersection(inter1).
intersection(inter2).
intersection(inter3).
intersection(inter4).
intersection(inter5).

on(Item,[Item|Rest]) :- writeln('search complete').
on(Item,[DisregardHead|Tail]) :- on(Item,Tail),writeln('searching').

:- op(500,xfx,connects_with).

