class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.3.tar.gz"
  version "0.1.2"
  sha256 "853a1820c1f91945a78193d5bd3db89f6e46e73fce8f22491e8e79f8e31fec3f"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.2"
    sha256 arm64_tahoe: "0000000000000000000000000000000000000000000000000000000000000000"
    sha256 tahoe: "0000000000000000000000000000000000000000000000000000000000000000"
    sha256 arm64_sequoia: "18d2637995b14e659c2934fe6ef0a57af058cbf1e70d223c6285569a5b0df85b"
    sha256 sequoia: "b89472bb10f921ec8a447f455112319ba6c5f55b395ddf2efb11ceddc6d1d718"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
