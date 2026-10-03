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
| [blendwerk](https://blendwerk.westhoffswelt.de), a file-based HTTP and HTTPS API mock server | `brew install jakobwesthoff/tap/blendwerk` |
| [jlif](https://jlif.westhoffswelt.de), a formatter and filter for multi-object JSON logs in streaming input | `brew install jakobwesthoff/tap/jlif` |
| [mkulid](https://github.com/jakobwesthoff/mkulid), a ULID generator like `uuidgen` | `brew install jakobwesthoff/tap/mkulid` |
| [ntropy](https://ntropy.westhoffswelt.de), a Markdown note manager with a query language and no database | `brew install jakobwesthoff/tap/ntropy` |
| [patine](https://github.com/jakobwesthoff/patine), a Markdown renderer for the terminal | `brew install jakobwesthoff/tap/patine` |
| [podpull](https://podpull.westhoffswelt.de), a podcast downloader that syncs RSS feeds | `brew install jakobwesthoff/tap/podpull` |

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
- `publish-notice.yml` puts the way to publish at the top of every new
  pull request's description (see [Publishing a pull
  request](#publishing-a-pull-request)).
- Dependabot keeps the actions up to date.

## References

- [Taps](https://docs.brew.sh/Taps)
- [How to create and maintain a tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Cask cookbook](https://docs.brew.sh/Cask-Cookbook)
- [Formula cookbook](https://docs.brew.sh/Formula-Cookbook)

## Publishing a pull request

How a pull request gets published depends on what it changes. Each new
pull request starts with a notice saying which case applies.

> [!IMPORTANT]
> **Pull requests that change formulae: do not use the merge button.**
> Once the tests pass, run the
> [brew pr-pull workflow](https://github.com/jakobwesthoff/homebrew-tap/actions/workflows/publish.yml)
> with the pull request's number:
>
> ```
> gh workflow run publish.yml -R jakobwesthoff/homebrew-tap -f pull_request=<number>
> ```
>
> It uploads the bottles to a release of this repository, writes their
> hashes into the formula, pushes to `main` and closes the pull request.
> Merged with the button, the formula reaches `main` without bottles and
> every install compiles from source.

> [!NOTE]
> **Pull requests that only change casks: use the merge button** once
> the tests pass. Casks have no bottles to publish.

> [!WARNING]
> The daily bump opens its pull requests with the repository secret
> `HOMEBREW_TAP_BUMP_TOKEN`, a fine-grained token limited to this
> repository (Contents and Pull requests: read and write). When it
> expires, the bump workflow fails. Create a new token and replace the
> secret.
