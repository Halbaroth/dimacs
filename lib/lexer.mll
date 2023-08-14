{
  open Parser
  open Lexing

  exception SyntaxError of position * string

  let raise_error ~pos msg =
    Format.kasprintf (fun str -> raise @@ SyntaxError (pos, str)) msg
}

let digit = ['0'-'9']
let integer = '-'?digit+

rule read = parse
  | 'c'              { comment lexbuf }
  | 'p'              { P }
  | "cnf"            { CNF }
  | '0'              { ZERO }
  | integer as s     { INT (int_of_string s) }
  | '\n'             { new_line lexbuf; NEWLINE }
  | [' ' '\t' '\r']+ { read lexbuf }
  | eof              { EOF }
  | '%'              { ignore lexbuf }
  | _
    { raise_error ~pos:lexbuf.lex_curr_p
        "unexpected char: %s" (Lexing.lexeme lexbuf) }

and comment = parse
  | eof   { EOF }
  | '\n'  { new_line lexbuf; read lexbuf }
  | _     { comment lexbuf }

and ignore = parse
  | eof   { EOF }
  | _     { ignore lexbuf }
