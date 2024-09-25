#!/usr/bin/swipl -f -q

/* Function for printing list */
writenlist([]) :- nl.
writenlist([H|T]) :-
    write(H),
    write(' '),
    writenlist(T).

/* River bank change rules */
opposite(e, w).
opposite(w, e).

/* Check if a state is unsafe (i.e., more than 100 kg in the boat) */
unsafe(state(_, BoatPassengers)) :-
    sum_list(BoatPassengers, TotalWeight),
    TotalWeight > 100.

/* Move function for valid river crossings */
move(state(X, Bank1, Bank2), state(Y, NewBank1, NewBank2)) :-
    opposite(X, Y),
    transfer(Bank1, NewBank1, Bank2, NewBank2),
    not(unsafe(state(Y, NewBank1))),
    writenlist(['Try: Move from ', X, ' to ', Y, ' with ', Bank2]).

/* Define valid transfers between river banks */
transfer([A|Bank1], Bank1, Bank2, [A|Bank2]) :-
    sum_list(Bank2, Sum),
    Sum + A =< 100.

transfer([A,B|Bank1], Bank1, Bank2, [A,B|Bank2]) :-
    sum_list(Bank2, Sum),
    Sum + A + B =< 100.

/* Solution path */
path(Goal, Goal, List) :-
    write('Solution Path: '), nl,
    reverse_writenlist(List).

/* Make moves until the goal state is reached */
path(State, Goal, List) :-
    move(State, NextState),
    not(member(NextState, List)),
    path(NextState, Goal, [NextState|List]),
    !.

/* Initial call to run the program */
:- 
    path(state(e, [80,80,30,30], []), state(w, [], [80,80,30,30]), [state(e, [80,80,30,30], [])]),
    halt(0).
