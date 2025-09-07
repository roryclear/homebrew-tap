class Clearcam < Formula
  desc "NVR with AI object detection."
  homepage "https://github.com/roryclear/clearcam"
  url "https://github.com/roryclear/clearcam/releases/download/0.1.1/clearcam-0.1.1-macos.zip"
  sha256 "e198f72fc5e818e62a111d0e087b22975224b52f1d5cbdbd674d385953ca016d"
  license "AGPL"
  depends_on "ffmpeg"

  def install
    libexec.install Dir["*"]
    (bin/"clearcam").write <<~EOS
      #!/bin/bash
      "#{libexec}/clearcam" "$@"
    EOS
    chmod 0755, bin/"clearcam"
  end

  test do
    system "#{bin}/clearcam", "--version"
  end
end
