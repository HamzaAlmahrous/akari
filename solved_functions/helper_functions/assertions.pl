

assert_cells([]).
assert_cells([H|T]) :-
    assert(H),
    assert_cells(T).

assert_lighted([]).
assert_lighted([cell(X,Y)|T]) :-
    assert(lighted(X, Y)),
    assert_lighted(T).

assert_prohibited([]).
assert_prohibited([cell(X,Y)|T]) :-
    assert(prohibited(X, Y)),
    assert_prohibited(T).