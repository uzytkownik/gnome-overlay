# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="mirror://sourceforge/gtksourcecomple/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="nls"

DEPEND="$RDEPEND
		dev-util/intltool"
RDEPEND=">=x11-libs/gtksourceview-2.4.0
		 >=dev-libs/glib-2.18.0
		 >=gnome-base/libglade-2.6.0
		 nls? ( sys-devel/gettext )"

pkg_setup() {
	G2CONF="$G2CONF $(use_enable nls)"
}

