open Polyglot
open Js_of_ocaml

module Lang = struct
  let (-->) = Js.Unsafe.fun_call
  
  module Math = struct
    let jMath = (Java.type_ "java.lang.Math")
    let pi = jMath##.PI |> Js.float_of_number
    let random () =  jMath##.random --> [||] |> Js.float_of_number
    let sin (x:float) = jMath##.sin --> [|Js.Unsafe.inject x|] |> Js.float_of_number

    let floor (x:float) = jMath##.floor --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let ceil (x:float) = jMath##.ceil --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let round (x:float) = jMath##.round --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let abs (x:float) = jMath##.abs --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let sqrt (x:float) = jMath##.sqrt --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let pow (x:float) (y:float) = jMath##.pow --> [|Js.Unsafe.inject x; Js.Unsafe.inject y|] |> Js.float_of_number
    let log (x:float) = jMath##.log --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let exp (x:float) = jMath##.exp --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let min (x:float) (y:float) = jMath##.min --> [|Js.Unsafe.inject x; Js.Unsafe.inject y|] |> Js.float_of_number
    let max (x:float) (y:float) = jMath##.max --> [|Js.Unsafe.inject x; Js.Unsafe.inject y|] |> Js.float_of_number
    let atan2 (x:float) (y:float) = jMath##.atan2 --> [|Js.Unsafe.inject x; Js.Unsafe.inject y|] |> Js.float_of_number
    let atan (x:float) = jMath##.atan --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let acos (x:float) = jMath##.acos --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let asin (x:float) = jMath##.asin --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let cos (x:float) = jMath##.cos --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    let tan (x:float) = jMath##.tan --> [|Js.Unsafe.inject x|] |> Js.float_of_number
    
    let log10 (x:float) = log x /. log 10.
    let log2 (x:float) = log x /. log 2.
    let log1p (x:float) = log (1. +. x)
    let expm1 (x:float) = exp x -. 1.
    let cbrt (x:float) = x ** (1. /. 3.)
    let hypot (x:float) (y:float) = sqrt (x *. x +. y *. y)
    let sinh (x:float) = (exp x -. exp (-.x)) /. 2.

  end
end