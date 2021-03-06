
% Transform a list into a set in the order of the first occurence.

% removeElem(L- list, EL- integer, R- list)
% removeElem(i,i,o)

removeElem([], _, []).
removeElem([H|T], EL, R) :-
    H =:= EL,  % in this case the head is the element we want to remove, so we won't add it to the result
    removeElem(T, EL, R).
removeElem([H|T], EL, [H|R]) :-
    H =\= EL, % here, we want to add the head to the result, because it's not the element we're looking to remove
    removeElem(T, EL, R).

% toSet(L-list, R-list)
% toSet(i, o)

toSet([], []).
toSet([H|T], [H|R]) :-   % the actual worker function, in which H is added to the result and then all the occurences of H are removed from the tail
    removeElem(T, H, R1),
    toSet(R1, R).








