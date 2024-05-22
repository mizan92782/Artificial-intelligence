% Define the main predicate to read input and call the art predicate
main :-
    write('Enter numbers: '), nl,
    read(X), read(Y),
    art(X, Y).

% Define the art predicate to calculate and write the sum and difference
art(X, Y) :-
    S is X + Y,
    M is X - Y,
    write('Sum is: '), write(S), nl,
    write('Difference is: '), write(M), nl.

% Start the program by calling main
:- main.
