class AiAgency < Formula
  desc "AI agent session launcher - AGENTS.md-based multi-agent orchestration"
  homepage "https://github.com/itdar/ai-agency"
  url "https://github.com/itdar/ai-agency/archive/refs/tags/v3.1.1.tar.gz"
  version "3.1.1"
  sha256 "37b934f83adc0c0c0bc38b4e8a4bc32ea25a27ad7868e9f06e80a587fd15c157"
  license "MIT"

  def install
    # Install main scripts to share directory
    (share/"ai-agency").install "ai-agency.sh"
    (share/"ai-agency").install "setup.sh"
    (share/"ai-agency").install "HOW_TO_AGENTS.md"
    (share/"ai-agency/scripts").install "scripts/sync-ai-rules.sh"

    # Install the global CLI wrapper
    bin.install "bin/ai-agency"
  end

  def caveats
    <<~EOS
      Quick start:
        ai-agency init /path/to/project        # initialize a new project
        ai-agency register /path/to/project    # register an existing project
        ai-agency scan ~/projects              # auto-discover projects
        ai-agency                              # launch agent picker
    EOS
  end

  test do
    assert_match "ai-agency", shell_output("#{bin}/ai-agency --help")
  end
end
