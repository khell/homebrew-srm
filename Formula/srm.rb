class Srm < Formula
  desc "Command-line program to delete files securely"
  homepage "https://srm.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/srm/1.2.15/srm-1.2.15.tar.gz"
  sha256 "7583c1120e911e292f22b4a1d949b32c23518038afd966d527dae87c61565283"

  bottle do
    sha256 cellar: :any_skip_relocation, sierra: "9143af437ad365572a4440c5e4cef405e2288f46978879383d93f2f47c206b0a"
    sha256 cellar: :any_skip_relocation, el_capitan: "d035ef3e47fa1d69a7c05f4e0224e72bcb71b90664dae66c358dd769ba0bbaae"
    sha256 cellar: :any_skip_relocation, yosemite: "86c16f244e295dd1f3b81cabb162856250ad26f00778efc4e7afbb864334337d"
  end

  keg_only :provided_by_osx if MacOS.version < :sierra

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    touch "srm_test"
    system bin/"srm", "srm_test"
    !File.exist? "srm_test"
  end
end
