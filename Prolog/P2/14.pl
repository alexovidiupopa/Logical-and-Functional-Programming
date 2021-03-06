even(X):-X mod 2 =:= 0.

append2([],R,[R]).
append2([H|R],R2,[H|T]):-
    append2(R,R2,T).

len([],0).
len([_|T],R):- len(T,R1), R is R1+1.

seq([],C,AUX,C):-
    len(C,LC),
    len(AUX,LAUX),
    LC>=LAUX.
seq([],C,AUX,AUX):-
    len(C,LC),
    len(AUX,LAUX),
    LC<LAUX.
seq([H|T],C,AUX,R):-
    even(H),!,
    append2(AUX,H,R1),
    seq(T,C,R1,R).
seq([_|T],C,AUX,R):-
    len(C,LC),
    len(AUX,LAUX),
    LAUX>=LC,
    seq(T,AUX,[],R).
seq([_|T],C,AUX,R):-
    len(C,LC),
    len(AUX,LAUX),
    LAUX<LC,
    seq(T,C,[],R).



