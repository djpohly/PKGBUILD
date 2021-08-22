# Maintainer: tectonic-deploy <sasha+tectonic@hackafe.net>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

# The master version of this file is maintained here:
#
#   https://github.com/tectonic-typesetting/tectonic/blob/master/dist/arch/PKGBUILD.src.in
#
# The version on aur.archlinux.org is updated automatically by the Tectonic
# CI/CD system when new versions are released. Pull requests should be filed
# against Tectonic if the settings in this file need changing.

pkgname=tectonic
pkgver=0.7.1
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
url=https://tectonic-typesetting.github.io/
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('ffd09ea7fc0f2e4914883134d018d5b6f6b4769a899b29f4942ba01c144e93d9b1f2a192fe05668322331050bcafc8593c4559d819284239f70b7d6f3b59fb0f')

build() {
	cd $pkgname-$pkgver
	cargo build --release --locked --features external-harfbuzz
}

check() {
	cd $pkgname-$pkgver
	cargo test --release --locked --features external-harfbuzz
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 ${CARGO_TARGET_DIR:-target}/release/tectonic "$pkgdir"/usr/bin/tectonic
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
