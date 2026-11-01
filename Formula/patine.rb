class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v2.2.3.tar.gz"
  sha256 "a90669197a1e0835cd3de292fc9d4198c2a361793606643b2381248a1851e11f"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-2.2.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "607fbf6d305d08493312fb78a5fbeb0a7b035f283fc93ea9b9df8398c09a4f2b"
    sha256 cellar: :any,                 x86_64_linux: "0749ba45e56291720f793e20de7a711d302cc168b04ad29d571b01ce726a37f2"
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
