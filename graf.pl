glavnaya_forma :-
new(Dialog, dialog('������� �����')),
send_list(Dialog, append,
[ new(N1, text_item(���_��������)),
 new(N2, text_item(�������)),
 new(S, new(S, menu(���))),
 new(A, int_item(�������, low := 18, high := 65)),
 new(D, menu(�����������, cycle)),
 button(������, message(Dialog, destroy)),
 button(��, and(message(@prolog,
 vivod_rezultata,
 N1?selection,
 N2?selection,
 S?selection,
 A?selection,
 D?selection),
 message(Dialog, destroy)))
 ]),
 send_list(S, append, [���, ���]),
 send_list(D, append, [�����������, ����������, ������]),
 send(Dialog, default_button, ��),
 send(Dialog, open).

 vivod_rezultata(FirstName, LastName, Pol, Vozrast, Depth) :-
 format('�������� ���: ~w ���: ~w �������: ~w, ������� ~w, ����������� ~w~n',
 [ Pol, FirstName, LastName, Vozrast, Depth]).
