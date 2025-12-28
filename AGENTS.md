# Site Generation

This site uses a Just-based workflow to manage Zola commands.

## Available Commands

- `just build`: Build the site to the `public/` directory
- `just serve`: Start a local development server with hot reloading
- `just check`: Check site for errors
- `just post "Post Title"`: Create a new post with the given title

## Workflow

During development, use `just serve` to start a local server that automatically rebuilds the site and refreshes the browser when files change.

To stop the server, press `Ctrl+C` in the terminal where it's running.

For production builds or for, use `just build` to generate the static files in the `public/` directory for deployment.

## Development Notes

- No need to manually rebuild after each change when using `just serve` - changes are automatically detected and the site is rebuilt
- The development server provides hot reloading, instantly reflecting changes in the browser
- Only run `just build` to check if build is ok
- Prefer CSS selectors over inline styles for better maintainability and consistency

The Justfile provides a simple interface to Zola commands, ensuring consistent usage across different environments.
