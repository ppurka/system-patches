# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils
DESCRIPTION="Cura is developed by Ultimaker to make 3D printing as easy and streamlined as possible."
HOMEPAGE="https://daid.github.com/Cura"
SRC_URI="$P.tar.gz"

LICENSE="AGPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/pyopengl
		dev-python/numpy
		dev-python/pyserial
		dev-python/setuptools
		dev-python/wxpython
		app-arch/deb2targz"
RDEPEND="${DEPEND}"
S="${WORKDIR}"

pkg_nofetch() {
	local p="${PN}_${PV}-debian_amd64.deb"
	einfo "Please download '$p' from:"
	einfo "'http://software.ultimaker.com'"
	einfo "and run the following commands:"
	einfo "emerge deb2targz"
	einfo "deb2targz $p"
	einfo "mv ${p%.deb}.tar.gz ${DISTDIR}/${P}.tar.gz"
}

src_install() {
	cp -R "${S}/usr" "${D}/" || die "install failed"
}
