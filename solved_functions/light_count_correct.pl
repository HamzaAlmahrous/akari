

light_count_correct() :-
    get_walls_num(W),
    check_walls(W).

check_walls([]).
check_walls([H|T]) :-
    is_surrounded_helper(H),
    check_walls(T).    
