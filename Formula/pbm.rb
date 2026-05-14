class Pbm < Formula
  desc "Deterministic macOS desktop automation CLI and MCP server"
  homepage "https://github.com/mkusaka/pbm"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/pbm/archive/refs/tags/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "4528858346d371956e7ea0a72700fb2f81bbef083d21bd5d0fe236744023d8c8"
  license "MIT"
  head "https://github.com/mkusaka/pbm.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/pbm/releases/download/v0.0.1"
    sha256 arm64_tahoe:   "c1586668346abff16e5906418a7b33721c8471e66fbe268bcd4c9424a2fc74b3"
    sha256 arm64_sequoia: "d4585cec33acc8d063198c4980136ec70ca054d8ee16a5580dea31f94f113682"
    sha256 tahoe:         "95465f10af4b5657d907d8c90f740f6f8e542bd2c7e9874f7899d41033569449"
    sha256 sequoia:       "181fadc5db2f1a77fc666246f0344497d2db4447f41bae092e0f8c5beaa09460"
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
