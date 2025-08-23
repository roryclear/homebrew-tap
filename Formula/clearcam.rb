class Clearcam < Formula
  desc "NVR with AI object detection."
  homepage "https://github.com/roryclear/clearcam"
  url "https://github.com/roryclear/clearcam/releases/download/0.1.0/clearcam-0.1.0-macos.zip"
  sha256 "cfe653452bbb04f717c01ed501183f78450a59724aab80fbfd238a3c9d3addc5"
  license "AGPL"
  depends_on "ffmpeg"

  def install
    system "pwd"
    system "ls", "-la"
    
    if Dir.exist?("clearcam")
      puts "clearcam directory exists, contents:"
      system "ls", "-la", "clearcam"
      bin.install "clearcam/clearcam"
      chmod 0755, bin/"clearcam"
    else
      puts "clearcam directory does not exist! Current contents:"
      system "ls", "-laR", "."
      raise "clearcam directory not found in extracted archive"
    end
  end
  test do
    system "#{bin}/clearcam", "--version"
  end
end
