PLUGIN = ${HOME}/Library/Application\ Support/xbar/plugins/KMonad.1m.sh

$(PLUGIN): xbar/KMonad.sh
	cp "$<" "$@"
	chmod u+x "$@"

clean:
	rm $(PLUGIN)
