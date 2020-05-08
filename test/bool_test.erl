%%%-------------------------------------------------------------------
%%% @author talgat065
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. May 2020 18:26
%%%-------------------------------------------------------------------
-module(bool_test).
-author("talgat065").

-include_lib("eunit/include/eunit.hrl").
%%-include("../src/bools.erl").

simple_test() ->
  ?assertEqual(bool:b_not(false), true),
  ?assertEqual(bool:b_not(true), false),
  ?assertEqual(bool:b_and(false, true), false),
  ?assertEqual(bool:b_and(true, false), false),
  ?assertEqual(bool:b_and(true, true), true),
  ?assertEqual(bool:b_or(true, false), true),
  ?assertEqual(bool:b_or(true, true), true),
  ?assertEqual(bool:b_or(false, false), false),
  ?assertEqual(bool:b_nand(false, false), true).



