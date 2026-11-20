class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.19.0.tar.gz"
  sha256 "96f05f43da38f75ffdf9e354a1d4565b2247c00e56261242aff3296ecf1facf5"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.18.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ae2302ae25fe71f18a5b6250b43ec80897d6230dba80ba7f8fa939f0d8573a17"
    sha256 cellar: :any,                 x86_64_linux: "f27385e590b662a9dde4b8d6b5da7ebf1bec869f2676a360bd3efac53e6f7d24"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asqr --version")
    (testpath/"session.json").write shell_output("#{bin}/asqr new")
    assert_match "valid", shell_output("#{bin}/asqr validate #{testpath}/session.json")
  end
end
