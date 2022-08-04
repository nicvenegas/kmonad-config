CONFIGS := apple.kbd magic-keyboard.kbd
PLUGIN := ${HOME}/Library/Application\ Support/xbar/plugins/KMonad.1m.sh
PLUGINSRC := xbar/KMonad.sh

all: $(CONFIGS) $(PLUGIN)

$(CONFIGS): apple.kbd.m4

apple.kbd:
	m4 -D __NAME__='Apple Internal Keyboard / Trackpad' "$<" > "$@"

magic-keyboard.kbd:
	m4 -D __NAME__='Magic Keyboard' "$<" > "$@"

$(PLUGIN): $(PLUGINSRC)
	cp "$<" "$@"

clean:
	rm $(CONFIGS)
	rm $(PLUGIN)

lint:
	shellcheck "$(PLUGINSRC)"
