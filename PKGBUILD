# Contributor: tobias [tobias [at] archlinux.org]
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt
pkgver=1.14.2
pkgrel=1
pkgdesc='Small but very powerful text-based mail client'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('x86_64')
optdepends=('perl: for smime_keys'
            'smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn2' 'mime-types' 'krb5')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA')
source=("https://bitbucket.org/mutt/mutt/downloads/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('e22f700e8c57fbc41a642bfeeeed1adca06e6187887c39614a5c38d381a6ac31'
            'SKIP')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -Np1 -i "$srcdir/reply-filter.patch"
	patch -Np1 -i "$srcdir/smtp-samepass.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-debug \
		--enable-gpgme \
		--enable-pop \
		--enable-imap \
		--enable-smtp \
		--enable-hcache \
		--enable-sidebar \
		--enable-autocrypt \
		--with-curses=/usr \
		--with-gss=/usr \
		--with-ssl=/usr \
		--with-sqlite3 \
		--with-sasl \
		--with-idn2 \

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
sha256sums+=('38169eab2a8511968e6dc62ff74a5207bcf0e50711425c787e311469c9b917f1'
             'bf283ac4bc9aab6fec454d07819791ff4c6bcec28aa7a36324c400a99ed9c401')
