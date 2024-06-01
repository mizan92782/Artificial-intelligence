% Define the capacity of each jug
capacity(jug1, 4).
capacity(jug2, 3).

% Define the initial state
initial_state(state(0, 0)).

% Define the goal state (desired amount of water)
goal_state(state(2, _)).

% Rules to move from one state to another

% Fill jug1
move(state(_, Y), state(4, Y)).

% Fill jug2
move(state(X, _), state(X, 3)).

% Empty jug1
move(state(_, Y), state(0, Y)).

% Empty jug2
move(state(X, _), state(X, 0)).

% Pour water from jug1 to jug2
move(state(X, Y), state(X1, Y1)) :-
    capacity(jug2, MaxY),
    Total is X + Y,
    (Total =< MaxY -> (X1 is 0, Y1 is Total) ; (X1 is Total - MaxY, Y1 is MaxY)).

% Pour water from jug2 to jug1
move(state(X, Y), state(X1, Y1)) :-
    capacity(jug1, MaxX),
    Total is X + Y,
    (Total =< MaxX -> (X1 is Total, Y1 is 0) ; (X1 is MaxX, Y1 is Total - MaxX)).

% Solve the problem by finding a sequence of moves from the initial state to the goal state
solve(Solution) :-
    initial_state(InitialState),
    goal_state(GoalState),
    bfs([[InitialState]], GoalState, Solution).

% Breadth-First Search (BFS) implementation
bfs([[State | Path] | _], State, [State | Path]).
bfs([Path | Paths], GoalState, Solution) :-
    extend(Path, NewPaths),
    append(Paths, NewPaths, Paths1),
    bfs(Paths1, GoalState, Solution).

% Extend the current path with possible moves
extend([State | Path], NewPaths) :-
    findall([NewState, State | Path],
            (move(State, NewState), \+ member(NewState, [State | Path])),
            NewPaths).
