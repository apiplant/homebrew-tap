# Generated from packaging/homebrew/opendlss-rs.rb in apiplant/opendlss-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/opendlss-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class OpendlssRs < Formula
  desc "Rust host and model tools for the OpenDLSS-NR neural renderer"
  homepage "https://github.com/apiplant/opendlss-rs"
  version "0.1.1"
  license "MIT"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/opendlss-rs/releases/download/v0.1.1/opendlss-rs-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "f7ac50bfa5fb34222b367c3cf07357b9f548bcd51289c5887b222562f8e95be9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/opendlss-rs/releases/download/v0.1.1/opendlss-rs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2dbcb6d6a6ab63d5ac3825f93a5b00359cefa4f0365e2393de0a911d79dae60"
    end
    on_arm do
      url "https://github.com/apiplant/opendlss-rs/releases/download/v0.1.1/opendlss-rs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "152f627d636171de1f05edc2aac48c4a0af385420e5a2a3263eedbf15642f60a"
    end
  end

  def install
    bin.install "opendlss-nr"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opendlss-nr --version")
  end
end
