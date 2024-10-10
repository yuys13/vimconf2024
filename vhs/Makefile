.PHONY: all intro ollama clean

all: intro ollama

intro: intro1.gif intro2.gif intro3.gif intro4.gif

ollama: ollama1.gif ollama2.gif ollama3.gif ollama4.gif

intro1.gif: intro1.tape init.lua
	vhs <intro1.tape

intro2.gif: intro2.tape init.lua intro1.gif
	vhs <intro2.tape

intro3.gif: intro3.tape init.lua intro2.gif
	vhs <intro3.tape

intro4.gif: intro4.tape init.lua intro3.gif
	vhs <intro4.tape

ollama1.gif: ollama1.tape
	vhs <ollama1.tape

ollama2.gif: ollama2.tape
	vhs <ollama2.tape

ollama3.gif: ollama3.tape
	vhs <ollama3.tape

ollama4.gif: ollama4.tape
	vhs <ollama4.tape

clean:
	rm *.gif *.go
