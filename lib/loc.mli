type loc

type 'a t = { loc : loc; data : 'a }

val mk : filename:string -> Lexing.position -> Lexing.position -> loc
val data : 'a t -> 'a
val pp : Format.formatter -> loc -> unit
