# Generated from packaging/homebrew/gliner-rs.rb in apiplant/gliner-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/gliner-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class GlinerRs < Formula
  desc "Rust (candle) inference for GLiNER2 checkpoints"
  homepage "https://github.com/apiplant/gliner-rs"
  version "0.3.1"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.3.1/gliner-rs-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "f0f341e401f49a676cc8f2b183fa09be5af97167c0d93c94ef062b5ac6d2cd44"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.3.1/gliner-rs-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4b552b4ca9fbf7e734a0c3a2509559af80387d368eb8606a0829194856f66bc"
    end
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.3.1/gliner-rs-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a9f2c6b0a649c85867059a21e05dfe1f5b3504b556fbe12c547a2dc4a4302f4"
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
