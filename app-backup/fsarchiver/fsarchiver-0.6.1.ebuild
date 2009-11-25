# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools eutils

DESCRIPTION="Flexible filesystem archiver for backup and deployment tool"
HOMEPAGE="http://www.fsarchiver.org"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug gcrypt lzma lzo static"

DEPEND="sys-libs/zlib
	app-arch/bzip2
	>=sys-fs/e2fsprogs-1.41.4
	lzma? ( >=app-arch/xz-utils-4.999.9_beta )
	lzo? ( >=dev-libs/lzo-2.02 )
	gcrypt? ( dev-libs/libgcrypt )
	static? ( lzma? ( app-arch/xz-utils[static-libs] ) )"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-configure.patch"
	if ! use debug ; then
		sed -i -e 's/^\([a-z]*_CFLAGS.*\)-ggdb/\1/' src/Makefile.am || die "seding failed"
	fi
	eautoreconf
}

src_configure() {
	econf $(use_enable lzma) \
	$(use_enable lzo) \
	$(use_enable gcrypt crypto) \
	$(use_enable static) \
	$(use_enable debug devel)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
}
