class RemoteInstaller < Formula
  desc "Share signed iOS and Android builds over a temporary HTTPS tunnel"
  homepage "https://github.com/icodesign/remote-installer"
  version "0.4.0"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.4.0/remote-installer-0.4.0-darwin-arm64.tar.gz"
    sha256 "f06e601e03909d12d56324d23e83c9f643a6d951e0886ac57f87eeffcfcec8fc"
  elsif Hardware::CPU.intel?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.4.0/remote-installer-0.4.0-darwin-x86_64.tar.gz"
    sha256 "6a1ca07ef6b630751cb8bd14f160a05051913c09ec152e1cdcb09a4dc961f8c2"
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
