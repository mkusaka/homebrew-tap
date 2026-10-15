class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.4"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.4/ghok_darwin_arm64.tar.gz"
      sha256 "8c1c6439e6782debbedc769ec1a0e94d705426968c93505264892f827d5f3d11"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.4/ghok_darwin_amd64.tar.gz"
      sha256 "c617d643a94a872a62298d1d54fc78155f62ff2200726ae28326bbd38a874b23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.4/ghok_linux_arm64.tar.gz"
      sha256 "3545c5926770320d688e2f449d255969ccc6d1e6c375772bd797de5796c3dbd4"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.4/ghok_linux_amd64.tar.gz"
      sha256 "e5b7482ef0103070ef46cd44587e3ab39995f1ba8431c73e609d6f59699b0644"
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
