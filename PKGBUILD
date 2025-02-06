# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgbase=fwupd
pkgname=(
  fwupd
  fwupd-docs
)
pkgver=2.0.5
pkgrel=1
pkgdesc="Simple daemon to allow session software to update firmware"
arch=(x86_64)
url='https://github.com/fwupd/fwupd'
license=(LGPL-2.1-or-later)
depends=(
  bash
  bluez
  curl
  flashrom
  fwupd-efi
  gcc-libs
  glib2
  glibc
  gnutls
  hicolor-icon-theme
  json-glib
  libarchive
  libcbor
  libdrm
  libjcat
  libmbim
  libmm-glib
  libqmi
  libusb
  libxmlb
  passim
  polkit
  protobuf-c
  python
  shared-mime-info
  sqlite
  tpm2-tss
  xz
  zlib
)
makedepends=(
  bash-completion
  gi-docgen
  gnu-efi-libs
  gobject-introspection
  meson
  noto-fonts
  noto-fonts-cjk
  pandoc
  python-cairo
  python-dbus
  python-dbusmock
  python-gobject
  python-pillow
  umockdev
  vala
  valgrind
)
source=(
  "https://github.com/fwupd/fwupd/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
  fwupd.sysusers
)
sha512sums=('6d3e4e4f234a4dd81db6ed09e65185f36179215a95ae63964cc2e4776546cec8a47d870301f803904e67f5ca566c669d51b9be0589a9b63d720e61cded8b6860'
            'SKIP'
            'f9a99c60786a2b98e0de439a9288af61b2c0716f8339a4c93e2df7108d2a7f9ef8128967dcaa1e12022ffa647945bf5eb3749e38cac83e00a28cbc5b015fbee9')
b2sums=('a3000cfb54e59c756ea61d21b22ff732f4d818dc4714b863e78d489d2b1f0551fa14ab11ded7141b82b92d336ba9613aa6430b8e257a10a638739af94b1459d4'
        'SKIP'
        'c294c6dd324c0ad0d752affdc459d427d34f4bf865def099ac0e25db6b5dfbfcf645ca325e4e7732d1256e75c624ff27094d5c814726909c7e348128a9dd93f9')
validpgpkeys=(163EB50119225DB3DF8F49EA17ACBA8DFA970E17) # Richard Hughes <richard@hughsie.com>

build() {
  local meson_options=(
    -D systemd=disabled
    -D elogind=enabled
    -D docs=enabled
    -D efi_binary=false
    -D launchd=disabled
    -D supported_build=enabled
  )

  artix-meson ${pkgname}-${pkgver} build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_fwupd() {
  depends+=(
    libarchive.so
    libblkid.so
    libcbor.so
    libcurl.so
    libjson-glib-1.0.so
    libmm-glib.so
    libpassim.so
    libprotobuf-c.so
    libqmi-glib.so
  )
  optdepends=(
    'python-dbus: Firmware packaging tools'
    'python-gobject: Firmware packaging tools'
    'udisks2: UEFI firmware upgrade support'
  )
  provides=(libfwupd.so)
  backup=(
    'etc/fwupd/fwupd.conf'
    'etc/fwupd/remotes.d/lvfs-testing.conf'
    'etc/fwupd/remotes.d/lvfs.conf'
    'etc/fwupd/remotes.d/vendor-directory.conf'
  )

  meson install -C build --destdir "${pkgdir}"
  # Add fwupd user https://bugs.archlinux.org/task/79653
  install -D -m644 fwupd.sysusers "${pkgdir}"/usr/lib/sysusers.d/fwupd.conf
  # Remove the tests
  rm -r "${pkgdir}"/usr/{lib,share}/installed-tests/
  # Conflicts with the dbxtool package
  mv "${pkgdir}"/usr/bin/{,fwupd-}dbxtool
  mv "${pkgdir}"/usr/share/man/man1/{,fwupd-}dbxtool.1
  # Remove msr module-load config as it is built-in
  rm "${pkgdir}"/usr/lib/modules-load.d/fwupd-msr.conf || :
  rmdir "${pkgdir}"/usr/lib/modules-load.d || :

  _pick docs "${pkgdir}"/usr/share/doc/{,fwupd/}{libfwupdplugin,libfwupd}
}

package_fwupd-docs() {
  pkgdesc="Simple daemon to allow session software to update firmware - documentation"
  depends=()
  mv docs/* "${pkgdir}"
}
