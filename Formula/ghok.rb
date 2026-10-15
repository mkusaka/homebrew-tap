class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.7"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.7/ghok_darwin_arm64.tar.gz"
      sha256 "74baae00a53c869eb70304242e640172241ce89e65e37e1c711c4075796a30c2"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.7/ghok_darwin_amd64.tar.gz"
      sha256 "7daa24ea392dfe0d5648ceb45ede51147e84650bc174adf9322d6eff408029ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.7/ghok_linux_arm64.tar.gz"
      sha256 "4a811208d1d9188e5dfc38097da8c585aa7e37c807a30d63259314e0f2bbbc9d"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.7/ghok_linux_amd64.tar.gz"
      sha256 "3177c35ee562258e50d2897889c314617c132894abcbbc7830f52a64051d3a54"
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
