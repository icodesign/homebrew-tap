class RemoteInstaller < Formula
  desc "Share signed iOS and Android builds over a temporary HTTPS tunnel"
  homepage "https://github.com/icodesign/remote-installer"
  version "0.2.0"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.2.0/remote-installer-0.2.0-darwin-arm64.tar.gz"
    sha256 "7109c86ef3ff89fb2e221fff22f4a3b4ae13c696dfbec41e3a8c4d1b9f246540"
  elsif Hardware::CPU.intel?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.2.0/remote-installer-0.2.0-darwin-x86_64.tar.gz"
    sha256 "eb386b57a0d19ef87c064ed809e6e052a1ca3d2d1c2aac58df88bd22da4e0243"
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
