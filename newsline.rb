# Homebrew formula TEMPLATE for newsline.
# The GitHub Actions workflow (.github/workflows/homebrew.yml) fills the
# TAG/VERSION/SHA placeholders on tag push and pushes it to itdar/homebrew-tap.
# (You normally never edit the deployed formula by hand.)
class Newsline < Formula
  desc "Locale-aware one-line news in your Claude Code status line"
  homepage "https://github.com/itdar/newsline"
  url "https://github.com/itdar/newsline/archive/refs/tags/v1.0.3.tar.gz"
  version "1.0.3"
  sha256 "0edfefb9189132228ff0650e5093335bac333db17d0b4261a59ed0df34b64297"
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
