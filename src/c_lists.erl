%%%-------------------------------------------------------------------
%%% @author talgat065
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. May 2020 19:37
%%%-------------------------------------------------------------------
-module(c_lists).
-author("talgat065").

%% API
-export([create/1, create_reverse/1, print_nums/1, print_odds/1]).

%% Write a function that returns a list of the format [1,2,..,N-1,N].
%% Example:
%% create(3) ⇒ [1,2,3].
create(N) -> create(N, []).
create(0, Acc) -> Acc;
create(N, Acc) -> create(N - 1, [N | Acc]).

%%Write a function that returns a list of the format [N, N-1,..,2,1].
%%
%%Example:
%%reverse_create(3) ⇒ [3,2,1].
create_reverse(0) -> [];
create_reverse(N) -> [N | create_reverse(N - 1)].

%% Write a function that prints out the
%% integers between 1 and N.
%% Hint: use io:format("Number:~p~n",[N]).
print_nums(N) -> print_nums(1, N).

print_nums(N, N) -> print(N);
print_nums(M, N) ->
  print(N),
  print_nums(M + 1, N).

%% Write a function that prints out the
%% even integers between 1 and N.
%% Hint: use guards.
print_odds(N) -> print_odds(1, N).
print_odds(M, N) when N div 2 /= 0 ->
  print(N),
  print_nums(M + 1, N);
print_odds(M, N) -> print_nums(M + 1, N).

print(N) -> io:format("Number:~p~n", [N]).
