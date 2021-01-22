% lab16 KPI
% У акваріум можна одночасно помістити риб трьох різновидів, якщо
% всі вони належать або не належать до хижаків.
-module(lab16).
-export([start/0]).
-author("Ivan Bohun").

% {Name, Class, Predator or Prey}
db_fish() ->
    [   
        {carp,      prey},
        {trout,     prey},
        {sander,    prey},
        {tench,     prey},
        {salmon,    predator},
        {perch,     predator},
        {pike,      predator},
        {shark,     predator},
        {piranha,   predator}
    ].

in_aquarium() ->
    DB = db_fish(),

    {Prey, Predators} = {get_prey(DB, []), get_predator(DB, [])},
    PreyOptions = [{X, Y, Z} || {X, _} <- Prey, {Y, _} <- Prey, {Z, _} <- Prey, X /= Y, X /= Z, Y /= Z],
    PredatorOptions = [{X, Y, Z} || {X, _} <- Predators, {Y, _} <- Predators, {Z, _} <- Predators, X /= Y, X /= Z, Y /= Z],
    % сортує комбінації риб всередині списків і видаляє повторення, які початково мали інший порядок
    lists:usort(sort_fish_lists(PreyOptions, []))
    ++ lists:usort(sort_fish_lists(PredatorOptions, [])).

sort_fish_lists([], Acc) -> Acc;
sort_fish_lists([Tuple|Rest], Acc) -> sort_fish_lists(Rest, Acc ++ [lists:sort(tuple_to_list(Tuple))]).

get_prey([], Acc) -> Acc;
get_prey([Fish | Rest], Acc) ->
    case Fish of
        {_, prey} -> get_prey(Rest, [Fish | Acc]);
        {_, predator} -> get_prey(Rest, Acc)
    end.

get_predator([], Acc) -> Acc;
get_predator([Fish | Rest], Acc) ->
    case Fish of
        {_, predator} -> get_predator(Rest, [Fish | Acc]);
        {_, prey} -> get_predator(Rest, Acc)
    end.

start() ->
    io:format("~p~n", [in_aquarium()]).