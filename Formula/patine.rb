class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v2.2.2.tar.gz"
  sha256 "22d097570ac7351b74c6c2965edf6acc5db1c6f6a85677531e83853b5a624cee"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-2.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "115ce05ca14fcf86e58ccecfed3618ff02a06eee4e98dc4f8bd8078b241d0f41"
    sha256 cellar: :any,                 x86_64_linux: "143e06b5c93b7b17c09820e4c8c282b1e7e1618b6add995bc8ea5743dddaede4"
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
