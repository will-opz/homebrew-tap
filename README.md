# Homebrew Tap — will-opz

Personal Homebrew formulae for open-source CLI tools maintained by [will-opz](https://github.com/will-opz).

## Install NetKit

```sh
brew install will-opz/tap/netkit
netkit -h
netkit dns list
```

Or register the tap first:

```sh
brew tap will-opz/tap
brew install netkit
```

To update an installed tool after a new formula version is published:

```sh
brew update
brew upgrade will-opz/tap/netkit
```

For testing the development branch, the formula also includes a `head` source:

```sh
brew install --HEAD will-opz/tap/netkit
```

## Releases and versioning

- The initial NetKit formula is a **pinned source snapshot**, compiled with Homebrew's Go build dependency; it is *not* a prebuilt binary or an upstream GitHub Release.
- The snapshot version is maintained in `Formula/netkit.rb`. The source commit is immutable. The formula's version must be bumped for future upgrades; `brew upgrade` will not automatically follow every upstream commit.
- When NetKit publishes versioned tags and release archives, switch to a stable archive URL and verified SHA256 or immutable Git tag+revision.
- New tools belong in separate `Formula/<tool>.rb` files. Each formula should be reviewed, tested and pinned to a specific release.
- Go is a build dependency for the source formula, not required to run the compiled executable.

This tap is not affiliated with Homebrew. Only install formulae you trust.

## Contributing

Before publishing a formula change, run `brew audit --strict will-opz/tap/netkit`, `brew test will-opz/tap/netkit` and, for new installations, `brew install --build-from-source will-opz/tap/netkit`.

## Projects

- [NetKit](https://github.com/will-opz/netkit) — local IP, DNS, and domain diagnostics.
