# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils flag-o-matic systemd subversion

DESCRIPTION="Precision Time Protocol daemon"
HOMEPAGE="http://ptpd.sf.net"

ESVN_REPO_URI="http://svn.code.sf.net/p/ptpd/code/trunk"
SRC_URI=""
KEYWORDS=""

LICENSE="BSD"
SLOT="0"
IUSE="snmp +statistics ntp experimental debug +pcap slave-only"
RDEPEND="snmp? ( net-analyzer/net-snmp:= )
	pcap? ( net-libs/libpcap:= )"
DEPEND="${RDEPEND}"
RDEPEND="${RDEPEND}
	ntp? ( net-misc/ntp )"

src_unpack() {
	subversion_src_unpack
}

src_prepare() {
	eautoreconf
}

src_configure() {
	append-flags -fno-strict-aliasing
	econf \
		--enable-daemon \
		$(use_enable snmp) \
		$(use_enable experimental experimental-options) \
		$(use_enable statistics) \
		$(use_enable debug runtime-debug) \
		$(use_enable pcap) \
		$(use_enable slave-only)
}

src_install() {
	emake install DESTDIR="${D}"

	insinto /etc
	newins "src/ptpd2.conf.minimal" ptpd2.conf

	newinitd "${FILESDIR}/ptpd2.rc" ptpd2
	newconfd "${FILESDIR}/ptpd2.confd" ptpd2

	systemd_dounit "${FILESDIR}/ptpd2.service"
}

pkg_postinst() {
	elog "Do not forget to setup correct network interface."
	elog "Change the config file /etc/ptpd2.conf to suit your needs."
}
