class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.1"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.1/ghok_darwin_arm64.tar.gz"
      sha256 "9dfb1d8bcd6c83e8369dd0d9219f931bc22d3600a6a7d37886be7492f6747253"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.1/ghok_darwin_amd64.tar.gz"
      sha256 "12d0486f0a6732e5aaa697a64e2779af0b37d932abf949f04853c567be45e472"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.1/ghok_linux_arm64.tar.gz"
      sha256 "0b232b315b90b213fa8e2ecd3397b47ccb4c907eedbda5e392826d29aeae3fae"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.1/ghok_linux_amd64.tar.gz"
      sha256 "0e239805832fc9724276513cd9217f8a01a897bc6e7fa8bd84b033259a7de7ac"
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
