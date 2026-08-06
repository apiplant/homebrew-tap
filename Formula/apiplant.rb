# Generated from packaging/homebrew/apiplant.rb in apiplant/apiplant by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/apiplant.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Apiplant < Formula
  desc "Point it at an app directory and it serves an API"
  homepage "https://github.com/apiplant/apiplant"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  # There are no bottles: the release archives *are* the binaries, so the
  # formula only unpacks what the workflow already built for each platform.
  # macOS x86_64 is absent because the release does not build it.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.7.0/apiplant-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "8f728936b7a09358b481313146b7ffff4bbab2da27710e47c79b1803430367ff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/apiplant/releases/download/v0.7.0/apiplant-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "597ae9ae68d597a33f7023c90b97baf206908585703e60c60396cd27ac9f452e"
    end
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.7.0/apiplant-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "abf7cb0dd79f6470463dda50fa43dae73ee2f67a2b9866152d2df3c5e5446498"
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
