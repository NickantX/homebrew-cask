cask "lockrattler" do
  version "4.37,2023.05"
  sha256 "e0313e7116136d98201c01b09eefe3a221889579debe68457e88488bfa60b78e"

  url "https://eclecticlightdotcom.files.wordpress.com/#{version.csv.second.major}/#{version.csv.second.minor}/lockrattler#{version.csv.first.no_dots}.zip",
      verified: "eclecticlightdotcom.files.wordpress.com/"
  name "Lock Rattler"
  desc "Checks security systems and reports issues"
  homepage "https://eclecticlight.co/"

  livecheck do
    url "https://raw.githubusercontent.com/hoakleyelc/updates/master/eclecticapps.plist"
    strategy :page_match do |page|
      match = page.match(%r{/(\d+)/(\d+)/lockrattler(\d+)\.zip}i)
      next if match.blank?

      "#{match[3].split("", 2).join(".")},#{match[1]}.#{match[2]}"
    end
  end

  depends_on macos: ">= :el_capitan"

  app "lockrattler#{version.csv.first.major}#{version.csv.first.minor}/LockRattler.app"

  zap trash: [
    "~/Library/Caches/co.eclecticlight.LockRattler",
    "~/Library/Preferences/co.eclecticlight.LockRattler.plist",
    "~/Library/Saved Application State/co.eclecticlight.LockRattler.savedState",
  ]
end
