# Maintainer: Minmo <com dot gmail at maroboromike>
# Contributor: Sematre <sematre at gmx dot de>

pkgname=yt-dlp-drop-in
pkgver=1.1
pkgrel=1
pkgdesc='Emulate youtube-dl executables with yt-dlp (youtube-dlp)'
arch=('any')
license=('MIT')
depends=('yt-dlp')
provides=('youtube-dl')
conflicts=('youtube-dl')
source=('youtube-dl-hook.sh')
sha256sums=('78e4e0ae75e40fea540afd65c4d45788a14b14611d358578cb7fa20e574efb8d')

package() {
  install -Dm755 "youtube-dl-hook.sh" "${pkgdir}/usr/bin/youtube-dl"
}
