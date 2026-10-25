cask "gain" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.4.1"
  sha256 "a7edea5511bdb6fa0b44ad4e83d5f04a5b144eef81485650d6f91cecad7a4434"

  url "https://github.com/mkusaka/gain/releases/download/v#{version}/gain-#{version}-darwin-universal.tar.gz"
  name "gain"
  desc "Run gh with a GitHub App installation token from a passphrase-locked agent"
  homepage "https://github.com/mkusaka/gain"

  depends_on formula: "gh"

  binary "gain"

  # Upgrades leave the agent running (unlocked, on the old binary) instead of stopping it; it
  # switches to the new binary at the next login or `gain agent install`. Zap removes the
  # LaunchAgent. The vault (~/.local/share/gain) is deliberately kept: it is the only copy of the App keys.
  zap launchctl: "com.github.mkusaka.gain.agent",
      trash:     [
        "~/Library/LaunchAgents/com.github.mkusaka.gain.agent.plist",
        "~/Library/Logs/gain-agent.log",
      ]

  caveats <<~EOS
    Start the agent now and at every login, then unlock it once per login:
      gain agent install
      gain agent unlock
    Upgrades keep the running agent; it moves to the new binary at the next login
    (or run `gain agent install` and unlock again). `gain agent status` shows its version.
    Uninstall with `brew uninstall --zap gain` to also remove the LaunchAgent.
  EOS
end
