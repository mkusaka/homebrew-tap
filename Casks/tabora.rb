cask "tabora" do
  version "0.0.9"
  sha256 "f65ba16f757fdd4533e2a7fa3fe360a170ebfefd2b3d5578db27dd4709c85436"

  url "https://github.com/mkusaka/Tabora/releases/download/v#{version}/Tabora.zip"
  name "Tabora"
  desc "macOS window switcher with window-level previews and keyboard navigation"
  homepage "https://github.com/mkusaka/Tabora"

  app "Tabora.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Tabora.plist",
  ]
end
