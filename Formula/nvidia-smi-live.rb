# Generated from packaging/homebrew/nvidia-smi-live.rb in
# apiplant/nvidia-smi-live by the release workflow, which fills in the version
# and checksums and commits the result to apiplant/homebrew-tap as
# Formula/nvidia-smi-live.rb. Changes belong in the source repository: the
# next release overwrites this file.
class NvidiaSmiLive < Formula
  desc "Live-updating nvidia-smi with a minimal terminal UI"
  homepage "https://github.com/apiplant/nvidia-smi-live"
  version "0.1.1"
  license "MIT"

  # NVML is a Linux driver interface: there is no macOS build, so the formula
  # only serves Linuxbrew. There are no bottles either — the release archives
  # *are* the binaries, so the formula only unpacks what the tagged workflow
  # already built for each platform.
  on_linux do
    on_intel do
      url "https://github.com/apiplant/nvidia-smi-live/releases/download/v0.1.1/nvidia-smi-live-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1e5666f724f3bd514869a0ff768e0b35529336aab117cde83b83c7dd4669336"
    end
    on_arm do
      url "https://github.com/apiplant/nvidia-smi-live/releases/download/v0.1.1/nvidia-smi-live-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ab0abce9a649337e09441bea87d510ecd02fa6fad51e5be55fa253ead59c9e0"
    end
  end

  def install
    bin.install "nvidia-smi-live"
    doc.install "README.md"
  end

  test do
    # No driver on the test runner: the binary must fail cleanly, and it must
    # report its version before it ever touches NVML.
    assert_match version.to_s, shell_output("#{bin}/nvidia-smi-live --version", env: {"HOME" => ENV["HOME"]}).split("\n").first
  end
end