товар('Гаечный ключ', 300).
товар('Садовый шланг', 400).
товар('Лейка', 100).
товар('Водяной насос', 500).
товар('Набор отверок', 200).
товар('Товар', 500).
товар('Ещё товар', 400).


sum200(S):- priceslist(L), sum200(L, S1), S is S1.
sum200([], 0).
sum200([H|T], S) :- sum200(T, S1), H>200, S is H + S1, !.
sum200([_|T], S) :- sum200(T, S1), S is 0 + S1.

maxprice(L, M) :- maxprice(L, 0, M1), M is M1.
maxprice([H|T], CM, M) :-  H > CM, maxprice(T, H, M1), M is M1, !.
maxprice([_|T], CM, M) :-  maxprice(T, CM, M1), M is M1.
maxprice([], CM, M):- M is CM.

maxpricetov(N, P) :- priceslist(S), maxpricetov(S, X, Y), N = X, P = Y.
maxpricetov(P, X, Y):-  maxprice(P, M), товар(N, M), X = N, Y = M.

priceslist(S) :- findall(X, товар(_, X), L), S = L.
