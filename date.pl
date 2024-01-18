:- [base].

book [
  [
    # date(2024, 1, 1),
    # date(2024, 2, 2)
  ]
].

% ?- book L, flatten(L, L2), maplist(#; note, L2).