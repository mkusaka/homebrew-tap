class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.31"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.31/ghok_darwin_arm64.tar.gz"
      sha256 "f804ea9fafd09eb7b32efb358445b99aa87d7fbd7a7c134da019268fb20eda34"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.31/ghok_darwin_amd64.tar.gz"
      sha256 "2de4a2cfd0ca0f3628884b63b68d34ff999d03e02c036c5b6707a765681f1890"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.31/ghok_linux_arm64.tar.gz"
      sha256 "1ee66c289652b6e4cf434de866f6be7d0708425ccb40b196569d1eb7b8bf5f19"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.31/ghok_linux_amd64.tar.gz"
      sha256 "ec14a87ef8f3469d23df35c95615acec91a88f9f1f7f459fc45923a31409953c"
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
