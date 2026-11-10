# Stephen's Dotfiles

macOS dotfiles managed with [chezmoi](https://www.chezmoi.io), Homebrew Bundle
and [mise](https://mise.jdx.dev). Fish is the main shell; zsh stays usable as
macOS's default.

There are two machine profiles, picked once when a machine is set up:

- **laptop**: the MacBook Pro. Gets everything, including GUI apps, Android and
  mobile tooling, Hammerspoon, Ghostty config and macOS settings.
- **devbox**: the headless Mac mini. Gets the shells, CLI tools and agents,
  plus Tailscale, SSH and power settings.

## Set up a new Mac

```sh
xcode-select --install   # git and compilers; wait for it to finish

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin \
  init --apply --source ~/Dev/github.com/stephenlaughton/dotfiles stephenlaughton
```

That clones this repo to `~/Dev/github.com/stephenlaughton/dotfiles`, asks
whether the machine is a laptop or a devbox, links the dotfiles, and runs the
setup scripts: Homebrew, `brew bundle`, `mise install`, Fisher plugins,
Claude Code, then the macOS settings (laptop) or the devbox setup. The repo is
public, so nothing needs a login until you run `gh auth login` afterwards.

Then:

- Run `tide configure` in fish to set up the prompt.
- **Devbox:** run `sudo tailscale up --ssh` to join the tailnet. If the script
  couldn't turn on Remote Login, switch it on in System Settings > General >
  Sharing. On macOS 26 Tahoe, Remote Login also lets you unlock FileVault over
  SSH after a reboot.

## Status (2026-11-10)

Not adopted yet: this branch isn't applied to either Mac, and Stephen isn't ready to switch. Still to sort out when he does:

- **proto** still manages Node, Bun, Deno and Yarn on the Macs today (`~/.proto`, set up in the old fish and zsh configs), and the Billie monorepo pins its versions in `.prototools`. Moving the monorepo to a `mise.toml` is a separate change in that repo.
- Global npm installs currently live in proto's `~/.proto/tools/node/globals` (eas-cli and codex). Remove them once mise provides the same CLIs.
- The `minimum_release_age` cooldown in the mise config needs a newer mise than the one installed.

## Day to day

Most files in `~` are symlinks into this repo, as with the old `link.sh`, so
editing `~/.zshrc` edits the repo. Commit and push from here as usual.

| Task | Command |
|---|---|
| See what would change | `chezmoi diff` |
| Apply the repo to `~` (also reruns setup scripts whose inputs changed) | `chezmoi apply` |
| Pull the latest and apply | `chezmoi update` |
| Start managing a new file | `chezmoi add ~/.config/foo/bar.toml` |
| Add a Homebrew package | edit `Brewfile` (or `Brewfile.laptop` / `Brewfile.devbox`), then `chezmoi apply` |
| Add a global tool version | `mise use -g node@24` (writes to the repo's mise config) |

## Layout

```
Brewfile                 Homebrew packages for every machine
Brewfile.laptop          GUI apps, mobile tooling, VS Code extensions
Brewfile.devbox          Tailscale daemon, Docker CLI
extras/                  App exports (Raycast, iStat, Stats, Terminal, iTerm); not applied
home/                    What chezmoi puts in ~ (set by .chezmoiroot)
  .chezmoi.toml.tmpl       asks for the machine profile on `chezmoi init`
  .chezmoiignore           files the devbox skips
  .chezmoiexternal.toml    base16-shell, cloned into ~/.config/base16-shell
  .chezmoiscripts/         setup scripts (Homebrew, bundle, mise, fisher, macOS, devbox)
  dot_zshenv, dot_zshrc    -> ~/.zshenv, ~/.zshrc, and so on
  private_dot_config/      -> ~/.config (fish, zsh, mise)
  private_Library/         -> ~/Library (Ghostty config)
```

chezmoi's file naming: `dot_` becomes a leading `.`; `private_` keeps a folder
readable only by you; files ending `.tmpl` are templates.

Shell setup:

- `~/.zshenv` holds the PATH setup (Homebrew, mise shims, `~/.local/bin`). zsh
  reads it even for non-interactive commands like `ssh mini some-command`, so
  remote tools find everything.
- `laptop.fish` and `laptop.zsh` hold the laptop-only parts: Android, the
  `pixel` adb helper, LocalAI, and VS Code as the editor.
