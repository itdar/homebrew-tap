class AiAgency < Formula
  desc "AI agent session launcher - AGENTS.md-based multi-agent orchestration"
  homepage "https://github.com/itdar/ai-agency"
  url "https://github.com/itdar/ai-agency/archive/refs/tags/v4.5.6.tar.gz"
  version "4.5.6"
  sha256 "f522a0759209bc36fb198556bd4d507ff95756579fbdaa8abc9713a4002673b0"
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
