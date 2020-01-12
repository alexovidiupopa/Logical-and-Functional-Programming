%2) given n, remove elems from pos n, 2*n, 4*n...
%[1,2,3,4,5,6,7,8] => [1,3,5,6,7]
%remove(i,o)

remove([],_,_,[]).
remove([_|T], N, POS, R):-
    N=:=POS,
    !,
    N1 is 2*N,
    POS1 is POS+1,
    remove(T,N1,POS1, R).
remove([H|T], N, POS, [H|R]):-
    POS1 is POS+1,
    remove(T,N, POS1, R).

remove_wr(L,N,R):-
    remove(L, N, 1, R).


%3)generate the subsets of even length

subsets([],[]).
subsets([H|T], [H|R]):-
    subsets(T,R).
subsets([_|T], R):-
    subsets(T,R).


check(L,R):-
    subsets(L,R),
    length(R,LEN),
    mod(LEN,2) =:= 0.

generate(L,R):-
    findall(RPartial, check(L,RPartial), R).


