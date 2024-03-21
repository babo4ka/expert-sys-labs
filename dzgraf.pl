:- use_module(library(pce)).

glavnaya_form :-
new(Dialog, dialog('Выручка фирмы')),
send_list(Dialog, append,
[ new(N, text_item('Название')),
 new(G1, int_item('Выручка_1_год')),
 new(G2, int_item('Выручка_2_год')),
 button(отмена, message(Dialog, destroy)),
 button(посчитать, and(message(@prolog,
 vivod_rez,
 N?selection,
 G1?selection,
 G2?selection),
 message(Dialog, destroy)))
 ]),
 send(Dialog, default_button, посчитать),
 send(Dialog, open).

vivod_rez(Name, God1, God2) :- R = God1+God2,
 format('Выручка фирмы ~w = ~w', [ Name, R]).
