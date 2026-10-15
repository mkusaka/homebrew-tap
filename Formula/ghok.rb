class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.8"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.8/ghok_darwin_arm64.tar.gz"
      sha256 "ddfb7bb2685877b8f251c8d53c6f41df37fd171fa51ba68d22e2e6631e9869cd"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.8/ghok_darwin_amd64.tar.gz"
      sha256 "0eb5bc0c46dde526ae0bc7e932e34943aba7f64ba7f25dce1b2f598287b80701"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.8/ghok_linux_arm64.tar.gz"
      sha256 "088b6e21734118c55e0a20ba3cabda265ccc471a8cd3afe7d4cedb8311eeb2c5"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.8/ghok_linux_amd64.tar.gz"
      sha256 "76e0c8635c195c55950cbb8fc5e309c1222aa8940ac9d8645ec0b4f45f5c122a"
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
