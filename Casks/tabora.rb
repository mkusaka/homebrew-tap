cask "tabora" do
  version "0.0.2"
  sha256 "4ebe857d702bc5c2c62f83f3020ae741bb98767902fe73951815ff7453a72c6c"

  url "https://github.com/mkusaka/Tabora/releases/download/v#{version}/Tabora.zip"
  name "Tabora"
  desc "macOS window switcher with window-level previews and keyboard navigation"
  homepage "https://github.com/mkusaka/Tabora"

  app "Tabora.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Tabora.plist",
  ]
end
