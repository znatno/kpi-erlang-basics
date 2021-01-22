% lab12 KPI
% варіант 3
-module(lab12).
-export([start/0]).
-author("Ivan Bohun").

sum_tail(X,I,Acc) when I>0 -> sum_tail(X,I-1, Acc+( 1.0 / ((X*X) + I) ));
sum_tail(X,0,S) -> S + math:sin(X*X).

%+(X,Final X,Step Size,N)
% -List of Function Values
func_main(X, Xf, H, N) -> func_list(X, Xf + H / 100.0, H, N).

%+(X,Final X,Step Size,N)
% -List of Function Values
func_list(X, Xf, H, N)  when X =< Xf    -> [sum_tail(X, N, 0) | func_list(X + H, Xf, H, N)];
func_list(X, Xf, _, _)  when X > Xf     -> [].

start() ->
    io:format("result: ~p~n", [func_main(0,1,0.2,3)]).
    % func_main(0,1.0,0.2,3.0).
