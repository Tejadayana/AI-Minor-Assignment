#!/usr/bin/swipl -f -q

% Define family relationships
father(john, speaker).       % John is the father of the speaker
father(speaker, that_man).   % The speaker is the father of 'that man'

% Rule to find 'that man'
find_that_man(X) :-
    father(john, speaker),   % Speaker's father is John
    father(speaker, X).      % 'X' is that man's father

% Initial call to find and display the solution
:- 
    find_that_man(X),
    write('That man is: '), write(X), nl,
    halt(0).

