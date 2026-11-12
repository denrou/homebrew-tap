class GhPrs < Formula
  desc "List the GitHub pull requests and issues that need your attention"
  homepage "https://github.com/denrou/gh-prs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/denrou/gh-prs/releases/download/v0.20.0/gh-prs-v0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "45a38a0b282d0d3b4beb7d4a7ef1126cd5f2081b706a3f59cfa8f5161537eb76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/denrou/gh-prs/releases/download/v0.20.0/gh-prs-v0.20.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33ed604de632ca48b63c1dc326b5f2bffa63b642a9ad2789db9c6bc744389e71"
    end
  end

  def install
    bin.install "gh-prs", "gh-issues"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-prs --version")
    assert_match version.to_s, shell_output("#{bin}/gh-issues --version")
  end
end
