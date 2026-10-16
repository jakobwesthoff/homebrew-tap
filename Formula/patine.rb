class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v1.7.2.tar.gz"
  sha256 "685fb728dbc29affab7e57a5866e25ef94771d8a5b6af46878a6786e1c7f98f4"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8096f0e1258be1e42c3f9a352c641dfd66436fcf6255a79c62f2fecc0e64b5a2"
    sha256 cellar: :any,                 x86_64_linux: "9aaf71d4ef025c4c7a47f19df47439f9d336a60f04eab7741a0a02fd721f0881"
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
