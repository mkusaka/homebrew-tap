class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.12.tar.gz"
  version "0.1.12"
  sha256 "77c96a9c2d46da2c87462db58c52f2074ce45b57d1f2a3ff1ed877eb24dfd461"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.12"
    sha256 arm64_tahoe:   "7eba979b313d088363499e158e6058952ce59bf41be041688e892795677b919d"
    sha256 tahoe:         "34cef09689785aa9f1fc354da909470cf542d7ba97feac3a08b16311c340294c"
    sha256 arm64_sequoia: "69d0de6ef05cbdff72c5f86a4e172487ed4f0db1be6ea8149aba708dd9427698"
    sha256 sequoia:       "b9f620d0d4140ceafd205ec2b02c0ac7adbce9874a53a99d61be2c24558de168"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
