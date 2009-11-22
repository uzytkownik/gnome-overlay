# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 autotools

EAPI=2

COMMIT=e492e31

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://download.github.com/chuchiperriman-gtksourcecompletion-${COMMIT}.tar.gz"
S="${WORKDIR}/chuchiperriman-gtksourcecompletion-${COMMIT}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="nls"

DEPEND="$RDEPEND
		dev-util/intltool
		dev-util/gtk-doc"
RDEPEND=">=x11-libs/gtksourceview-2.4.0
		 >=dev-libs/glib-2.18.0
		 >=gnome-base/libglade-2.6.0
		 nls? ( sys-devel/gettext )"

src_prepare() {
	gtkdocize
	eautoreconf
}

pkg_setup() {
	G2CONF="$G2CONF $(use_enable nls)"
}

