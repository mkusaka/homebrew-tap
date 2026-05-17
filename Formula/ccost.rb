class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.9.tar.gz"
  version "0.1.9"
  sha256 "3393cd33d92bf0146278ee4b4111f0f8f4c8548d9d2eaf184379147187f9f952"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.9"
    sha256 arm64_tahoe:   "8e6dbf89d2e804f2ee7550d2830d2cf7b2f5fc5fcd3ce8688136d1a899092db9"
    sha256 tahoe:         "c8099a75e01bf3dfa1de0d4dcbaec89ed6ece620a7bafd82edf78f8b5006c555"
    sha256 arm64_sequoia: "174b8fcd6d648eeedfa186234156b1823c3c9569311dba30b133d8f4e58c3e4d"
    sha256 sequoia:       "f8d3f01189bf7bc24a34cb6c9ed56bb6850bf400a5fc4a64fc377e272e5802c4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
