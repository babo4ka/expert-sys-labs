:- dynamic(flower/3).
:- use_module(library(pce)).

flower('альстромерия', 50, 100).
flower('роза', 40, 90).
flower('ромашка', 4, 80).
flower('пион', 15, 60).
flower('хризантема', 25, 150).
flower('астра', 9, 150).
flower('гвоздика', 28, 50).
flower('георгин', 18, 90).
flower('гладиолус', 45, 50).
flower('ландыш', 15, 70).


flower_page:-
    new(Dialog, dialog('цветы')),
    send_list(Dialog, append,
    [new(text('добавить новый цветок')),
     new(N, text_item('название цветка')),
     new(C, int_item('количество цветов')),
     new(P, int_item('цена за 1 цветок')),
        button('добавить цветок', and(message(@prolog,
    add_flower, N?selection, C?selection, P?selection),
                                 message(Dialog, destroy))),

     new(text('потратить цветы')),
    new(N1, text_item('название цветка')),
    new(C1, int_item('количество')),
    button('потратить цветы', and(message(@prolog,
     spend_flower, N1?selection, C1?selection),
                                 message(Dialog, destroy))),
    button(выход, message(Dialog, destroy))
]),
    send(Dialog, open).

add_flower(N, C, P):- assertz(flower(N, C, P)).
spend_flower(N, C):-  flower(N, C1, P), NC is C1 - C, NC>0,
    retract(flower(N, C1, P)), assertz(flower(N, NC, P)), !.

spend_flower(N, C):- retract(flower(N, C, _)).
