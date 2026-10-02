# Generated from packaging/homebrew/laya-rs.rb in apiplant/laya-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/laya-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class LayaRs < Formula
  desc "Rust (candle) inference for Laya's typed-decision engine"
  homepage "https://github.com/apiplant/laya-rs"
  version "0.3.1"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binary, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.3.1/laya-rs-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "477ddf187cb1a5db8fbb5a24dc9c2160b5293e425725846a84b0cd28a8e4d0cf"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.3.1/laya-rs-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c3792c4bc7771fe5d98f5d51ac605dc70398ea7089487d5be6831b8c8f72602"
    end
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.3.1/laya-rs-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18fb42815310fde69f1489977d0b1d4072732e92c3bbea39a6035531978e016c"
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
