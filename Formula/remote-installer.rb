class RemoteInstaller < Formula
  desc "Share a signed iOS build over a temporary HTTPS tunnel"
  homepage "https://github.com/icodesign/remote-installer"
  version "0.1.1"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.1.1/remote-installer-0.1.1-darwin-arm64.tar.gz"
    sha256 "c4cd210892b55972b786ddb6a2c154facb3532bce23b37fadffcb1a5487b83d9"
  elsif Hardware::CPU.intel?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.1.1/remote-installer-0.1.1-darwin-x86_64.tar.gz"
    sha256 "db6ab53cf872e411ac399e1ea187df4ecc12978ea4a2a31949898deb666286be"
  else
    odie "remote-installer only provides macOS arm64 and x86_64 binaries"
  end

  def install
    bin.install "remote-installer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/remote-installer --version")
  end
end
