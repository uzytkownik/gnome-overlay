# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2

inherit gnome2

DESCRIPTION="Seed allows to use GObject from JavaScript scripts"
HOMEPAGE="http://live.gnome.org/Seed"
S="$WORKDIR/seed-0.3"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="nls"

DEPEND="dev-util/intltool
        sys-devel/gettext
		$RDEPEND"
RDEPEND="|| (
         	sys-devel/gcc[libffi]
            virtual/libffi
	     )
		 sys-libs/readline
		 x11-libs/cairo
		 >=dev-db/sqlite-3
		 gnome-extra/gobject-introspection
		 net-libs/webkit-gtk" # TODO: Check if it is possible to use qt webkit

pkg_setup() {
	G2CONF="$G2CONF $(use_enable nls)"
}

