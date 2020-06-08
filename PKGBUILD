# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=firejail
pkgver=0.9.62
pkgrel=1
pkgdesc="Linux namespaces sandbox program"
arch=(x86_64)
license=(GPL2)
url="https://github.com/netblue30/firejail"
backup=('etc/firejail/login.users'
	'etc/firejail/firejail.config')
depends=('apparmor')
validpgpkeys=('F951164995F5C4006A73411E2CCB36ADFC5849A7')
install=firejail.install
#source=(${pkgname}-${pkgver}.tar.gz::https://github.com/netblue30/${pkgname}/archive/$pkgver.tar.gz)
source=(https://sourceforge.net/projects/firejail/files/firejail/firejail-${pkgver}.tar.xz{,.asc})
sha256sums=('0568081ce950c5240e1b2fca7014b798f589657249e17283a14e20e41f8d5ae0'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# fix build
#	export CFLAGS="${CFLAGS/-fsanitize=undefined/}"
	./configure --prefix=/usr --enable-apparmor
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

