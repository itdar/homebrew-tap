# Homebrew formula TEMPLATE for newsline.
# The GitHub Actions workflow (.github/workflows/homebrew.yml) fills the
# TAG/VERSION/SHA placeholders on tag push and pushes it to itdar/homebrew-tap.
# (You normally never edit the deployed formula by hand.)
class Newsline < Formula
  desc "Locale-aware one-line news in your Claude Code status line"
  homepage "https://github.com/itdar/newsline"
  url "https://github.com/itdar/newsline/archive/refs/tags/v0.1.8.tar.gz"
  version "0.1.8"
  sha256 "677d13cf6da178e4f4c3d7aacb9ccdccc3e5b97861e9b00c340b825806794864"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.install "newsline", "statusline.sh", "refresh.sh",
                    "fetch.py", "resolve.py", "feeds.json"
    bin.install_symlink libexec/"newsline"
  end

  def caveats
    <<~EOS
      Set up newsline (composes with your existing status line):
        newsline init
    EOS
  end

  test do
    assert_match "newsline", shell_output("#{bin}/newsline help")
  end
end
