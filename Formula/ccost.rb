class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.8.tar.gz"
  version "0.1.8"
  sha256 "faedcb71323499d14abd349814315fb3dd7fd9869a9388e932025ed853175c61"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.8"
    sha256 arm64_tahoe: "40f60af7af5ba3d7aca5367ac4c4b277b59f69a70ca2592b7fcc25a76d7f1b53"
    sha256 tahoe: "a078c3840923f32f62fbe05f86f0b524adb50a73256d514c8f3b384ca6330f54"
    sha256 arm64_sequoia: "8aa105a428b3e437ef3c885cf7b7e9cab2c160d4789b093c79fad61b5149ad3d"
    sha256 sequoia: "bc0c1483fd45514e71012f7db07c4448dc780d93b18ff24cb5fd2180d74f98a5"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
