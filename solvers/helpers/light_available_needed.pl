
wall_num_helper(cell(X, Y), Num) :- wall_num(X, Y, Num).

is_light_neighbor(R, C, []) :- 
    not(cell(R, C));
    not(light(R, C)).

is_light_neighbor(R, C, [cell(R, C)]) :-
    cell(R, C),
    light(R, C).
  

light_neighbors_list_length(cell(R, C), Num) :-
  R1 is R-1, is_light_neighbor(R1, C, T1),
  R2 is R+1, is_light_neighbor(R2, C, T2),
  C1 is C-1, is_light_neighbor(R, C1, T3),
  C2 is C+1, is_light_neighbor(R, C2, T4),
  append([T1, T2, T3, T4], Result),
  length(Result, Num).
%------------------------------------------------------------------------------------------------------

fill_available_neighbors([]).
fill_available_neighbors([H|T]) :-
    light_neighbors_list_length(H, LightListLength),
    wall_num_helper(H, Num),
    Needed is Num - LightListLength,
    available_neighbors_list(H, AvailableList),
    length(AvailableList, L),
    (Needed == L -> fill(AvailableList); nothing()),
    fill_available_neighbors(T).
%------------------------------------------------------------------------------------------------------

light_available_needed() :-
    findall(cell(X, Y), (wall_num(X, Y, N)), List),
    fill_available_neighbors(List).