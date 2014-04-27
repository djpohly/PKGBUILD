# Maintainer: Devin J. Pohly <djpohly@gmail.com>
pkgname=dwm-djp-git
pkgver=1625.10
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama')
makedepends=('git')
install=
provides=('dwm')
conflicts=('dwm')
source=("git+https://github.com/djpohly/dwm.git" dwm.desktop)
_upstream="http://git.suckless.org/dwm"
md5sums=(SKIP '939f403a71b6e85261d09fc3412269ee')

pkgver() {
  cd "$srcdir/dwm"

  git remote add upstream "$_upstream"
  git fetch upstream

  local upstream=$(git rev-list --count upstream/master)
  local behind=$(git rev-list --count ..upstream/master)
  local ahead=$(git rev-list --count upstream/master..)

  [[ $behind -gt 0 ]] && warning "Patched version is %s commits behind upstream" "$behind"

  printf "%s.%s\n" "$upstream" "$ahead"
}

prepare() {
  cd "$srcdir/dwm"

  sed -i 's/CPPFLAGS =/CPPFLAGS +=/g' config.mk
  sed -i 's/^CFLAGS = -g/#CFLAGS += -g/g' config.mk
  sed -i 's/^#CFLAGS = -std/CFLAGS += -std/g' config.mk
  sed -i 's/^LDFLAGS =/LDFLAGS +=/g' config.mk
}

build() {
  cd "$srcdir/dwm"

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/dwm"

  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 -D "$srcdir/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}

# vim:set ts=2 sw=2 et:
