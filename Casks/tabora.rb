cask "tabora" do
  version "0.0.3"
  sha256 "900fa2da883deefab9f288e126868990abe14e6c40641ef22a820c7d93ab8d82"

  url "https://github.com/mkusaka/Tabora/releases/download/v#{version}/Tabora.zip"
  name "Tabora"
  desc "macOS window switcher with window-level previews and keyboard navigation"
  homepage "https://github.com/mkusaka/Tabora"

  app "Tabora.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Tabora.plist",
  ]
end
