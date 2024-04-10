:- use_module(library(pce)).

test :-
    new(Dialog, dialog('���� 6 ������� 12')),
    send_list(Dialog, append,
    [new(text('� ��� ���� �������� ��������?')),
    new(Q1, new(Q1, menu('������ 1'))),
    new(text('�� �������� ������� ��� ��������?')),
    new(Q2, new(Q2, menu('������ 2'))),
    new(text('�� ������ �������� � ������ ��� ��������?')),
    new(Q3, new(Q3, menu('������3'))),
    button(�����, message(Dialog, destroy)),
     button(���������, and(message(@prolog,
result,
Q1?selection,
Q2?selection,
Q3?selection),
message(Dialog, destroy)))
]),
send_list(Q1, append, [��, ���]),
send_list(Q2, append, [��, ���]),
send_list(Q3, append, [��, ���]),
send(Dialog, open).

result(Q1, Q2, Q3):-
    loves(Q1, Q2, Q3, OT)
    ,
    new(Dialog, dialog('���������')),
    send_list(Dialog, append,
             [new(text(OT))]),
    send(Dialog, open).

loves(Q1, Q2, Q3, AN):-  yes_no(Q1, A1), yes_no(Q2, A2), yes_no(Q3, A3), A1+A2+A3>=2, AN = '�� ������ ��������', !.
loves(_, _, _, AN):- AN = '�� �� ������ ��������'.

yes_no(YN, AN):- YN=��, AN is 1, !.
yes_no(YN, AN):- YN=���, AN is 0.
