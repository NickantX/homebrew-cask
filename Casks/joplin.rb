cask "joplin" do
  version "2.10.16"
  sha256 "71152fd0523e0d5825f0ae5df0051f6e488413d7517a15060f6194604d01b86d"

  url "https://github.com/laurent22/joplin/releases/download/v#{version}/Joplin-#{version}.dmg",
      verified: "github.com/laurent22/joplin/"
  name "Joplin"
  desc "Note taking and to-do application with synchronization capabilities"
  homepage "https://joplinapp.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Joplin.app"

  zap trash: [
    "~/Library/Application Support/Joplin",
    "~/Library/Preferences/net.cozic.joplin-desktop.helper.plist",
    "~/Library/Preferences/net.cozic.joplin-desktop.plist",
    "~/Library/Saved Application State/net.cozic.joplin-desktop.savedState",
  ]
end
