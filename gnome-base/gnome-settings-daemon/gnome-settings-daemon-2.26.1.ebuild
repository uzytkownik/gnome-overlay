# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-base/gnome-settings-daemon/gnome-settings-daemon-2.24.1-r1.ebuild,v 1.1 2008/12/02 15:02:18 remi Exp $

inherit autotools confutils eutils gnome2

DESCRIPTION="Gnome Settings Daemon"
HOMEPAGE="http://www.gnome.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE="debug libnotify pulseaudio"

RDEPEND=">=dev-libs/dbus-glib-0.74
	>=dev-libs/glib-2.18.0
	>=x11-libs/gtk+-2.13
	>=gnome-base/gconf-2.6.1
	>=gnome-base/libgnomekbd-2.21.4

	>=gnome-base/libglade-2
	>=gnome-base/libgnomeui-2
	>=gnome-base/gnome-desktop-2.25.6

	libnotify? ( >=x11-libs/libnotify-0.4.3 )

	x11-libs/libX11
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXext
	x11-libs/libXxf86misc
	>=x11-libs/libxklavier-3.8
	media-libs/fontconfig

	pulseaudio? ( >=media-sound/pulseaudio-0.9.12 )
	!pulseaudio? (
		>=media-libs/gstreamer-0.10.1.2
		>=media-libs/gst-plugins-base-0.10.1.2 )
"

DEPEND="${RDEPEND}
	!<gnome-base/gnome-control-center-2.22
	sys-devel/gettext
	>=dev-util/intltool-0.40
	>=dev-util/pkgconfig-0.19
	x11-proto/inputproto
	x11-proto/xproto"

# README is empty
DOCS="AUTHORS NEWS ChangeLog MAINTAINERS"

pkg_setup() {
	G2CONF="${G2CONF}
		$(use_enable debug)
		$(use_with libnotify)
		$(use_enable pulseaudio pulse)
		$(use_enable !pulseaudio gstreamer)"

	if use pulseaudio; then
		elog "Building volume media keys using Pulseaudio"
	else
		elog "Building volume media keys using GStreamer"
	fi
}

src_unpack() {
	gnome2_src_unpack

	# Restore gstreamer volume control support, upstream bug #571145
	epatch "${FILESDIR}/${P}-readd-gst-vol-control-support.patch"
	epatch "${FILESDIR}/${P}-volume-keys.patch"

	# Fix background loading (GNOME bug #564909)
	# This patch needs to be verified, I couldn't reproduce the original bug
	# ~nirbheek
	#epatch "${FILESDIR}/${P}-background.patch"

	eautoreconf
}
