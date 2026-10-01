class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.38.tar.gz"
  version "0.1.38"
  sha256 "5aee203fd5fb2ee0a485100f50f4bfae4619f3963ca502825dd093d0093de3d6"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.38"
    sha256 arm64_tahoe:   "4ed3f593ef150de51ec16e6c46ca7ba82d3e6563b0dd7030d08154257029a3fb"
    sha256 tahoe:         "ac5eb5564cc361e14d108d3cc18765406ec2bcdcb116afd7a445b2094169614d"
    sha256 arm64_sequoia: "c41623cf8bed8f9bbe9567e08d9d77721e41f8389691da8dfb73290bbd830058"
    sha256 sequoia:       "7dcf43cea2d0831cbdd8089217bf49a84cc29ad9943b38f63639653d3b4c37b9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
