# FSD42 Golang Dev Container Feature

## Overview

The FSD42 Golang Dev Container Feature is a development environment setup for Golang projects. It provides a pre-configured container with essential tools and extensions for Go development, making it easy to start coding right away.

## Features

- Golang installation (configurable version)
- Node.js installation (configurable version)
- Zsh and Oh My Zsh (optional)
- GitHub CLI
- Go Task
- VS Code extensions for Go development

## Usage

To use this feature in your dev container, add the following to your `devcontainer.json` file:

```json
"features": {
  "ghcr.io/fullstackdev42/fsd42-go:1": {
    "goVersion": "1.23",
    "nodeVersion": "lts",
    "installZsh": true
  }
}
```

## Options

| Option | Default | Description |
|--------|---------|-------------|
| `goVersion` | "1.23" | Golang version to install. Options: "1.23", "latest" |
| `nodeVersion` | "lts" | Node.js version to install. Options: "lts", "latest" |
| `installZsh` | true | Whether to install and configure Zsh |

## What's Included

- Golang (specified version)
- Node.js (specified version)
- Zsh and Oh My Zsh (if enabled)
- GitHub CLI
- Go Task
- VS Code extensions:
  - golang.Go
  - ms-azuretools.vscode-docker
  - jinliming2.vscode-go-template

## Customization

You can customize the feature by modifying the options in your `devcontainer.json` file. For example, to use the latest Go version and disable Zsh installation:

```json
"features": {
  "ghcr.io/your-repo/fsd42-go:1": {
    "goVersion": "latest",
    "nodeVersion": "lts",
    "installZsh": false
  }
}
```

## Contributing

Contributions to improve the FSD42 Golang Dev Container Feature are welcome. Please feel free to submit issues or pull requests on our GitHub repository.

## License

[MIT License](LICENSE)

## Support

If you encounter any problems or have any questions, please open an issue on the GitHub repository.
