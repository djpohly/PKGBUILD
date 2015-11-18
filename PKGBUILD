# Maintainer: David Phillips <dbphillipsnz@gmail.com>

_pkgname=sent
pkgname=${_pkgname}-git
pkgver=r69.cc57a28
pkgrel=1
pkgdesc="Simple plain-text presentation tool"
arch=('i686' 'x86_64')
url=(http://tools.suckless.org/${_pkgname})
license=('MIT')
depends=('fontconfig' 'libxft' 'libpng')
makedepends=('git')
conflicts=('sent')
source=("${pkgname}::git://git.suckless.org/${_pkgname}")
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
	make -C "${srcdir}/${pkgname}" \
		PREFIX=/usr/
}

package() {
	make -C "${srcdir}/${pkgname}" \
		DESTDIR="${pkgdir}" \
		install
}
