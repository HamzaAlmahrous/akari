nothing().

consult_files() :-
    consult('D:/Akari/solved_functions/no_double_light.pl'),
    consult('D:/Akari/solved_functions/light_count_correct.pl'),
    consult('D:/Akari/solved_functions/all_cells_lighted.pl'),
    consult('D:/Akari/solved_functions/helper_functions/is_lighted.pl'),
    consult('D:/Akari/solved_functions/helper_functions/column_neighbors.pl'),
    consult('D:/Akari/solved_functions/helper_functions/row_neighbors.pl'),
    consult('D:/Akari/solved_functions/helper_functions/neighbors_list.pl'),
    consult('D:/Akari/solved_functions/helper_functions/count_light.pl'),
    consult('D:/Akari/solved_functions/helper_functions/is_surrounded.pl'),

    consult('D:/Akari/solved_functions/solved.pl'),
    consult('D:/Akari/solvers/helpers/retract.pl'),
    consult('D:/Akari/solved_functions/helper_functions/assertions.pl'),
    consult('D:/Akari/solved_functions/helper_functions/getters.pl'),
    consult('D:/Akari/solved_functions/helper_functions/available_neighbors_list.pl'),
    consult('D:/Akari/games_Input/game2.pl'), %game1__________________________________________________
    consult('D:/Akari/solvers/helpers/for_each_XP.pl'),
    consult('D:/Akari/solvers/helpers/fill.pl'),
    consult('D:/Akari/solvers/helpers/c_rest.pl'),
    consult('D:/Akari/solvers/helpers/most_cp_neighbors.pl'),
    consult('D:/Akari/solvers/helpers/prohibit_zero_needed.pl'),
    consult('D:/Akari/solvers/helpers/light_available_needed.pl'),
    consult('D:/Akari/solvers/helpers/cp_one_neighbor.pl'),
    consult('D:/Akari/solvers/helpers/print_game.pl'),
    consult('D:/Akari/solvers/helpers/retract.pl').
%------------------------------------------------------------------------------------------------------
init() :- 
    consult_files(),
    retract_all_facts(),
    get_cells(All),
    assert_cells(All).

%------------------------------------------------------------------------------------------------------

loop(0).
loop(Size) :-
    light_available_needed(),
    prohibit_zero_needed(),
    Size1 is Size - 1,
    loop(Size1).
%------------------------------------------------------------------------------------------------------

loop_prohibited(0).
loop_prohibited(Size) :-
    prohibited_one_available_neighbor(),
    prohibit_zero_needed(),
    Size1 is Size - 1,
    loop_prohibited(Size1).

%------------------------------------------------------------------------------------------------------
main_loop(0).
main_loop(Size):-
    loop(Size),
    loop_prohibited(Size),
    prohibited_one_available_neighbor(),
    Size1 is Size - 1,
    (print_game(), main_loop(Size1)).


%------------------------------------------------------------------------------------------------------
solve() :-
    init(),
    size(RSize, _),
    main_loop(RSize),
    c_rest(),
    print_game(),
    solved(Z),
    (Z==2 -> write('You solved it! you are a genius!'); write('Sorry, You failed!')).






