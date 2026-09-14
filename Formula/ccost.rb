class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.28.tar.gz"
  version "0.1.28"
  sha256 "fe3c652c7406ab9b7be074989774cc60722f629ccbd7b1ac714fea1a65366a64"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.28"
    sha256 arm64_tahoe:   "88240b4b70f5722e47e51ed78745590d55c5cc2298e1245003c616277241c547"
    sha256 tahoe:         "11aa610a5569f75919871cbb96f05fb876cd96678a6f9bbb5dca17e20e6e6d05"
    sha256 arm64_sequoia: "265205f1ac257904baa1a92f88684a64e74c0f173368807a241fb0ae8f49b318"
    sha256 sequoia:       "01c21775ca5f042936d87274e26cef43cdeb535767e076c43525758a30304b8e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
