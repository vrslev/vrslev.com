.PHONY: build serve check

build:
	zola build

serve:
	tmux kill-session -t zola-dev; tmux new-session -d -s zola-dev 'zola serve --open' || exit 0

check:
	zola check
