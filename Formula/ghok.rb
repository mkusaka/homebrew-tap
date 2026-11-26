class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.30"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.30/ghok_darwin_arm64.tar.gz"
      sha256 "e95b96b1fa9a0d72dfacccd7f22dc6ada677b92615d9154b14e71f185b3a4e4c"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.30/ghok_darwin_amd64.tar.gz"
      sha256 "2b00873b95ed64b1eb567da13d1da480aad489f784ea702859e34304fce5c95d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.30/ghok_linux_arm64.tar.gz"
      sha256 "a30de8a228df0bc5b1cf5f3198e3b9d9cb3996b782f1ab85587d71390a8e9b0b"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.30/ghok_linux_amd64.tar.gz"
      sha256 "3b5fd94749184ad17a7865c771f2aa0c4e8ff2e9539211835ed5ed120d6f9229"
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
