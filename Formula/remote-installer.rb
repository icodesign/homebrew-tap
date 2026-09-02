class RemoteInstaller < Formula
  desc "Share a signed iOS build over a temporary HTTPS tunnel"
  homepage "https://github.com/icodesign/remote-installer"
  version "0.1.3"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.1.3/remote-installer-0.1.3-darwin-arm64.tar.gz"
    sha256 "dfdce4d10de7a6d57422fbb0da3fa8d7eec5d31db10fc410a9e281c8a8c9d387"
  elsif Hardware::CPU.intel?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.1.3/remote-installer-0.1.3-darwin-x86_64.tar.gz"
    sha256 "31276ced9102f5e7a63a095a87ecb1b182a3e6f031109a5eb31fae26f167c020"
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
