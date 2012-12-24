# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/w9wm/w9wm-0.4.2.ebuild,v 1.1 2006/11/10 22:13:54 truedfx Exp $

inherit eutils

DESCRIPTION="w9wm - 8-1/2-like Window Wanager for X"
HOMEPAGE="http://www.grassouille.org/code/w9wm.en.html"
SRC_URI="http://www.grassouille.org/code/w9wm/src/${P}.tar.gz"

LICENSE="9wm"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
DEPEND=""

RDEPEND="${DEPEND}
x11-misc/imake"

src_unpack() {
	unpack ${A}
	mv "${S}.orig" "${S}"
	cd ${S}
	epatch "${FILESDIR}/w9wm-gcc.diff"
}

src_compile() {
	xmkmf
	#econf || die "configure failed"
	emake || die "make failed"
	mv w9wm.man w9wm.1
	mkdir Sessions
	cp "${FILESDIR}/w9wm" Sessions/w9wm
	cp "${FILESDIR}/w9wm.desktop" .
}

src_install() {
	dobin w9wm
	doman w9wm.1
	exeinto /etc/X11/Sessions
	doexe Sessions/w9wm
	insinto /usr/share/xsessions/
	doins w9wm.desktop
}
