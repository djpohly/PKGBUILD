# Maintainer: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Jorge Araya Navarro <jorge@esavara.cr>

pkgname=goimapnotify
pkgver=2.3.16
pkgrel=2
pkgdesc="Execute scripts on IMAP mailbox changes (new/deleted/updated messages) using IDLE, golang version."
url="https://gitlab.com/shackra/goimapnotify"
license=('GPL3')
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "2.3.16-service.patch")
b2sums=('2347a7e7de150d84172249c8bb02da6b9dd27a5b7c9ddd4505993e7819c0df57d0d7ebdee2161b3c21d1ebd598a2044c9954cdc82ab271a5a87b701896f2b328'
        'd7719beef51ad0aa4e83df709b634ee480e8afaf26da91827d2564b6d744edecb6787de561bb7fbf0db1b1f12891234227a698f2cdc35319e1620f80dbfb9236')
options=(!lto)

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -i ../2.3.16-service.patch
}

build() {
    cd "${pkgname}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build
}

check() {
    cd "${pkgname}-${pkgver}"

    go test ./...
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/user/" goimapnotify@.service
}
