# Generated from packaging/homebrew/portward.rb in apiplant/portward by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/portward.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Portward < Formula
  desc "Live map of listening ports on localhost, with a web UI"
  homepage "https://github.com/apiplant/portward"
  version "0.3.2"
  license "MIT"

  # There are no bottles: the release archives *are* the binaries, so the
  # formula only unpacks what the tagged workflow already built for each
  # platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/portward/releases/download/v0.3.2/portward-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "3644823a3c67b2eb6cf31737c42692c16e22aab25cb3dccd9ac2b35698d89c6e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/portward/releases/download/v0.3.2/portward-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c3904d2bf7fa2e7ee91254154dbd515a55a6fbe90c30d03c9b365dca54dc708"
    end
    on_arm do
      url "https://github.com/apiplant/portward/releases/download/v0.3.2/portward-v0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffe422fd15ec28a67aa602eaba2dd170e229bf4b6be7e70cb151330728038730"
    end
  end

  # lsof does the actual port discovery; portward just shells out to it.
  depends_on "lsof" => :recommended

  def install
    bin.install "portward"
    doc.install "README.md"
  end

  # macOS has no systemd; `brew services` (launchd under the hood) is the
  # platform service wrapper for Homebrew installs.
  service do
    run [opt_bin/"portward"]
    keep_alive true
    log_path var/"log/portward.log"
    error_log_path var/"log/portward.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/portward version")
  end
end
