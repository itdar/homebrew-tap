cask "1shot" do
  version "0.8.16"
  sha256 "5037c0c9bf66cf62dbc4a0a32802f9b31f1c61c4ede5d626ef1a93656bbc7d3f"

  url "https://github.com/itdar/1shot-dist/releases/download/v0.8.16/1shot-#{version}.zip"
  name "1shot"
  desc "Types stored logins into the focused field without exposing them to agents"
  homepage "https://github.com/itdar/1shot-dist"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "1shot.app"
  binary "#{appdir}/1shot.app/Contents/Helpers/1shot-cli.app/Contents/MacOS/1shot-cli", target: "1shot"

  # Upgrades replace the app: stop the old one first, then start the new one in the background
  # (the field button, the hotkey and the menu bar icon work only while 1shot runs).
  # Not `uninstall quit:`: Homebrew then reopens the app in the foreground with its window.
  preflight do
    system_command "/usr/bin/pkill", args: ["-x", "1shot"], must_succeed: false
  end

  postflight do
    system_command "/usr/bin/open", args: ["-g", "#{appdir}/1shot.app"]
  end

  uninstall signal: [["TERM", "dev.gino.1shot.app"]]

  zap trash: "~/.config/1shot"

  caveats <<~EOS
    Give Accessibility permission to the app that runs `1shot fill`
    (Terminal, iTerm, or your agent host):
      System Settings > Privacy & Security > Accessibility

    Passwords are in the 1shot-only keychain group. Uninstalling does not
    delete them. Run `1shot reset` first to delete all 1shot data.
  EOS
end
