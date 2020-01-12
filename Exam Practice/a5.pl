%i.2)
f([],0).
f([H|T],S):-f(T,S1), S1<H, !, S is H.
f([_|T],S):-f(T,S1),S is S1.

% since f is getting the max of the list, lets do it some other way
% without redefining the predicate
f([],0).
fgood([E],E):-!.
fgood([A,B|T],S):-
    M is max(A,B),
    fgood([M|T],S).

%i.4)
p(1).
p(2).
q(1).
q(2).
r(1).
r(2).

s:-!,p(X),q(Y),r(Z), write(X), write(Y), write(Z),nl.
%expected result:
%1 1 1
%1 1 2
%1 2 1
%1 2 2
%2 1 1
%2 1 2
%2 2 1
%2 2 2
%ok, so it actually prints 'true' as well after each one


% ii) generate the list of all subsets with at least n elems having sum
% of elems divisible with 3
%

%len(i,o)
len([],0).
len([_|T],R):-
    len(T,R1),
    R is R1+1.


%sum(i,o)
sum([],0).
sum([H|T],R):-
    sum(T,R1),
    R is R1+H.

subsets([],[]).
subsets([A|L],[A|R]):-
    subsets(L,R).
subsets([_|L], R):-
    subsets(L,R).

check(L,N,R):-
    subsets(L,R),
    len(R,LEN),
    LEN>=N,
    sum(R,S),
    S mod 3 =:= 0.

get_all(L,N,R):- findall(RPartial, check(L,N,RPartial),R).
