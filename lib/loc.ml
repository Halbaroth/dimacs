type loc = {
  filename: string;
  line: int;
  col: int;
}

type 'a t = { loc : loc; data : 'a }

let mk ~filename start _end =
  let open Lexing in
  { filename; line = start.pos_lnum; col = start.pos_cnum }

let[@inline always] data { data; _ } = data

let pp fmt {filename; line; col} =
  Format.fprintf fmt "%s (%i, %i)" filename line col
