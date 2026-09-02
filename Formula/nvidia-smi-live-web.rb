# Generated from packaging/homebrew/nvidia-smi-live-web.rb in
# apiplant/nvidia-smi-live by the release workflow, which fills in the version
# and checksums and commits the result to apiplant/homebrew-tap as
# Formula/nvidia-smi-live-web.rb. Changes belong in the source repository: the
# next release overwrites this file.
class NvidiaSmiLiveWeb < Formula
  desc "Live nvidia-smi monitor for the browser"
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
    bin.install "nvidia-smi-live-web"
    doc.install "README.md"
  end

  # macOS has no systemd; Linuxbrew installs run under a user manager, and
  # `brew services` (launchd-style wrappers) is the platform service wrapper.
  service do
    program options "--port", "7680"
    keep_alive true
    log_path var/"log/nvidia-smi-live-web.log"
    error_log_path var/"log/nvidia-smi-live-web.log"
  end

  test do
    # No driver on the test runner: the binary must fail cleanly, and it must
    # report its version before it ever touches NVML.
    assert_match version.to_s, shell_output("#{bin}/nvidia-smi-live-web --version")
  end
end