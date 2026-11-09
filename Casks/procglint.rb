cask "procglint" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "1.4.0"
  sha256 "9bb87b60e512b04af0d3a64f26285b6623e443d05491a171b2b48bc98acb7a4d"

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
