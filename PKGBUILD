#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=powerpill
pkgver=2018.7
pkgrel=3
pkgdesc='Pacman wrapper for faster downloads.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/powerpill"
depends=(aria2 'pm2ml>2012.12.12' pyalpm python3 python3-xcgf python3-xcpf reflector)
optdepends=('python3-threaded_servers: internal Pacserve support' 'rsync: Rsync download support')
backup=(etc/powerpill/powerpill.json)
source=(
  https://xyne.archlinux.ca/projects/powerpill/src/powerpill-2018.7.tar.xz
  https://xyne.archlinux.ca/projects/powerpill/src/powerpill-2018.7.tar.xz.sig
)
sha512sums=(
  97650365b59a285671580ac7631c518be30f7e0616bb80e4e83f18b2ce30f62d50a99ceecb01eff52451c16e69ebe1b5b4f3fabc339a751f6b844f13e1f34669
  6e32d591eed2ca11f120e61e0ce90fe6817ee2366afc1ea0a39b33369e494d6e7ba34af14ee4ad4cb027dcac4284b5e7cebe3caf8884201fd11599f101329dbf
)
md5sums=(
  885e9da2d42579a4241e3f0914c61651
  6cc604a0e81582090a48ee739b917b1f
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 'powerpill' "$pkgdir/usr/bin/powerpill"
  install -Dm644 'powerpill.json' "$pkgdir/etc/powerpill/powerpill.json"
  install -Dm644 'man/powerpill.json.1.gz' "$pkgdir/usr/share/man/man1/powerpill.json.1.gz"
  install -Dm644 'powerpill-bash-completion.sh' "$pkgdir/usr/share/bash-completion/completions/powerpill"
  install -Dm644 '_powerpill.zsh' "$pkgdir/usr/share/zsh/site-functions/_powerpill"
}

# vim: set ts=2 sw=2 et:
