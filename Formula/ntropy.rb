class Ntropy < Formula
  desc "Markdown notes with a query language and no database"
  homepage "https://ntropy.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/ntropy/archive/refs/tags/v2.4.1.tar.gz"
  sha256 "3f444bcacd4b9dad81c5708a237abdd50a2f76fbfda52b8f2451b0d3a4b3943f"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/ntropy.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/ntropy-2.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "67e09d8dc2ce9c4dd26c4987581a4c0c7f28920f1352fca6184f99246ef97cbb"
    sha256 cellar: :any,                 x86_64_linux: "9422fa5d3e1a3f1cf38a7a3ef9ce42fdace16fc0ff012d7af2f12212e4f63066"
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
