class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.10"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.10/ghok_darwin_arm64.tar.gz"
      sha256 "da15eae0abdd96a0bbe1efff70a8706e9226591e1676367f487f35b46f76b1fa"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.10/ghok_darwin_amd64.tar.gz"
      sha256 "7ce5810c5e224e3b48bddb44f311bd4306d2c244434d5c238925d5365c3a4448"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.10/ghok_linux_arm64.tar.gz"
      sha256 "81b7df32a67c732c2bcbdcaa0a0ce42861683bf9b0a14cf57dc3daeb9229ac64"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.10/ghok_linux_amd64.tar.gz"
      sha256 "278fdd6dccfc314b211fe44ca579b13a30fc063df0538ed755c15d68cd206940"
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
