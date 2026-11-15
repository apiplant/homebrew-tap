# Generated from packaging/homebrew/apiplant-slim.rb in apiplant/apiplant by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/apiplant-slim.rb. Changes belong in
# the source repository: the next release overwrites this file.
#
# The slim build: the same program without TypeScript support, and so without
# the V8 engine that runs it — two thirds of the binary.
class ApiplantSlim < Formula
  desc "apiplant without TypeScript support (no V8)"
  homepage "https://github.com/apiplant/apiplant"
  version "0.11.1"
  license any_of: ["MIT", "Apache-2.0"]

  # Both formulae install `bin/apiplant`, so brew has to be told rather than
  # discovering it as a collision at link time.
  conflicts_with "apiplant", because: "both install the apiplant binary"

  # There are no bottles: the release archives *are* the binaries, so the
  # formula only unpacks what the tagged workflow already built for each
  # platform, and this template stays aligned with the CI release matrix.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.11.1/apiplant-slim-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "97d48d2bba2aa0f2b060926f74a3ef8d2c16c69e0d7c6ca85b0734777a4a9b26"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/apiplant/releases/download/v0.11.1/apiplant-slim-v0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08f4bd84a541ac4f0dba33844ac119e85e53e5f56870c3f9e2fc10eeffc62238"
    end
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.11.1/apiplant-slim-v0.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70fc65f4ad223ae078f7a7b92e82bcd90e085577927742d4a69d8ff76f239fe8"
    end
  end

  def install
    bin.install "apiplant"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      This is the slim build: no TypeScript. `apiplant build` refuses a .ts by
      name, and `apiplant run` reports any .js in functions/ as a function it
      cannot load. `brew install apiplant/tap/apiplant` for the full one.

      `apiplant build` shells out to a toolchain per language — cargo for .rs,
      cc for .c, zig for .zig, go for .go — so install whichever your functions
      use.
    EOS
  end

  test do
    output = shell_output("#{bin}/apiplant version")
    assert_match version.to_s, output
    # The thing that distinguishes this formula's binary from the other's.
    assert_match "slim", output
  end
end
