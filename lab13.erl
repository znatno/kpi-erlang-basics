% lab13 KPI
% Додати в кінець заданого числового списку елемент,
% який є сумою 1-го і останнього елементів.
-module(lab13).
-export([start/0]).
-author("Ivan Bohun").

sum_to_end(List) -> List ++ [lists:nth(1, List) + lists:last(List)].

start() -> io:format("result: ~p~n", [sum_to_end([1, 2, 3, 4, 49])]).