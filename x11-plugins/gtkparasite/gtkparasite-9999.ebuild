# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="Parasite is a GTK+ debugger"
HOMEPAGE="http://chipx86.github.com/gtkparasite/"
EGIT_REPO_URI="git://github.com/chipx86/gtkparasite"
EGIT_BOOTSTRAP="./autogen.sh --help"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.12.0
        >=dev-python/pygtk-2.10.3"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

