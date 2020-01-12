odd(1).
odd(3).
odd(5).
odd(7).
odd(9).

even(X):- odd(N1), odd(N2), X is N1+N2, X<9.
even(X):- odd(N1),!, X is N1*2, X>9.


f([], 0).
f([H|T], S):-
	f(T, S1), !,
	H mod 2 =:= 1,
	S is S1 + H.
f([_|T], S):-
	f(T, S).

g([], 0):-!.
g([H|T], S):-
	g(T, S1),
	H mod 2 =:= 1,
	S is S1 + 1,!.
g([_|T], S):-
	g(T, S).

prim(2):-!.
prim(N):- N>2, N1 is N-1, divis(N,N1).

divis(_,1):-!.
divis(N, D):- N mod D =\=0, D1 is D-1, divis(N,D1).

b(1).
b(4).
c(1).
c(3).
d(4).
a(X):-b(X),c(X),fail.
a(X):-d(X).

a1(X):-b(X),!,c(X),fail.
a1(X):-d(X).

h([],[]).
h([H|T],[H|S]):-h(T,S).
h([H|T],S):-H mod 2=:=0, h(T,S).
