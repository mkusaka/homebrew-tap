class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.11"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.11/ghok_darwin_arm64.tar.gz"
      sha256 "b728619f757ad1235e9bf62dee2a4f087f2c807b51e116dae5f1a3fa65c6a4a7"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.11/ghok_darwin_amd64.tar.gz"
      sha256 "c908640dd238504ab7afe5bfb6ccd87e473b72c78fa82b47cc9c2fb54754ebb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.11/ghok_linux_arm64.tar.gz"
      sha256 "6135530b194850b762bd940486ade9eaeb546e5141e6f0151b699e0664e006a0"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.11/ghok_linux_amd64.tar.gz"
      sha256 "e35af9953d3f833d5e56154cf19dacd4a8a80fa76996776468d2eb24d810f344"
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
