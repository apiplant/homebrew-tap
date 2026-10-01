# Generated from packaging/homebrew/julia1-rs.rb in apiplant/julia1-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/julia1-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class Julia1Rs < Formula
  desc "Rust CPU/CUDA inference runtime for the Julia-1 decision model"
  homepage "https://github.com/apiplant/julia1-rs"
  version "0.1.1"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.1.1/julia1-rs-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "2611606386a7e903d0946ae6bef0ba7c6aa0d5beef97a6d7013a3b63fedcd5e2"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.1.1/julia1-rs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6765b67b7ff44412d487ecdfcabfbdef03273309f57d185c713ca8beddd13091"
    end
    on_arm do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.1.1/julia1-rs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "563e04da9bdef82d885186903db1cf0df05e5457bb75cd86ed2070c4733b311b"
    end
  end

  conflicts_with "julia1-rs-cuda", because: "both install the same binaries"

  def install
    bin.install "julia1"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julia1 --version")
  end
end
