:- use_module(library(pce)).

glavnaya_forma :-
new(Dialog, dialog('Главная форма')),
send_list(Dialog, append,
[ new(N, text_item(название)),
 new(G1, int_item(год1)),
 new(G2, int_item(год2)),
 button(отмена, message(Dialog, destroy)),
 button(ок, and(message(@prolog,
 vivod_rezultata,
 N?selection,
 G1?selection,
 G2?selection),
 message(Dialog, destroy)))
 ]),
 send(Dialog, default_button, ок),
 send(Dialog, open).

 vivod_rezultata(Name, G1, G2) :- R is G1 + G2,
 format('Выручка фирмы ~w = ~w~n',
 [ Name, R]).
