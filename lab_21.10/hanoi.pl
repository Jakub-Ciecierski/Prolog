/* Start the game */
hanoi(N) :- move(N,fr,to,aux).

/* Stop the reccursion */
move(1,_,_,_) :- writeln('Stop'),!.

/* The reccursion */
move(N,Fr,To,Aux) :- M is N-1, 
					writeln(['move Begin', N]), 
					writeln(['From: ',Fr,' To:',To,' Aux:',Aux]),
					move(M,Fr,Aux,To),
					writeln(['From: ',Fr,' To:',Aux,' Aux:',To]),
					move(1,Fr,To,Aux),
					writeln('Bottom most moved'),
					move(M,Aux,To,Fr),
					writeln(['From: ',Aux,' To:',To,' Aux:',Aux]).
	
