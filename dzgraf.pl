:- use_module(library(pce)).

glavnaya_form :-
new(Dialog, dialog('������� �����')),
send_list(Dialog, append,
[ new(N, text_item('��������')),
 new(G1, int_item('�������_1_���')),
 new(G2, int_item('�������_2_���')),
 button(������, message(Dialog, destroy)),
 button(���������, and(message(@prolog,
 vivod_rez,
 N?selection,
 G1?selection,
 G2?selection),
 message(Dialog, destroy)))
 ]),
 send(Dialog, default_button, ���������),
 send(Dialog, open).

vivod_rez(Name, God1, God2) :- R = God1+God2,
 format('������� ����� ~w = ~w', [ Name, R]).
