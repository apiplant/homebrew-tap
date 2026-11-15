# Generated from packaging/homebrew/apiplant.rb in apiplant/apiplant by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/apiplant.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Apiplant < Formula
  desc "Point it at an app directory and it serves an API"
  homepage "https://github.com/apiplant/apiplant"
  version "0.11.1"
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
      url "https://github.com/apiplant/apiplant/releases/download/v0.11.1/apiplant-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "37bef295e3a2bc610828fc8c87af2362628c2b92c7d62b14cd8960a4a1538fa2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/apiplant/releases/download/v0.11.1/apiplant-v0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe9c93043536a521814582fa65bd3cf41bb67af8ace9fdde75403759bea6f5c3"
    end
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.11.1/apiplant-v0.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1cc4b500bad32197d64c1e0cd6c776c600c8de89845d14ca6d706baad6d7fd26"
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
