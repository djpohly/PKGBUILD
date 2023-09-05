# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=1.9.5
pkgrel=1
pkgdesc="Simple daemon to allow session software to update firmware"
arch=(x86_64)
url="https://github.com/fwupd/fwupd"
license=(LGPL)
depends=(
  bluez
  efivar
  flashrom
  fwupd-efi
  gcab
  gnutls
  hicolor-icon-theme
  libarchive.so
  libcbor.so
  libcurl.so
  libgudev-1.0.so
  libgusb
  libjcat
  libjson-glib-1.0.so
  libmm-glib.so
  libpassim.so
  libprotobuf-c.so
  libqmi-glib.so
  libsmbios
  libxmlb
  polkit
  python
  shared-mime-info
  tpm2-tss
)
optdepends=(
  'udisks2: UEFI firmware upgrade support'
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
  python-gobject
  python-pillow
  vala
  valgrind
)
checkdepends=(umockdev)
provides=(libfwupd.so)
backup=(
  'etc/fwupd/fwupd.conf'
  'etc/fwupd/remotes.d/dell-esrt.conf'
  'etc/fwupd/remotes.d/fwupd-tests.conf'
  'etc/fwupd/remotes.d/lvfs-testing.conf'
  'etc/fwupd/remotes.d/lvfs.conf'
  'etc/fwupd/remotes.d/vendor-directory.conf'
  'etc/fwupd/remotes.d/vendor.conf'
)
source=("https://github.com/fwupd/fwupd/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha512sums=('19c152746d4d44f00c5bf3ed36b97249cb0a8fdedab351706a7d4e761fb142d096351555392b535ce976cb9e925505246542525a90319a2560f753a675ff26cf'
            'SKIP')
b2sums=('0926f97a79d7795f3bd8ea71841a072b8f725800d9b33eaf6fc54c62e67f53e41faa5558979a53b0e83094d8dfd3b3263bc462380498c00484e29500ca6baf8c'
        'SKIP')
validpgpkeys=(163EB50119225DB3DF8F49EA17ACBA8DFA970E17) # Richard Hughes <richard@hughsie.com>

build() {
  artix-meson ${pkgname}-${pkgver} build \
    -D b_lto=false \
    -D docs=enabled \
    -D plugin_intel_spi=true \
    -D supported_build=enabled \
    -D systemd=false \
    -D offline=false \
    -D elogind=true \
    -D efi_binary=false
  meson compile -C build
}

check() {
    meson test -C build || :
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  # Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "${pkgdir}"/usr/share/polkit-1/rules.d
  # Remove the tests
  rm -r "${pkgdir}"/usr/share/installed-tests/
  mv "${pkgdir}"/usr/bin/{,fwupd-}dbxtool
  mv "${pkgdir}"/usr/share/man/man1/{,fwupd-}dbxtool.1
  # Remove msr module-load config as it is built-in
  rm "${pkgdir}"/usr/lib/modules-load.d/fwupd-msr.conf
  rmdir "${pkgdir}"/usr/lib/modules-load.d
}
