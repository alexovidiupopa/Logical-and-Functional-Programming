% b
%
% Model matematic:
% decompose(l1...ln)
%	[0, 0, [], []], n = 0
%	{decompose(l2...ln), 1 + nr_even, l1 + even_list}, l1 % 2 = 0
%	{decompose(l2...ln), 1 + nr_odd, l1 + odd_list}, l1 % 2 = 1

% decompose(L:list, R:list)
% decompose(i, o)

decompose([], [[], [], 0, 0]).
decompose([H|T], [[H|EVEN], ODD, EVENCOUNT, ODDCOUNT]) :-
    H mod 2 =:= 0,
    decompose(T, [EVEN, ODD, EVENCOUNT1, ODDCOUNT]),
    EVENCOUNT is EVENCOUNT1 + 1.
decompose([H|T], [EVEN, [H|ODD], EVENCOUNT, ODDCOUNT]) :-
    H mod 2 =:= 1,
    decompose(T, [EVEN, ODD, EVENCOUNT, ODDCOUNT1]),
    ODDCOUNT is ODDCOUNT1 + 1.

