-module(c_math).
-author("talgat065").

%% API
-export([sum/1, sum/2]).

%% Exercise 3-1: Evaluating Expressions
%% Write a function sum/1 which, given a positive integer N,
%% will return the sum of all the integers between 1 and N.
%% Example: sum(5) ⇒ 15.
sum(0) -> 0;
sum(N) -> N + sum(N - 1).

%% Write a function sum/2 which, given two integers N and M,
%% where N =< M, will return the sum of the interval between N and M.
%% If N > M, you want your process to terminate abnormally.
%% Example:
%% sum(1,3) ⇒ 6.
%% sum(6,6) ⇒ 6.
sum(N, N) -> N;
sum(N, M) when N =< M -> N + sum(N + 1, M);
sum(N, M) -> throw({error, {bad_arith, N, M}}).



