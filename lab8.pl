:- dynamic(flower/3).
:- use_module(library(pce)).

flower('������������', 50, 100).
flower('����', 40, 90).
flower('�������', 4, 80).
flower('����', 15, 60).
flower('����������', 25, 150).
flower('�����', 9, 150).
flower('��������', 28, 50).
flower('�������', 18, 90).
flower('���������', 45, 50).
flower('������', 15, 70).


flower_page:-
    new(Dialog, dialog('�����')),
    send_list(Dialog, append,
    [new(text('�������� ����� ������')),
     new(N, text_item('�������� ������')),
     new(C, int_item('���������� ������')),
     new(P, int_item('���� �� 1 ������')),
        button('�������� ������', and(message(@prolog,
    add_flower, N?selection, C?selection, P?selection),
                                 message(Dialog, destroy))),

     new(text('��������� �����')),
    new(N1, text_item('�������� ������')),
    new(C1, int_item('����������')),
    button('��������� �����', and(message(@prolog,
     spend_flower, N1?selection, C1?selection),
                                 message(Dialog, destroy))),
    button(�����, message(Dialog, destroy))
]),
    send(Dialog, open).

add_flower(N, C, P):- assertz(flower(N, C, P)).
spend_flower(N, C):-  flower(N, C1, P), NC is C1 - C, NC>0,
    retract(flower(N, C1, P)), assertz(flower(N, NC, P)), !.

spend_flower(N, C):- retract(flower(N, C, _)).
