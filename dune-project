(lang dune 3.10)
(name dimacs)
(generate_opam_files true)
(using menhir 2.1)

(source
 (github Halbaroth/dimacs))

(authors "Pierre Villemot")

(maintainers "Pierre Villemot")

(license LICENSE)

(package
 (name dimacs)
 (synopsis "A Menhir parser for the DIMACS format")
 (description "A Menhir parser for the DIMACS format")
 (depends
   ocaml
   dune
   base
   menhir
   ppx_sexp_conv
   ppx_compare
   ppx_deriving)
 (tags
  (topics "Yet another parser :D" your project)))
