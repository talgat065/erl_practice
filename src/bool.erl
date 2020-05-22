-module(bool).
-author("talgat065").

%% API
-export([b_not/1, b_and/2, b_or/2, b_nand/2]).

b_not(false) -> true;
b_not(true) -> false.

b_and(true, true) -> true;
b_and(_, _) -> false.

b_or(true, _) -> true;
b_or(_, true) -> true;
b_or(_, _) -> false.

b_nand(Expr1, Expr2) -> b_not(b_and(Expr1, Expr2)).

