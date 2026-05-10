cask "tabora" do
  version "0.0.6"
  sha256 "1f53f3a15a75ac46493e9fafec0f79f7a1747cf4d93d0c79ed1eeb0e0559ce96"

  url "https://github.com/mkusaka/Tabora/releases/download/v#{version}/Tabora.zip"
  name "Tabora"
  desc "macOS window switcher with window-level previews and keyboard navigation"
  homepage "https://github.com/mkusaka/Tabora"

  app "Tabora.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Tabora.plist",
  ]
end
