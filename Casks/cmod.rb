cask "cmod" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.3"
  sha256 "975854116f07ea1e95bc7c45b2c8e7586c2eb2b4c6922969cf0fdd09ffa0137e"

  url "https://github.com/mkusaka/cmod/releases/download/v#{version}/Cmod.zip"
  name "Cmod"
  desc "macOS menu bar app for Command-key input switching"
  homepage "https://github.com/mkusaka/cmod"

  app "Cmod.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Cmod.plist",
  ]
end
