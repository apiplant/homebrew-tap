# Generated from packaging/homebrew/gliner-rs.rb in apiplant/gliner-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/gliner-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class GlinerRs < Formula
  desc "Rust (candle) inference for GLiNER2 checkpoints"
  homepage "https://github.com/apiplant/gliner-rs"
  version "0.1.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.1.0/gliner-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "dc2e45fb5323aa58d29ea6229a1ae2cf62cb21327548864e1dab42db59619078"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.1.0/gliner-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8d17bd9f8e40d64e9b1f7828d977ad05ff2af8c3002a52003a15a95b212c5a9"
    end
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.1.0/gliner-rs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75b179dc1f80f6a36da24f225a019d351c12e0db1e80058af2363d24f368d8ab"
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
