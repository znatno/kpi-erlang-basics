% lab14 KPI
% Задано список, довжина якого кратна трьом.
% Отримати список, в якому видалена остання третина.
-module(lab14).
-export([start/0]).
-author("Ivan Bohun").

delete_last_third_part(List) when length(List) rem 3 == 0 ->
    lists:sublist(List, 1, length(List) div 3 * 2).

start() ->
    List1 = [1, 2, 3, 1, 1, 200],
    List2 = [1, 2, 3, 100, 200, 300, 100, 200, 300, 100, 200, 300],
    List3 = [1, 1, 1],

    io:format("result: ~p~n", [delete_last_third_part(List1)]),
    io:format("result: ~p~n", [delete_last_third_part(List2)]),
    io:format("result: ~p~n", [delete_last_third_part(List3)]).