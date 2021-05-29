# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh-git
pkgver=1.20190621.r130.gfb7fde8
pkgrel=1
epoch=1
pkgdesc='Version Control System for $HOME that manages multiple Git repositories'
arch=(any)
url="https://github.com/RichiH/${pkgname%-git}"
license=(GPL)
depends=(git)
makedepends=(ruby-ronn)
checkdepends=(perl perl-shell-command perl-test-most)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  ./bootstrap.sh
}


build() {
  cd "$pkgname"
  ./configure
  make
}

check() {
  cd "$pkgname"
  make test
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
