# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=wpa_supplicant
pkgver=2.8
pkgrel=1
epoch=2
pkgdesc='A utility providing key negotiation for WPA wireless networks'
url='http://hostap.epitest.fi/wpa_supplicant'
arch=(x86_64)
license=(GPL)
depends=(openssl libdbus readline libnl)
install=wpa_supplicant.install
source=(https://w1.fi/releases/${pkgname}-${pkgver}.tar.gz{,.asc}
        config
)
validpgpkeys=('EC4AA0A991A5F2464582D52D2B6EF432EFC895FA') # Jouni Malinen
sha256sums=('a689336a12a99151b9de5e25bfccadb88438f4f4438eb8db331cd94346fd3d96'
            'SKIP'
            '23aee0597750ec21b37654b5163e2f577c1204fc33bdfbf7bc2fb470e8a467db')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  local i; for i in "${source[@]}"; do
    case $i in
      *.patch)
        msg2 "Applying patch $i"
        patch -p1 -i "$srcdir/$i"
        ;;
    esac
  done

  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  cp "$srcdir/config" ./.config
}

build() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"

  make LIBDIR=/usr/lib BINDIR=/usr/bin
  make LIBDIR=/usr/lib BINDIR=/usr/bin eapol_test
}

package() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  make LIBDIR=/usr/lib BINDIR=/usr/bin DESTDIR="$pkgdir" install
  install -Dm755 eapol_test "$pkgdir/usr/bin/eapol_test"

  install -d -m755 "$pkgdir/etc/wpa_supplicant"
  install -Dm644 wpa_supplicant.conf \
    "$pkgdir/usr/share/doc/wpa_supplicant/wpa_supplicant.conf"


install -d -m755 "$pkgdir/usr/share/dbus-1/system-services"
install -m644 \
dbus/fi.w1.wpa_supplicant1.service \
"$pkgdir/usr/share/dbus-1/system-services/"

 install -Dm644 dbus/dbus-wpa_supplicant.conf \
"$pkgdir/etc/dbus-1/system.d/wpa_supplicant.conf"

  install -d -m755 "$pkgdir/usr/share/man/man"{5,8}
  install -m644 doc/docbook/*.5 "$pkgdir/usr/share/man/man5/"
  install -m644 doc/docbook/*.8 "$pkgdir/usr/share/man/man8/"
  rm -f "$pkgdir/usr/share/man/man8/wpa_"{priv,gui}.8
}

source+=(config-dir.patch)
sha256sums+=(405af2562412f1a18fa19f879813c0251fc8197af82384c45b099ef746c5f6d6)
