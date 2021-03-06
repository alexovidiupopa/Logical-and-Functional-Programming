solve([]).
solve([_,_|T]):-
    solve(T).

min([],M,M).
min([H|T],M,R):-
    H<M,
    !,
    min(T,H,R).
min([_|T],M,R):-
    min(T,M,R).

minW([H|T],R):-
    min(T,H,R).

remove([],_,_,[]).
remove([H|T],MIN,FLAG,[H|R]):-
    H =:= MIN,
    FLAG is 1,
    !,
    remove(T,MIN,1,R).

remove([H|T],MIN,FLAG,[H|R]):-
    H =\= MIN,
    FLAG is 1,
    !,
    remove(T,MIN,1,R).
remove([H|T],MIN,FLAG,[H|R]):-
    H =\= MIN,
    FLAG is 0,
    !,
    remove(T,MIN,0,R).

remove([H|T],MIN,FLAG,R):-
    H=:=MIN,
    FLAG is 0,
    !,
    remove(T,MIN,1,R).

removeW(L,R):-
    minW(L,MIN),
    remove(L,MIN,0,R).


