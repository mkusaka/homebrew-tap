class Cas < Formula
  desc "Recursively sync Claude agent files to Codex-compatible paths"
  homepage "https://github.com/mkusaka/cas"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/cas/archive/refs/tags/v0.0.3.tar.gz"
  version "0.0.3"
  sha256 "a451177e110fbcef1a412b47d887d2d86baefa8c08ed6ed25390bac5a6c3b466"
  license "MIT"
  head "https://github.com/mkusaka/cas.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/cas/releases/download/v0.0.3"
    sha256 arm64_tahoe: "cfafcc7748cea6aaafd2bc62e7edb3b4bf24630b9e2585317df65267492834fa"
    sha256 tahoe: "be61b053e05f2396e410499a7054c5646da4360e06383f825b64bd88a49c557d"
    sha256 arm64_sequoia: "cc46c7f4cacacf1c73ddd34061c9d78078292134a2baf097bc0fc546948e6705"
    sha256 sequoia: "c5848f2390d8c1c84e310585bb0317ae3db9737b506df55d3f0e3377d1be9341"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match ".claude/skills", shell_output("#{bin}/cas --help")
  end
end
