class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.19.tar.gz"
  version "0.1.19"
  sha256 "714d5c7a5c169ce3c486f92c417bf1fa426805c358c1db3b6771183fa0351f13"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.19"
    sha256 arm64_tahoe:   "fb7130a39885d316eaeccb19d9d09c7295e4bae5100fa6c7acb12860aa5b9a3a"
    sha256 tahoe:         "a08dc42a0cab40bb69db1a4f2457cfcc4ca5a586d59a511713b8ded5ea2e0247"
    sha256 arm64_sequoia: "3b03872c585f82ade0ece5ff9e917677cbd997e6097c4a1b031f799d631309c5"
    sha256 sequoia:       "d2d65cf9c369c5cd124bf105738307675bf75e5ddf2e8a32a2adca532187f467"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
