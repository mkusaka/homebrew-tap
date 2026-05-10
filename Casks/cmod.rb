cask "cmod" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.2"
  sha256 "7fb0a1686a0daaf5897997a53af113f4f2b9e840d82793dfb1502367be713dc5"

  url "https://github.com/mkusaka/cmod/releases/download/v#{version}/Cmod.zip"
  name "Cmod"
  desc "macOS menu bar app for Command-key input switching"
  homepage "https://github.com/mkusaka/cmod"

  app "Cmod.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Cmod.plist",
  ]
end
