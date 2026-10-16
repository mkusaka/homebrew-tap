class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.12"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.12/ghok_darwin_arm64.tar.gz"
      sha256 "8e8b58800269c3883be8cab0d16c52bcd84423af70656ec8a0cb15ce1cb00849"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.12/ghok_darwin_amd64.tar.gz"
      sha256 "e19100ed7f7e14d5ae7807c12572ebce6f662633389845fe9092c576747ad414"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.12/ghok_linux_arm64.tar.gz"
      sha256 "022f4cd6362c7115efb5b9c54bd11642f01d53eac16f2e7845d295469a0ffb8d"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.12/ghok_linux_amd64.tar.gz"
      sha256 "b262b72050c4d0d4f50adfecbb043b77537cc454bc92e86aea48c34594a84168"
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
