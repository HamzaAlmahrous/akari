
:-dynamic light/2.
:-dynamic lighted/2.
:-dynamic prohibited/2.

print_game() :-
    write('\n'),
    get_cells(Cells),
    print_cell(Cells).

print_cell([]).
print_cell([H|T]) :-
    print_cell_helper(H),
    print_cell(T).

print_cell_helper(cell(X, Y)) :-
    size(_,CSize),
    (
        wall_num(X, Y, N), N=<4 -> (write('B'), write(N), write('    '));
        wall(X, Y)   -> write('B.    ');
        light(X, Y)  -> write('L.    ');
        lighted(X, Y)  -> (
                                prohibited(X,Y) -> write('XP    ');
                                                   write('X.    ')
                          );
        (
            prohibited(X,Y) -> write('CP    ');
                               write('C.    ')
        )
    ),
    (Y =:= CSize -> write('\n'); write('')).