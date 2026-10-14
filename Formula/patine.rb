class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "baf72fb3666f9181483b38859bacc8fb5f2910536391b900e2bbec535ff3b597"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "751b0deb0ade415050a2b792d94b22f63ff43259f1ec491a04f8117cd416bcec"
    sha256 cellar: :any,                 x86_64_linux: "397adb0587e6f84d1f52ef8b78de312aa07478c89861aeedd7862d8e9658974a"
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
