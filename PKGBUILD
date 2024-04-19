# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.17.5
pkgrel=1
pkgdesc="Interactive SDR receiver waterfall for many devices."
arch=(x86_64)
url="http://gqrx.dk/"
license=(GPL3)
depends=(gcc-libs glibc hicolor-icon-theme libvolk qt6-base qt6-svg)
makedepends=(
  boost
  cmake
  gnuradio
  gnuradio-osmosdr
  libpulse
)
source=(https://github.com/gqrx-sdr/$pkgname/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('d349185b3016bee7ea8f27d89f21eb65f5321e09590538f37186cdef78bf0ed7')
b2sums=('0437438e16c818be645e0ad9de02cb73e783218e06e97ba460a2553b89765b68e72d4c162d6ba0ed52da49795bd2807c9290f41cf20783c691cdd87a1564686c')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  depends+=(
    gnuradio libgnuradio-{analog,blocks,digital,fft,filter,network,pmt,runtime}.so
    gnuradio-osmosdr libgnuradio-osmosdr.so
    libpulse libpulse.so libpulse-simple.so
  )

  DESTDIR="$pkgdir" cmake --install build
}
