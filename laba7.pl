:- use_module(library('plot/axis')).

tt:-
    send(new(P, picture), open),
 send(P, display,
 plot_axis(x, 0, 100, @default, 400, point(40, 320))),
 send(P, display,
 plot_axis(y, 0, 500, @default, 300, point(40, 320))).
