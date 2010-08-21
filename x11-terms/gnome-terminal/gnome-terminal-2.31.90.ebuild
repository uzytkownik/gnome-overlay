# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-terms/gnome-terminal/gnome-terminal-2.30.2.ebuild,v 1.1 2010/06/22 14:12:20 pacho Exp $

EAPI="2"

GCONF_DEBUG="no"

inherit eutils gnome2

DESCRIPTION="The Gnome Terminal"
HOMEPAGE="http://www.gnome.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux"
IUSE="gtk3"

# libgnome needed for some monospace font schema, bug #274638
RDEPEND=">=dev-libs/glib-2.25.0
	gtk3? (
		>=x11-libs/gtk+-2.90.6:3
	)
	!gtk3? (
		>=x11-libs/gtk+-2.18.0:2
	)
	>=gnome-base/gconf-2.31.3
	>=x11-libs/vte-0.25.90[gtk3?]
	x11-libs/libSM
	gnome-base/libgnome"
DEPEND="${RDEPEND}
	  sys-devel/gettext
	>=dev-util/intltool-0.40
	>=dev-util/pkgconfig-0.9
	>=app-text/gnome-doc-utils-0.3.2
	>=app-text/scrollkeeper-0.3.11"

DOCS="AUTHORS ChangeLog HACKING NEWS README"

src_prepare() {
	# Use login shell by default (#12900)
	epatch "${FILESDIR}"/${PN}-2.22.0-default_shell.patch

	epatch "${FILESDIR}"/${P}-version-check.patch
}

pkg_setup() {
	if use gtk3; then
		G2CONF="${G2CONF} --with-gtk=3.0"
	else
		G2CONF="${G2CONF} --with-gtk=2.0"
	fi
	G2CONF="${G2CONF} --enable-skey"
}
