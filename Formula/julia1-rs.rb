# Generated from packaging/homebrew/julia1-rs.rb in apiplant/julia1-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/julia1-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class Julia1Rs < Formula
  desc "Rust CPU/CUDA inference runtime for the Julia-1 decision model"
  homepage "https://github.com/apiplant/julia1-rs"
  version "0.2.1"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.2.1/julia1-rs-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "81f4cf129c9096f88711e39b2959418aa741ce0f4e57951eefdc14ab6315b98a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.2.1/julia1-rs-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "317c5c82f1cb41af6d52cd6d27e41ce6a7e24f2883ba2f41645ec4a06c01bcce"
    end
    on_arm do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.2.1/julia1-rs-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "642a4c5bad63de4bf06c5f011e8a39dbdd06089bfaac4e908470879ee4fe6a54"
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
