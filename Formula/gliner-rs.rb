# Generated from packaging/homebrew/gliner-rs.rb in apiplant/gliner-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/gliner-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class GlinerRs < Formula
  desc "Rust (candle) inference for GLiNER2 checkpoints"
  homepage "https://github.com/apiplant/gliner-rs"
  version "0.2.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.0/gliner-rs-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "350faeb68a9877df449ac0efb9884ac99b7366bac5cff1b9f06c5123afa85571"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.0/gliner-rs-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c80b33461d77fde497c2bef101863bb0fb2733d3a0906342df09f16f686d90d"
    end
    on_arm do
      url "https://github.com/apiplant/gliner-rs/releases/download/v0.2.0/gliner-rs-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de9ca5d476620b2a0e07ea9d142c8289bebd64cc6c124984e348125835114b8a"
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
