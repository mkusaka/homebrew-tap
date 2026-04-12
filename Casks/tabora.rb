cask "tabora" do
  version "0.0.0"
  sha256 "REPLACE_ME"

  url "https://github.com/mkusaka/Tabora/releases/download/v#{version}/Tabora.zip"
  name "Tabora"
  desc "macOS window switcher with window-level previews and keyboard navigation"
  homepage "https://github.com/mkusaka/Tabora"

  app "Tabora.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Tabora.plist",
  ]
end
