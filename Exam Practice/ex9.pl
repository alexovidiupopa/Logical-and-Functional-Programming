my_rev([],AUX,AUX).
my_rev([H|T], AUX, R):-
    not(is_list(H)),
    !,
    my_rev(T, [H|AUX], R).
my_rev([H|T],AUX,R):-
    my_rev(H, [], R2),
    my_rev(T, [R2|AUX], R).

my_rev_wrapper(L,R):-
    my_rev(L,[],R).

% 3. Write a predicate to generate the list of all subsets with all
% elements of a given list. Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]

%sublists(+L:list, -R:list)

sublists([], []).
sublists([H|T], [H|R]):-
	sublists(T, R).
sublists([_|T], R):-
	sublists(T, R).

%process(+L:list, +N:number, -R:list)

process(L, N, R):-
	sublists(L, R),
	length(R, N).

%allsolutions(+L:list, +N:number, -R:list)

all_solutions(L, N, R):-
	findall(AUX, process(L, N, AUX), R).

% problem is we would get an 'arguments not sufficiently instantiated'
% because when performing S-H, S doesn't have a value. the correct way
% is S is S1-H, because S1 would already be bind to a value when
% returning from recursion.
f([],0).
f([H|T],S):-
    f(T,S1),
    S1 is S-H.
