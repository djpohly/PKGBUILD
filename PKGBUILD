# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Contributor: Christopher Snowhill <chris@kode54.net>
# Contributor: Denis Zheleztsov <difrex.punk@gmail.com>

pkgname=wlr-randr
pkgver=0.2.0
pkgrel=2
pkgdesc="Utility to manage outputs of a Wayland compositor"
arch=('x86_64')
url="https://sr.ht/~emersion/wlr-randr/"
license=('MIT')
depends=("wayland")
makedepends=("meson")
source=("https://git.sr.ht/~emersion/wlr-randr/refs/download/v$pkgver/wlr-randr-$pkgver.tar.gz"{,.sig})
sha512sums=('213e35d97ee4c5fe4e524119eba66f121707a4ccb9076f48ceb47091e2ca987ed43f9897168b4d62efd10457d256225cd23423e039c1fcd705d7ba7e779a6722'
            'SKIP')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
