# Generated from packaging/homebrew/gliner-rs.rb in apiplant/gliner-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/gliner-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class GlinerRs < Formula
  desc "Rust (candle) inference for GLiNER2 checkpoints"
  homepage "https://github.com/apiplant/gliner-rs"
  version "0.2.3"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.3/gliner-rs-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "fef1696cba2dad635146b739237401da0d4a98ab5accd8e29f6e944de03a27f8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.3/gliner-rs-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ef64f151ca3af2ef5a61603d962ace8764183a7930de4f01439c62bf2ef3ec6"
    end
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.3/gliner-rs-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "999706cdcf8920726eb7d1a354a9bc58ef31d4172e185a5bf20f294c5c1d07c8"
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
