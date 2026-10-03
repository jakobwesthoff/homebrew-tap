class Ntropy < Formula
  desc "Markdown notes with a query language and no database"
  homepage "https://ntropy.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/ntropy/archive/refs/tags/v2.1.1.tar.gz"
  sha256 "803e411b241da6323a28c8d58429861e103b2c610a8e97fc463f903e9f19a16f"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/ntropy.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/ntropy-2.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "495d387a5f9940b92eb262a66f25deb7a8457c8876abaf88d503a4d51008a218"
    sha256 cellar: :any,                 x86_64_linux: "81b7895fadee77081c355847ae43287f5a62a4b4a265e987787905f1a13b83b5"
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
