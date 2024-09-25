% Define the family relationship where 'father(X, Y)' means 'X is the father of Y'.

% Let's assume 'john' is the father of 'me' (the speaker).
father(john, me).  

% Define the rule to find 'that man' based on the riddle.
% 'X' is the man whose father is 'my father's son'.
that_man(X) :-
    father(john, me),   % 'me' is the son of 'john'
    father(me, X).      % 'X' is the son of 'me', making 'X' the speaker's son.

% Example Query:
% ?- that_man(X).
