# homebrew-tap

Homebrew tap for the command-line tools of [denrou](https://github.com/denrou).

| Tool                                       | What it does                                                                      | Install                          |
| ------------------------------------------ | --------------------------------------------------------------------------------- | -------------------------------- |
| [slack](https://github.com/denrou/slack)   | Shows the Slack messages waiting for you in the terminal and lets you answer them | `brew install denrou/tap/slack`  |
| [gh-prs](https://github.com/denrou/gh-prs) | Lists the GitHub pull requests that need your attention                           | `brew install denrou/tap/gh-prs` |
| [ggit](https://github.com/denrou/ggit)     | Scans directories for git repositories and shows their status in a TUI            | `brew install denrou/tap/ggit`   |

slack installs the binary of its latest [release](https://github.com/denrou/slack/releases): macOS on Apple Silicon and Linux on x86_64, the two targets the release builds. `brew upgrade` follows the releases of every tool.

## Coming from denrou/slack, denrou/gh-prs or denrou/ggit

Each tool had its own tap until October 2026. Those taps now point here, so `brew update` moves an installed formula over by itself. The old taps can then go:

```bash
brew untap denrou/slack denrou/gh-prs denrou/ggit
```

## How the formulas stay current

The [Update Formula](.github/workflows/update-formula.yml) workflow moves one formula to the latest release of its tool, checks it with brew and commits it. The release workflow of each tool dispatches it; by hand:

```bash
gh workflow run update-formula.yml --repo denrou/homebrew-tap -f formula=ggit
```

- **slack**: `scripts/update-slack` rewrites the formula from the `checksums.txt` published with the release (`-f version=0.8.0` for a given one), and the run installs and tests it on macOS.
- **gh-prs** and **ggit**: the formula points at the PyPI sdist, and `brew update-python-resources` regenerates its dependencies.
