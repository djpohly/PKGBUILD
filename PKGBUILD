# Maintainer: Devin J. Pohly <djpohly@gmail.com>
pkgname=rmx-api-git
pkgver=r1168.5c4fdc4
pkgrel=1
pkgdesc=""
arch=(x86_64)
url="https://github.com/devinpohly/remicss"
license=('GPL')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+ssh://git@github.com/devinpohly/remicss')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/remicss"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/remicss"
	make librmx_api.so
}

package() {
	cd "$srcdir/remicss"
  install -Dm755 librmx_api.so "$pkgdir/usr/lib/librmx_api.so"
  install -Dm644 rmx_api.h "$pkgdir/usr/include/rmx_api.h"
}
