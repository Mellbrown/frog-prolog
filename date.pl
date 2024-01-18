:- [base].

class event(Event, date(Y, M, D)):-
  atom(Event), 
  integer(Y),
  integer(M),
  integer(D).

implict date(Y, M) :- implict date(Y, M, _).
% implict date(Y) :- implict date(Y, _).
% implict exact_date(Y, M, D) :- implict date(Y, M, D).
% implict exact_date(Y, M, 1) :- implict date(Y, M).
% implict exact_date(Y, 1, 1) :- implict date(Y).

fact [
  event(event1, date(2024, 1, 1)),
  % event(event2, date(2024, 1, 1)),
  % event(event3, date(2024, 1, 1))
  % event(event2),
  % event(event3)
  event(event3, date(2024, 1, 1))
  % event(event7)
].

fact [
  % event(event4, date(2024, 1, 1))
  event(event5, date(2024, 1, 1)),
  event(event6, date(2024, 1, 1)),
  event(event4)
].

:- initialization(frog_check).