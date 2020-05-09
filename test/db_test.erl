%%%-------------------------------------------------------------------
%%% @author talgat065
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. May 2020 20:37
%%%-------------------------------------------------------------------
-module(db_test).
-author("talgat065").

-include_lib("eunit/include/eunit.hrl").

db_test() ->
  Db = db:new(),
  Db1 = db:write(francesco, london, Db),
  Db2 = db:write(lelle, stockholm, Db1),
  Db3 = db:write(joern, stockholm, Db2),
  Db4 = db:delete(lelle, Db3),
  ?assertEqual([], (Db)),
  ?assertEqual([{francesco,london}], (Db1)),
  ?assertEqual([{lelle,stockholm},{francesco,london}], (Db2)),
  ?assertEqual({ok,london}, (db:read(francesco, Db2))),
  ?assertEqual([{joern,stockholm},{lelle,stockholm},{francesco,london}], (Db3)),
  ?assertEqual({error,instance}, (db:read(ola, Db3))),
  ?assertEqual([joern,lelle], (db:match(stockholm, Db3))),
%%  ?assertEqual([{joern,stockholm},{francesco,london}], (Db4)),
%%  ?assertEqual([joern], (db:match(stockholm, Db4))),
  ok.
