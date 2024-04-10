:- use_module(library(pce)).

test :-
    new(Dialog, dialog('лаба 6 задание 12')),
    send_list(Dialog, append,
    [new(text('” вас есть домашнее животное?')),
    new(Q1, new(Q1, menu('вопрос 1'))),
    new(text('¬ы работали н€нькой дл€ животных?')),
    new(Q2, new(Q2, menu('вопрос 2'))),
    new(text('¬ы хотите работать в приюте дл€ животных?')),
    new(Q3, new(Q3, menu('вопрос3'))),
    button(выход, message(Dialog, destroy)),
     button(результат, and(message(@prolog,
result,
Q1?selection,
Q2?selection,
Q3?selection),
message(Dialog, destroy)))
]),
send_list(Q1, append, [да, нет]),
send_list(Q2, append, [да, нет]),
send_list(Q3, append, [да, нет]),
send(Dialog, open).

result(Q1, Q2, Q3):-
    loves(Q1, Q2, Q3, OT)
    ,
    new(Dialog, dialog('результат')),
    send_list(Dialog, append,
             [new(text(OT))]),
    send(Dialog, open).

loves(Q1, Q2, Q3, AN):-  yes_no(Q1, A1), yes_no(Q2, A2), yes_no(Q3, A3), A1+A2+A3>=2, AN = 'вы любите животных', !.
loves(_, _, _, AN):- AN = 'вы не любите животных'.

yes_no(YN, AN):- YN=да, AN is 1, !.
yes_no(YN, AN):- YN=нет, AN is 0.
