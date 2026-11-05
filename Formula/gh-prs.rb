class GhPrs < Formula
  desc "CLI for listing GitHub pull requests that need your attention"
  homepage "https://github.com/denrou/gh-prs"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/denrou/gh-prs/releases/download/v0.19.0/gh-prs-v0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "75d74eb20281fd5561034d69f910cd9f1034d664e69b5788f54e262e2fdfd408"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/denrou/gh-prs/releases/download/v0.19.0/gh-prs-v0.19.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a7be70b0f485d1bded0ff0eaeb7d3db492272639ebc6a49a738e5ea197d9aae7"
    end
  end

  def install
    bin.install "gh-prs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-prs --version")
  end
end
