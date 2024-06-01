% Define edges in the graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).

% Depth-First Search
dfs(Start, Path) :-
    dfs(Start, [Start], Path).

dfs(Node, _, [Node]) :-
    \+ edge(Node, _). % Base case: Node has no outgoing edge

dfs(Node, Visited, [Node|Path]) :-
    edge(Node, Next),
    \+ member(Next, Visited), % Ensure we haven't visited this node before
    dfs(Next, [Next|Visited], Path).

% Example query:
% ?- dfs(a, Path).
