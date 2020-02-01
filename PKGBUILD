# Maintainer: Alad Wenter <alad@archlinux.org>
# Co-Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
# Co-Maintainer: Maxim Baz <archlinux@maximbaz.com>
pkgname=aurutils
pkgver=2.3.3
pkgrel=1
pkgdesc='helper tools for the arch user repository'
url='https://github.com/AladW/aurutils'
arch=('any')
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgver.tar.gz.asc")
install=$pkgname.install
depends=('git' 'jq' 'expac' 'diffstat' 'pacutils' 'parallel' 'wget')
optdepends=('bash-completion: bash completion'
            'devtools: aur-chroot'
            'vifm: build file interaction')
sha256sums=('f1c63c3a9134c12b538d599dd9df768c4a271be8711ea71ccf5a4eb41a622e9e'
            'SKIP')
validpgpkeys=('DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A') # Alad Wenter <alad@archlinux.org>

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
