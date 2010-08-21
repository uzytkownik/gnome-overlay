# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit gnome2 versionator

DESCRIPTION="Mx is a widget toolkit using Clutter that provides a set of
standard interface elements"
HOMEPAGE=""
SRC_URI="http://source.clutter-project.org/sources/mx/1.1/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug dbus glade gtk introspection"

DEPEND=">=media-libs/clutter-1.0
	dbus? ( >=dev-libs/dbus-glib-0.82 )
	glade? ( >=dev-util/glade-3.4.5 )
	introspection? ( >=dev-libs/gobject-introspection-0.6.4 )
	x11-libs/gtk+:2"
RDEPEND="${DEPEND}"

pkg_setup() {
	G2CONF="${G2CONF}
		$(use_enable debug)
		$(use_with dbus)
		$(use_with glade)
		--enable-gtk-widgets
		--without-clutter-imcontext
		--without-clutter-gesture
		--without-startup-notification"
}

