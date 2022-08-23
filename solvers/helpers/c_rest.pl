c_rest() :-
    findall(cell(X, Y), is_available(X, Y), List),
    fill(List).

