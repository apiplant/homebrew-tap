# Generated from packaging/homebrew/gliner-rs.rb in apiplant/gliner-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/gliner-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class GlinerRs < Formula
  desc "Rust (candle) inference for GLiNER2 checkpoints"
  homepage "https://github.com/apiplant/gliner-rs"
  version "0.3.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.3.0/gliner-rs-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "4ab59b22d9b4b2afee32d2edfe66b1810ee451b44667f830f4d5baccc3283384"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.3.0/gliner-rs-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4176bfed1420d15c2158873ad930136a104b66e168a0e59af865ce9a68e7194d"
    end
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.3.0/gliner-rs-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "989ece9aa756bdcc654bf7e51de94a763875346b38b965ba241c2bbc60d7e65d"
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
