open! Core
open! Org2md

let%expect_test "" =
  let output = Parser.parse "this is a test hello, *world*!" in
  print_s [%sexp (output : (Ast.t, string) Result.t)];
  [%expect {|
    (Ok
     (Element
      (Paragraph
       ((Plain_text this) (Plain_text is) (Plain_text a) (Plain_text test)
        (Plain_text hello,) (Markup Bold world))))) |}];
  ()
;;

let%expect_test "" =
  let output = Parser.parse "*hello test* this is a world" in
  print_s [%sexp (output : (Ast.t, string) Result.t)];
  [%expect {|
    (Ok
     (Element
      (Paragraph
       ((Markup Bold "hello test") (Plain_text this) (Plain_text is)
        (Plain_text a) (Plain_text world))))) |}];
  ()
;;

let%expect_test "" = 
  let output = Parser.parse "this is a *test of org-mode* syntax" in
  print_s [%sexp (output : (Ast.t, string) Result.t)];
  [%expect {|
    (Ok
     (Element
      (Paragraph
       ((Plain_text this) (Plain_text is) (Plain_text a)
        (Markup Bold "test of org-mode") (Plain_text syntax))))) |}];
  ();
;;