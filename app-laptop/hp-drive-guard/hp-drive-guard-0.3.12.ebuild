# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-laptop/hp-drive-guard/hp-drive-guard-0.3.12.ebuild,v 1.1 2011/06/16 16:00:43 chainsaw Exp $

EAPI=4

inherit libtool autotools eutils


DESCRIPTION="HP 3D Drive Guard - Hard disk protection system"
HOMEPAGE="https://build.opensuse.org/package/files?package=hp-drive-guard&project=hardware"
SRC_URI="https://api.opensuse.org/public/source/hardware/hp-drive-guard/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-auth/polkit
    x11-libs/libnotify
    sys-power/upower
    x11-libs/gtk+:2
    dev-libs/glib:2"
RDEPEND="${DEPEND}"


src_prepare() {
	cp "${FILESDIR}/hp-drive-guard.in" "${WORKDIR}/${P}/init/"

	epatch "${FILESDIR}"/0001-Fix-misc-compile-warnings.patch
	epatch "${FILESDIR}"/0002-Fix-build-with-the-new-libnotify.patch
	epatch "${FILESDIR}"/use-new-polkit.diff

	AT_M4DIR="." eautoreconf
	elibtoolize
}

src_configure() {
	econf \
		--with-pm=upower \
		|| die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc README
}
