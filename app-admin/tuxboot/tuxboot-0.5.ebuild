# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils qt4-r2

DESCRIPTION="Tuxboot helps you to create a bootable Live USB drive for Clonezilla live, DRBL live, GParted live and Tux2live."
HOMEPAGE="http://tuxboot.org"
SRC_URI="mirror://sourceforge/tuxboot/${PF}.src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND=""
RDEPEND="app-arch/p7zip"

src_install() {
	dobin tuxboot
}
