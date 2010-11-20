# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/gnome-themes/gnome-themes-2.32.0.ebuild,v 1.1 2010/10/12 18:05:05 pacho Exp $

EAPI="2"
GCONF_DEBUG="no"

inherit gnome2

DESCRIPTION="Adwaita theme for GNOME Shell"
HOMEPAGE="http://www.gnome.org/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Double-check gtk/gtk-engines/metacity/mutter dependencies
RDEPEND=">=x11-libs/gtk+-2
	>=x11-themes/gtk-engines-2.15.3"
DEPEND="${RDEPEND}
	>=x11-misc/icon-naming-utils-0.8.7
	>=dev-util/pkgconfig-0.19
	>=dev-util/intltool-0.35
	sys-devel/gettext"
# This ebuild does not install any binaries
RESTRICT="binchecks strip"
DOCS="NEWS"
