# Generated from packaging/homebrew/gliner-rs.rb in apiplant/gliner-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/gliner-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class GlinerRs < Formula
  desc "Rust (candle) inference for GLiNER2 checkpoints"
  homepage "https://github.com/apiplant/gliner-rs"
  version "0.2.1"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.1/gliner-rs-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "8c9094c28f7d3b6a566f334d89050517ed3be759156f4f899e876e14ce007555"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.1/gliner-rs-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d28ea9b0bbdd3725eea30f3328ffc1fdea509bfe4fb14bf962f064bbd00c9ff1"
    end
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.1/gliner-rs-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8e5fb838a3df674c2799b8e48f8fde5a426549e57c86af8244be9f76854cc98"
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
