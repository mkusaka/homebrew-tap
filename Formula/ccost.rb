class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.21.tar.gz"
  version "0.1.21"
  sha256 "2a6721f7d804abb87705c6c71e1c6f89a4e54f644a886e2ed4f8737bc18cf2b4"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.21"
    sha256 arm64_tahoe:   "69b694b73e3d4c646c5fac35cbfa3a92091a6948c0c3362cea4520632abf54ab"
    sha256 tahoe:         "4ed299b7b0becd375f1cfa19540d34ecfc02e0c459df39a166eb89b02dfeda84"
    sha256 arm64_sequoia: "31805b3f3e59345431f190aea5745249efcb2b71ebb7eca860ffa4907a4ed1a1"
    sha256 sequoia:       "e23e709120ad2a00f584d61a9ddac490b94eeaec9d1b802ee2da851cd07458a6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
