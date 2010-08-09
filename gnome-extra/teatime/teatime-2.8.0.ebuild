# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2 eutils

DESCRIPTION="A GNOME panel applet that reminds you when your tea is ready"
HOMEPAGE="http://det.cable.nu/teatime/index.rbx"
SRC_URI="mirror://debian/pool/main/t/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.6
	>=x11-libs/gtk+-2.6
	|| ( >=media-plugins/gst-plugins-gconf-0.10
	     >=media-libs/gstreamer-0.8 )
	>=gnome-base/gnome-vfs-2.4
	>=gnome-base/gnome-panel-2.6
	>=dev-libs/libxml2-2.6"
RDEPEND=${DEPEND}

S=${WORKDIR}/${PN}_applet_2-${PV}

src_prepare() {
	epatch "${FILESDIR}/teatime-2.8.0-adding-slash-for-pixmaps-dir.patch"
	gnome2_omf_fix
}
