# Site Generation

This site uses a Make-based workflow to manage Zola commands.

## Available Commands

- `make build`: Build the site to the `public/` directory
- `make serve`: Start a local development server with hot reloading
- `make clean`: Remove the `public/` directory

## Workflow

During development, use `make serve` to start a local server that automatically rebuilds the site and refreshes the browser when files change.

To stop the server, press `Ctrl+C` in the terminal where it's running.

For production builds or for, use `make build` to generate the static files in the `public/` directory for deployment.

## Development Notes

- No need to manually rebuild after each change when using `make serve` - changes are automatically detected and the site is rebuilt
- The development server provides hot reloading, instantly reflecting changes in the browser
- Only run `make build` to check if build is ok

The Makefile provides a simple interface to Zola commands, ensuring consistent usage across different environments.
