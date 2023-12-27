open! Core
open Angstrom
open Angstrom.Let_syntax


let _punctuation = (char '!' *> return ()) <|> end_of_input

let markup c m = 
  let%bind content = char c *> take_till (Char.equal c) <* char c in
  return (Ast.Object.Markup (m, content))
;;

let plain_text = 
  let%bind s = take_till (Char.equal ' ') in 
  return (Ast.Object.Plain_text s)
  
let paragraph = 
  let obj = markup '*' Ast.Object.Markup_type.Bold  <|> plain_text  in
  let%bind objs = sep_by1 (char ' ') obj in
  return (Ast.Element.Paragraph objs)

let ast = let%bind p = paragraph in 
  return (Ast.Element (p))

(* TODO: make the parser handle EOF properly *)
let parse input = parse_string ~consume:Prefix ast input