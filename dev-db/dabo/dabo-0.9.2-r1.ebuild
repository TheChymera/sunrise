# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit distutils multilib

DESCRIPTION="A 3-tier, cross-platform application development framework written in Python/wxPython"
HOMEPAGE="http://dabodev.com/"
SRC_URI="http://cdn.cloudfiles.mosso.com/c118811/${PN}/${P}-mac-nix.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ide"

DEPEND=">=dev-python/setuptools-0.6_alpha9"

RDEPEND=">=dev-python/wxpython-2.6.1.1
	>=dev-db/sqlite-3.0
	dev-lang/python[sqlite]
	ide? ( dev-python/imaging dev-python/reportlab )"

S=${WORKDIR}/${PN}

src_install() {
	distutils_src_install

	dodoc ANNOUNCE AUTHORS ChangeLog README TODO || die

	if use ide; then
		cd "${S}/ide"
		INS="/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}/ide"

		insinto ${INS}
		doins -r * || die "IDE installation failed!"

		# pick out those files which should be executable
		for EFIL in $(grep -RI '^#!' * | cut -d : -f 1 | grep -iv '\.txt$')
		do
			# and if there are any - install them
			exeinto "${INS}/$(dirname ${EFIL})"
			doexe "${EFIL}" || die
		done
	fi
}
