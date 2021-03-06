# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

DESCRIPTION="Shell scripts to manage POSIX accounts in an LDAP."
HOMEPAGE="http://contribs.martymac.com/"
SRC_URI="http://contribs.martymac.com/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="net-nds/openldap
	dev-libs/uulib"

RUNTIMEDIR="/var/run/${PN}"
RUNTIMEFILE="runtime"
ETCDIR="/etc/${PN}"
ETCFILE="ldapscripts.conf"

src_prepare() {
	sed -i.orig -e "s|^_RUNTIMEFILE=.*|_RUNTIMEFILE=\"${RUNTIMEDIR}/${RUNTIMEFILE}\"|g" bin/*
	sed -i.orig -e "s|^_CONFIGFILE=.*|_CONFIGFILE=\"${ETCDIR}/${ETCFILE}\"|g" etc/*
}

src_install() {
	dobin bin/*
	doman man/man1/*

	insinto "${RUNTIMEDIR}"
	doins "etc/${RUNTIMEFILE}"

	insinto "${ETCDIR}"
	doins "etc/${ETCFILE}"

	dodoc CHANGELOG README TODO VERSION
}
