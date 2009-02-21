# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit gnome2

DESCRIPTION="Vala Toys for GEdit"
HOMEPAGE="http://code.google.com/p/vtg/"
SRC_URI="http://vtg.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE="+gen-project +vtg-plugin +vsc-shell"

DEPEND="dev-util/intltool
        ${RDEPEND}"
RDEPEND=">=dev-lang/vala-0.5.7
         >=dev-libs/glib-2.16.0
		 >=x11-libs/gtk+-2.10.0
		 vsc-shell? ( sys-libs/readline )
		 vtg-plugin? (
		 	>=app-editors/gedit-2.22.0
		 	>=x11-libs/gtksourcecompletion-0.5.2
		 )"

pkg_setup() {
	G2CONF="$G2CONF $(use_enable gen-project) $(use_enable vtg-plugin)"
	G2CONF="$G2CONF $(use_enable vsc-shell)"
}

