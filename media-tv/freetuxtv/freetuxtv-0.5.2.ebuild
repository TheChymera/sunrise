# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="WebTV player for french people to watch ADSL TV"
HOMEPAGE="http://code.google.com/p/freetuxtv/"
SRC_URI="http://freetuxtv.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="x11-libs/gtk+:2
	dev-libs/glib:2
	dev-libs/dbus-glib
	dev-db/sqlite:3
	media-video/vlc[live,rtsp]
	net-misc/curl
	x11-libs/libnotify
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"

src_configure() {
	econf $(use_enable nls)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README || die
}
