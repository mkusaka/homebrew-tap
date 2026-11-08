cask "procglint" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "1.0.0"
  sha256 "814b8d2579bf109799b3f55c8e89313f23ed00fc6e51fa3bc91cef4dee5d20e8"

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
