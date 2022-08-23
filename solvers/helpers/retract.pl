

retract_all_facts() :-
    retractall(cell(_,_)),
    retractall(light(_,_)),
    retractall(lighted(_,_)),
    retractall(prohibited(_,_)).
