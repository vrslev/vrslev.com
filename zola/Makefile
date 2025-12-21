.PHONY: build serve clean check

build:
	zola build

serve:
	tmux new-session -d -s zola-dev 'zola serve' || tmux attach-session -t zola-dev

clean:
	rm -rf public/

check:
	zola check