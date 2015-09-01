# $Id$
# Contributor: tobias [tobias [at] archlinux.org]
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt
pkgver=1.5.24
pkgrel=1
pkgdesc='Small but very powerful text-based mail client'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
source=("http://ftp.mutt.org/pub/mutt/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha1sums=('38a2da5eb01ff83a90a2caee28fa2e95dbfe6898' 'SKIP')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA')

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
	rm "${pkgdir}"/usr/bin/{flea,muttbug}
	rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
	install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}
