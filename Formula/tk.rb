class Tk < Formula
  desc "Standalone Rust CLI for persistent structured task lists"
  homepage "https://github.com/mkusaka/tk"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/tk/archive/refs/tags/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "799587de9dbb899c14d11c151eafdb1ae07b420a62604ad0b876e832f726bbe9"
  license "MIT"
  head "https://github.com/mkusaka/tk.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/tk/releases/download/v0.0.1"
    sha256 arm64_tahoe: "223790ae4d285822b0ade33eb9c79c94e3d7a106b5fe1b49d2f80a72a9e4a7b4"
    sha256 tahoe: "0d90f20aa7561e80445eb3df7f4b9df9ce4d2c7b42f764b887abac1bfe89010c"
    sha256 arm64_sequoia: "8df1e54b4addcc81d5e9c7d208614c4e1f3128357210192a4ef17aaa5c5ccf56"
    sha256 sequoia: "551efac21835f64535912681b74364a53b2c8ac0ecee820ca69ff039fa7783f5"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Structured task list CLI", shell_output("#{bin}/tk --help")
  end
end
