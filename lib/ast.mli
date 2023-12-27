open! Core
module Object : sig
    module Markup_type : sig
        type t = 
            | Bold 
            | Italic 
            | Underline 
            | Verbatim 
            | Code 
            | Strikethrough
        [@@deriving sexp_of]
    end

    type t = 
        | Plain_text of string
        | Markup of Markup_type.t * string
    [@@deriving sexp_of]
end

module Element : sig
    module Heading_info : sig
        type t [@@deriving sexp_of]

        val create : level:int -> todo:string option -> priority:char option -> title:string option -> t
        val level : t -> int
        val todo: t -> string option
        val priority : t -> char option
        val title : t -> string option
    end
    type t = 
        | Heading of Heading_info.t
        | Section of t list 
        | Paragraph of Object.t list
        [@@deriving sexp_of]
end

type t = | Element of Element.t | Object of Object.t [@@deriving sexp_of]