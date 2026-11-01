class Ntropy < Formula
  desc "Markdown notes with a query language and no database"
  homepage "https://ntropy.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/ntropy/archive/refs/tags/v2.10.0.tar.gz"
  sha256 "7cc819f4c5f4ecc367e016d9eeb647b276e711bb90935f48ae29d198552a1ff9"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/ntropy.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/ntropy-2.9.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ec1c3fa2dc1c5cdaa6c29a7e89401c3bcd250f411b09ab672b7f1e9c2c59281b"
    sha256 cellar: :any,                 x86_64_linux: "e65c03dd5e5cb0c9e79a893fba2ddfcf45d5b7a43e41f694072e22999a18b278"
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
