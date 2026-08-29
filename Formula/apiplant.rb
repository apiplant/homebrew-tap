# Generated from packaging/homebrew/apiplant.rb in apiplant/apiplant by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/apiplant.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Apiplant < Formula
  desc "Point it at an app directory and it serves an API"
  homepage "https://github.com/apiplant/apiplant"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]

  # `apiplant-slim` is the same program without TypeScript support, and installs
  # the same `bin/apiplant`. brew has to be told, rather than discovering it as
  # a collision at link time.
  conflicts_with "apiplant-slim", because: "both install the apiplant binary"

  # There are no bottles: the release archives *are* the binaries, so the
  # formula only unpacks what the tagged workflow already built for each
  # platform, and this template stays aligned with the CI release matrix.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.10.0/apiplant-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "b50b37d7b02b0faed89f7abf22d67dc3e2cdc6034e0957632e7c9e71c4d92851"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/apiplant/releases/download/v0.10.0/apiplant-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0fcc9863a261b3c3859c8a22f649d2e0955b379a9a46b5aac68674a9d8d7dd74"
    end
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.10.0/apiplant-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d81d9063ddae5a18f926524b5cb638f059bd698f46168fb27322dbc42c7b7cd"
    end
  end

  def install
    bin.install "apiplant"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      `apiplant build` shells out to a toolchain per language — cargo for .rs,
      cc for .c, zig for .zig, go for .go — so install whichever your functions
      use. TypeScript needs nothing; it is transpiled in-process.

      For a build without TypeScript — and so without V8, which is two thirds
      of the binary — use `brew install apiplant/tap/apiplant-slim`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/apiplant version")
  end
end
