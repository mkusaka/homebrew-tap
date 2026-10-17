class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.13"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.13/ghok_darwin_arm64.tar.gz"
      sha256 "ffd6fd9a9f5f2ffab216d5d36bb3bebbca3656de865f29e6c5620943c9160a6a"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.13/ghok_darwin_amd64.tar.gz"
      sha256 "d6fb4ba771136eac84a5ed3e2c09b4a11aff064c7f59115979bc03a32a82dbe4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.13/ghok_linux_arm64.tar.gz"
      sha256 "a6f4d4b7722d9125a822b44d92385cb4ac41432e0a7a432318eb4c96ec130793"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.13/ghok_linux_amd64.tar.gz"
      sha256 "24a5cea8a35bbb6416f3370b1887cfc97f76e5ba82a806bd33800a6eb1bb304b"
    end
  end

  def install
    bin.install "ghok"
  end

  def caveats
    <<~EOS
      ghok is installed but not active. Route `gh` through it in one of two ways:
        ghok shim install                   # every gh on this machine, incl. scripts and agents
        eval "$(ghok shell-init zsh)"       # only gh typed in your shell (bash/fish also supported)
      The shim creates ~/.local/bin/gh -> #{opt_bin}/ghok (shell rc files are not modified);
      put ~/.local/bin before #{HOMEBREW_PREFIX}/bin in PATH. Undo with `ghok shim uninstall`.
      Without a config gh passes through untouched; create one with:
        ghok config init --scope user
      Then check everything with `ghok doctor`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghok version")
  end
end
