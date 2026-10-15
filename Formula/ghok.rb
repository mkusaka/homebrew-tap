class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.9"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.9/ghok_darwin_arm64.tar.gz"
      sha256 "4e429556d2523fd7df45c7b73a15b8da17d9d2843e7f460686e88ec46904324e"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.9/ghok_darwin_amd64.tar.gz"
      sha256 "18f6596cf529b47cfb0392f741151f850df6c3339e30902d46dd8ec6d3a87e4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.9/ghok_linux_arm64.tar.gz"
      sha256 "41db6e383bee94df9a0a881e97372b7fb14b5a38c7bf9b60f36e92bd4041194c"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.9/ghok_linux_amd64.tar.gz"
      sha256 "b573f9678635ee634c399ae45468fe66edbe3e776df5c0f0840451b809c4fcef"
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
