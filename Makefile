run:
	js_of_ocaml _build/default/bin/main.bc
	rome format --write --skip-errors _build/default/bin/main.js 
	$(GRAALVM)/bin/node --inspect --jvm --polyglot _build/default/bin/main.js 

exec: 
	rome format --write --skip-errors _build/default/bin/main.js 
	$(GRAALVM)/bin/node --inspect --jvm --polyglot _build/default/bin/main.js 