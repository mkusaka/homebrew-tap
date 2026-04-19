class Tk < Formula
  desc "Standalone Rust CLI for persistent structured task lists"
  homepage "https://github.com/mkusaka/tk"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/tk/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  head "https://github.com/mkusaka/tk.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/tk/releases/download/v0.1.0"
    sha256 arm64_tahoe: "arm64_tahoe_sha256_placeholder"
    sha256 tahoe: "tahoe_sha256_placeholder"
    sha256 arm64_sequoia: "arm64_sequoia_sha256_placeholder"
    sha256 sequoia: "sequoia_sha256_placeholder"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Structured task list CLI", shell_output("#{bin}/tk --help")
  end
end
