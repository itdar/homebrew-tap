class AiAgency < Formula
  desc "AI agent session launcher - AGENTS.md-based multi-agent orchestration"
  homepage "https://github.com/itdar/ai-agency"
  url "https://github.com/itdar/ai-agency/archive/refs/tags/v3.2.2.tar.gz"
  version "3.2.2"
  sha256 "f5624b7e6b33692f439092e6b9604b614244c3cc424de54d910cec1c42621b98"
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
