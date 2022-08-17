open Js_of_ocaml
open Printf

module Java = struct
  let type_ typename = Js.Unsafe.eval_string (sprintf {|Java.type('%s')|} typename)  
  let addToClasspath path = Js.Unsafe.eval_string (sprintf {|Java.addToClasspath('%s')|} path)

end
module type Java = sig
  (** loads the specified Java class and provides it as an object
fields of this object can be read directly from it, and new instances can be created with the JavaScript new keyword: *)
  val type_:string -> 'a

  (** creates a shallow copy of the Java datastructure (Array, List) as a JavaScript array
In many cases, this is not necessary; you can typically use the Java datastructure directly from JavaScript. *)
  val from: 'a

  (** converts the argument to a Java dataype
The source object jsData is expected to be a JavaScript array, or an object with a length property. The target toType can either be a String (e.g. "int[]") or a type object (e.g., Java.type("int[]")). Valid target types are Java arrays. When no target type is provided, Object[] is assumed: 
var jsArr = ["a", "b", "c"];
var strArrType = Java.type("java.lang.String[]");
var javaArr = Java.to(jsArr, strArrType);
assertEquals('class java.lang.String[]', String(javaArr.getClass()));
The conversion methods as defined by ECMAScript (e.g., ToString and ToDouble) are executed when a JavaScript value has to be converted to a Java type. Lossy conversion is disallowed and results in a TypeError.
*)
  val to_: 'a

  (** returns whether obj is an object of the Java language
returns false for native JavaScript objects, as well as for objects of other polyglot languages
 *)
  val isJavaObject: 'a -> bool

  (** returns true if obj is an object representing the constructor and static members of a Java class, as obtained (for example) by Java.type()
returns false for all other arguments *)
  val isType: 'a -> bool

  (** returns the Java Class name of obj when obj represents a Java type (isType(obj) === true) or Java Class instance
returns undefined otherwise *)
  val typeName: 'a

  (** returns whether fn is an object of the Java language that represents a Java function
returns false for all other types, including native JavaScript function, and functions of other polyglot languages This function requires the Nashorn compatibility mode flag. *)
  val isJavaFunction: 'a

  (** returns whether obj is an object of the JavaScript language
returns false for all other types, including objects of Java and other polyglot languages
This function requires the Nashorn compatibility mode flag. *)
  val isScriptObject: 'a

  (** returns whether fn is a JavaScript function
returns false for all other types, including Java function, and functions of other polyglot languages
This function requires the Nashorn compatibility mode flag. *)
  val isScriptFunction: 'a

  (** adds the specified location (file name or path name, as String) to Java's classpath *)
  val addToClasspath: string -> unit

  
end
let (-->) = Js.Unsafe.fun_call


module type Graal = sig

  (** provides the version number (year value) of GraalVM JavaScript's ECMAScript compatibility mode. *)
  val versionECMAScript: string

  (** provides the version of GraalVM, if the current engine is executed on GraalVM *)
  val versionGraalVM: string

  (** provides whether GraalVM JavaScript is executed on a GraalVM-enabled runtime. If true, hot code is compiled by the GraalVM compiler, resulting in high peak performance. If false, GraalVM JavaScript will not be optimized by the GraalVM Compiler, typically resulting in lower performance.  *)
  val isGraalRuntime: unit -> bool

end
