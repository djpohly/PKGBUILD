# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgbase=fwupd
pkgname=(
  fwupd
  fwupd-docs
)
pkgver=1.9.22
pkgrel=2
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
  libgudev
  libgusb
  libjcat
  libmbim
  libmm-glib
  libqmi
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
  libdrm
  meson
  noto-fonts
  noto-fonts-cjk
  pandoc
  python-cairo
  python-dbus
  python-gobject
  python-pillow
  vala
  valgrind
)
checkdepends=(umockdev)
source=(
  "https://github.com/fwupd/fwupd/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
  fwupd.sysusers
  https://github.com/fwupd/fwupd/pull/7553.patch
)
sha512sums=('8141431ce04a9d141868c9a9137ec749d1b8fd754abafc5b1959ca8205e739e2c66bd967db054de3d9cd750081922a8ed51fc4831d6bd295fcc13d8781a5d8ab'
            'SKIP'
            '637203080b55eda74a659f58c853a9a723a2dad5da70915b2b0e036c6145a649468ebec700cc83975d9cb5378b9dced8b3a3b26bdbcc75ddc774837355e75deb'
            '5869660de4b6af70aa873b962ccff8e9da8a314d37993f548bf16f0b7a09cd34c0d78d048f35b854a0e7450e62dc4f08ed63c89d3a633a227ae31ed7609efe94')
b2sums=('434fa15718206caf9ab08474459df136e7e2a8f7dfed99240ac07f54fd2e4d042bab7009a05db9485460740956f8cf8971e216812cf710799921d3ce3103dd0b'
        'SKIP'
        'e65ca7da22a20a40882cfc1fe4479643f9a38c90a4f2c3e71e6e5e3de1d6db212a0f17d600097619fe3cdb0a9b860422f8b0b9a9d45441518e51a7eb12a918bb'
        'aaf2a8368159d7272ca262dd5aa4d8d195c0c15203e532e3333f7f518fccdac1d0e84ab7945af3ef10f12303a8ba54c649a7284592de3baac90f4ae1172b6e06')
validpgpkeys=(163EB50119225DB3DF8F49EA17ACBA8DFA970E17) # Richard Hughes <richard@hughsie.com>

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 < ../7553.patch
}

build() {
  local meson_options=(
    -D systemd=disabled
    -D offline=disabled
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
    libcbor.so
    libcurl.so
    libgudev-1.0.so
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
