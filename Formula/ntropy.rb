class Ntropy < Formula
  desc "Markdown notes with a query language and no database"
  homepage "https://ntropy.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/ntropy/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "a7b77d4740ffed4c8677fe4140c79b566f32e2989e52e9dd4d7f6004f59501a6"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/ntropy.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/ntropy-2.7.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "cba03774cb1d7f331fd838cd68ad1bc0a4a7ce00f65846fe6f67ec96e9b20bb9"
    sha256 cellar: :any,                 x86_64_linux: "032d717cd1b4ff31b46c87af2b10d1b1bcc4f1e7a25abb3df6f623b1e02823d4"
  end

  depends_on "rust" => :build
  # PDF export renders through the typst binary on PATH.
  depends_on "typst"

  def install
    system "cargo", "install", *std_cargo_args
    pkgshare.install "contrib/shell/ntropy.sh"
  end

  def caveats
    <<~EOS
      To use `ncd`, which changes into the active vault, add this line to
      your ~/.zshrc or ~/.bashrc:
        source #{opt_pkgshare}/ntropy.sh
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ntropy --version")
    system bin/"ntropy", "init", testpath/"vault"
    output = shell_output("#{bin}/ntropy --vault #{testpath}/vault new --print 'My First Note'")
    assert_match(/-my-first-note\.md$/, output)
  end
end
