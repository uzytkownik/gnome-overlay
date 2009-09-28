# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 git autotools

DESCRIPTION="Desktop-neutral search tool and indexer"
HOMEPAGE="http://www.tracker-project.org/"
SRC_URI=""
EGIT_REPO_URI="git://git.gnome.org/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="+deskbar +devkit-power eds exempi exif iptc jpeg hal +gsf gstreamer gnome
gtk +notify poppler totem tiff vala vorbis xine xml"

DEPEND="sys-libs/zlib
	>=dev-libs/glib-2.16.0
	>=x11-libs/pango-1
	>=dev-libs/dbus-glib-0.60
	>=media-libs/libpng-1.2
	>=gnome-base/gconf-2.2
	sys-apps/util-linux
	devkit-power? ( >=sys-apps/devicekit-power-007 )
	hal? ( !devkit-power? ( >=sys-apps/hal-0.5 ) )
	gstreamer? ( >=media-plugins/gst-plugins-taglib-0.10.12 )
	xine? ( !gstreamer? ( >=media-libs/xine-lib-1 ) )
	!xine? ( !gstreamer? ( >=media-plugins/gst-plugins-taglib-0.10.12 ) )
	gtk? ( >=x11-libs/gtk+-2.16 )
	deskbar? ( >=gnome-extra/deskbar-applet-2.19 ) 
	xml? ( >=dev-libs/libxml2-0.6 )
	notify? ( >=x11-libs/libnotify-0.4.3 )
	gnome? (
		>=gnome-base/libgnome-2.13.2
		>=gnome-base/libgnomeui-2.13.2
		>=gnome-base/gnome-desktop-2.9.91
		>=dev-libs/libgee-0.1.3
		>=dev-lang/vala-0.7.5
	)
	poppler? ( >=dev-libs/poppler-glib-0.4.5 )
	exif? ( >=media-gfx/exif-0.6 )
	iptc? ( media-libs/libiptcdata )
	gsf? ( >=gnome-extra/libgsf-1.13 )
	jpeg? ( media-libs/jpeg )
	tiff? ( media-libs/tiff )
	vorbis? ( >=media-libs/libvorbis-0.22 )
	exempi? ( >=media-libs/exempi-1.99.2 )
	>=dev-db/sqlite-3.6.11
	totem? ( dev-libs/totem-pl-parser )
	eds? (
		>=mail-client/evolution-2.25.5
		>=gnome-extra/evolution-data-server-2.25.5
	)
	>=dev-lang/vala-0.7
	"
RDEPEND="${DEPEND}"

pkg_setup() {
	if use devkit-power
	then
		G2CONF="${G2CONF} --enable-devkit-power --disable-hal"
	elif use hal
	then
		G2CONF="${G2CONF} --disable-devkit-power --enable-hal"
	else
		G2CONF="${G2CONF} --disable-devkit-power --disable-hal"
	fi

	if use gstreamer
	then
		G2CONF="${G2CONF} --enable-video-extractor=gstreamer"
	elif use xine
	then
		G2CONF="${G2CONF} --enable-video-extractor=xine"
	else
		G2CONF="${G2CONF} --enable-video-extractor=gstreamer"
	fi

	if use gtk && use notify
	then
		G2CONF="${G2CONF} --enable-tracker-status-icon"
	else
		G2CONF="${G2CONF} --disable-tracker-status-icon"
	fi

	G2CONF="${G2CONF}
	        --disable-gstreamer-tagreadbin
	        $(use_enable test unit-tests)
	        $(use_enable xml libxml2)
			$(use_enable gtk gdkpixbuf)
			$(use_enable gtk libtrackergtk)
			$(use_enable gtk tracker-preferences)
			$(use_enable deskbar deskbar-applet)
			$(use_enable gnome tracker-search-tool)
			$(use_enable gnome tracker-explorer)
			$(use_enable poppler poppler-glib)
			$(use_enable exif libexif)
			$(use_enable iptc libiptcdata)
			$(use_enable gsf libgsf)
			$(use_enable jpeg libjpeg)
			$(use_enable tiff libtiff)
			$(use_enable vorbis libvorbis)
			$(use_enable exempi)
			$(use_enable totem playlist)"
}

src_prepare() {
	gtkdocize
	glib-gettextize --force --copy
	eautoreconf
	intltoolize --force --copy
}


