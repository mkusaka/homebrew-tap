cask "cmod" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.4"
  sha256 "8bfe27703d938ada80cdab7fe1f810879ad8bc069036f3aee48210907b970ccf"

  url "https://github.com/mkusaka/cmod/releases/download/v#{version}/Cmod.zip"
  name "Cmod"
  desc "macOS menu bar app for Command-key input switching"
  homepage "https://github.com/mkusaka/cmod"

  app "Cmod.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Cmod.plist",
  ]
end
