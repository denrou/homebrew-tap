class Slack < Formula
  desc "Read and answer Slack from the terminal"
  homepage "https://github.com/denrou/slack"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/denrou/slack/releases/download/v0.24.0/slack-v0.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "38d876239ff030f6b5fb370f3406cce1a4776a9d7c9da60bc5b49758195f4db1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/denrou/slack/releases/download/v0.24.0/slack-v0.24.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4048b582ff36906347dab39bb9acc83bc3956b6982e09f658a2f704258790320"
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
