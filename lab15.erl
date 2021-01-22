% lab15 KPI
% Задана квадратна матриця невідомого розміру. Отримати суму елементів,
% розташованих вище за головну діагональ матриці.   
-module(lab15).
-export([start/0]).
-author("Ivan Bohun").

matrix_data(1) ->
    [[1,1,1,1,1],
     [1,1,1,1,1],
     [1,1,1,1,1],
     [1,1,1,1,1],
     [1,1,1,1,1]];

matrix_data(2) ->
    [[0, 1, 1, 1, 100],
     [0, 0, 1, 1, 1],
     [0, 1, 1, 1, 1],
     [0, 1, 1, 1, 1],
     [100, 0, 0, 0, 1]];

matrix_data(3) ->
    [[1,1,1,1,1,0],
     [1,1,1,1,0,0],
     [1,1,1,0,0,0],
     [1,1,0,0,0,0],
     [1,0,0,0,0,0]];

matrix_data(4) ->
    [
     [2, 1, 1, 1, 1, 1],
     [0, 1, 1, 1, 1, 1],
     [0, 0, 1, 1, 1, 1],
     [0, 0, 0, 1, 1, 1],
     [0, 0, 0, 0, 1, 1],
     [100, 0, 0, 0, 0, 1]
    ].

%+ Test#
matrix_main(K)->
    Ms = matrix_data(K),
    % io:format("Ms: ~p, LENGTH: ~p~n", [Ms, length(Ms)]),    % debug !
    matrix_pro(Ms, length(Ms), 0).

%+Matrix, Rows Counter, Accumulator,
%-Sum
matrix_pro([R|Rs], I, Acc) ->
    % io:format("R: ~p~n", [R]),      % debug !
    % io:format("Acc: ~p, I: ~p~n", [Acc, I]),  % debug !
    % io:format("Rs: ~p~n", [Rs]),    % debug !
    matrix_pro(Rs, I - 1, Acc + row_pro(R, I, I));
matrix_pro([], _, S) -> S .

%+Row, Counter, N
%-Row Sum
row_pro([_|Xs], I, N) when I > N  -> row_pro(Xs, I-1, N);
row_pro([X|Xs], I, N) when I =< N -> X + row_pro(Xs, I-1, N);
row_pro([], _, _) -> 0.

start() -> io:format("~p~n", [matrix_main(4)]).