cask "cmod" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.1"
  sha256 "d400e1d270112c4b041bc607736c795b641b00359079b2ffea8e535a1ae016c9"

  url "https://github.com/mkusaka/cmod/releases/download/v#{version}/Cmod.zip"
  name "Cmod"
  desc "macOS menu bar app for Command-key input switching"
  homepage "https://github.com/mkusaka/cmod"

  app "Cmod.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Cmod.plist",
  ]
end
