:- use_module(library(pce)).

forma :-
new(Dialog, dialog('���� 21.03.2024')),
send_list(Dialog, append,
[ new(N, text_item(���)),
 new(I, new(I, menu(��������))),
 button(�����, message(Dialog, destroy)),
 button('����� ���', and(message(@prolog,
 vivod,
 N?selection,
 I?selection),
 message(Dialog, destroy)))
 ]),
 send_list(I, append, [��������, �������, �����, �������, �������]),
 send(Dialog, default_button, '����� ���'),
 send(Dialog, open).

vivod(Name, Interes):-
new(Dialog, dialog(answer)),
send_list(Dialog, append,
[new(text(Name)),
 new(text(�����)),
 new(text(Interes))
]),
send(Dialog, open).

 vivod_rezultata(Name, Interes) :-
 format('~w ����� ~w~n',
 [ Name, Interes]).
