

fill([]).
fill([H|T]) :-
    fill_helper(H),
    fill(T).

fill_helper(cell(X, Y)) :-
    assert(light(X, Y)),
    row_neighbors(X, Y, Result1),
    column_neighbors(X, Y, Result2),
    append(Result1, Result2, Result),
    assert_lighted(Result).