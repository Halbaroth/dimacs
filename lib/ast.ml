type atom = int Loc.t
type clause = atom list Loc.t
type header = (int * int) Loc.t
type t = (header * clause list) Loc.t

let atom ~loc a : atom =
  Loc.{ loc; data = a }

let clause ~loc atoms : clause =
  Loc.{ loc; data = atoms }

let header ~loc nbvars nbclauses : header =
  Loc.{ loc; data = (nbvars, nbclauses) }

let cnf ~loc header clauses : t =
  Loc.{ loc; data = (header, clauses) }
