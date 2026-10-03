class Mkulid < Formula
  desc "ULID generator, like uuidgen but for ULIDs"
  homepage "https://github.com/jakobwesthoff/mkulid"
  url "https://github.com/jakobwesthoff/mkulid/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "05bb916b040ea149867190638cadfa4296e1fefa8a7fba19b4dc7da4d5239c9e"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/mkulid.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mkulid --version")
    # A ULID starts with its 48-bit millisecond timestamp, so the Unix epoch
    # gives ten zeros followed by 16 random Crockford base32 characters.
    assert_match(/\A0{10}[0-9A-HJKMNP-TV-Z]{16}\n\z/, shell_output("#{bin}/mkulid --timestamp 0"))
  end
end
