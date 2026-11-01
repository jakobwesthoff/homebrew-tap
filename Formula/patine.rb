class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v2.2.1.tar.gz"
  sha256 "5f9bc92f04079b20a23465f88cc8b4cc5158c390059148b4b0609382fb380a5e"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-2.2.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d8a18facbbf64de073f7f41e3cc2342f542e11a4d78b9d308aab9333f8ae36e1"
    sha256 cellar: :any,                 x86_64_linux: "5853bd3458f3ca57528880fcea399949efbeead55b196d2aee41faf9eeda952e"
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
