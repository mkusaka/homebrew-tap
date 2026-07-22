class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.18.tar.gz"
  version "0.1.18"
  sha256 "9251b525939a9368c8d60f4f81b9ea6fd669d2a92b3bdf0df3c2c88c212da782"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.18"
    sha256 arm64_tahoe:   "384f8f08f88e047327ff257a2b1cd285c88348d79d3c788363eaa509088ed4c1"
    sha256 tahoe:         "fbc618682c088de9abe15996e0574f37d0f19c608ba40d7a6a14d037445a9dcd"
    sha256 arm64_sequoia: "5d120b6e08667ddf1b71871caec04d0a13e0b91f3c1586df269bbf51cff7f9be"
    sha256 sequoia:       "52f9eeb5c553bcdddd2392e157e7e13fd889ee84ddc715777a2fe5eb2f5d3762"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
