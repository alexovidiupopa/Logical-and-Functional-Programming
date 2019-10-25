%Get the maximum from the list
%maxList(L:list, M:int, R:int)
%maxList(i,i,o)
maxList([],M,M).
maxList([H|T],M,R):- H > M, !,
    maxList(T,H,R).
maxList([_|T],M,R):-
    maxList(T,M,R).

% Wrapper function to call the maximum list function with the first
% element
%maxListWrapper(L:list, R:list)
%maxListWrapper(i,o)
maxListWrapper([H|T],R):- maxList(T,H,R).

%lengthOfList(L:list, R:int)
%lengthOfList(i,o)
lengthOfList([],0).
lengthOfList([_|T], R):- lengthOfList(T,R1),
    R is R1+1.

% Given the max from a list, compute a list which has all the positions
% on which the maximum appears
%maxPositions(L:list, MAX:int, P:int,R:list)
%maxPositions(i,i,i,o)
maxPositions([],_,_,[]).
maxPositions([MAX|T],MAX,P,R):-
    P1 is P+1,
    maxPositions(T,MAX,P1, R1),
    R = [P1|R1].
maxPositions([_|T],MAX,P, R):-
    P1 is P+1,
    maxPositions(T,MAX,P1, R).

% Wrapper to call the max positions function with the initial position 0(
% to be made into 1 after the first
% call
%maxPositionsWrapper(L:list,R:list)
%maxPositionsWrapper(i,o)
maxPositionsWrapper([],[]).
maxPositionsWrapper([H|T],R):-
    maxListWrapper([H|T],MAX),
    maxPositions([H|T],MAX,0,R).

% Replace the sublists with the max positions list if their length>1,
% else add the solo elem to the list
% replaceLists(L:list,R:list)
% replaceLists(i,o)
replaceLists([],[]).
replaceLists([H|T],[H|R]):- not(is_list(H)),
    replaceLists(T,R).
replaceLists([H|T],[H|R]):- lengthOfList(H,L),
    L is 1,
    replaceLists(T,R).
replaceLists([H|T],R):- lengthOfList(H,L),
    L > 1,
    maxPositionsWrapper(H,NEW),
    replaceLists(T,R1),
    R = [NEW|R1].





