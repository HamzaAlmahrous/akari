

is_lighted_helper(cell(X, Y), Z) :- 
    is_lighted(X, Y, Z).

is_lighted(R, C, 1) :- wall(R, C) ; light(R, C).
is_lighted(R, C, Z) :-
    row_neighbors(R, C, Result1),
    column_neighbors(R, C, Result2),
    append(Result1, Result2, Result),
    has_light(Result, Z).

has_light([], 0).
has_light([H|T], Z) :-
    light_cell(H, Z),
    (Z =:= 1) -> nothing();
    has_light(T, Z).

light_cell(cell(X,Y), 1) :- light(X,Y).
light_cell(cell(X,Y), 0) :- light(X1,Y1).



