class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.17.1.tar.gz"
  sha256 "3c043e7e7be663d7076588e06ca84b2e507be9d98a6bc8d063a75976ccdc395b"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.17.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a9f140bb0ebbe1195ee3aabd931e25d30f6ca8b4064c9ee55752016cfd1d9828"
    sha256 cellar: :any,                 x86_64_linux: "5e96efe8e74069854f83cad065d45de5bb290da69c10e5bb516be65d092e8f7c"
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
