:- use_module(library(pce)).

glavnaya_forma :-
new(Dialog, dialog('������� �����')),
send_list(Dialog, append,
[ new(N, text_item(��������)),
 new(G1, int_item(���1)),
 new(G2, int_item(���2)),
 button(������, message(Dialog, destroy)),
 button(��, and(message(@prolog,
 vivod_rezultata,
 N?selection,
 G1?selection,
 G2?selection),
 message(Dialog, destroy)))
 ]),
 send(Dialog, default_button, ��),
 send(Dialog, open).

 vivod_rezultata(Name, G1, G2) :- R is G1 + G2,
 format('������� ����� ~w = ~w~n',
 [ Name, R]).
