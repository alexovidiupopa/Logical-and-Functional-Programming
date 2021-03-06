sum([],S,S):-!.
sum([A],S,R):-
    !,
    S1 is S+A,
    R is S1.

sum([A,B|T],S,R):-
    S1 is S+A,
    S2 is S1-B,
    sum(T,S2,R).

sumW(L,R):-
    sum(L,0,R).

is_valley([L1,L2,L3|T]):-
    L1>L2,
    L2<L3,
    is_valley([L2,L3|T]).
is_valley([L1,L2,L3|T]):-
    L1>L2,
    L2>L3,
    is_valley([L2,L3|T]).
is_valley([L1,L2,L3|T]):-
    L1<L2,
    L2<L3,
    is_valley([L2,L3|T]).
is_valley([L1,L2]):-L1<L2.

is_valleyW([A,B|T]):-
    A>B,
    is_valley([A,B|T]).
