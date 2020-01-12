

coll([X1,Y1],[X2,Y2],[X3,Y3]):-
    (Y2-Y1)*(X3-X1)=:=(Y3-Y1)*(X2-X1).

collinear2([AX,AY],[BX,BY],[CX,CY]):-coll([AX,AY],[BX,BY],[CX,CY]).
collinear2([[AX,AY],[BX,BY],[CX,CY]|T]):- coll([AX,AY],[BX,BY],[CX,CY]),
    collinear2([[BX,BY],[CX,CY]|T]).


subs([[AX,AY],[BX,BY],[CX,CY]],[[AX,AY],[BX,BY],[CX,CY]]):-collinear2([AX,AY],[BX,BY],[CX,CY]).
subs([[AX,AY]|L],[[AX,AY]|S]):-
    subs(L,S),
    collinear2([[AX,AY]|S]).

subs([_|L],S):-
    subs(L,S).

getall(L,R):-
    findall(RPartial, subs(L,RPartial), R).
