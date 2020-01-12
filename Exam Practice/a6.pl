%i.4)
f2([],[]).
f2([H|T],[H|S]):-f2(T,S).
f2([H|T],S):-H mod 2 =:= 0, f2(T,S).
%f2([1,2,3],L) yields [1|3]; false.

% ii) generate all permutations having the absolute value of the
% difference between two consec elems <=3.

%elim(i,o,i)
elim(E, [E|L], L).
elim(E,[A|X],[A|Y]):-
    elim(E,X,Y).

%perm(i,o)
perm([],[]).
perm([E|L],T):-
    perm(L,R),
    elim(E,T,R).

%check(i)
check([_]).
check([A,B|T]):-
    abs(A-B)<4,
    check([B|T]).

%generate(i,o)
generate(L,R):-
    perm(L,R),
    check(R).

%get_all(i,o)
get_all(L,R):-
    findall(RPartial, generate(L,RPartial), R).
