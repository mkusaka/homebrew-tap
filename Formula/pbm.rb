class Pbm < Formula
  desc "Deterministic macOS desktop automation CLI and MCP server"
  homepage "https://github.com/mkusaka/pbm"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/pbm/archive/refs/tags/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "d22b67c3c8701811634ccc68e578090b184ffa7837209c687233ffd0850649d1"
  license "MIT"
  head "https://github.com/mkusaka/pbm.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/pbm/releases/download/v0.0.1"
    sha256 arm64_tahoe:   "f614384b225f109539b46a11408ca09fbc59e84805a0c07e25768f765045d1e2"
    sha256 arm64_sequoia: "5d02d643bb7c9900aec7182009276902223984ba273184b78c7cb8370e9f44f2"
    sha256 tahoe:         "fb6e35123ae348750d42f14e226e54ff83c9e777f99a9aee4f49bf04604ccb23"
    sha256 sequoia:       "2d55e2b0d1d5f40e4d7209852938347af19aa998f54addf91b805f324cc569f0"
  end

  depends_on macos: :sequoia

  def install
    developer_dir = Dir["/Applications/Xcode_26*.app/Contents/Developer"].last
    swift = if developer_dir
      "#{developer_dir}/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift"
    else
      "swift"
    end

    system swift, "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/pbm"
    (pkgshare/"skills").install "skills/pbm-cli"
  end

  def caveats
    skill_path = opt_pkgshare/"skills"
    <<~EOS
      Optional agent skills were installed to:
        #{skill_path}

      Install from the packaged skill files with npx skills:
        npx -y skills add "#{skill_path}" --skill pbm-cli -y --copy

      Install from the repository with npx skills:
        npx -y skills add https://github.com/mkusaka/pbm --skill pbm-cli -y

      Add `--agent <host>` if you want to target a specific agent host.
    EOS
  end

  test do
    output = shell_output("#{bin}/pbm --version")
    assert_match "\"schemaVersion\":\"pbm.stable.v1\"", output
    assert_match "\"version\":\"#{version}\"", output
  end
end
