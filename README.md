# homebrew-tap

Homebrew tap for the command-line tools of [denrou](https://github.com/denrou).

| Tool                                       | What it does                                                                      | Install                          |
| ------------------------------------------ | --------------------------------------------------------------------------------- | -------------------------------- |
| [slack](https://github.com/denrou/slack)   | Shows the Slack messages waiting for you in the terminal and lets you answer them | `brew install denrou/tap/slack`  |
| [gh-prs](https://github.com/denrou/gh-prs) | Lists the GitHub pull requests (`gh-prs`) and issues (`gh-issues`) that need you  | `brew install denrou/tap/gh-prs` |
| [ggit](https://github.com/denrou/ggit)     | Scans directories for git repositories and shows their status in a TUI            | `brew install denrou/tap/ggit`   |

Homebrew loads the formulas of a third-party tap only once it is trusted, so the first time:

```bash
brew tap denrou/tap
brew trust denrou/tap
```

slack and gh-prs install the binary of their latest release ([slack](https://github.com/denrou/slack/releases), [gh-prs](https://github.com/denrou/gh-prs/releases)): macOS on Apple Silicon and Linux on x86_64, the two targets their releases build. `brew upgrade` follows the releases of every tool.

## Coming from denrou/slack, denrou/gh-prs or denrou/ggit

Each tool had its own tap until October 2026. Those taps point here through `tap_migrations.json`, but Homebrew does not tap an untrusted tap by itself, so `brew update` only warns about the move. Once this tap is tapped and trusted as above, reinstall from it the tools you have, then drop the old taps:

```bash
brew reinstall denrou/tap/slack denrou/tap/gh-prs denrou/tap/ggit
brew untap denrou/slack denrou/gh-prs denrou/ggit
```

## How the formulas stay current

The [Update Formula](.github/workflows/update-formula.yml) workflow moves one formula to the latest release of its tool, checks it with brew and commits it. The release workflow of each tool dispatches it; by hand:

```bash
gh workflow run update-formula.yml --repo denrou/homebrew-tap -f formula=ggit
```

- **slack** and **gh-prs**: `scripts/update-binary` rewrites the formula from the `checksums.txt` published with the release (`-f version=0.8.0` for a given one), and the run installs and tests it on macOS. The gh-prs formula installs two binaries, `gh-prs` and `gh-issues`, which one release of its workspace ships together.
- **ggit**: the formula points at the PyPI sdist, and `brew update-python-resources` regenerates its dependencies. gh-prs did the same up to 0.18.1, its last Python release.
