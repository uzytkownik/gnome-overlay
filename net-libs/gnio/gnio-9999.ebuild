# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="The GLib-based network library"
HOMEPAGE="http://sciyoshi.com/projects/gnio/"
EGIT_REPO_URI="http://sciyoshi.com/git/gnio.git/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="=dev-lang/vala-9999
		${RDEPEND}"
RDEPEND=">=dev-libs/glib-2.16"

src_unpack() {
	git_src_unpack
}

src_compile() {
	./waf configure --prefix /usr
	./waf
}

src_install() {
	./waf install --destdir="${D}"
}