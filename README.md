# Graaml

Run OCaml on the GraalVM.

At the moment, only experimenting with java apis.

## Prerequisites

- GraalVM with NodeJS plugin
- JS of OCaml compiler

## Usage

### Accessing Java object properties

```ocaml
let jMath = (Java.type_ "java.lang.Math") in
let pi = jMath##.PI |> Js.float_of_number in
print_float pi (* Prints 3.14159265359 *)
```
### Invoking Java methods
```ocaml
let open Java.Lang in
let jMath = (Java.type_ "java.lang.Math") in
let random () =  jMath##.random --> [||] |> Js.float_of_number in
random () |> print_float (* Prints a random number *)

```

## Running

You need to compile your code with jsoo and the run it with `$GRAAL_HOME/bin/node --jvm --inspect --polyglot _build/default/bin/main.js`
