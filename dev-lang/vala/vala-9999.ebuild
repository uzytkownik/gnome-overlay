# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion gnome2

ESVN_REPO_URI="http://svn.gnome.org/svn/vala/trunk"
ESVN_PROJECT="vala"
ESVN_BOOTSTRAP="./autogen.sh"

DESCRIPTION="Vala - Compiler for the GObject type system"
HOMEPAGE="http://live.gnome.org/Vala"
SRC_URI=""

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="debug gen-project vapigen"

RDEPEND=">=dev-libs/glib-2.12
         gen-project? ( >=x11-libs/gtk+-2.10 )"
DEPEND="${RDEPEND}
        sys-devel/flex
		||  ( sys-devel/bison dev-util/yacc )
        dev-libs/libxslt"

DOCS="AUTHORS ChangeLog MAINTAINERS NEWS README"

src_unpack() {
	subversion_src_unpack
}

pkg_setup() {
	G2CONF="${G2CONF}
	        $(use_enable debug)
			$(use_enable gen-project) 
			$(use_enable vapigen)"
}

