class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.36.tar.gz"
  version "0.1.36"
  sha256 "71382836be73f9a9c8c988de5a5e39aa692744cc7e87209e20eb63a6586f9510"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.36"
    sha256 arm64_tahoe:   "5c9ed6af806f5b981dd89b1e332e7c4cb535bee9c9dffa93126acb3432a6fa96"
    sha256 tahoe:         "b36732ebcc357428c06d139a501e0196652a7daa1160574b8f72ad2015678015"
    sha256 arm64_sequoia: "b1a83f7ecb940a04c863afb953250014dcc877ea0e601ac34b278cb1defbd50a"
    sha256 sequoia:       "472426c6fbde45248779a91ee5a1cfcfb25ca9d59c9b23fcf1422c7a0171eb54"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
