# Maintainer: Marc Tiehuis <marctiehuis at gmail.com>

pkgname=zig-git
pkgver=0.2.0r2735.4e23fb7f
pkgrel=1
pkgdesc="a programming language prioritizing robustness, optimality, and clarity"
arch=('i686' 'x86_64')
url='http://ziglang.org'
license=('MIT')
depends=('llvm' 'clang' 'libxml2' 'zlib')
makedepends=('cmake')
provides=(zig)
conflicts=(zig)
source=("git://github.com/zig-lang/zig.git")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$provides"
    patch -Np1 -i "$srcdir/../force_dynamic_llvm.patch"
}

pkgver() {
    cd "$srcdir/$provides"
    printf "0.2.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$provides"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

check() {
    cd "$srcdir/$provides/build"

    # omit full compiler test since it takes ages
    ./zig version
}

package() {
    cd "$srcdir/$provides/build"
    install -Dm644 "$srcdir/$provides/LICENSE" "$pkgdir/usr/share/licenses/$provides/LICENSE"
    make DESTDIR="$pkgdir" install
}
