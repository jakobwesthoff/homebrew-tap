class Ntropy < Formula
  desc "Markdown notes with a query language and no database"
  homepage "https://ntropy.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/ntropy/archive/refs/tags/v2.14.1.tar.gz"
  sha256 "b34a7d183aa188f84daa59816e735c3ae80d2fd5b53a5f79f3c8dcc5b29efeef"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/ntropy.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/ntropy-2.14.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6f82431b4524ba06dc74a4654089604b95c210fd8f25cb9f397dc598c39d214d"
    sha256 cellar: :any,                 x86_64_linux: "8f75ff81f8e6d7bfa7ed17e48432b7512b9394b76210087f8ea8cc1c3629efd0"
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
