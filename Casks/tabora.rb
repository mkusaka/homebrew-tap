cask "tabora" do
  version "0.0.4"
  sha256 "5a1f14c281e571961816445943fa21e6a3dd6c82b22245cd1a1a2eabae2263b5"

  url "https://github.com/mkusaka/Tabora/releases/download/v#{version}/Tabora.zip"
  name "Tabora"
  desc "macOS window switcher with window-level previews and keyboard navigation"
  homepage "https://github.com/mkusaka/Tabora"

  app "Tabora.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Tabora.plist",
  ]
end
