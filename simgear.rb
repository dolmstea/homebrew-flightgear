require "formula"

class Simgear < Formula
  homepage "http://www.flightgear.org"
  url "http://mirrors.ibiblio.org/simgear/ftp/Source/simgear-3.2.0.tar.bz2"
  sha1 "6e384a70bafc9145477cdc6b50d746667d52103d"

  depends_on "cmake" => :build
  depends_on :x11
  depends_on "open-scene-graph"
  depends_on "zlib"
  depends_on "openal-soft"
  depends_on "subversion" => :optional


  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test simgear`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
