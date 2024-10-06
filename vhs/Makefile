all: intro1.gif intro2.gif intro3.gif intro4.gif

intro1.gif: intro1.tape init.lua
	vhs <intro1.tape

intro2.gif: intro2.tape init.lua intro1.gif
	vhs <intro2.tape

intro3.gif: intro3.tape init.lua intro2.gif
	vhs <intro3.tape

intro4.gif: intro4.tape init.lua intro3.gif
	vhs <intro4.tape

clean:
	rm *.gif *.go
