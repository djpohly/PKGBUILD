# $Id$
# Contributor: tobias [tobias [at] archlinux.org]
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt
pkgver=1.10.1
pkgrel=3
pkgdesc='Small but very powerful text-based mail client'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA')
source=("http://ftp.mutt.org/pub/mutt/${pkgname}-${pkgver}.tar.gz"{,.asc}
        'a2b289361d90360c37eb19cca2cf1216ab60fb7b.patch')
sha256sums=('734a3883158ec3d180cf6538d8bd7f685ce641d2cdef657aa0038f76e79a54a0'
            'SKIP'
            '21ae6f739801f07728d770ac7365f696b6d0ec81cda8b6cd1a5b3c81a3bb0f2f')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../a2b289361d90360c37eb19cca2cf1216ab60fb7b.patch
	patch -Np1 -i "$srcdir/reply-filter.patch"
	patch -Np1 -i "$srcdir/smtp-samepass.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-gpgme \
		--enable-pop \
		--enable-imap \
		--enable-smtp \
		--enable-hcache \
		--enable-sidebar \
		--with-curses=/usr \
		--with-regex \
		--with-gss=/usr \
		--with-ssl=/usr \
		--with-sasl \
		--with-idn \

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}"/etc/mime.types{,.dist}
	install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}

source+=(reply-filter.patch
	 smtp-samepass.patch)
sha256sums+=('a0d77346530ee5d7ab0a6005c205eb9577d4832e2f7d22e91ad4ebc06469c53a'
             'be33e45656a8fff366d855de996569ed25b7b7ab3a9b1cebe16243934a8cf277')
