pkgname=('alacritty-git' 'alacritty-terminfo-git')
_pkgname="alacritty"
pkgver=0.2.9.1144.g6f4d1af
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/jwilm/alacritty"
license=('Apache-2.0')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'freetype2' 'git' 'ncurses' 'desktop-file-utils')
source=("$_pkgname::git+https://github.com/jwilm/alacritty.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package_alacritty-git() {
	pkgdesc="A cross-platform, GPU-accelerated terminal emulator"
	depends=('freetype2' 'fontconfig' 'xclip')
	provides=('alacritty')
	conflicts=('alacritty')

	cd $_pkgname

	env CARGO_INCREMENTAL=0 cargo build --release

	sed -i "s/Icon=utilities-terminal/Icon=alacritty/g" "$srcdir/$_pkgname/extra/linux/alacritty.desktop"
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "$srcdir/$_pkgname/extra/linux/alacritty.desktop"

	install -D -m755 "$srcdir/$_pkgname/target/release/alacritty" "$pkgdir/usr/bin/alacritty"
	install -D -m644 "$srcdir/$_pkgname/extra/alacritty.man" "$pkgdir/usr/share/man/man1/alacritty.1"
	install -D -m644 "$srcdir/$_pkgname/extra/completions/alacritty.bash" "$pkgdir/usr/share/bash-completion/completions/alacritty"
	install -D -m644 "$srcdir/$_pkgname/extra/completions/_alacritty" "$pkgdir/usr/share/zsh/site-functions/_alacritty"
	install -D -m644 "$srcdir/$_pkgname/extra/completions/alacritty.fish" "$pkgdir/usr/share/fish/completions/alacritty.fish"
	install -D -m644 "$srcdir/$_pkgname/extra/logo/alacritty-term.svg" "$pkgdir/usr/share/pixmaps/alacritty.svg"
}

package_alacritty-terminfo-git() {
	pkgdesc="Terminfo files for the alacritty terminal emulator"
	provides=('alacritty-terminfo')
	conflicts=('alacritty-terminfo')

	cd $_pkgname/extra

	install -dm 755 "$pkgdir/usr/share/terminfo/a/"
	tic -o "$pkgdir/usr/share/terminfo" alacritty.info
}
