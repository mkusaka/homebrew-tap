class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.2"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.2/ghok_darwin_arm64.tar.gz"
      sha256 "fcbe1e097ded0be5f7b73913adbf0da770ee8af9ad825eac4b066b8fbef50b53"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.2/ghok_darwin_amd64.tar.gz"
      sha256 "7c065dc2974129eb54eaf3cb509baf2aae1dce13f65d2f49b6b68b15db73d001"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.2/ghok_linux_arm64.tar.gz"
      sha256 "a522f737f384a0295c3a87043a8b2a14778a1c0eef4eb5cc5a830466a2446229"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.2/ghok_linux_amd64.tar.gz"
      sha256 "a421fb54a566e2034d8115fa3434c5a0e5aa26aff0d4d18c0f48ce9c536e2d42"
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
