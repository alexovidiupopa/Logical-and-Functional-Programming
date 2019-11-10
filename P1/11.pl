substitute([],_,_,[]).
substitute([H|T],NEW,OLD,[NEW|R]):-
    H=:=OLD,
    !,
    substitute(T,NEW,OLD,R).
substitute([H|T],NEW,OLD,[H|R]):-
    substitute(T,NEW,OLD,R).


sublist([],_,_,_,[]).
sublist([H|T],POS,M,N,[H|R]):-
    POS>M-1,
    POS<N+1,
    !,
    POS1 is POS+1,
    sublist(T,POS1,M,N,R).
sublist([_|T],POS,M,N,R):-
    POS1 is POS+1,
    sublist(T,POS1,M,N,R).

