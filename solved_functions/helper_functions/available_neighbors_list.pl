

is_available(R, C) :-
    cell(R, C),
    not(wall(R, C)),
    not(light(R, C)),
    not(lighted(R, C)),
    not(prohibited(R, C)).

is_not_available(R, C) :-
    not(cell(R, C));
    wall(R, C);
    light(R, C);
    lighted(R, C);
    prohibited(R, C).

is_available_neighbor(R, C, []) :- 
    is_not_available(R, C).

is_available_neighbor(R, C, [cell(R, C)]) :-
    is_available(R, C).
  

available_neighbors_list(cell(R, C), Result) :-
  R1 is R-1, is_available_neighbor(R1, C, T1),
  R2 is R+1, is_available_neighbor(R2, C, T2),
  C1 is C-1, is_available_neighbor(R, C1, T3),
  C2 is C+1, is_available_neighbor(R, C2, T4),
  append([T1, T2, T3, T4], Result).