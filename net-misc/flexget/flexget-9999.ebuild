# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4 3.*"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils eutils subversion

DESCRIPTION="A multipurpose automation tool for content like torrents, nzbs, podcasts, comics, etc."
HOMEPAGE="http://flexget.com/"
SRC_URI=""
ESVN_REPO_URI="http://svn.flexget.com/trunk"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/setuptools
	dev-python/feedparser
	>=dev-python/sqlalchemy-0.6
	dev-python/pyyaml
	dev-python/beautifulsoup
	>=dev-python/html5lib-0.11
	dev-python/PyRSS2Gen
	dev-python/pynzb
	dev-python/progressbar
	dev-python/flask
	dev-python/cherrypy"
DEPEND="${RDEPEND}
	dev-python/paver
	test? ( >=dev-python/nose-0.11 )"

src_prepare() {
	# Prevent setup from grabbing nose from pypi
	sed -e /setup_requires/d -i pavement.py || die

	# Generate setup.py
	paver generate_setup || die

	epatch_user
	distutils_src_prepare
}

pkg_postinst() {
	distutils_pkg_postinst

	ewarn "FlexGet's database schema may need to be updated manually."
	ewarn "See http://flexget.com/wiki/UpgradeActions for more information."
}
