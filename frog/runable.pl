:- use_module(h/'runable.h').

run [].
run [Head | Tail] :- Head, run Tail bind Condition, !, Condition.
run NoList :- \+ is_list(NoList), NoList bind Condition, !, Condition.

Condition bind Binder :- (Condition, Binder = true; Binder = false), !, true.

if Condition then Run :- (Condition, (run Run; true); true), !.