cask "tabora" do
  version "0.0.1"
  sha256 "578ecbfeb70936ed8f87c90090fac2bca8d15f95e8047906e0cb1b1122bf4f28"

  url "https://github.com/mkusaka/Tabora/releases/download/v#{version}/Tabora.zip"
  name "Tabora"
  desc "macOS window switcher with window-level previews and keyboard navigation"
  homepage "https://github.com/mkusaka/Tabora"

  app "Tabora.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Tabora.plist",
  ]
end
