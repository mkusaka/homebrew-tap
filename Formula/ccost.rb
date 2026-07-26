class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.20.tar.gz"
  version "0.1.20"
  sha256 "fbd351a838ca33f7119c741682b3830aca9853c0dd4018b24970cb5f17b65f78"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.20"
    sha256 arm64_tahoe:   "274efcf83176c951402c724f24b81c6cdbeb89485b74655567e7c9467afe4ed4"
    sha256 tahoe:         "c2efd850a3effec68bce5167f293ea657653956c0b39470727fdb83e8ade2fc6"
    sha256 arm64_sequoia: "3f2fb3be97303bfa0241c5d7d2176f52e7b9c38a13451f9a481f7ebb8a72705f"
    sha256 sequoia:       "5069b7653bac436d031956776fe8064d8a93b8c6aa3b80b1f3d7f189fa405fa1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
