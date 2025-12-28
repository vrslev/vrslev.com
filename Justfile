# Build the site to the `public/` directory
build:
    zola build

# Start a local development server with hot reloading
serve:
    tmux kill-session -t zola-dev 2>/dev/null || true
    tmux new-session -d -s zola-dev 'zola serve --open' || exit 0

# Check site for errors
check:
    zola check

# Create a new post with the given title
# Usage: just post "Post Title"
post title:
    #!/usr/bin/env bash
    TITLE="{{title}}"
    SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-zA-Z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-*$//')
    FILE="content/posts/$(date +%Y-%m-%d)-$SLUG.md"

    if [ -f "$FILE" ]; then
        echo "File $FILE already exists!"
        exit 1
    fi
    echo "Creating new post: $FILE"

    {
        echo "+++"
        echo "date = $(date +%Y-%m-%dT%H:%M:%S%z)"
        echo "title = \"$TITLE\""
        echo "taxonomies.tags = []"
        echo "+++"
    } > "$FILE"
