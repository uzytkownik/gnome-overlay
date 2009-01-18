# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="An alarm clock"
HOMEPAGE="https://launchpad.net/alarm-clock"
SRC_URI="http://launchpad.net/alarm-clock/trunk/0.2/+download/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	>=dev-libs/glib-2.13.0
	>=x11-libs/gtk+-2.11.0
	>=gnome-base/gnome-vfs-2.15.4
	>=gnome-base/gconf-2.8.0
	>=gnome-base/libglade-2.4.0
	>=media-libs/gstreamer-0.10.2
	>=gnome-base/libgnome-2.8.0
	>=gnome-base/libgnomeui-2.8.0
	>=gnome-base/gnome-panel-2.13.4
	>=x11-themes/gnome-icon-theme-2.15.91
	>=x11-libs/libnotify-0.3.2"
RDEPEND="${DEPEND}"

