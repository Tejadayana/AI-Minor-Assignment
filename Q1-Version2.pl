#!/usr/bin/swipl -f -q

/* Function to display output */
writenlist([]) :- nl.
writenlist([H|T]) :-
    write(H),
    write(' '),
    writenlist(T).

/* Family relationships */
father(john, speaker).

/* Rule to find 'that man' */
that_man(X) :-
    father(john, speaker),
    father(speaker, X).

/* Solution path */
path(Goal, Goal, List) :-
    write('Solution Path: '), nl,
    reverse_writenlist(List).

/* Make move to find the man */
path(State, Goal, List) :-
    that_man(State),
    not(member(State, List)),
    path(State, Goal, [State|List]),
    !.

/* Initial call to run the program */
:- 
    that_man(X),
    write('That man is: '), writenlist([X]),
    halt(0).
