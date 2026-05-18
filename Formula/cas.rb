class Cas < Formula
  desc "Recursively link CLAUDE.md to AGENTS.md"
  homepage "https://github.com/mkusaka/cas"
  url "https://github.com/mkusaka/cas/archive/refs/tags/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "bf32cc69909a1ecf4c2264b252cdb0cc582ddba4aad4dceeac9de77cb2518e64"
  license "MIT"
  head "https://github.com/mkusaka/cas.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/cas/releases/download/v0.0.1"
    sha256 arm64_tahoe:   "8e8dbc6dcaabb7ed32fd78192a6b92ec934ec81d0ff8e475a78ea62fb9317012"
    sha256 tahoe:         "27ea2554085776d3053cd0a570aa504a3a638f657fe833fa673be6ecae32cd99"
    sha256 arm64_sequoia: "c0c8a78fd3b4a7793439de6db529c92deca0e8888ffee321ede60dc311a8d7f2"
    sha256 sequoia:       "ab19e06d4399bd5b12b34fe6368cfced8ecdf57cbc0bee9f23e29ef23a4c2f38"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Recursively create AGENTS.md", shell_output("#{bin}/cas --help")
  end
end
