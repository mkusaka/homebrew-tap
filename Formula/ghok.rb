class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.28"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.28/ghok_darwin_arm64.tar.gz"
      sha256 "076e4276bf65071f447b3e21369142f5850b573133d0eec7d69331c6dc6f3f63"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.28/ghok_darwin_amd64.tar.gz"
      sha256 "620b28fa2ddcefa86aed92cf8a5a8fde9ca2fe06d633302daa145d9e1e83bc6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.28/ghok_linux_arm64.tar.gz"
      sha256 "557272d013f4f9710f725c9660e1f137be08a8714be04ba9c316a1ec31c1e3f7"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.28/ghok_linux_amd64.tar.gz"
      sha256 "fe97aee7e37e97e8b26b6ced3e47ad97447e80cf26874e5eec63421e01a6d581"
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
      Docs ship with the binary (offline): `ghok docs`, `ghok docs search "<query>"`, `ghok actions`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghok version")
  end
end
