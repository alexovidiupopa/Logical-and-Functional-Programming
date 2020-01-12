%1)
f([],0).
f([H|T],S):- f(T,S1), S1>=2,!,S is S1+H.
f([_|T],S):-f(T,S1), S is S1+1.

g([],0).
g([_,_], 2):-!.
g([H|T],R):-
    g(T,R1),
    R is R1+H.

%2) eliminarea primelor n numere prime ale unei liste

prim(2).
prim(X):- X>2, X1 is X-1, divisors(X,X1).

divisors(_,1).
divisors(X, D):- X mod D =\=0, !, D1 is D-1, divisors(X,D1).

removeprimes([],_,_,[]).
removeprimes([H|T], I, N, R):-
    prim(H),
    I=<N,
    !,
    I1 is I+1,
    removeprimes(T,I1,N,R).
removeprimes([H|T], I,N,[H|R]):-
    I>N,!,
    removeprimes(T,I,N,R).
removeprimes([H|T],I,N,[H|R]):-
    not(prim(H)),!,
    removeprimes(T,I,N,R).

%3) submultimi de suma S data

sum([],0).
sum([H|T],R):-
    sum(T,R1),
    R is R1+H.

subs([],[]).
subs([H|T],[H|S]):-
    subs(T,S).
subs([_|T],S):-
    subs(T,S).


generate(L,R,S):-
    subs(L,R),
    sum(R, S1),
    S1=:=S.

get_all(L,S,R):-
    findall(RPartial, generate(L,RPartial,S),R).
