# Generated from packaging/homebrew/apiplant.rb in apiplant/apiplant by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/apiplant.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Apiplant < Formula
  desc "Point it at an app directory and it serves an API"
  homepage "https://github.com/apiplant/apiplant"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]

  # There are no bottles: the release archives *are* the binaries, so the
  # formula only unpacks what the tagged workflow already built for each
  # platform. packaging/local-release.sh can add extra host-built assets later,
  # but this template stays aligned with the CI release matrix.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.8.0/apiplant-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "805b6f695f1e9462066354d7d6bff58ec49ecb3ecd0a6f69f8adf54f2e2d0517"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/apiplant/releases/download/v0.8.0/apiplant-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "908b274f62c57d85d121ce5f73b6f94cb5a3d761ebb30a2a660d0a4d1d59c40e"
    end
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.8.0/apiplant-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "79892cebd1ee36cbe451bf24a29e31fe9ee702ce78d86aa4e73d96447ecf0a4e"
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
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/apiplant version")
  end
end
