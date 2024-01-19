:- module('typeof', ['typeof'/2]).
:- reexport('__typeof').

:- multifile 'typeof'/2.
:- table 'typeof'/2.

:- [
  'typeof_primitive',
  'typeof_list',
  'typeof_compound'
].
