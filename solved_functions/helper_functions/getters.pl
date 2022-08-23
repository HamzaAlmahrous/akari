

get_cells(L) :- 
    size(RSize, CSize),
    findall(cell(R,C), (between(1, RSize, R), between(1, CSize, C)), L).

get_walls_num(W) :- 
    findall(wall_num(R, C, N), wall_num(R, C, N), W).

get_lights(L) :- 
    findall(light(R, C), light(R, C), L).