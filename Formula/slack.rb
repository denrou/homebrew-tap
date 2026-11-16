class Slack < Formula
  desc "Read and answer Slack from the terminal"
  homepage "https://github.com/denrou/slack"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/denrou/slack/releases/download/v0.23.0/slack-v0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "03b88dee64f5622bc459f875f400a601f7ddce10dca94ee974d8ae6eca4b57c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/denrou/slack/releases/download/v0.23.0/slack-v0.23.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fdcf484aa6b22e4b53dcf201b176a5cb3ace249806c468ce79ae0cbf2a08490c"
    end
  end

  def install
    bin.install "slack"
    pkgshare.install "skills"
  end

  def caveats
    <<~EOS
      The skill that teaches Claude Code to use slack is installed with it.
      To enable it, link it once (it then follows brew upgrade):
        mkdir -p ~/.claude/skills
        ln -sfn #{opt_pkgshare}/skills/slack ~/.claude/skills/slack
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/slack --version")
    assert_path_exists pkgshare/"skills/slack/SKILL.md"
  end
end
