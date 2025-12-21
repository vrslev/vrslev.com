.PHONY: build serve clean check

build:
	zola build

serve:
	tmux new-session -d -s zola-dev 'zola serve' || exit 0

check:
	zola check
