class Patine < Formula
  desc "Render Markdown in the terminal"
  homepage "https://github.com/jakobwesthoff/patine"
  url "https://github.com/jakobwesthoff/patine/archive/refs/tags/v1.7.2.tar.gz"
  sha256 "685fb728dbc29affab7e57a5866e25ef94771d8a5b6af46878a6786e1c7f98f4"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/patine.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/patine-1.7.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "cb82b76fa777572432e44f1f46da4a7d8b00c9cd4099d08de5d2a65ea5b2ca0f"
    sha256 cellar: :any,                 x86_64_linux: "9cb491bd146970ed170c669eddf5204dbf06a509f5a4b3dd6a3498289e47cb84"
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
