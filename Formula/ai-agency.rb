class AiAgency < Formula
  desc "AI agent session launcher - AGENTS.md-based multi-agent orchestration"
  homepage "https://github.com/itdar/agents-initializer"
  url "https://github.com/itdar/agents-initializer/archive/refs/heads/main.tar.gz"
  version "0.1.0"
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
        ai-agency register /path/to/project   # register a project
        ai-agency scan ~/projects              # auto-discover projects
        ai-agency                              # launch agent picker

      For new projects, run setup first:
        cd /path/to/project && #{share}/ai-agency/setup.sh
    EOS
  end

  test do
    assert_match "ai-agency", shell_output("#{bin}/ai-agency --help")
  end
end
