# Generated from packaging/homebrew/imajev-rs.rb in apiplant/imajev-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/imajev-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class ImajevRs < Formula
  desc "Rust (candle) inference for the Imajev image decision model"
  homepage "https://github.com/apiplant/imajev-rs"
  version "0.1.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/imajev-rs/releases/download/v0.1.0/imajev-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "c4b4dbadb601fbbbfc2a3744a1630b0fc2a714c438e5659649ff755ab83c8701"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/imajev-rs/releases/download/v0.1.0/imajev-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "16d915801e9bef0f64238ac89092f5f301a7989150be3622f1876564546670c7"
    end
    on_arm do
      url "https://github.com/apiplant/imajev-rs/releases/download/v0.1.0/imajev-rs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d1c1413630dd26ef92c8697f67cc57748811b028512b277d0c7d867c4b06ede"
    end
  end

  def install
    bin.install "imajev"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imajev --version").split(" ").last
  end
end
