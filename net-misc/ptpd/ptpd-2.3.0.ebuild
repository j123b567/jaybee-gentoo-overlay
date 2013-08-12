# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils

DESCRIPTION="Precision Time Protocol daemon"
HOMEPAGE="http://ptpd.sf.net"
SRC_URI="mirror://sourceforge/ptpd/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="snmp statistics ntpdc experimental debug double-servo"

COMMON_DEPEND="	snmp? ( net-analyzer/net-snmp )
				net-libs/libpcap"
RDEPEND="${COMMON_DEPEND}"
DEPEND="${COMMON_DEPEND}"

src_unpack() {
    unpack ${A}
    cd "${S}"
}

src_prepare() { eautoreconf; }

src_configure() {
    econf \
		$(use_enable snmp) \
		$(use_enable experimental experimental-options) \
		$(use_enable statistics) \
        $(use_enable ntpdc) \
        $(use_enable double-servo) \
        $(use_enable debug runtime-debug)
}

#src_install() {
#	default
#	prune_libtool_files
#}


