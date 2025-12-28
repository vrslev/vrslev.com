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

During development, use `just serve` once to start a local server that automatically rebuilds the site and refreshes the browser when files change.

## Development Notes

- No need to manually rebuild after each change when using `just serve` - changes are automatically detected and the site is rebuilt. The development server provides hot reloading, instantly reflecting changes in the browser
- Only run `just build` to check if build is ok or check the resulting html
- Use CSS selectors over inline styles for better maintainability and consistency

The Justfile provides a simple interface to Zola commands, ensuring consistent usage across different environments.
