class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "263d7a4c809a70a09b58dfda445faf3b3a65beab9a8595221477ae36a76db948"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-1.8.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4def001994633974e2bd94cfa4756a3b0be63f9a09382ccbd69ada43b0553791"
    sha256 cellar: :any,                 x86_64_linux: "881b641dffee10020c3422632f91d7bfb0714bb34f51c85f2ff766af2f7ddd00"
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
