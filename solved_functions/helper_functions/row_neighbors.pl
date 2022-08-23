

right_neighbors(R, C, CSize, []) :- wall(R, C) ; C>CSize. 
right_neighbors(R, C, CSize, [cell(R, C) |T]) :- 
    (C1 is C+1, right_neighbors(R, C1, CSize, T)).

left_neighbors(R, C, CSize, []) :- wall(R, C) ; C<1. 
left_neighbors(R, C, CSize, [cell(R, C) |T]) :- 
    (C1 is C-1, left_neighbors(R, C1, CSize, T)).

row_neighbors(R, C, []) :- size(RSize, CSize), (wall(R, C) ; R > RSize ; R < 1 ; C > CSize ; C < 1).
row_neighbors(R, C, Result) :- 
    size(_, CSize),
    (C1 is C+1, right_neighbors(R, C1, CSize, T1)),
    (C2 is C-1, left_neighbors(R, C2, CSize, T2)),
    append(T1, T2, Result).

row_neighbors_helper(light(X, Y), Result1) :- row_neighbors(X, Y, Result1).
row_neighbors_helper_cell(cell(X, Y), Result1) :- row_neighbors(X, Y, Result1).

