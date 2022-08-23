

solved(Z):-
    light_count_correct(),
    no_double_light(X), 
    all_cells_lighted(Y),
    Z is X+Y.