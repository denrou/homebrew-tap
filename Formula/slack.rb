class Slack < Formula
  desc "Unread Slack messages in the terminal, with a screen to read and reply"
  homepage "https://github.com/denrou/slack"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/denrou/slack/releases/download/v0.21.0/slack-v0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "24dc16a3a7c4c02d67769fc44c15e6c56f32e3d250aa79a911a21327dd8d79c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/denrou/slack/releases/download/v0.21.0/slack-v0.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20941652e04376bc2b9a307097cdaee69ba2830d8b9e0c716a2a9b3cba96c29a"
    end
  end

  def install
    bin.install "slack"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/slack --version")
  end
end
