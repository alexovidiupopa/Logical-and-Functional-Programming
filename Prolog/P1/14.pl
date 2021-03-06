%search(i,o)
search([H|_],EL):-
    H=:=EL,!.
search([_|T],EL):-
    search(T,EL).

%diference = all the elems that are in A but are not in B
diff([],[_|_],[]).
diff([H|T],B,[H|R]):-
    not(search(B,H)),
    !,
    diff(T,B,R).
diff([_|T],B,R):-
    diff(T,B,R).

len([],0).
len([_|T],R):- len(T,R1), R is R1+1.

equality(A,B):-
    diff(A,B,R),
    diff(B,A,R1),
    len(R,L),
    L =:= 0,
    len(R1,L1),
    L1=:=0.

select([H|_],POS,N,H):-
    POS=:=N,!.
select([_|T],POS,N,R):-
    POS1 is POS+1,
    select(T,POS1,N,R).
