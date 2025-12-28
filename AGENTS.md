## About the project
This is a personal website built with Zola, a static site generator. Just for workflow management, and vanilla CSS, HTML, and JavaScript for the frontend. Posts are written in Markdown in both Russian and English.

## Available Commands
`just --list` output:

```
Available recipes:
    build           # Build the site to the `public/` directory
    check           # Check site for errors
    post lang title # Create bilingual posts: just post en "Post Title" (English/original) or just post ru "Заголовок поста" (Russian/translation)
    serve           # Start a local development server with hot reloading
```

## Workflow
- Start local server with `just serve`: it'll automatically rebuild the site and refresh the browser when files change
- No need to manually rebuild after each change - changes are automatically detected and the site is rebuilt. Only run `just build` to check if build is ok or check the resulting html
- Create bilingual posts with `just post en "Title"` for English (original) or `just post ru "Заголовок"` for Russian (translation)

## Development Notes
- Use CSS selectors over inline styles for better maintainability and consistency
- Use content tags conservatively
