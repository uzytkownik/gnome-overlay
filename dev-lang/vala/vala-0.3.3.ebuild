# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 autotools

DESCRIPTION="Vala - Compiler for the GObject type system"
HOMEPAGE="http://live.gnome.org/Vala"
SRC_URI="http://download.gnome.org/sources/${PN}/0.3/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gtk +vapigen"

RDEPEND=">=dev-libs/glib-2.12
		 gtk? ( >=x11-libs/gtk+-2.10 )"
DEPEND="${RDEPEND}
		sys-devel/flex
		||  ( sys-devel/bison dev-util/yacc )
		doc? ( dev-libs/libxslt )"

DOCS="AUTHORS ChangeLog MAINTAINERS NEWS README"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/missing-gnet-vapi.patch"
	eautoreconf
}

pkg_setup() {
	G2CONF="${G2CONF}
			$(use_enable gtk gen-project)
			$(use_enable vapigen)"
}

