# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/telepathy-mission-control/telepathy-mission-control-4.67.ebuild,v 1.3 2009/01/07 17:12:27 armin76 Exp $

inherit eutils

DESCRIPTION="Nokia's implementation of a Telepathy Mission Control"
HOMEPAGE="http://mission-control.sourceforge.net/"
SRC_URI="http://telepathy.freedesktop.org/releases/telepathy-mission-control/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~sparc ~x86"
IUSE="debug doc examples test"

RDEPEND=">=net-libs/telepathy-glib-0.7.32
	>=dev-libs/dbus-glib-0.51
	>=gnome-base/gconf-2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-libs/libxslt
	doc? ( dev-util/gtk-doc )
	virtual/python"

src_compile() {
	econf $(use_enable doc gtk-doc) \
		$(use_enable debug) \
		$(use_enable test tests) \
		$(use_enable examples) \
		--disable-Werror \
		--enable-server \
		--enable-plugins
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog
}
