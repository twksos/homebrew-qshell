class Qshell < Formula
  desc "Shell for QiNiu"
  homepage "https://github.com/qiniu/qshell"
  url "http://devtools.qiniu.com/qshell-v2.0.0.zip"
  sha256 "b4fdf193ceb0e5d8cba0fc3968aa230d2798516a909495c5eb35c9cbae9e588e"

  def install
    uname = `uname -a`
    binary_file = "qshell_darwin_amd64" if uname.match /x86_64/
    binary_file = "qshell_darwin_386" if uname.match /i386/
    puts "Use binary file: #{binary_file}."
    throw :NO_SUITABLE_BINARY unless binary_file
    system "mv", binary_file, "qshell"
    bin.install "qshell"
  end

  test do
    system "#{bin}/qshell", "-v"
  end
end
