class RemoteInstaller < Formula
  desc "Share signed iOS and Android builds over a temporary HTTPS tunnel"
  homepage "https://github.com/icodesign/remote-installer"
  version "0.3.0"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.3.0/remote-installer-0.3.0-darwin-arm64.tar.gz"
    sha256 "3413c44232ac900d6b7a37d9845932208994b53d9acb3387bb1c35aa296353f5"
  elsif Hardware::CPU.intel?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.3.0/remote-installer-0.3.0-darwin-x86_64.tar.gz"
    sha256 "56df6cda5ccf8e9853d011ee0b4450af1d7694572741abb826c9a2bd1082a316"
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
