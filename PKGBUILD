# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-bin
pkgver=1.7.4
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk-openjdk')
validpgpkeys=('CB36D7D2EBB2E35D9B75500BCD5DC1C529CDFD3B')
source_x86_64=("https://github.com/bisq-network/bisq/releases/download/v${pkgver}/Bisq-64bit-${pkgver}.deb"{,.asc})
sha512sums_x86_64=('a738c15ca251f2d1e487a73059f1567ed15c4c4bb645e0f75fedcd099f06be781b422efd80616765370a6ca9c4503faec4b3c2d6e9ec7ab75a448e8e3220c645'
                   'SKIP')
_binname=Bisq
conflicts=("bisq" "bisq-git")
provides=("bisq-bin")

prepare() {
  tar -Jxvf data.tar.xz
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps}

  # Install all .deb files into /opt.
  cp -r "$srcdir/opt" "$pkgdir"

  # Symlink some files to complete install.
  ln -s "/opt/bisq/bin/$_binname" "$pkgdir/usr/bin/bisq"
  ln -s "/opt/bisq/lib/bisq-${_binname}.desktop" "${pkgdir}/usr/share/applications/bisq.desktop"
  ln -s "/opt/bisq/lib/${_binname}.png" "${pkgdir}/usr/share/pixmaps/bisq.png"
}
