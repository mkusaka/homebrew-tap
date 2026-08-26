class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.26.tar.gz"
  version "0.1.26"
  sha256 "b2906b5781ae67150b8d524b862f0402068b6d32832dbfe4dd016d46ebaf11e6"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.26"
    sha256 arm64_tahoe:   "11d69d031c0e59672b2500ec066655fa156952fe388455866f3a96f898a37df1"
    sha256 tahoe:         "d2583b40b1a28377786943c665625f2e539465409d99c4915ffcfed8afa50444"
    sha256 arm64_sequoia: "cc1816e07c4a04004499691326da5069575aae04971c156593f5aa66fa4a18d5"
    sha256 sequoia:       "7097d2c9fa5b6266e947d08b836b7165ff8bbbb2e5dd35c1e2ef43a7006e39d0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
