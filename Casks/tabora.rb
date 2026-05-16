cask "tabora" do
  version "0.0.8"
  sha256 "0274ee0add1fd38d2380e89164543fb7baf2e1b3c68859b3fe994738741666e5"

  url "https://github.com/mkusaka/Tabora/releases/download/v#{version}/Tabora.zip"
  name "Tabora"
  desc "macOS window switcher with window-level previews and keyboard navigation"
  homepage "https://github.com/mkusaka/Tabora"

  app "Tabora.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Tabora.plist",
  ]
end
