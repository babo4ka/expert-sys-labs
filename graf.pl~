glavnaya_forma :-
new(Dialog, dialog('√лавна€ форма')),
send_list(Dialog, append,
[ new(N1, text_item(им€_студента)),
 new(N2, text_item(фамили€)),
 new(S, new(S, menu(пол))),
 new(A, int_item(возраст, low := 18, high := 65)),
 new(D, menu(направление, cycle)),
 button(отмена, message(Dialog, destroy)),
 button(ок, and(message(@prolog,
 vivod_rezultata,
 N1?selection,
 N2?selection,
 S?selection,
 A?selection,
 D?selection),
 message(Dialog, destroy)))
 ]),
 send_list(S, append, [муж, жен]),
 send_list(D, append, [информатика, математика, физика]),
 send(Dialog, default_button, ок),
 send(Dialog, open).

 vivod_rezultata(FirstName, LastName, Pol, Vozrast, Depth) :-
 format('ƒобавить пол: ~w им€: ~w фамили€: ~w, возраст ~w, направление ~w~n',
 [ Pol, FirstName, LastName, Vozrast, Depth]).
