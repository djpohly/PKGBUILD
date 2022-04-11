# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Shatur95 <genaloner@gmail.com>

pkgname=vim-language-server
pkgver=2.2.7
pkgrel=1
pkgdesc="VimScript language server"
arch=('any')
url="https://github.com/iamcco/vim-language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('1538f3202b4406f7b4455990a9f5c016b5edbfc2a2f82e3bf6613bbfecd3c982')
noextract=("$pkgname-$pkgver.tgz")

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	chown -R root:root "$pkgdir"
	## why does !emptydirs run after PURGE_TARGETS
	rm -rf "$pkgdir/usr/lib/node_modules/vim_language_server/.github/"
}
