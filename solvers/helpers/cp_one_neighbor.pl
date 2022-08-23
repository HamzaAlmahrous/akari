
prohibited_one_available_neighbor() :-
    findall(cell(X, Y), (prohibited(X, Y), not(lighted(X, Y))), List),
    for_each_prohibited_not_lighted(List).