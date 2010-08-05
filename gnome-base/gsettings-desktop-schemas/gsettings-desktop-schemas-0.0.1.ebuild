# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit gnome.org gnome2

DESCRIPTION="Shared GSettings schemas for the desktop"
HOMEPAGE="http://www.gnome.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-libs/glib-2.21.5
	dev-util/intltool
	sys-devel/gettext"
RDEPEND="${DEPEND}"

