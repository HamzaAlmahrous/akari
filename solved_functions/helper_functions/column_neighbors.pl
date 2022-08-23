

down_neighbors(R, C, RSize, []) :- wall(R, C) ; R>RSize. 
down_neighbors(R, C, RSize, [cell(R, C) |T]) :- 
    (R1 is R+1, down_neighbors(R1, C, RSize, T)).

up_neighbors(R, C, RSize, []) :- wall(R, C) ; R<1. 
up_neighbors(R, C, RSize, [cell(R, C) |T]) :- 
    (R1 is R-1, up_neighbors(R1, C, RSize, T)).

column_neighbors(R, C, []) :- size(RSize, CSize), (wall(R, C) ; R > RSize ; R < 1 ; C > CSize ; C < 1).
column_neighbors(R, C, Result) :- 
    size(RSize, _),
    (R1 is R+1, down_neighbors(R1, C, RSize, T1)),
    (R2 is R-1, up_neighbors(R2, C, RSize, T2)),
    append(T1, T2, Result).


column_neighbors_helper(light(X, Y), Result2) :- column_neighbors(X, Y, Result2).
column_neighbors_helper_cell(cell(X, Y), Result2) :- column_neighbors(X, Y, Result2).
