open! Core

module Object = struct
    type t = | Heading | Section [@@deriving sexp]
end

module Element = struct
    type t = | Paragraph of string [@@deriving sexp]
end

type t = | Element of Element.t | Object of Object.t [@@deriving sexp]