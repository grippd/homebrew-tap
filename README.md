# homebrew-tap

Public. The Homebrew formula for the `grippd` CLI, and the CLI's release downloads.

```sh
brew install grippd/tap/grippd
```

Homebrew requires a repo named `homebrew-*`; `grippd/tap` is short for `grippd/homebrew-tap`.

## How it's updated

Nothing here is edited by hand. Pushing a `cli-v<version>` tag in the grippd monorepo runs its release workflow (`.github/workflows/release.yml`), which:

1. builds `grippd` for macOS (arm64, x86_64), Linux (arm64, x86_64, static musl) and Windows (x86_64);
2. publishes them, with `SHA256SUMS`, as a GitHub release **in this repo**, because the monorepo is private and its release assets can't be downloaded;
3. writes the version and the four macOS and Linux checksums into `Formula/grippd.rb` and commits it here.

`curl -fsSL https://grippd.sh/install | sh` downloads from the same releases.

`Formula/grippd.rb` is a template until the first release: version `0.0.0` and placeholder checksums. The release rewrites only the `version` line and the lines ending `# <target>`, so keep those markers if you change the formula's shape (in a pull request to the monorepo's `update-formula.sh` too).

## Access

The release workflow pushes with a GitHub App installed on this repo only, with Contents read and write. Each release mints a one-hour token for it; there's no long-lived key.
