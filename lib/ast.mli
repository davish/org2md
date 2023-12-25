open! Core
module Object : sig
    type t = | Heading | Section [@@deriving sexp_of]
end

module Element : sig
    type t = | Paragraph of string [@@deriving sexp_of]
end

type t = | Element of Element.t | Object of Object.t [@@deriving sexp_of]