open Js_of_ocaml

let jPI () = 
  Js.Unsafe.eval_string {|Java.type('java.lang.Math').PI|}  |> Js.float_of_number |> print_float