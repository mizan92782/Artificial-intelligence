
% Define edges in the graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).

% Breadth-First Search to find all paths from Start to all nodes
bfs_all_paths(Start, Paths) :-
    bfs_iterative([[Start]], [], Paths).

% Base case: No more paths to explore
bfs_iterative([], Paths, Paths).

% Continue exploring paths
bfs_iterative([[Goal|Visited]|Paths], Acc, Result) :-
    findall([Next,Goal|Visited],
            (edge(Goal, Next),
            \+ member(Next, Visited)),
            NewPaths),
    append(Paths, NewPaths, UpdatedPaths),
    bfs_iterative(UpdatedPaths, [[Goal|Visited]|Acc], Result).

% Example query:
% ?- bfs_all_paths(a, Paths).
