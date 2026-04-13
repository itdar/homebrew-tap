class AiAgency < Formula
  desc "AI agent session launcher - AGENTS.md-based multi-agent orchestration"
  homepage "https://github.com/itdar/ai-agency"
  url "https://github.com/itdar/ai-agency/archive/refs/tags/v4.6.1.tar.gz"
  version "4.6.1"
  sha256 "6d86a454b08fd8b9fd9d0014375ab12be1f4ac5e2acbc464812e3ddb1960e7cf"
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
