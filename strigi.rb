class Strigi < Formula
  desc "Program for fast indexing and searching personal data"
  homepage "http://www.vandenoever.info/software/strigi/"
  url "http://www.vandenoever.info/software/strigi/strigi-0.7.8.tar.bz2"
  sha256 "43e461a625acdefa59bf58cc9d10aebda9eba920dfbe800fc77e6dcbf1eff989"

  depends_on "cmake" => :build
  depends_on "clucene"
  depends_on "exiv2" => :optional

  def install
    ENV["CLUCENE_HOME"] = HOMEBREW_PREFIX
    ENV["EXPAT_HOME"] = "/usr/"

    system "cmake", ".", "-DENABLE_EXPAT:BOOL=ON",
                         "-DENABLE_DBUS:BOOL=OFF",
                         *std_cmake_parameters
    system "make", "install"
  end
end
