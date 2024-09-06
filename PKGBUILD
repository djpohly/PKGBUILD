# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=pinentry
pkgver=1.3.1
pkgrel=5
pkgdesc='Collection of simple PIN or passphrase entry dialogs which utilize the Assuan protocol'
url='https://gnupg.org/related_software/pinentry/'
arch=('x86_64')
license=('GPL')
depends=(
  'glibc' 'ncurses' 'libassuan' 'libsecret' 'glib2'
  libsecret-1.so libncursesw.so libassuan.so libglib-2.0.so)
makedepends=('gtk3' 'gcr-4')
optdepends=(
  'gcr: GNOME backend'
  'gtk3: GTK backend'
)
source=("https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"{,.sig}
        'pinentry')
sha256sums=('bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04'
            'SKIP'
            '2f961cccf9aebddf9c0823a96809a10296d7af6516460ae2d93e8ea5a433166d')
validpgpkeys=(
  'D8692123C4065DEA5E0F3AB5249B39D24F25E3B6' # Werner Koch (dist sig)
  '6DAA6E64A76D2840571B4902528897B826403ADA' # Werner Koch (dist signing 2020)
  'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD' # Niibe Yutaka (GnuPG Release Key)
)

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../fallback-tty.diff
  autoreconf -if
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-pinentry-tty \
    --enable-pinentry-curses \
    --enable-fallback-curses \
    --enable-pinentry-emacs \
    --enable-pinentry-gnome3 \
    --disable-pinentry-qt \
    --enable-libsecret

  make
}

package() {
  depends+=(
    libglib-2.0.so
    libncursesw.so
    libsecret-1.so
  )

  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm 755 ../pinentry -t "${pkgdir}/usr/bin"

  # The -gtk backend has been built to be used with GTK3.
  mv "${pkgdir}/usr/bin/pinentry-gtk"{-2,}
}

source+=(fallback-tty.diff)
sha256sums+=(2d02da1bfb151a6dd53aa05fa4f403053062a46845bac54586dfc9d79e920ce6)

# vim: ts=2 sw=2 et:
