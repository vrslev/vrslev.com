# Site Generation
This site uses a Just-based workflow to manage Zola commands.

## Available Commands
`just --list` output:

```
Available recipes:
    build      # Build the site to the `public/` directory
    check      # Check site for errors
    post title # Usage: just post "Post Title"
    serve      # Start a local development server with hot reloading
```

## Workflow
- Start local server with `just serve &`: it'll automatically rebuild the site and refresh the browser when files change
- No need to manually rebuild after each change - changes are automatically detected and the site is rebuilt. Only run `just build` to check if build is ok or check the resulting html

## Development Notes
- Use CSS selectors over inline styles for better maintainability and consistency
- Use content tags conservatively
