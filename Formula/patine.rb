class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "263d7a4c809a70a09b58dfda445faf3b3a65beab9a8595221477ae36a76db948"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-1.9.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f27db7cee8da6c04d71679c00520d978d05cf0b045066ad3dd4d5b8909dde126"
    sha256 cellar: :any,                 x86_64_linux: "6e948ca039e0445b37e80f3c50856814c0c6620ecacc9e19c7d9565e35e9385e"
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
