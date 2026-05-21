class AiAgency < Formula
  desc "AI agent session launcher - AGENTS.md-based multi-agent orchestration"
  homepage "https://github.com/itdar/ai-agency"
  url "https://github.com/itdar/ai-agency/archive/refs/tags/v1.0.5.tar.gz"
  version "1.0.5"
  sha256 "3ad3b0a75e9915225ef4a09ab29e37ec045bd57523c558d258c1ac1580a7117b"
  license "MIT"

  def install
    (share/"ai-agency").install "src/ai-agency.sh"
    (share/"ai-agency").install "src/setup.sh"
    (share/"ai-agency").install "src/HOW_TO_AGENTS.md"
    (share/"ai-agency/scripts").install "src/scripts/sync-ai-rules.sh"
    bin.install "src/bin/ai-agency"
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
