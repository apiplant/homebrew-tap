# Generated from packaging/homebrew/apiplant.rb in apiplant/apiplant by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/apiplant.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Apiplant < Formula
  desc "Point it at an app directory and it serves an API"
  homepage "https://github.com/apiplant/apiplant"
  version "0.11.0"
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
      url "https://github.com/apiplant/apiplant/releases/download/v0.11.0/apiplant-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "e478c036e68bf9d2d16c27e5aa0cb2cf5ba2438bc0f26197523b401b2537db81"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/apiplant/releases/download/v0.11.0/apiplant-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db4d8273a6d76786182bbffa1853118496d463fe08353c4118ddb2e5e5c236dd"
    end
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.11.0/apiplant-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc12761f15ff6af09bcb5e37bf3c6dcc74f4de39f366c88c554970f278b5d73f"
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
