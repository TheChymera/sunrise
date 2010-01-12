# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit qt4-r2

MY_PN="${PN}-src"

DESCRIPTION="Monkey Studio is a cross platform Qt 4 IDE"
HOMEPAGE="http://monkeystudio.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_PN}-${PV}.zip"

KEYWORDS="~x86"
LICENSE="GPL-2"
SLOT="0"
IUSE="doc"

RDEPEND="x11-libs/qt-gui:4
	x11-libs/qt-sql:4"
DEPEND="${RDEPEND}
	app-arch/unzip"

S=${WORKDIR}/${MY_PN}-${PV}

src_prepare() {
	sed -i \
		-e 's#/build/#build/#g' \
		"${S}/monkey.pro" || die "build-dir fix failed"
}

src_install() {
	dodoc {Readme,ToDo,WishList,Informations,Changes,Bugs}.txt
	dobin binary/monkey_x11
	dosym monkey_x11 /usr/bin/monkeystudio
	use doc && dohtml -r docqt4ds/english/html/*
}
