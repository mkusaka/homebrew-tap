class Cxms < Formula
  desc "High-performance CLI for searching Codex session rollout JSONL files"
  homepage "https://github.com/mkusaka/cxms"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/cxms/releases/download/v0.0.1/cxms_darwin_arm64.tar.gz"
      sha256 "5b65ad86e33556f990bcf943f3a2ab74d0a9b6c81ed8578f1781566e8b0c0e29"
    else
      url "https://github.com/mkusaka/cxms/releases/download/v0.0.1/cxms_darwin_amd64.tar.gz"
      sha256 "f015df291a6af0670db0cb4e08eac1a94f42534ed82a6579e9e6024d17aec708"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/cxms/releases/download/v0.0.1/cxms_linux_arm64.tar.gz"
      sha256 "6e56b8ccf37cca64fe27d699bf5fb736e91424b2caed05d6703316a4f418df37"
    else
      url "https://github.com/mkusaka/cxms/releases/download/v0.0.1/cxms_linux_amd64.tar.gz"
      sha256 "ad04f1ee8744b63f0d9d4d9183e5f5f3899a0107ffe13acddc4ddb62170ca4b9"
    end
  end

  def install
    bin.install "cxms"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cxms --version")
  end
end
