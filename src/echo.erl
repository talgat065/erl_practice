%%%-------------------------------------------------------------------
%%% @author talgat065
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. May 2020 09:45
%%%-------------------------------------------------------------------
-module(echo).
-author("talgat065").

%% API
-export([start/0, stop/0, print/1, loop/0]).

start() ->
  register(echo, spawn(echo, loop, [])),
  echo ! {self(), hello}.

print(Msg) ->
  echo ! {self(), Msg},
  receive
    {_Pid, Msg} -> io:format("~w~n", [Msg])
  end.

stop() ->
  echo ! stop.

loop() ->
  receive
    {Pid, Msg} -> Pid ! {self(), Msg},
      loop();
    stop -> true
  end.
