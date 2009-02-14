# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2

inherit gnome2 eutils

DESCRIPTION="The GObject introspection"
HOMEPAGE="http://live.gnome.org/GObjectIntrospection/"

LICENSE="LGPL-2 GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.19.0
        || ( sys-devel/gcc[libffi] virtual/libffi )
		>=dev-lang/python-2.5"
RDEPEND="${DEPEND}"

