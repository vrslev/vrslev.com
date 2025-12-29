# Build the site to the `public/` directory
build:
    zola build

# Minify the site in `public/`
minify:
    minify-html --keep-closing-tags --minify-js --minify-css public/**/*.html

# Start a local development server with hot reloading
serve:
    tmux kill-session -t zola-dev 2>/dev/null || true
    tmux new-session -d -s zola-dev 'zola serve' || exit 0

# Open in browser
open:
    open http://localhost:1111/

# Check site for errors
check:
    zola check

# Create bilingual posts: just post en "Post Title" (English/original) or just post ru "Заголовок поста" (Russian/translation)
post lang title:
    #!/usr/bin/env bash
    LANG="{{lang}}"
    TITLE="{{title}}"

    # Validate language parameter
    if [ "$LANG" != "en" ] && [ "$LANG" != "ru" ]; then
        echo "Error: lang must be 'en' or 'ru'"
        exit 1
    fi

    if [ "$LANG" = "en" ]; then
        SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-zA-Z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-*$//')
        FILE="content/posts/$(date +%Y-%m-%d)-$SLUG.md"
        TAGS="[\"original-lang\"]"
        TRANSLATION_FILE="content/posts/$(date +%Y-%m-%d)-$SLUG.ru.md"
        POST_TYPE="English"
    else
        # Simple transliteration for Russian characters in slug
        SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/а/a/g' | sed 's/б/b/g' | sed 's/в/v/g' | sed 's/г/g/g' | sed 's/д/d/g' | sed 's/е/e/g' | sed 's/ё/e/g' | sed 's/ж/j/g' | sed 's/з/z/g' | sed 's/и/i/g' | sed 's/й/i/g' | sed 's/к/k/g' | sed 's/л/l/g' | sed 's/м/m/g' | sed 's/н/n/g' | sed 's/о/o/g' | sed 's/п/p/g' | sed 's/р/r/g' | sed 's/с/s/g' | sed 's/т/t/g' | sed 's/у/u/g' | sed 's/ф/f/g' | sed 's/х/h/g' | sed 's/ц/c/g' | sed 's/ч/ch/g' | sed 's/ш/sh/g' | sed 's/щ/sh/g' | sed 's/ъ/ie/g' | sed 's/ы/y/g' | sed 's/ь/~/g' | sed 's/э/e/g' | sed 's/ю/yu/g' | sed 's/я/ya/g' | sed 's/[^a-zA-Z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-*$//')
        FILE="content/posts/$(date +%Y-%m-%d)-$SLUG.ru.md"
        TAGS="[\"human-translation\"]"
        TRANSLATION_FILE="content/posts/$(date +%Y-%m-%d)-$SLUG.md"
        POST_TYPE="Russian"
    fi

    if [ -f "$FILE" ]; then
        echo "File $FILE already exists!"
        exit 1
    fi
    echo "Creating new $POST_TYPE post: $FILE"

    # Format date with colon in timezone offset for TOML compatibility
    DATE_FORMATTED=$(date +%Y-%m-%dT%H:%M:%S%z | sed 's/\([+-][0-9]\{2\}\)\([0-9]\{2\}\)/\1:\2/')
    {
        echo "+++"
        echo "date = $DATE_FORMATTED"
        echo "title = \"$TITLE\""
        echo "taxonomies.tags = $TAGS"
        echo "+++"
    } > "$FILE"

    if [ "$LANG" = "en" ]; then
        echo "Post created: $FILE"
        echo "Remember to create the Russian translation: $TRANSLATION_FILE"
    else
        echo "Post created: $FILE"
        echo "Remember to create the English translation: $TRANSLATION_FILE"
    fi
