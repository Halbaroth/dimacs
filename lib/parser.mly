%token P
%token CNF
%token ZERO
%token NEWLINE
%token <int> INT
%token EOF
%start <Ast.t> cnf

%%

atom:
  | a=INT
    { let loc = Loc.mk ~filename:"" $startpos $endpos in
      Ast.atom ~loc a }

clause:
  | c=nonempty_list(atom) ZERO NEWLINE
    { let loc = Loc.mk ~filename:"" $startpos $endpos in
      Ast.clause ~loc c }

header:
  | P CNF nbvars=INT nbclauses=INT NEWLINE
    { let loc = Loc.mk ~filename:"" $startpos $endpos in
      Ast.header ~loc nbvars nbclauses }

clauses:
  | EOF
    { [] }
  | c=clause NEWLINE* l=clauses
    { c :: l }

cnf:
  | NEWLINE* s=header c=clauses
    { let loc = Loc.mk ~filename:"" $startpos $endpos in
      Ast.cnf ~loc s c }
