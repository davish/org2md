open! Core

let%expect_test "hi" =
  print_endline "hello world";
  print_s [%message "hello"];
  [%expect {| hello world |}];
  ()
;;