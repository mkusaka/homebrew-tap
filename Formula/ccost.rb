class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.25.tar.gz"
  version "0.1.25"
  sha256 "bee593454a66ba12b7b0e355c70099874e962150ba68c04dcc4632263060977c"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.25"
    sha256 arm64_tahoe:   "e92d77a12c3bb0bff5381d6cc978539b2e006dac2d2ee779591172914693f0f5"
    sha256 tahoe:         "063b1309dd4522bb490ef7a463851f521da92a82b4b4fdf28b0159f79e0c9f6e"
    sha256 arm64_sequoia: "8eac93b57db9ab98a6980c19e1e9654e1fcddcf0df9937b3d27009ed00fb42a4"
    sha256 sequoia:       "3290ac404583b883e8233ab95c95a8de7070ce0f74254df43065495083b34fc3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
