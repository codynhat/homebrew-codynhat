class Libimobiledevice < Formula
    desc "Library to communicate with iOS devices natively"
    homepage "https://www.libimobiledevice.org/"
    revision 1
  
    url "https://github.com/codynhat/libimobiledevice.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "libxml2"
  
    depends_on "pkg-config" => :build
    depends_on "libplist"
    depends_on "libtasn1"
    depends_on "libusbmuxd"
    depends_on "openssl@1.1"
  
    def install
      system "./autogen.sh"
      system "./configure", "--disable-dependency-tracking",
                            "--disable-silent-rules",
                            "--prefix=#{prefix}",
                            # As long as libplist builds without Cython
                            # bindings, libimobiledevice must as well.
                            "--without-cython",
                            "--enable-debug-code"
      system "make", "install"
    end
  
    test do
      system "#{bin}/idevicedate", "--help"
    end
  end