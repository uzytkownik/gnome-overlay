# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2

inherit gnome2 eutils autotools git

DESCRIPTION="The GObject introspection"
HOMEPAGE="http://live.gnome.org/GObjectIntrospection/"
EGIT_REPO_URI="git://git.gnome.org/gobject-introspection"
EGIT_BOOTSTRAP="NOCONFIGURE=yes ./autogen.sh"
SRC_URI=""

LICENSE="LGPL-2 GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.19.0
        || ( sys-devel/gcc[libffi] virtual/libffi )
		>=dev-lang/python-2.5
		dev-util/gtk-doc"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-0.6.2-gir.patch"
	NOCONFIGURE=yes ./autogen.sh
}

