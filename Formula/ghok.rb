class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.5"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.5/ghok_darwin_arm64.tar.gz"
      sha256 "9e054bc616d8bc931b6c9770ffff7f7a4cf14617cf6df100021df3d00a3e9668"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.5/ghok_darwin_amd64.tar.gz"
      sha256 "0378d85baef900dc97b95c3391956c6362546d0a137ef93e9c496d9cc5571a89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.5/ghok_linux_arm64.tar.gz"
      sha256 "7062a2dc2dc617f7dd7d5090621c87166eeeeeaf547148568aaf1f87e27cd520"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.5/ghok_linux_amd64.tar.gz"
      sha256 "a8d60cf20af203175224c8ff5e04a4be184ef0f1c613268395aabe1027938456"
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
