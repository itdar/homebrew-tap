# Homebrew formula TEMPLATE for newsline.
# The GitHub Actions workflow (.github/workflows/homebrew.yml) fills the
# TAG/VERSION/SHA placeholders on tag push and pushes it to itdar/homebrew-tap.
# (You normally never edit the deployed formula by hand.)
class Newsline < Formula
  desc "Locale-aware one-line news in your Claude Code status line"
  homepage "https://github.com/itdar/cc-plugin"
  url "https://github.com/itdar/cc-plugin/archive/refs/tags/v0.1.5.tar.gz"
  version "0.1.5"
  sha256 "5997ccd58af4e26fb99b291a59845f69c8873386d062eedac01e4372e67803c1"
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
