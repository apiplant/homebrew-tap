# Generated from packaging/homebrew/gliner-rs.rb in apiplant/gliner-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/gliner-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class GlinerRs < Formula
  desc "Rust (candle) inference for GLiNER2 checkpoints"
  homepage "https://github.com/apiplant/gliner-rs"
  version "0.2.4"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.4/gliner-rs-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "244cefbbf2672974e679b867d9f993a74b0f58abc1fb4865576adbf6841c0839"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.4/gliner-rs-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5d2b0dbe0716e0315a46909df338c3d1100f73daacbc441bd07c4688cebbf30"
    end
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.4/gliner-rs-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "525d322118e9c1b99d6fa808b4914b1f71daeec9db74bc3f9bd37c40c720a3a9"
    end
  end

  def install
    bin.install "gliner"
    bin.install "gliner-classify"
    bin.install "gliner-pii"
    bin.install "gliner-guardrails"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gliner-classify --version").split(" ").last
  end
end
