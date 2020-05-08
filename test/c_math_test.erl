%%%-------------------------------------------------------------------
%%% @author talgat065
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. May 2020 19:20
%%%-------------------------------------------------------------------
-module(c_math_test).
-author("talgat065").

-include_lib("eunit/include/eunit.hrl").

sum_test() ->
  ?assertEqual(c_math:sum(5), 15),
  ?assertEqual(c_math:sum(4), 10),
  ?assertEqual(c_math:sum(0), 0),
  ?assertEqual(c_math:sum(1, 3), 6),
  ?assertEqual(c_math:sum(6, 6), 6).
