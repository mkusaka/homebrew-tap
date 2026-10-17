# Homebrew Tap

Custom Homebrew tap for mkusaka's applications.

## Usage

```bash
brew tap mkusaka/tap
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `cas` | Recursively sync Claude agent files to Codex-compatible paths |
| `ccost` | Claude Code, Codex, and OpenCode usage cost reporter |
| `cxtools` | MCP server exposing OpenAI Codex tools by calling the codex-rs crates in-process |
| `ghok` | Transparent GitHub CLI wrapper with pre/post hooks and operation normalization |
| `gtk` | BYO-credentials Google Tasks CLI |
| `it2ag` | iTerm2 agent monitor for Claude Code and Codex |
| `pbm` | Deterministic macOS desktop automation CLI and MCP server |
| `tk` | Standalone Rust CLI for persistent structured task lists |
| `xfer` | Prepare a bounded session handoff for another coding agent |

### Install Formulae

```bash
brew install mkusaka/tap/cas
brew install mkusaka/tap/ccost
brew install mkusaka/tap/cxtools
brew install mkusaka/tap/ghok
brew install mkusaka/tap/gtk
brew install mkusaka/tap/it2ag
brew install mkusaka/tap/pbm
brew install mkusaka/tap/tk
brew install mkusaka/tap/xfer
```

Tagged releases publish bottles for Apple Silicon and Intel Macs on macOS
Sequoia 15 and Tahoe 26. Until the first tagged release is published, or on
unsupported platforms, you can install from `HEAD`. `ghok`, `it2ag` and `xfer`
install prebuilt release binaries instead (`ghok` for macOS and Linux, `it2ag` and
`xfer` for macOS) and have no `HEAD` build. The others:

```bash
brew install --HEAD mkusaka/tap/cas
brew install --HEAD mkusaka/tap/ccost
brew install --HEAD mkusaka/tap/cxtools
brew install --HEAD mkusaka/tap/gtk
brew install --HEAD mkusaka/tap/pbm
brew install --HEAD mkusaka/tap/tk
```

## Available Casks

| Cask | Description |
|------|-------------|
| `cmod` | macOS menu bar app for Command-key input switching |
| `joblet` | Manage launchd LaunchAgents (scheduled jobs) with an MCP server for AI agents |
| `keyglass` | macOS menu bar utility for visualizing keyboard and mouse input |
| `keypunch` | macOS menu bar app that launches applications via global keyboard shortcuts |
| `tabora` | macOS window switcher with window-level previews and keyboard navigation |

### Install Casks

```bash
brew install --cask mkusaka/tap/cmod
brew install --cask mkusaka/tap/joblet
brew install --cask mkusaka/tap/keyglass
brew install --cask mkusaka/tap/keypunch
brew install --cask mkusaka/tap/tabora
```

### Uninstall

```bash
brew uninstall cas
brew uninstall ccost
brew uninstall cxtools
brew uninstall ghok
brew uninstall gtk
brew uninstall it2ag
brew uninstall pbm
brew uninstall tk
brew uninstall xfer
brew uninstall --cask cmod
brew uninstall --cask joblet
brew uninstall --cask keyglass
brew uninstall --cask keypunch
brew uninstall --cask tabora
```
