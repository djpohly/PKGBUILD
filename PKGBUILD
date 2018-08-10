# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=pcf2bdf-git
pkgver=16+gfbc3c0a
pkgrel=1
pkgdesc="Convert X font from PCF to BDF"
arch=('i686' 'x86_64')
url="https://github.com/ganaware/pcf2bdf"
license=('custom:X11')
depends=('gcc-libs')
makedepends=('git')
provides=('pcf2bdf')
conflicts=('pcf2bdf')
source=('git://github.com/ganaware/pcf2bdf.git')
md5sums=('SKIP')

pkgver() {
	cd "pcf2bdf"
	echo "$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)"
}

build() {
	make -C "pcf2bdf" -f "Makefile.gcc"
}

package() {
	make -C "pcf2bdf" -f "Makefile.gcc" PREFIX=/usr DESTDIR="$pkgdir" install
}
