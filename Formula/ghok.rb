class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.6"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.6/ghok_darwin_arm64.tar.gz"
      sha256 "c5062d466c3783b6a2b03eb184f9b777159b915976278d20a104a75be0f3c834"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.6/ghok_darwin_amd64.tar.gz"
      sha256 "f473b4fbeb5332fdd7c1a18d77c8da9c33b644f2d637ae2a873b0bcdb3c47c48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.6/ghok_linux_arm64.tar.gz"
      sha256 "8e61179dcea0eb8b940d826b00530daddf3da0318f8941dbc33acbd2b171f455"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.6/ghok_linux_amd64.tar.gz"
      sha256 "eca9e8b44c491df66f920206f47e0e7741755c50277a48f5da5f6c0fb3794465"
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
