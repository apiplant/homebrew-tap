# Generated from packaging/homebrew/portward.rb in apiplant/portward by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/portward.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Portward < Formula
  desc "Live map of listening ports on localhost, with a web UI"
  homepage "https://github.com/apiplant/portward"
  version "0.3.1"
  license "MIT"

  # There are no bottles: the release archives *are* the binaries, so the
  # formula only unpacks what the tagged workflow already built for each
  # platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/portward/releases/download/v0.3.1/portward-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "5fea5f196effae3ae71cfaf8e14132903535019e79e802948614568b331c0a50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/portward/releases/download/v0.3.1/portward-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85971eae4fc719d68b65bdd714509cb6b8c20502f9f68212bddc7000eaa42593"
    end
    on_arm do
      url "https://github.com/apiplant/portward/releases/download/v0.3.1/portward-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1e7439b34a2fe675307cd42169bccfcd1c6f8c2dd685c80cd2591caf0e33836"
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
