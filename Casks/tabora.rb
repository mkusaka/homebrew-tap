cask "tabora" do
  version "0.0.5"
  sha256 "75c4d99bc0e1a758fffa4a8f520ee12b44f37aa3cd688f884ceeee927ee99f83"

  url "https://github.com/mkusaka/Tabora/releases/download/v#{version}/Tabora.zip"
  name "Tabora"
  desc "macOS window switcher with window-level previews and keyboard navigation"
  homepage "https://github.com/mkusaka/Tabora"

  app "Tabora.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Tabora.plist",
  ]
end
