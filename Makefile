run:
	js_of_ocaml _build/default/bin/main.bc
	$(GRAALVM)/bin/node --jvm --polyglot _build/default/bin/main.js 