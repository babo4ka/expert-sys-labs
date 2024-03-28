:- use_module(library(pce)).

show_tabs_interface :-
    new(TabDialog, dialog('������ ���������� � ���������')),
    send(TabDialog, append, new(Tabs, tab)),


    send_list(Tabs, append,
        [tab('������� 1',
            new(Text1, text_item('����� 1')),
            new(Label1, label('���������:'))
        ),
        tab('������� 2',
            new(Text2, text_item('����� 2')),
            new(Label2, label('��������� 2:'))
        )]
    ),

    send(Tabs, open).


button_action(Text) :-
    get(Text, selection, TextValue),
    write('�� �����: '), write(TextValue), nl.

