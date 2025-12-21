# Site Generation

This site uses a Make-based workflow to manage Zola commands.

## Available Commands

- `make build`: Build the site to the `public/` directory
- `make serve`: Start a local development server with hot reloading
- `make clean`: Remove the `public/` directory

## Workflow

During development, use `make serve` to start a local server that automatically rebuilds the site and refreshes the browser when files change.

To stop the server, press `Ctrl+C` in the terminal where it's running.

For production builds, use `make build` to generate the static files in the `public/` directory for deployment.

The Makefile provides a simple interface to Zola commands, ensuring consistent usage across different environments.