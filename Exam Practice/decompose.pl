consec([_]).
consec([A,B|T]):-
    B-A=:=1,
    consec([B|T]).

sum([],0).
sum([H|T],S):-
    sum(T,S1),
    S is S1+H.

subsets([],[]).
subsets([A|L], [A|S]):-
    subsets(L,S).
subsets([_|L], S):-
    subsets(L,S).

inRange(N,N,[]).
inRange(N,I, [I|R]):-
    I1 is I+1,
    inRange(N,I1,R).

generate(N,R):-
    inRange(N,1,L),!,
    subsets(L,R),
    sum(R,S),
    S=:=N,
    consec(R).

getAll(N,R):-
    findall(RPartial, generate(N,RPartial),R).
