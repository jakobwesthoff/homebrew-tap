class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "8c135a6cbac322718a9998bc8f02eef7caf723450c48e0c25c70486fffc79446"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-2.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4d9a3fe3c01c6f49c957f2f9b2820dd276bef5a6c63ae5300ce6dee05e0a4760"
    sha256 cellar: :any,                 x86_64_linux: "64c6d65f0f4eb72c2f5a12625ae5d61a01cf67cfdb6ccbc361adf3c7fc655422"
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
