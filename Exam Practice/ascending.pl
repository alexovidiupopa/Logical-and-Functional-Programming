subs([],[]).
subs([A|L],[A|S]):-
    subs(L,S).
subs([_|L],S):-
    subs(L,S).

ascending([_]).
ascending([A,B|T]):-
    A<B,
    ascending([B|T]).

generate(L,R):-
    subs(L,R),
    ascending(R).

get_all(L,R):-
    findall(RPartial, generate(L,RPartial),R).

