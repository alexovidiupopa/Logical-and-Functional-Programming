f([],0).
f([H|T],P):-!,H mod 2=:=0, f(T,P1), P is P1*H.
f([_|T],P):-f(T,P1), P is P1.

% f([1,2,3,4,5,6,7,8],R)=> false, pentru ca ! impiedica backtrackingul,
% iar cum 1 mod 2 =\=0, nu va trece de conditie => evalueaza ca fals.
g([],0).
g([H|T],P):- PARITY is mod(H,2), !, g(T,P1), P is P1+PARITY.


%2) sa se stearga elem de pe poz 2, 6, 10...
%sterg(i,i,o)
%I initially takes value 1
sterg([],_,[]).
sterg([H|T], I, [H|R]):-
    I1 is I-2,
    mod(I1,4)=\=0,
    !,
    I2 is I+1,
    sterg(T,I2,R).
sterg([_|T],I,R):-
    I1 is I+1,
    sterg(T,I1,R).

%3) genereze lista submultimilor cu k elemente in progresie aritmetica

subs([E|_],1,[E]).
subs([A|L],K,[A|S]):-
    K1 is K-1,
    K1>0,
    subs(L,K1,S).
subs([_|L],K,S):-
    subs(L,K,S).


aritm([_,_]):-!.
aritm([A,B,C|T]):-
    CB is C-B,
    BA is B-A,
    BA=:=CB,
    aritm([B,C|T]).

generate(L,K,R):-
    subs(L,K,R),
    aritm(R).

getall(L,K,R):-
    findall(RPartial, generate(L,K,RPartial),R).


