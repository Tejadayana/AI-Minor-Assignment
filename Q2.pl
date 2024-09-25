#!/usr/bin/swipl -f -q

% River bank change rules
opposite(e, w).
opposite(w, e).

% Check if the boat is overloaded
unsafe(Passengers) :-
    sum_list(Passengers, TotalWeight),
    TotalWeight > 100.

% Move function for valid river crossings
move(state(X, Bank1, Bank2), state(Y, NewBank1, NewBank2)) :-
    opposite(X, Y),
    select(Person, Bank1, NewBank1),
    NewBank2 = [Person|Bank2],
    \+ unsafe(NewBank2),  % Check if the new state is safe
    write('Move from '), write(X), write(' to '), write(Y), write(' with '), writenlist([Person]), nl.

% Print list elements
writenlist([]) :- nl.
writenlist([H|T]) :- write(H), write(' '), writenlist(T).

% Solution path
path(Goal, Goal, List) :-
    write('Solution Path: '), nl,
    reverse_writenlist(List).

% Make moves until the goal state is reached
path(State, Goal, List) :-
    move(State, NextState),
    \+ member(NextState, List),
    path(NextState, Goal, [NextState|List]).

% Initial call to run the program
:- 
    path(state(e, [80, 80, 30, 30], []), state(w, [], [80, 80, 30, 30]), [state(e, [80, 80, 30, 30], [])]),
    halt(0).
