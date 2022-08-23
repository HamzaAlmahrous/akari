

count_available(List, Num, AvailableCells) :- 
    findall(cell(X,Y), (member(cell(X,Y),List), is_available(X,Y)), AvailableCells), 
    length(AvailableCells, Num).

%------------------------------------------------------------------------------------------------------
for_each_prohibited_not_lighted([]).
for_each_prohibited_not_lighted([cell(X,Y)|T]) :-
    row_neighbors(X, Y, Result1),
    column_neighbors(X, Y, Result2),
    append(Result1, Result2, Result),
    count_available(Result, N, AvailableCells),
    (N == 1 -> fill(AvailableCells); nothing()),
    for_each_prohibited_not_lighted(T).
