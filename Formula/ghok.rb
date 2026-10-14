class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.3"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.3/ghok_darwin_arm64.tar.gz"
      sha256 "4a7041960b8a080ea5f6820f4f34e2dd5df6910b15ed652ef294c24fd55825e1"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.3/ghok_darwin_amd64.tar.gz"
      sha256 "b837e8912eab5d2244f53c244bb0dd1ef4607a2dfdb854629231681686e0ca61"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.3/ghok_linux_arm64.tar.gz"
      sha256 "30e063bb1cd9feacac781713a59e7efe2f95886f42d4decaac717bfa89c0e37b"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.3/ghok_linux_amd64.tar.gz"
      sha256 "8dc24236185cf8741d28922c2e9514820d06fb55cfe3f5ae17e3abcf1e1ab44d"
    end
  end

  def install
    bin.install "ghok"
  end

  def caveats
    <<~EOS
      ghok is installed but not active. To route `gh` through ghok, run:
        ghok shim install
      This creates ~/.local/bin/gh -> #{opt_bin}/ghok (shell rc files are not modified);
      make sure ~/.local/bin comes before #{HOMEBREW_PREFIX}/bin in PATH, then check with:
        ghok doctor
      Undo with `ghok shim uninstall`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghok version")
  end
end
