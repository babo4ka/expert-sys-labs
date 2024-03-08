ves(1, 'Андрей', 60, 170).
ves(2, 'Дмитрий', 80, 182).
ves(3, 'Оксана', 90, 176).
ves(4, 'Аня', 70, 182).
ves(5, 'Саша', 80, 179).
ves(6, 'Аркадий', 75, 175).


allves(S) :- findall(V, ves(_, _, V, _), L), S = L.

minves(V) :- allves(S), minves(S, M), V is M.
minves(L, V) :- minves(L, 10000, M), V is M.
minves([H|T], CM, M):- H<CM, minves(T, H, M1), M is M1, !.
minves([_|T], CM, M) :- minves(T, CM, M1), M is M1.
minves([], CM, M):- M is CM.

maxves(V) :- allves(S), maxves(S, M), V is M.
maxves(L, V) :- maxves(L, 0, M), V is M.
maxves([H|T], CM, M):- H>CM, maxves(T, H, M1), M is M1, !.
maxves([_|T], CM, M) :- maxves(T, CM, M1), M is M1.
maxves([], CM, M) :- M is CM.

maxmindiff(D) :- maxves(MAX), minves(MIN), D is MAX - MIN.
