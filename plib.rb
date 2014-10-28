require "formula"

class Plib < Formula
  homepage "http://plib.sourceforge.net"
  url "http://plib.sourceforge.net/dist/plib-1.8.5.tar.gz"
  sha1 "c2cf7e3e1e58f7b63dae4bb21e4fa82c3e4d4cfc"

  def install

    # Inform user that we are going to disable the broken stuff.
    ohai "The following libraries do not work and are disabled: pw, sl, psl, ssg, ssgaux."

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--disable-pw",
                          "--disable-sl",
                          "--disable-psl",
                          "--disable-ssg",
                          "--disable-ssgaux"

    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test plib`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
