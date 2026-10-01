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
      sha256 "f3bcf199f03e349874b33e0f328a470b09391f15a612bfa8015cec2abf8570ce"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.4/gliner-rs-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e53938d45d1689215f21f63460e24ac1d9df33f47cc77522803f5d3ad655e1d"
    end
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.4/gliner-rs-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f51544e0c77895a78bfdc94031429384e65a640c27e2ab2446bf02f200337e8"
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
