:- module('typeof.m', ['typeof'/2]).

:- multifile 'typeof'/2.
:- table 'typeof'/2.

:- [
  'typeof_primitive',
  'typeof_list',
  'typeof_compound'
].
