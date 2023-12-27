open! Core

module Object = struct
    module Markup_type = struct
        type t = 
            | Bold 
            | Italic 
            | Underline 
            | Verbatim 
            | Code 
            | Strikethrough
        [@@deriving sexp]
    end

    type t = 
        | Plain_text of string 
        | Markup of Markup_type.t * string
    [@@deriving sexp] 
end



module Element = struct
    module Heading_info = struct
        type t = {level : int; todo : string option; priority: char option; title: string option}
        [@@deriving sexp, fields ~getters ~iterators:create]

        let create = Fields.create
    end
    type t = 
        | Heading of Heading_info.t
        | Section of t list
        | Paragraph of Object.t list
    [@@deriving sexp]
end

type t = | Element of Element.t | Object of Object.t [@@deriving sexp]