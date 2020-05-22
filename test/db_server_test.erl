%%%-------------------------------------------------------------------
%%% @author talgat065
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. May 2020 17:49
%%%-------------------------------------------------------------------
-module(db_server_test).
-author("talgat065").

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
  ?assertEqual(db_server:start(), ok),
  ?assertEqual(db_server:write(john, liverpool), ok),
  ?assertEqual(db_server:write(andy, liverpool), ok),
  ?assertEqual(db_server:write(pit, liverpool), ok),
  ?assertEqual(db_server:write(pol, mccartny), ok),
  ?assertEqual(db_server:read(pol), {ok, mccartny}),
  ?assertEqual(db_server:delete(john), ok),
  ?assertEqual(db_server:read(john), {error, john}),
  ?assertEqual(db_server:match(liverpool), [andy, pit]),
  ?assertEqual(db_server:stop(), ok).
