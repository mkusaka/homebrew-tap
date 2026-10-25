cask "gain" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.4.0"
  sha256 "4d734178850a24aac1e7f313104813d4254e19a6d827feedbae95733b7a7d564"

  url "https://github.com/mkusaka/gain/releases/download/v#{version}/gain-#{version}-darwin-universal.tar.gz"
  name "gain"
  desc "Run gh with a GitHub App installation token from a passphrase-locked agent"
  homepage "https://github.com/mkusaka/gain"

  depends_on formula: "gh"

  binary "gain"

  # `gain agent install` registers this LaunchAgent; don't leave it pointing at a removed binary.
  uninstall launchctl: "com.github.mkusaka.gain.agent",
            trash:     "~/Library/LaunchAgents/com.github.mkusaka.gain.agent.plist"

  # The vault (~/.local/share/gain) is deliberately kept: it is the only copy of the App keys.
  zap trash: "~/Library/Logs/gain-agent.log"

  caveats <<~EOS
    Start the agent now and at every login, then unlock it once per login:
      gain agent install
      gain agent unlock
    After `brew upgrade --cask gain`, run both again so the agent runs the new binary.
  EOS
end
