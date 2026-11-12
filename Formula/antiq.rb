class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "de4e8a6edef01394ff4788ddec3509fb1df8fb5fe1f5b0fd0ad325810909c7eb"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/antiq-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c4c234feec7d68af03b80ee3db782cd07dc0e11ca4cdeea37f4004412c3690d5"
    sha256 cellar: :any,                 x86_64_linux: "49c7edb69395979e6ba5004269241a3cba7475799d9880be89b514bda0bf268f"
  end

  depends_on "rust" => :build
  # `antiq push` needs rsync 3.2.4 or newer and passes over the openrsync
  # that macOS ships.
  depends_on "rsync"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/antiq --version")
    assert_match "Your idle folders", shell_output("#{bin}/antiq --help")
  end
end
