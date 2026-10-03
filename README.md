# homebrew-tap

My [Homebrew tap](https://docs.brew.sh/Taps): casks and formulae for
my apps and command-line tools, most of them listed on
[westhoffswelt.de/projects](https://westhoffswelt.de/projects).

They live here rather than in Homebrew's own repositories, which only
take projects past a certain popularity
([acceptance policy](https://docs.brew.sh/Package-Acceptance-Policy)).

## Packages

| Package | Install |
|---|---|
| [Torchsnap](https://torchsnap.app/), a keyboard-driven launcher (cask) | `brew install --cask jakobwesthoff/tap/torchsnap` |

Homebrew taps the repository on first use.

## How updates work

The workflows are based on the ones `brew tap-new` generates:

- `autobump.yml` checks every package for a new version once a day, or
  when started by hand, and opens a pull request for each one it finds.
- `tests.yml` tests every pull request and builds
  [bottles](https://docs.brew.sh/Bottles) of the formulae it changes.
- `publish.yml` publishes a tested pull request that changes formulae
  when started by hand with its number: it uploads the bottles to a
  release of this repository and pushes the change to `main`.
- Pull requests that only change casks have no bottles. Merge them on
  GitHub once their tests pass.
- Dependabot keeps the actions up to date.

## References

- [Taps](https://docs.brew.sh/Taps)
- [How to create and maintain a tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Cask cookbook](https://docs.brew.sh/Cask-Cookbook)
- [Formula cookbook](https://docs.brew.sh/Formula-Cookbook)
