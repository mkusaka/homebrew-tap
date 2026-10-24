class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.40.tar.gz"
  version "0.1.40"
  sha256 "d0852237dea681b85c4ed01a9e8154cbd66c6694242aafaea051f5f8f588f571"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.40"
    sha256 arm64_tahoe:   "a7e132a4a15a854168b4f30e169bef21cb4f899dad996d69b9f93ab542c029e0"
    sha256 tahoe:         "3b73d5a4bfb494274f06145f73d2210d04599ad5261d416cc92ae0ae20a88edf"
    sha256 arm64_sequoia: "0b63f04626f3bf531ae2f8b184f501491e88138148473bbff4f2269cd8a5108e"
    sha256 sequoia:       "38086ce92537219aa7c5d7b8ce4543abae3a5b41d480a2154a17705b8dd8b050"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
