class Clearcam < Formula
  desc "NVR with AI object detection."
  homepage "https://github.com/roryclear/clearcam"
  url "https://github.com/roryclear/clearcam/releases/download/0.1.1/clearcam-0.1.1-macos.zip"
  sha256 "281877116aa30b48d26614f67965cce4098dbe72e870e508830c7258c0e342b4"
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
