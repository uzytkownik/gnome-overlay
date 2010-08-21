# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils gnome2 autotools

DESCRIPTION="People aggregation library"
HOMEPAGE="http://telepathy.freedesktop.org/wiki/Folks"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug introspection" # doc

DEPEND=">=dev-libs/glib-2.24.0
	>=net-libs/telepathy-glib-0.11.11[vala]
	>=dev-lang/vala-0.9.5
	dev-libs/dbus-glib
	dev-libs/libgee[introspection?]
	introspection? ( >=dev-libs/gobject-introspection-0.6.7 )"
#	doc? ( dev-util/valadoc )"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-build.patch"
	eautoreconf
}

pkg_setup() {
	G2CONF="${G2CONF}
		$(use_enable debug)
		$(use_enable introspection)
		--disable-Werror"
	# $(use_enable doc docs)
}

