# Homebrew formula TEMPLATE for newsline.
# The GitHub Actions workflow (.github/workflows/homebrew.yml) fills the
# TAG/VERSION/SHA placeholders on tag push and pushes it to itdar/homebrew-tap.
# (You normally never edit the deployed formula by hand.)
class Newsline < Formula
  desc "Locale-aware one-line news in your Claude Code status line"
  homepage "https://github.com/itdar/newsline"
  url "https://github.com/itdar/newsline/archive/refs/tags/v1.0.7.tar.gz"
  version "1.0.7"
  sha256 "1544c99fbd4b6bfb9e9c0869b2038067b76ed4adcc85b2fb8f35f8eb3f5cf92e"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.install "newsline", "statusline.sh", "refresh.sh", "refresh_stock.sh",
                    "fetch.py", "fetch_stock.py", "resolve.py", "feeds.json"
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
