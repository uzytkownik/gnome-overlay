# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/sound-juicer/sound-juicer-2.32.0.ebuild,v 1.2 2010/12/08 17:01:34 eva Exp $

EAPI="4"
GCONF_DEBUG="yes"
GNOME2_LA_PUNT="yes"

inherit gnome2
if [[ ${PV} = 9999 ]]; then
	inherit gnome2-live
fi

DESCRIPTION="CD ripper for GNOME"
HOMEPAGE="http://www.burtonini.com/blog/computers/sound-juicer/"

LICENSE="GPL-2"
SLOT="0"
if [[ ${PV} = 9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
fi
IUSE="test"

COMMON_DEPEND=">=dev-libs/glib-2.18:2
	>=x11-libs/gtk+-2.90:3
	media-libs/libcanberra[gtk3]
	>=app-cdr/brasero-2.90
	>=gnome-base/gconf-2:2
	sys-apps/dbus
	dev-libs/dbus-glib

	>=media-libs/musicbrainz-3.0.2:3
	media-libs/libgnome-media-profiles:3

	>=media-libs/gstreamer-0.10.15:0.10
	>=media-libs/gst-plugins-base-0.10:0.10"

RDEPEND="${COMMON_DEPEND}
	gnome-base/gvfs[cdda,udev]
	>=media-plugins/gst-plugins-gconf-0.10:0.10
	>=media-plugins/gst-plugins-gio-0.10:0.10
	|| (
		>=media-plugins/gst-plugins-cdparanoia-0.10:0.10
		>=media-plugins/gst-plugins-cdio-0.10:0.10 )
	>=media-plugins/gst-plugins-meta-0.10-r2:0.10"

DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.40
	virtual/pkgconfig
	>=app-text/scrollkeeper-0.3.5
	app-text/gnome-doc-utils
	test? ( ~app-text/docbook-xml-dtd-4.3 )"

pkg_setup() {
	# GST_INSPECT needed to get around some sandboxing checks
	G2CONF="${G2CONF}
		--disable-scrollkeeper
		GST_INSPECT=$(type -p true)"
	DOCS="AUTHORS ChangeLog NEWS README TODO"
}

pkg_postinst() {
	gnome2_pkg_postinst
	ewarn "If ${PN} does not rip to some music format, please check your USE flags"
	ewarn "on media-libs/libgnome-media-profiles and media-plugins/gst-plugins-meta"
}
