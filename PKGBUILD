# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl-git
pkgver=0.1.r188.848d89b
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://github.com/djpohly/dwl"
license=('GPL')
depends=('wlroots')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/djpohly/dwl')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr/" install
}
