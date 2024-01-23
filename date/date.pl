:- ['..'/frog/frog].

def morph date(Y, M, D) <~> date(Y, M):- [Y, M, D] typeof [int].
def morph date(Y, M) <~> date(Y):- [Y, M] typeof [int].

def explict morph date(Y, M, D) <~> Y/M/D :- [Y, M, D] typeof [int].
def explict morph date(Y, M) <~> Y/M :- [Y, M] typeof [int].
def explict morph date(Y) <~> Y :- Y typeof int.

% morph date(Y, M, D) <~> date(Y/M/D):- [Y, M, D] typeof [int].
% morph date(Y, M) <~> date(Y/M):- [Y, M] typeof [int].
% % morph date(Y) <~> Y :- Y typeof int.


% explict morph event(Event, DateA) <~> event(Event, DateB):- date(DateA) cast DateB typeof date.el;ll