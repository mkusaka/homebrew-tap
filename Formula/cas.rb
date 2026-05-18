class Cas < Formula
  desc "Recursively sync Claude agent files to Codex-compatible paths"
  homepage "https://github.com/mkusaka/cas"
  url "https://github.com/mkusaka/cas/archive/refs/tags/v0.0.2.tar.gz"
  version "0.0.2"
  sha256 "ee229b8f979add727ad6a78bb959cb06e00462e9af93d463a586ddc0a3edbb1c"
  license "MIT"
  head "https://github.com/mkusaka/cas.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/cas/releases/download/v0.0.2"
    sha256 arm64_tahoe:   "9a11b964c635706de466dfee1a1b0200385786b9300f5dab209fa87361e5efe2"
    sha256 tahoe:         "c8041c53ee37d0b16e4d2ecdba250d13a5793daa92c286a677eced8f7219ca62"
    sha256 arm64_sequoia: "f888b46c3a75a7c3a70b6556d49fb795c329b79ba05b2e2ee2265b7370b5c5de"
    sha256 sequoia:       "2963744e27ef865e051697683dab8c6e8c99ce00bb21662ecaeee734a6554479"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match ".claude/skills", shell_output("#{bin}/cas --help")
  end
end
