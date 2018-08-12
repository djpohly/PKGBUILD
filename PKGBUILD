# Maintainer: David Phillips <dbphillipsnz@gmail.com>

_pkgname=sent
pkgname=${_pkgname}-git
pkgver=r131.c8a937f
pkgrel=2
pkgdesc="Simple plain-text presentation tool"
arch=('i686' 'x86_64')
url="http://tools.suckless.org/${_pkgname}"
license=('MIT')
depends=('fontconfig' 'libxft')
optdepends=('farbfeld: PNG and JPEG support')
makedepends=('git')
provides=('sent')
conflicts=('sent')
source=("${pkgname}::git://github.com/djpohly/${_pkgname}")
#        "config.h")
sha256sums=('SKIP')
#            'SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	if [ -f "${srcdir}/config.h" ]; then
		cp "${srcdir}/config.h" .
	fi
}

build() {
	make -C "${srcdir}/${pkgname}"
}

package() {
	make -C "${srcdir}/${pkgname}" \
		PREFIX="/usr" \
		DESTDIR="${pkgdir}" \
		install
}
