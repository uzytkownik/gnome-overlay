# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit mercurial

DESCRIPTION="Vala plugin for Anjuta"
HOMEPAGE="http://freehg.org/u/abderrahim/anjuta-vala-plugin/"
EHG_REPO_URI="http://freehg.org/u/abderrahim/anjuta-vala-plugin/"
EHG_PROJECT="anjuta-vala-plugin"
S="${WORKDIR}/${PN}"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-lang/vala-0.5.7 >=dev-util/anjuta-2.24.0"
RDEPEND="${DEPEND}"

src_unpack() {
	mercurial_src_unpack
	cd "${S}"
	epatch "${FILESDIR}/${PN}-distdir.patch"
}

