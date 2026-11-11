# xtermium for Homebrew

A [Homebrew](https://brew.sh) tap for [xtermium](https://xtermium.com), the terminal with a session manager, on macOS (one app for Apple silicon and Intel).

```sh
brew tap xtermium/tap
brew trust xtermium/tap
brew install --cask xtermium
```

`brew trust` is Homebrew's own step for a tap that isn't one of its own: it refuses to load a cask from one until you say you trust it.

The cask also links the `xtermium` command line (`xtermium help`).

## Your data

Sessions, tabs, trusted host keys and settings live in `~/.xtermium` (or wherever `XTERMIUM_HOME` points), so `brew upgrade` and reinstalls keep them. `brew uninstall --zap xtermium` deletes `~/.xtermium` with the rest; plain `brew uninstall` leaves it. The key that opens the files stays in the login keychain either way.

## Nightly builds

`xtermium@nightly` is main as it stands, built every night it has changed: what the next release will carry, before it has been used for long. It takes the release's place and opens the same data, so keep a backup you trust (Settings › Import and export › Back up everything…).

```sh
brew uninstall --cask xtermium        # the release, if it is installed: your data stays
brew install --cask xtermium@nightly
brew upgrade --cask xtermium@nightly  # the latest night's build (close xtermium first)
```

- Each nightly build gets its own version, its build time (`20261110.035328`), and its hash: the [bump workflow](.github/workflows/bump.yml) picks up a new one within the hour.
- Installing in the hour between a new build and the bump fails on the hash: wait for the bump.
- Back to the release: `brew uninstall --cask xtermium@nightly`, then `brew install --cask xtermium`.

## Builds that are not notarized

These casks are written for a build signed with a Developer ID and notarized by Apple. Until a release is, macOS refuses to open it ("xtermium is damaged" or "cannot be opened"). After installing, clear the quarantine flag once per install or upgrade:

```sh
xattr -dr com.apple.quarantine /Applications/xtermium.app
```

New releases and nightly builds reach the tap on their own: the bump workflow checks every hour.
