:- use_module('morph.h').
:- ['..'/'prefixer'].

def explict mold morph X :- use explict morph X.
def explict morph X :- use explict mold morph X.