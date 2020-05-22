-module(db_server).
-author("talgat065").

%% API
-export([start/0, stop/0, write/2, read/1]).
-export([loop/1, init/0, delete/1, match/1]).

%%%%%%%%%%%% Server functions %%%%%%%%%%%%%%%%%%%

start() ->
  register(?MODULE, spawn(?MODULE, init, [])), ok.

init() -> loop([]).

loop(State) ->
  receive
    {stop, Pid, _} -> reply(Pid, ok);
    {Method, Pid, Param} ->
      {Reply, NewState} = case Method of
        write -> {ok, [Param | State]};
        read -> {read(Param, State), State};
        match -> {match(Param, State), State};
        delete ->
          F = fun({H, _El}) -> Param /= H end,
          {ok, lists:filtermap(F, State)}
      end,
      reply(Pid, Reply),
      loop(NewState)
  end.

read(Key, List) ->
  case lists:keyfind(Key, 1, List) of
    {_Key, El} -> {ok, El};
    false -> {error, Key}
  end.

match(El, List) -> match(El, List, []).

match(_, [], Acc) -> Acc;
match(El, [{Key, El} | List], Acc) ->
  match(El, List, [Key | Acc]);
match(El, [_ | List], Acc) -> match(El, List, Acc).

reply(Pid, Reply) ->
  Pid ! {reply, Reply}.

call(Msg, Data) ->
  ?MODULE ! {Msg, self(), Data},
  receive
    {reply, Reply} -> Reply
  end.

%%%%%%%%%%%%% End of server functions %%%%%%%%%%%%%%

%%%%%%%%%%%% Client functions %%%%%%%%%%%%%%%%%%%%%%
write(Key, El) ->
  call(write, {Key, El}).

read(Key) ->
  call(read, Key).

delete(Key) ->
  call(delete, Key).

match(El) ->
  call(match, El).

stop() ->
  call(stop, []).
%%%%%%%%%%%%% End of Client functions %%%%%%%%%%%%%%
