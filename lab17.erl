% lab17 KPI
% Задано числовий список. Змінити знак всіх від’ємних чисел, які знаходяться в діапазоні [-1,0].
-module(lab17).
-export([start/0]).
-author("Ivan Bohun").

% ver.1
change_minus1([X|Xs]) when X >= -1, X =< 0              -> [X*-1|change_minus1(Xs)];
change_minus1([X|Xs]) when not((X >= -1) and (X =< 0))  -> [X|change_minus1(Xs)];
change_minus1([])                                       -> [].

% ver.2
change_minus2([X|Xs]) ->
    case (X >= -1) and (X =< 0) of
        true -> [X*-1|change_minus2(Xs)];
        _ -> [X|change_minus2(Xs)]
    end;
change_minus2([]) -> [].

% ver.3
change_minus3(Xs) ->
    lists:map(fun (X) -> X * -1 end, lists:filter(fun (X) -> (X >= -1) and (X =< 0) end, Xs)).

% ver.4
change_minus4(Xs) -> [X * -1 || X  <- Xs, X >= -1, X =< 0].

start() -> io:format("~p~n", [change_minus4([1.0, 2, 3, 0.0, 100, -1, -0.25, -0.5, -0.33, 0.75, 0.21, -50, -2])]).