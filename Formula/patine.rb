class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "6d3810d8749095dacebcd1440a57aac03dfd5eb53d6a2544f281537e29356dd1"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-2.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "31f2c83cf76b900f63989e26e1ce53e3e88621ae66d9e5ad4c5b40cc11e5b099"
    sha256 cellar: :any,                 x86_64_linux: "f44b211512d4fb325058857428df14cc6fda48f6b3d7d5e082630f5c3581c193"
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
