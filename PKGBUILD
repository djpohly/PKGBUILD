# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: frownlee <florez.brownlee@gmail.com>

pkgname=android-ndk
pkgver=r17.b
pkgrel=1
pkgdesc='Android C/C++ developer kit'
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=('etc/profile.d/android-ndk.sh')
install="$pkgname.install"
provides=('android-ndk')
replaces=('android-ndk64')
depends=('ncurses5-compat-libs')
source=('android-ndk.sh' "https://dl.google.com/android/repository/${pkgname}-${pkgver/./}-linux-x86_64.zip")
sha1sums=('234f2814d10de08499032fd6772d701d9160433a'
          'dd5762ee7ef4995ad04fe0c45a608c344d99ca9f')

package() {
  install -d "$pkgdir/opt"
  mv "$pkgname-${pkgver/./}" "$pkgdir/opt/$pkgname"

  install -Dm755 android-ndk.sh "$pkgdir/etc/profile.d/android-ndk.sh"

  # Fix broken permissions
  chmod -R o=g "$pkgdir/opt/$pkgname"
  find "$pkgdir/opt/$pkgname" -perm 744 -exec chmod 755 {} +
}

# vim: ts=2 sw=2 et:
