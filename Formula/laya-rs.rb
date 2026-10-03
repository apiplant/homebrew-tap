# Generated from packaging/homebrew/laya-rs.rb in apiplant/laya-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/laya-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class LayaRs < Formula
  desc "Rust (candle) inference for Laya's typed-decision engine"
  homepage "https://github.com/apiplant/laya-rs"
  version "0.4.1"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binary, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.4.1/laya-rs-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "8ad34fbe91c00b3429cdb8981b3c50b33ab2ddee9cfa0421a364f174c20742a7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.4.1/laya-rs-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9a3c737db078d7a01eb8637aa6a71a330508979530cb5fdd282e977f1413275"
    end
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.4.1/laya-rs-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c687397eb939bc1318c1f6ada83f1dd1abe8eeba346c2420ec409d751e1bd52"
    end
  end

  def install
    bin.install "laya"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/laya --version").split(" ").last
  end
end
