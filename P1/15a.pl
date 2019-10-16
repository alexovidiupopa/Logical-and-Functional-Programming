
% Model matematic:
% remove_occurences(l1...ln, e) =
%    [], n = 0
%    l1 + remove_occurences(l2...ln, e), l1 != e
%    remove_occurences(l2...ln, e), l1 = e

% remove_occurences(L:list, E:number, R:list)
% remove_occurences(i, i, o)

removeElem([], _, []).
removeElem([H|T], EL, R) :-
    H =:= EL,
    removeElem(T, EL, R).
removeElem([H|T], EL, [H|R]) :-
    H =\= EL,
    removeElem(T, EL, R).

% Model matematic:
% list_to_set(l1...ln) =
%	[], n = 0
%	l1 + list_to_set(remove_occurences(l2...ln, l1)), otherwise

% list_to_set(L:list, R:list)
% list_to_set(i, o)

toSet([], []).
toSet([H|T], [H|R]) :-
    removeElem(T, H, R1),
    toSet(R1, R).







