# Devcontainer with Devbox

[![Build and deploy](https://github.com/sambyeol/devbox-devcontainer/actions/workflows/build-and-deploy.yml/badge.svg)](https://github.com/sambyeol/devbox-devcontainer/actions/workflows/build-and-deploy.yml)

Pre-installed [`devbox`](https://github.com/jetpack-io/devbox) for devcontainer.
You can find the images in `ghcr.io/sambyeol/devbox-devcontainer`.

## Quickstart
Make a devcontainer setting file at `.devcontainer/devcontainer.json` in your project.
```json
{
    "image": "ghcr.io/sambyeol/devbox-devcontainer",
    "overrideCommand": false,
	"postCreateCommand": "devbox install"
}
```
Then, reopen in container.