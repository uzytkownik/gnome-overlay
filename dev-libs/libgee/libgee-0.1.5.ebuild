# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="libgee is a collection library providing GObject-based interfaces
and classes for commonly used data structures."
HOMEPAGE="http://live.gnome.org/Libgee"
SRC_URI="http://ftp.gnome.org/pub/GNOME/sources/libgee/0.1/${P}.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.10
		>=dev-lang/vala-0.3.3"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}

