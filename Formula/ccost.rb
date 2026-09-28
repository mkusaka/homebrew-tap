class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.35.tar.gz"
  version "0.1.35"
  sha256 "5e4755ec51ace032a881ee385743d045891703001ec95bbafcc854ee1026f525"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.35"
    sha256 arm64_tahoe:   "5639dcab2c3c65535ca9ea4c49f57f99e90568392fa477bd1db930eb2516963c"
    sha256 tahoe:         "75aa26eda2ebf97c98e9ec3d4641a0326d37a7e2d0c69a1a88a433705556c557"
    sha256 arm64_sequoia: "0011979199354f32a6d5e59cc1c1104c06cc6f9c9186fc0518e5ee81fab4b035"
    sha256 sequoia:       "c6c08bc671622d600d0c25127ebaea44cb4848fdd4ff91394b2a789594a67a21"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
