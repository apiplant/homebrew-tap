# Generated from packaging/homebrew/gliner-rs.rb in apiplant/gliner-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/gliner-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class GlinerRs < Formula
  desc "Rust (candle) inference for GLiNER2 checkpoints"
  homepage "https://github.com/apiplant/gliner-rs"
  version "0.2.2"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.2/gliner-rs-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "74d89d7014e62c03fe7907b2449b0baeb7a2582a4c11b373c88874f9ae974428"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.2/gliner-rs-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78d72ea8d74eb40437ce63e2928e3f9da9064b9ed697e5562e0a0533d988b1d8"
    end
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.2/gliner-rs-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a705eb9b3c91d1298cd5fb0a508d50a9206d9e55b409a436d4ecedfddd83e8a"
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
