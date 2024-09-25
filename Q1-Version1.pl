% Define the family relationship where 'father(X, Y)' means 'X is the father of Y'.

% The speaker has no siblings, so "my father's son" refers to the speaker (represented by 'me').
% Let's assume 'john' is the father of the speaker.
father(john, me).

% Define the rule to find 'that man'.
that_man(X) :-
    father(john, me),   % 'me' is the son of 'john'.
    father(me, X).      % 'X' (that man) is the son of 'me'.

% Example query this will return the person who is running the code:
% ?- that_man(X).
