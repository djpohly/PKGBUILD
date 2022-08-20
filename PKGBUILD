# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ajs124 < aur AT ajs124 DOT de >

pkgname=firejail
pkgver=0.9.70
pkgrel=2
pkgdesc='Linux namespaces sandbox program'
arch=('x86_64')
url=https://github.com/netblue30/firejail
license=('GPL2')
optdepends=('xdg-dbus-proxy: for D-Bus filtering')
backup=('etc/firejail/firecfg.config'
        'etc/firejail/firejail.config'
        'etc/firejail/login.users')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('b77b67a4db7c01d69cb033a50aa7b1132dfaeb2cd97ce6412285235265b71b17'
            'SKIP')
b2sums=('d5164ba5ee08e80415a84999e4152f1f9c897f50def669731098126cec117aed3cf4b21603aeb13ccbdb1bffa9d48de69dcb19fe7135691e891b9b83f48a5ca1'
        'SKIP')
validpgpkeys=('F951164995F5C4006A73411E2CCB36ADFC5849A7')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-apparmor
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
