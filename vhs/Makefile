.PHONY: all intro ollama fim clean

.SUFFIXES:
.SUFFIXES: .gif .tape

.tape.gif:
	vhs <$<

all: intro ollama fim outro.gif

intro: intro1.gif intro2.gif intro3.gif intro4.gif

ollama: ollama1.gif ollama2.gif ollama3.gif ollama4.gif

fim: fim1.gif fim2.gif fim3.gif

intro1.gif: init.lua

intro2.gif: init.lua intro1.gif

intro3.gif: init.lua intro2.gif

intro4.gif: init.lua intro3.gif

outro.gif: init.lua intro1.gif

clean:
	rm *.gif *.go
