# Homebrew Tap

Custom Homebrew tap for mkusaka's applications.

## Usage

```bash
brew tap mkusaka/tap
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `ccost` | Claude Code, Codex, and OpenCode usage cost reporter |
| `gtk` | BYO-credentials Google Tasks CLI |
| `tk` | Standalone Rust CLI for persistent structured task lists |

### Install Formulae

```bash
brew install mkusaka/tap/ccost
brew install mkusaka/tap/gtk
brew install mkusaka/tap/tk
```

Tagged releases publish bottles for Apple Silicon and Intel Macs on macOS
Sequoia 15 and Tahoe 26. Until the first tagged release is published, or on
unsupported platforms, you can install from `HEAD`:

```bash
brew install --HEAD mkusaka/tap/ccost
brew install --HEAD mkusaka/tap/gtk
brew install --HEAD mkusaka/tap/tk
```

## Available Casks

| Cask | Description |
|------|-------------|
| `keyglass` | macOS menu bar utility for visualizing keyboard and mouse input |
| `keypunch` | macOS menu bar app that launches applications via global keyboard shortcuts |
| `tabora` | macOS window switcher with window-level previews and keyboard navigation |

### Install Casks

```bash
brew install --cask mkusaka/tap/keyglass
brew install --cask mkusaka/tap/keypunch
brew install --cask mkusaka/tap/tabora
```

### Uninstall

```bash
brew uninstall ccost
brew uninstall gtk
brew uninstall tk
brew uninstall --cask keyglass
brew uninstall --cask keypunch
brew uninstall --cask tabora
```
