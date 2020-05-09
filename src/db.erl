%%%-------------------------------------------------------------------
%%% @author talgat065
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. May 2020 20:37
%%%-------------------------------------------------------------------
-module(db).
-author("talgat065").

%% API
-export([new/0, write/3, delete/2, read/2, match/2, destroy/1]).

new() -> [].

write(Key, El, Db) -> [{Key, El} | Db].

delete(_, []) -> [];
delete(Key, [{Key, _El} | List]) -> List;
delete(Key, [_ | List]) -> delete(Key, List).

read(_, []) -> {error, instance};
read(Key, [{Key, El} | _Tail]) -> {ok, El};
read(Key, [{_Key, _El} | Tail]) -> read(Key, Tail).

match(El, Db) -> match(El, Db, []).
match(_El, [], Acc) -> reverse(Acc);
match(El, [{Key, El} | Db], Acc) -> match(El, Db, [Key | Acc]);
match(El, [{_Key, _El} | Db], Acc) -> match(El, Db, Acc).

destroy(_Db) -> ok.

reverse(List) -> reverse(List, []).
reverse([], Acc) -> Acc;
reverse([Head|Tail], Acc) -> reverse(Tail, [Head|Acc]).
