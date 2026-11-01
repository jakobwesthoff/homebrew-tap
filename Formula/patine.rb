class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v2.2.1.tar.gz"
  sha256 "5f9bc92f04079b20a23465f88cc8b4cc5158c390059148b4b0609382fb380a5e"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-2.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c8fa723dd3659aee504655afe65a7a519e5684fafa3d57a3c94197fdd901c85e"
    sha256 cellar: :any,                 x86_64_linux: "0f106e6192f0d2f736650bfdd690781383775a8143ab3501df509f7e518c7585"
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
