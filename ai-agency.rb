class AiAgency < Formula
  desc "AI agent session launcher - AGENTS.md-based multi-agent orchestration"
  homepage "https://github.com/itdar/ai-agency"
  url "https://github.com/itdar/ai-agency/archive/refs/tags/v3.2.1.tar.gz"
  version "3.2.1"
  sha256 "bcdd3fb92f31971147222edd43f0c3a81c1ae890ed4e6dc7b7d265ef1a35595a"
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
