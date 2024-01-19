
:- use_module(library(filesex)).

:- table package/1.
package(Package):- \+ is_list(Package), package([Package]).
package([]).
package([Package | Packages]):-
  (
    exists_file(Package), use_module(Package);
    exists_directory(Package), 
      atom_concat(Package, '/__init__', PackageIndex),
      use_module(PackageIndex, []);
    write("Fail Impoart package: "),
    write(Package),
    nl
  ),
  package(Packages).