class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.18"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.18/ghok_darwin_arm64.tar.gz"
      sha256 "13ae5dd6b3b4543d27717e3f7a243d202818f7e590e1f9c898ba0e945e1ecd50"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.18/ghok_darwin_amd64.tar.gz"
      sha256 "a0bf37cadc995a9c791cf0dc0349e89dea360b5e6075eed72a55cb8ba97fedbc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.18/ghok_linux_arm64.tar.gz"
      sha256 "64d6806b8f385438712a9034ed24e2ddc3e535e25e335118ec1521ae98a5e9b5"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.18/ghok_linux_amd64.tar.gz"
      sha256 "d252b117f11642bcaaabbb0a83438ab24b0a382f19093a85cc35a4854722e052"
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
