

is_neighbor(R, C, []) :- 
  not(cell(R, C));
  wall(R, C).

is_neighbor(R, C, [cell(R, C)]) :-
  cell(R, C),
  not(wall(R, C)).

neighbors_list(R, C, Result) :-
  R1 is R-1, is_neighbor(R1, C, T1),
  R2 is R+1, is_neighbor(R2, C, T2),
  C1 is C-1, is_neighbor(R, C1, T3),
  C2 is C+1, is_neighbor(R, C2, T4),
  append([T1, T2, T3, T4], Result).

neighbors_list_helper(cell(X, Y), List) :- neighbors_list(X, Y, List).