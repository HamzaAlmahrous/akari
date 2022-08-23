

count_light(List, Num) :- 
    findall(light(X,Y),   (member(cell(X,Y),List),light(X,Y)),  Lighted),
    length(Lighted, Num).

count_CP(List, Num) :- 
    findall(cp(X,Y),   (member(cell(X,Y),List), not(lighted(X,Y)), prohibited(X, Y)),  CP),
    length(CP, Num).