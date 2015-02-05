# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit multilib

DESCRIPTION="Konica-Minolta printer driver for KonicaMinolta C203/C253/C353 PS/P"
HOMEPAGE="http://www.konicaminolta.uk/business-solutions/support/download-center.html"

LICENSE="Konica-Minolta EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SRC_URI="dbhc203psc200en.tgz"

RDEPEND="net-print/cups
	dev-lang/perl"

S=${WORKDIR}

src_install() {
	insinto /usr/share/ppd
	doins *.ppd

	exeinto /usr/libexec/cups/filter
	doexe femperonpsc250mu.pl
}
