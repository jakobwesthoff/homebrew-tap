class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "1cf6d79be342ffb865bbe2091d4fc7fc22b163f874f438160c997af43dd3b469"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "adb3a7fade6d8f3dfc0f9257c1f31cc31232944b1d75a1ffff7854b4135bb5f1"
    sha256 cellar: :any,                 x86_64_linux: "c04525f3073ccfc0dd0c295565ad8056bc856876224a404fe13c4ac1088c03e1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patine --version")
    (testpath/"hello.md").write "Hello world\n"
    assert_match "Hello world", shell_output("#{bin}/patine #{testpath}/hello.md")
  end
end
