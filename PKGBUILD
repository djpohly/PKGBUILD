# Maintainer: Nathan <ndowens@artixlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=xscreensaver
pkgver=6.06
pkgrel=1
pkgdesc='Screen saver and locker for the X Window System'
url='https://www.jwz.org/xscreensaver/'
arch=('x86_64')
license=('BSD')
depends=(
  'gtk3' 'glu' 'xorg-appres' 'libglvnd' 'libjpeg-turbo' 'libjpeg.so'
  'libx11' 'libxcrypt' 'libcrypt.so' 'libxext' 'libxft' 'libxi'
  'libxinerama' 'libxmu' 'libxrandr' 'libxt' 'libxxf86vm' 'perl-libwww' 'pam'
  'libpam.so' 'glibc' 'glib2' 'gdk-pixbuf2'
)
makedepends=('bc' 'intltool' 'libxpm' 'gdm')
optdepends=('gdm: for login manager support')
backup=('etc/pam.d/xscreensaver')
source=(https://www.jwz.org/xscreensaver/${pkgname}-${pkgver}.tar.gz
        LICENSE)
sha512sums=('988e30d422ef985ac348c275e098ddfe1ee034a2e916c91690ee2836c908801c1e017e22d828aca981b0f8bfc5491cd83ab7c45aabc155ba5013df8b149cbcb5'
            '863c699479b2ec2775a0d1cba22e615929194a14af164b3513e46a0c04229da6547255a4da8f7f1bbb40906898c124ed3c9ec2436b76b62affcb62385af9783e')
b2sums=('f15a439430bbca0852926c15716d3c4b22148d8c36d60b18ab033454d4df0d981400029b32e1f30a061592273deb648453db91813994b9bc4d6c66a61774a5d1'
        'cacb6ba39d6ecb8703ef5f5a7dc74de0ca805cce73b43a8b9b6b4c255c909aa9b5e692de76c2fbd4da26ce6efb5f2a46138c43b1b37f53cee6d20fd6ed41f4a9')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i "$srcdir/no-delay.diff"
  patch -Np1 -i "$srcdir/starry.diff"
  cp ../{flasher,meteor_l,meteor_r}.png hacks/images/
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --without-setuid-hacks \
    --with-pam \
    --with-login-manager \
    --with-gtk \
    --with-gl \
    --without-gle \
    --with-pixbuf \
    --with-jpeg
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/etc/pam.d"
  make install_prefix="${pkgdir}" install
  install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-settings.desktop"
}

source+=(no-delay.diff
         starry.diff
         flasher.png meteor_l.png meteor_r.png)
sha512sums+=('5a804c07d0498e41b0766fc76eed63a5270522aa584f2ed5316e52e321d0aea8cc8d20fa1543a6d0a6abe9edc09738cb7b99a7aca72f87bb4f5c139ba51da4a0'
             '07c554e8c20e92d1851eb4bbc1c7ec6e7b31d4aaa73cfbc0b7f346647fb7f648727406149216591776273621baa2bb74c73a1a931bdd920e1f9cae337af8f4bd'
             'db77727c27416dfa601e5e9a12b3e02575fe55e3891517121861713341b2e9d575265335ba302264490678b8ca433c8e10dd699c02350d1dbcbffaaf0205481d'
             'da7cbc0d72fc95ba35929b9a73a45d0a56862ef683fc0f069a8968d4cd73595fc693917265bc93558e35a73fb8ef5f808e84797b50c46429b5d4e30a856573bc'
             '55689096d3e6a41484f548300c54e6e1dc9dc755e3ef0a21294a195393cd84a86ceb055593fe6e5d0ea6dc15d79297e2749a7cd5a7b7d411a7714a3efe6b6578')
b2sums+=('c45231126028391b650387a8fd01689aa297346e6160f54823ca63c870154a863c57c08ea4a58a0c6fc3aab13995b53fee486e9e9933b3abf884d03b31d2e7f2'
         '33956d996b92924312fea7e03b43fd53c3fd78f985ebee03f436829d75f46a3a590af396af341a9f4d09c460d3c26c1741a01950d1cf2677267bbc18a45859b6'
         '3c72ef884fb657963c150a666c753b335cacc10f423bb0e385cd1b1f015abbafe09540eaf47907ff178866f46f0558a35f9d6b97ac39157bf0ae5665f14a8399'
         'ea6b522193fd56e8b2792fc14de9190869a4a41dfc48b7d7c47d3cef17c0326472d4093e78406567610ad058fcb5d443245b64473589874b2925caa3d946f139'
         '9504e9cabd2a575d320121c8d6868a7a5e009303f2d18d0fe284314bb425a6fb213aaf1b59ad802f2f3d6272823a4f76edfecac1fde93a0d005fb18141fc8776')

# vim: ts=2 sw=2 et:
