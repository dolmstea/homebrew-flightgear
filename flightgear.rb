require "formula"

class Flightgear < Formula
  homepage "http://www.flightgear.org"
  url "http://ftp.icm.edu.pl/packages/flightgear/Source/flightgear-3.2.0.tar.bz2"
  sha1 "89b187ecc891f880ec50a562fcf8281b587a37f2"

  depends_on "cmake" => :build
  depends_on :x11
  depends_on "open-scene-graph"
  depends_on "boost"
  depends_on "freeglut"
  depends_on "openal-soft"
  depends_on "plib"
  depends_on "simgear"


  resource "flightgear-data" do
    url "ftp://ftp.kingmont.com/flightsims/flightgear/Shared/FlightGear-data-3.2.0.tar.bz2"
    sha1 "d7bf617825339884c8ddb1e0ba583c0d53ffe281"
  end

  def install

    system "cmake", ".", *std_cmake_args
    system "make", "install"

    resource("flightgear-data").stage { (prefix/"fgfs.app"/"Contents"/"Resources"/"data").install Dir["./*"] }

  end

  test do
    # For now, all this does is open the .app bundle.
    system "open #{prefix}/fgfs.app"
  end
end
