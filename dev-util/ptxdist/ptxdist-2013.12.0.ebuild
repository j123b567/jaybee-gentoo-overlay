# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

SPV=${PV%.*}

DESCRIPTION="PTXdist is a build system for userlands, started by Pengutronix"

HOMEPAGE="http://www.pengutronix.de/software/ptxdist/"

SRC_URI="http://www.pengutronix.de/software/${PN}/download/${P}.tar.bz2"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~x86 ~amd64"

IUSE=""

#RESTRICT="strip"

DEPEND="sys-libs/ncurses"

RDEPEND="${DEPEND}"

src_unpack() {
        unpack ${A}
        cd "${S}"
}

src_compile() {
        econf || die "econf failed"
        emake || die "emake failed"
}

src_install() {
        emake DESTDIR="${D}" install || die "emake install failed"
}

pkg_postinst() {
        elog ""
        elog "Do not forget to run '${PN} setup' as the user"
        elog "who wants use ${PN}."
        elog ""
}
