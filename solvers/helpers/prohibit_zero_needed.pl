

prohibit_zero_needed() :-
    findall(cell(X, Y), wall_num(X, Y, N), List),
    need_zero_helper(List).

need_zero_helper([]).
need_zero_helper([cell(X, Y)|T]) :-
    light_neighbors_list_length(cell(X, Y), LightListLength),
    wall_num(X, Y, Num),
    Needed is Num - LightListLength,
    (Needed == 0 -> (available_neighbors_list(cell(X, Y), AvailableList), assert_prohibited(AvailableList)); assert_prohibited([])),
    need_zero_helper(T).