%%%-------------------------------------------------------------------
%%% @author talgat065
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. May 2020 19:38
%%%-------------------------------------------------------------------
-module(c_lists_test).
-author("talgat065").

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
  ?assertEqual(c_lists:create(3), [1, 2, 3]),
  ?assertEqual(c_lists:create(0), []),
  ?assertEqual(c_lists:create_reverse(3), [3, 2, 1]),
  ?assertEqual(c_lists:create_reverse(0), []).


