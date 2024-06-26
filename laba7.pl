:- use_module(library('plot/plotter')).
:- use_module(library(autowin)).

plot_function :-
plot_function(X: 2*cos(X) + 3).

plot_function(Template) :-
To is pi*2,
From is -(pi*2),
PlotStep is To/100,
Step is pi/4,
new(W, auto_sized_picture('Plotter demo')),
send(W, display, new(P, plotter)),
send(P, axis, new(X, plot_axis(x, From, To, Step, 300))),
send(P, axis, plot_axis(y, -1*2+3, 1*2+3, @default, 200)),
send(X, format, '%.2f'),
send(P, graph, new(G, plot_graph)),
plot_function(From, To, PlotStep, Template, G),
send(W, open).

plot_function(X, To, _, _, _) :-
X >= To, !.
plot_function(X, To, Step, Template, G) :-
copy_term(Template, X:Func),
Y is Func,
send(G, append, X, Y),
NewX is X + Step,
plot_function(NewX, To, Step, Template, G).

