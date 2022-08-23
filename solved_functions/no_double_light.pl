

no_double_light(D) :-
    get_lights(L),
    check_lights(L,D).

check_lights([], 1).
check_lights([H|T], D) :-
    row_neighbors_helper(H, Result1),
    column_neighbors_helper(H, Result2),
    count_light(Result1, N1),
    count_light(Result2, N2),
    (Z is N1 + N2),
    (Z > 0 -> D is 0 ; check_lights(T, D)).

