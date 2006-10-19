# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="This script allow you to unmask a package and its dependencies"
HOMEPAGE="http://gechi.it/"
SRC_URI="http://gechi-overlay.sf.net/distfiles/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=""
RDEPEND="sys-apps/portage"

src_install() {
	newsbin ${PN}.sh ${PN}
	dodoc AUTHORS NEWS ChangeLog
}
