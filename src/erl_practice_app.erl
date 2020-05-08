%%%-------------------------------------------------------------------
%% @doc erl_practice public API
%% @end
%%%-------------------------------------------------------------------

-module(erl_practice_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    erl_practice_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
