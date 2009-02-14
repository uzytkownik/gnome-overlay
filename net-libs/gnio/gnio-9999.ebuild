# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2

inherit git gnome2

DESCRIPTION="The GLib-based network library"
HOMEPAGE=""
EGIT_REPO_URI="git://git.desrt.ca/gnio"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-lang/vala-0.5.3
		${RDEPEND}"
RDEPEND=">=dev-libs/glib-2.19.6[gresolver]
		 >=gnome-extra/gobject-introspection-0.6.0
		 >=net-libs/gnutls-2.2.5"

src_unpack() {
	git_src_unpack
}
