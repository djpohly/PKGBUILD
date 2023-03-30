# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.11.1+20230212
_pkgver=${pkgver/+/.}
pkgrel=1
pkgdesc='CLI for MEGA'
arch=(i686 x86_64 armv6h armv7h aarch64)
url=https://megatools.megous.com
license=(GPL2)
depends=(curl glib2)
makedepends=(asciidoc docbook2x meson)
source=(https://megatools.megous.com/builds/$pkgname-$_pkgver.tar.gz)
sha512sums=('8d96533c6ae117f38e095b16f4c3241a9170397174befaff9caf81b598addbe60c89c05d29b20efead462a8f263f799107653cab1ad429ab2ba2fe0dc4fbbb39')

prepare() {
  cd "$pkgname-$_pkgver"
  patch -Np1 -i ../rename.patch
}

build() {
  arch-meson $pkgname-$_pkgver build -D symlinks=true -D man=true

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

source+=(rename.patch)
sha512sums+=('1da0b7fd89b8154d772aa78f1cedd406f02df957d1427bf5397ed6767d2dabecee04711b76c056a272e0f3765fae1d0bbb1a84f6e69e4af247ac1fcfeab79fa1')
