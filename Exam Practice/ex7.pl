%so i guess the program is trying to compute 1+2+...+n - 1 in a really
% bad way... so we can make that better
f([],-1).
f([H|T], S):- f(T,S1),S1>0,!,S is S1+H.
f([_|T],S):- f(T,S1),S is S1.


%2) two prolog implementations to transform a list of numbers into a set
% first one uses a search function in order to always search in the tail
% of the list. if the element is there, then we don't add it, otherwise
% we do. in this way, the set will be kept in the order of the last
% occurence, e.g [1,2,3,2,4]=>[1,3,2,4]
%
search([H|_], H).
search([_|T], E):- search(T,E).

toSet1([],[]).
toSet1([H|T],[H|R]):-
    not(search(T,H)),
    !,
    toSet1(T,R).
toSet1([_|T],R):-
    toSet1(T,R).

% second one basically removes the element we are at i.e. head from the
% actual tail, adds it to the result and we recur further with the
% resulted tail. the elements will be kept in the order of the first
% appeareance.

removeElem([],_,[]).
removeElem([H|T],EL,R):-
    H=:=EL,
    !,
    removeElem(T,EL,R).
removeElem([H|T],EL,[H|R]):-
    removeElem(T,EL,R).

toSet2([],[]).
toSet2([H|T],[H|R]):-
    removeElem(T,H,NEW),
    toSet2(NEW,R).


%3) generate arangements of k elems with product P

prod([],1).
prod([H|T], R):-
    prod(T,R1),
    R is R1*H.


comb([E|_],1,[E]).
comb([A|L],N,[A|S]):-
    N1 is N-1,
    N1 > 0,
    comb(L,N1,S).
comb([_|L],N,S):-
    comb(L,N,S).

%(i,o,i) - insert E on every position in L
elim(E, [E|L], L).
elim(E, [A|X], [A|Y]):-
    elim(E,X,Y).

perm([],[]).
perm([H|T],R):-
    perm(T,RTemp),
    elim(H,R,RTemp).

aranj(L,K,P,R):-
    comb(L,K,AUX),
    prod(AUX,P2),
    P2=:=P,
    perm(AUX,R).
get_all(L,K,P,R):-
    findall(RPartial, aranj(L,K,P,RPartial), R).
