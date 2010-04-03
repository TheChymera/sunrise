# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Utility for manipulating the scancode/keycode translation tables of keyboard drivers"
HOMEPAGE="http://0pointer.de/lennart/projects/keyfuzz/"
SRC_URI="http://0pointer.de/lennart/projects/${PN}/${P}.tar.gz"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( www-client/lynx )"
RDEPEND=""

src_configure() {
	econf $(use_enable doc lynx)
}

src_install() {
	dobin src/keyfuzz || die "dobin failed"
	dodoc README || die "dodoc failed"
	doman man/* || die "doman failed"
}
