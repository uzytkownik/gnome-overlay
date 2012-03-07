# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/udisks/udisks-1.0.4-r2.ebuild,v 1.1 2012/01/23 01:30:05 ssuominen Exp $

EAPI=4
inherit eutils bash-completion-r1 linux-info systemd autotools

DESCRIPTION="Daemon providing interfaces to work with storage devices"
HOMEPAGE="http://www.freedesktop.org/wiki/Software/udisks"
SRC_URI="http://hal.freedesktop.org/releases/${P}.tar.gz"
SRC_URI="http://cgit.freedesktop.org/udisks/snapshot/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE="debug doc introspection nls remote-access systemd"

COMMON_DEPEND="
	|| ( >=sys-fs/udev-171-r1[gudev] <sys-fs/udev-171-r1[extras] )
	>=dev-libs/glib-2.31.13
	>=sys-auth/polkit-0.92
	>=dev-libs/libatasmart-0.17
	>=sys-apps/sg3_utils-1.27.20090411
	introspection? ( dev-libs/gobject-introspection )
	systemd? ( sys-apps/systemd )"
RDEPEND="${COMMON_DEPEND}
	virtual/eject
	remote-access? ( net-dns/avahi )"
DEPEND="${COMMON_DEPEND}
	app-text/docbook-xsl-stylesheets
	dev-libs/libxslt
	>=dev-util/intltool-0.40.0
	dev-util/pkgconfig
	doc? (
		dev-util/gtk-doc
		app-text/docbook-xml-dtd:4.1.2
		)"

RESTRICT="test" # FIXME: dbus environment and sudo problems

pkg_setup() {
	if use amd64 || use x86; then
		CONFIG_CHECK="~USB_SUSPEND ~!IDE"
		linux-info_pkg_setup
	fi
}

src_prepare() {
	./autogen.sh --help
}

src_configure() {
	use systemd && \
		CONF="--with-systemdsystemunitdir=$(systemd_get_unitdir)"
	econf \
		--localstatedir="${EPREFIX}"/var \
		--disable-static \
		$(use_enable debug verbose-mode) \
		$(use_enable doc gtk-doc) \
		--enable-dmmp \
		$(use_enable remote-access) \
		$(use_enable nls) \
		$(use_enable introspection) \
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html \
		${CONF}
}

src_install() {
	emake DESTDIR="${D}" slashsbindir=/usr/sbin install #398081
	dodoc AUTHORS HACKING NEWS README

	rm -f "${ED}"/etc/profile.d/udisksctl-bash-completion.sh
	newbashcomp tools/udisksctl-bash-completion.sh ${PN}

	find "${ED}" -name '*.la' -exec rm -f {} +

	keepdir /media
	keepdir /var/lib/udisks #383091
}
