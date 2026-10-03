class Blendwerk < Formula
  desc "File-based HTTP and HTTPS API mock server"
  homepage "https://blendwerk.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/blendwerk/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "7b3991d75f16e20feda34110c3155a35686b019404b318d73259260c631ba181"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/blendwerk.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blendwerk --version")
  end
end
