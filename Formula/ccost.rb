class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.15.tar.gz"
  version "0.1.15"
  sha256 "ae3b052054c24715695b7a26269aeaded60ea7dcabde781bedd03225a86d8abb"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.15"
    sha256 arm64_tahoe:   "b9ee4c3208e2b8da4931295a81804394a7c7808e3ce9d1dfc234a4c91a764df4"
    sha256 tahoe:         "7040215366303fb7a88074f812a4a79733391d8d232821e507278b415130ccd1"
    sha256 arm64_sequoia: "c8c921f4f8ae401e932e4e4dc4377c21ed19993bd4d72f164992600a13db4081"
    sha256 sequoia:       "94e05aa81b36555c082b7e43739cfcf36c6323139e1a852d66e32d68ab1736d0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
