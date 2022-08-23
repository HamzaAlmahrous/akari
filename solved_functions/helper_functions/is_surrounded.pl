

is_surrounded_helper(wall_num(R, C, N)) :- is_surrounded(R, C).

is_surrounded(R,C) :- 
    neighbors_list(R, C, Result),
    count_light(Result, Num),
    wall_num(R, C, X1),
    Num==X1 ->  true ; false.