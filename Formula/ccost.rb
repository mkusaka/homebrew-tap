class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.2.tar.gz"
  version "0.1.2"
  sha256 "188c3505550ca9fd275a8509d080d7a165a3b7619bb1843ed4c4ba1f8e475192"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.2"
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
