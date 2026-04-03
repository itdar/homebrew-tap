class AiAgency < Formula
  desc "AI agent session launcher - AGENTS.md-based multi-agent orchestration"
  homepage "https://github.com/itdar/agents-initializer"
  url "https://github.com/itdar/agents-initializer/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "42504a79ab6acc9260e65b3e2bb6ee92cf30e94c5f9ef522a8ed11ef8aafea43"
  version "3.0.0"
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
