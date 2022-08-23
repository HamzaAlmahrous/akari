

all_cells_lighted(J) :- 
    get_cells(L), 
    check(L, J).

check([], 1).
check([H|T], J) :- 
    is_lighted_helper(H, J1),
    (J1 == 0 -> J is 0 ; check(T, J)).

