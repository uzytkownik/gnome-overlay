# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git gnome2 autotools

EGIT_REPO_URI="git://git.gnome.org/vala"
EGIT_BOOTSTRAP="./autogen.sh"

DESCRIPTION="Vala - Compiler for the GObject type system"
HOMEPAGE="http://live.gnome.org/Vala"
SRC_URI=""
S="${WORKDIR}/vala"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="doc +vapigen"

RDEPEND=">=dev-libs/glib-2.12"
DEPEND="${RDEPEND}
		doc? ( dev-libs/libxslt )"

DOCS="AUTHORS ChangeLog MAINTAINERS NEWS README"

src_unpack() {
	git_src_unpack
}

pkg_setup() {
	G2CONF="${G2CONF}
			$(use_enable vapigen)"
}

