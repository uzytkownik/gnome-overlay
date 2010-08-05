# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Telepathy Logger is a session daemon that should be activated whenever telepathy is being used (similar to mission control lifetime)."
HOMEPAGE="http://telepathy.freedesktop.org/wiki/Logger"
SRC_URI="http://telepathy.freedesktop.org/releases/${PN}/${P}.tar.bz2"

LICENSE="GPL-3 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

DEPEND=">=dev-libs/glib-2.25.11
	>=sys-apps/dbus-1.1
	>=dev-libs/dbus-glib-0.82
	>=net-libs/telepathy-glib-0.11.7
	dev-libs/libxml2
	dev-libs/libxslt
	doc? ( >=dev-util/gtk-doc-1.10 )
	test? (
		>=dev-lang/python-2.5
		dev-python/twisted )"
RDEPEND="${DEPEND}"

MAKEOPTS="${MAKEOPTS} -j1"

src_configure() {
	econf \
		$(use_enable doc gtk-doc) \
		--enable-channeltext \
		--disable-coding-style-checks \
		--disable-Werror
		# $(use_enable debug)
}

src_install() {
	emake DESTDIR="${D}" install
}

