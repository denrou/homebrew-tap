class Slack < Formula
  desc "Read and answer Slack from the terminal"
  homepage "https://github.com/denrou/slack"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/denrou/slack/releases/download/v0.22.0/slack-v0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "771b77723ab765b0c9ee6079f7afc9b01b20dba93568e55f3755af03a75defd9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/denrou/slack/releases/download/v0.22.0/slack-v0.22.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "783c02a59c8d97a90ae376a94bcd0a2811ae4bf19ea35e5d65e8b64ff1d2062a"
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
