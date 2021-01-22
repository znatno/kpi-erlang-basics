% lab11 KPI
% варіант 3
-module(lab11).
-export([start/0, func_value1/2, func_value2/2, sum_direct/2, sum_tail/3]).
-author("Ivan Bohun").

% direct
func_value1(X, N)   when X < 0  -> N; % k, якщо x < 0
func_value1(X, N)   when X > 0  -> sum_direct(X, N).
sum_direct(X, N)    when N > 0  -> (N * X + 2) + sum_direct(X, N - 1);
sum_direct(_X, 0)               -> 0.

% tail
func_value2(X, N) ->
    if
        X < 0 -> N; % k, якщо x < 0
        X > 0 -> sum_tail(X, N, 0)
    end.
sum_tail(X, N, Acc) when N > 0  -> sum_tail(X, N - 1, (N * X + 2) + Acc);
sum_tail(_X, 0, S)              -> S.

% ввід значень з термінала
start() ->
    {_, Xi} = io:fread("enter X: ", "~d"),
    {_, Ni} = io:fread("enter N: ", "~d"),
    [X|_] = Xi,
    [N|_] = Ni,

    io:format("result: ~p~n", [func_value2(X, N)]).

% без вводу значень
% start() -> io:format("~p~n", [func_value2(1,3)]).