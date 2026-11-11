cask "procglint" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "1.6.0"
  sha256 "ad19355ec2e2632b4d42c1532beaf287236c096dc89d0dea1821a2fb80ac8379"

  url "https://github.com/mkusaka/procglint/releases/download/v#{version}/Procglint-#{version}-arm64.zip"
  name "Procglint"
  desc "Process monitor with a shared sampler for the GUI, CLI and an MCP server"
  homepage "https://github.com/mkusaka/procglint"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Procglint.app"
  binary "#{appdir}/Procglint.app/Contents/Helpers/procglint"
  binary "#{appdir}/Procglint.app/Contents/Helpers/procglint-mcp"

  zap trash: [
    "~/Library/Application Support/Procglint",
    "~/Library/Preferences/io.github.mkusaka.procglint.plist",
  ]

  caveats <<~EOS
    Open Procglint and choose Settings… → Register agent… to start the per-user sampler.
    Before uninstalling, choose Settings… → Unregister agent.
  EOS
end
