% lab10 KPI
% Класифікація легкових автомобілів.
%+ (Довжина автомобіля, Ширина автомобіля)
%- Клас і назва класу
-module(lab10).
-export([start/0]).
-import(io, [fwrite/2]).
-author("Ivan Bohun").

cars_classification(Length, Width) ->
    if
        (Length < 3.6) and (Width < 1.6) ->     'Class A - Mini Cars';
        (Length < 3.9) and (Width < 1.7) ->     'Class B - Small Cars';
        (Length < 4.3) and (Width < 1.6) ->     'Class C - Medium Cars';
        (Length < 4.6) and (Width < 1.73) ->    'Class D - Large Cars';
        (Length < 4.9) and (Width < 1.82) ->    'Class E - Executive Cars';
        (Length > 4.9) and (Width > 1.82) ->    'Class F - Luxury Cars';
        true -> 'Undefined class of cars'
    end.

start() -> fwrite("~p~n", [cars_classification(4, 1.6)]).
