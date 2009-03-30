# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2

inherit git gnome2

DESCRIPTION="The GLib-based network library"
HOMEPAGE=""
EGIT_REPO_URI="git://git.desrt.ca/gnio"
EGIT_BOOTSTRAP="./autogen.sh"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="gir vala"

DEPEND="vala? ( >=dev-lang/vala-0.5.7 )
		dev-util/gtk-doc
		${RDEPEND}"
RDEPEND=">=dev-libs/glib-2.19.6[gresolver]
		 gir? ( >=gnome-extra/gobject-introspection-0.6.3 )
		 >=net-libs/gnutls-2.2.5"

src_unpack() {
	git_src_unpack
}

pkg_setup() {
	G2CONF="${G2CONF} $(use_enable vala) $(use_enable gir introspection)"
}
