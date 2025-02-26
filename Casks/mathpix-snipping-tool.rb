cask "mathpix-snipping-tool" do
  version "3.4.4.1"
  sha256 "f4713237f93cff2e88d949702d3dc716399bbc9c8bdd9a29bb6a0b5b52574464"

  url "https://mathpix.com/dmg/SnippingTool-v#{version}.dmg"
  name "Mathpix Snipping Tool"
  desc "Scanner app for math and science"
  homepage "https://mathpix.com/"

  livecheck do
    url "https://mathpix.com/appcast.xml"
    strategy :sparkle do |item|
      item.url[/SnippingTool[._-]v?(\d+(?:\.\d+)+)\.dmg/i, 1]
    end
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "Mathpix Snipping Tool.app"

  zap trash: [
    "~/Library/Application Support/com.mathpix.snipping-tool-noappstore",
    "~/Library/Caches/com.crashlytics.data/com.mathpix.snipping-tool-noappstore",
    "~/Library/Caches/com.mathpix.snipping-tool-noappstore",
    "~/Library/Caches/io.fabric.sdk.mac.data/com.mathpix.snipping-tool-noappstore",
    "~/Library/Preferences/com.mathpix.snipping-tool-noappstore.plist",
  ]
end
