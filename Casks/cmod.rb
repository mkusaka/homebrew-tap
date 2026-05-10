cask "cmod" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/mkusaka/cmod/releases/download/v#{version}/Cmod.zip"
  name "Cmod"
  desc "macOS menu bar app for Command-key input switching"
  homepage "https://github.com/mkusaka/cmod"

  app "Cmod.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Cmod.plist",
  ]
end
