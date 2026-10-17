class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.14"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.14/ghok_darwin_arm64.tar.gz"
      sha256 "ff6a84effc25da92c7aba59e449f68f62b494c72c18e90d2a6ab621d453b4c3f"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.14/ghok_darwin_amd64.tar.gz"
      sha256 "2d2298fa9eef5d3cb06bd872689f47bf9857a28f66ba9ae10eba4c863faea076"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.14/ghok_linux_arm64.tar.gz"
      sha256 "77c6d8506bad5a0ffbdcf4f48e805b83e4d197dd8fc7eebaaa760572381a8eeb"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.14/ghok_linux_amd64.tar.gz"
      sha256 "d40fadd83f56deec3dd136c0cfa385f6615c9cacf624c3a2dd5382f9f592f63a"
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
