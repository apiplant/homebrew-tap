# Generated from packaging/homebrew/julia1-rs.rb in apiplant/julia1-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/julia1-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class Julia1Rs < Formula
  desc "Rust CPU/CUDA inference runtime for the Julia-1 decision model"
  homepage "https://github.com/apiplant/julia1-rs"
  version "0.2.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.2.0/julia1-rs-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "e44ebe4f56e8917fd17f851c187ed133a5a664c0c39123c7a3a64ab2b257af50"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.2.0/julia1-rs-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2daab715516c99705ed1aa78c97680a240d36aec2c6250ec430623c91d94df2"
    end
    on_arm do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.2.0/julia1-rs-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16f167cf8b835a423d6ad0e527f92de0c224b446325725b35312ce049fc95071"
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
