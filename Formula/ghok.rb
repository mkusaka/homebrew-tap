class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.20"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.20/ghok_darwin_arm64.tar.gz"
      sha256 "02e0a246508a4f08ef1919cdbb9fc5844a70a2a98bf0b83e31d414c082dc94f6"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.20/ghok_darwin_amd64.tar.gz"
      sha256 "0718fd2441521c2f94f393da245d349b013844b88fa4c2de46d5732805a1d50d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.20/ghok_linux_arm64.tar.gz"
      sha256 "a0cb9a837d24e0a4cf4f71d9e2062929a9b8407308c5b775a65ca279adf995bc"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.20/ghok_linux_amd64.tar.gz"
      sha256 "3e75474f0d9f7c75429520aaef79bb86e71f5845e8c7625ba9a20ffa497dcf09"
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
