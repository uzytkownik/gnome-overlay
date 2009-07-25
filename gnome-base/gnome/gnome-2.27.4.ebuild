# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-base/gnome/gnome-2.26.2.ebuild,v 1.1 2009/05/28 22:33:38 eva Exp $
EAPI="1"

DESCRIPTION="Meta package for the GNOME desktop"
HOMEPAGE="http://www.gnome.org/"

LICENSE="as-is"
SLOT="2.0"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="~amd64 ~x86 ~x86-fbsd"

IUSE="accessibility cdr cups dvdr esd ldap mono"

S=${WORKDIR}

RDEPEND="
	>=dev-libs/glib-2.21.3
	>=x11-libs/gtk+-2.17.4
	>=dev-libs/atk-1.26.0
	>=x11-libs/pango-1.24.4

	>=dev-libs/libxml2-2.7.2
	>=dev-libs/libxslt-1.1.22

	>=media-libs/audiofile-0.2.6-r1
	esd? ( >=media-sound/esound-0.2.41 )
	>=x11-libs/libxklavier-3.6
	>=media-libs/libart_lgpl-2.3.20

	>=dev-libs/libIDL-0.8.13
	>=gnome-base/orbit-2.14.16

	>=x11-libs/libwnck-2.27.4
	>=x11-wm/metacity-2.27.0

	>=gnome-base/gnome-keyring-2.27.4
	>=app-crypt/seahorse-2.27.1

	>=gnome-base/gnome-vfs-2.24.1

	>=gnome-base/gnome-mime-data-2.18.0

	>=gnome-base/gconf-2.26.2
	>=net-libs/libsoup-2.27.4

	>=gnome-base/libbonobo-2.24.1
	>=gnome-base/libbonoboui-2.24.1
	>=gnome-base/libgnome-2.26.0
	>=gnome-base/libgnomeui-2.24.1
	>=gnome-base/libgnomecanvas-2.26.0
	>=gnome-base/libglade-2.6.4

	>=gnome-extra/bug-buddy-2.27.1
	>=gnome-base/libgnomekbd-2.27.4
	>=gnome-base/gnome-settings-daemon-2.27.4
	>=gnome-base/gnome-control-center-2.27.4

	>=gnome-base/gvfs-1.3.2
	>=gnome-base/eel-2.24.0
	>=gnome-base/nautilus-2.27.4

	>=media-libs/gstreamer-0.10.23
	>=media-libs/gst-plugins-base-0.10.23
	>=media-libs/gst-plugins-good-0.10.15
	>=gnome-extra/gnome-media-2.27.4
	>=media-sound/sound-juicer-2.26.1
	>=dev-libs/totem-pl-parser-2.27.1
	>=media-video/totem-2.27.1

	>=media-gfx/eog-2.27.4

	>=www-client/epiphany-2.27.4
	>=app-arch/file-roller-2.27.2
	>=gnome-extra/gcalctool-5.27.2

	>=gnome-extra/gconf-editor-2.26.0
	>=gnome-base/gdm-2.26.1
	>=x11-libs/gtksourceview-2.6.2:2.0
	>=app-editors/gedit-2.27.2

	>=app-text/evince-2.27.4

	>=gnome-base/gnome-desktop-2.27.2
	>=gnome-base/gnome-session-2.27.4
	>=dev-libs/libgweather-2.26.2.1
	>=gnome-base/gnome-applets-2.27.3
	>=gnome-base/gnome-panel-2.27.4
	>=gnome-base/gnome-menus-2.27.4
	>=x11-themes/gnome-icon-theme-2.26.0
	>=x11-themes/gnome-themes-2.27.4
	>=gnome-extra/deskbar-applet-2.27.4

	>=x11-themes/gtk-engines-2.18.2
	>=x11-themes/gnome-backgrounds-2.24.1

	>=x11-libs/vte-0.20.5
	>=x11-terms/gnome-terminal-2.26.3.1

	>=gnome-extra/gucharmap-2.26.3.1
	>=gnome-base/libgnomeprint-2.18.6
	>=gnome-base/libgnomeprintui-2.18.4

	>=gnome-extra/gnome-utils-2.27.2

	>=dev-python/gnome-python-desktop-2.27.1
	>=gnome-extra/gnome-games-2.27.4
	>=gnome-base/librsvg-2.26.0

	>=gnome-extra/gnome-system-monitor-2.27.4
	>=gnome-base/libgtop-2.26.1

	>=x11-libs/startup-notification-0.9

	>=gnome-extra/gnome-user-docs-2.26.2
	>=gnome-extra/yelp-2.27.2
	>=gnome-extra/zenity-2.26.0

	>=net-analyzer/gnome-netstatus-2.26.0
	>=net-analyzer/gnome-nettool-2.26.2

	cdr? (
		|| (
			>=app-cdr/brasero-2.27.4
			>=gnome-extra/nautilus-cd-burner-2.24.0 ) )
	dvdr? (
		|| (
			>=app-cdr/brasero-2.27.2
			>=gnome-extra/nautilus-cd-burner-2.24.0 ) )

	>=gnome-extra/gtkhtml-3.27.4
	>=mail-client/evolution-2.27.4
	>=gnome-extra/evolution-data-server-2.27.4
	>=gnome-extra/evolution-webcal-2.26.0

	>=net-misc/vino-2.26.2

	>=app-admin/pessulus-2.26.2
	ldap? (
		>=app-admin/sabayon-2.25.0
		>=net-voip/ekiga-2.2.5 )

	>=gnome-extra/gnome-screensaver-2.27.0
	>=x11-misc/alacarte-0.12.1
	>=gnome-extra/gnome-power-manager-2.27.2

	>=net-misc/vinagre-2.26.2
	>=gnome-extra/swfdec-gnome-2.26.0

	accessibility? (
		>=gnome-extra/libgail-gnome-1.20.1
		>=gnome-extra/at-spi-1.26.0
		>=app-accessibility/dasher-4.10.1
		>=app-accessibility/gnome-mag-0.15.7
		>=app-accessibility/gnome-speech-0.4.25
		>=app-accessibility/gok-2.27.4
		>=app-accessibility/orca-2.27.4
		>=gnome-extra/mousetweaks-2.27.4 )
	cups? ( >=net-print/gnome-cups-manager-0.31-r2 )

	mono? ( >=app-misc/tomboy-0.15.3 )"
# Broken from assumptions of gnome-vfs headers being included in nautilus headers,
# which isn't the case with nautilus-2.22, bug #216019
#	>=app-admin/gnome-system-tools-2.22.2
#	>=app-admin/system-tools-backends-1.4.2

# Development tools
#   scrollkeeper
#   pkgconfig
#   intltool
#   gtk-doc
#   gnome-doc-utils

pkg_postinst() {
# FIXME: Rephrase to teach about using different WMs instead, as metacity is the default anyway
# FIXME: but first check WINDOW_MANAGER is still honored in 2.24. gnome-session-2.24 might have lost
# FIXME: support for it, but we don't ship with gnome-session-2.24 yet
#	elog "Note that to change windowmanager to metacity do: "
#	elog " export WINDOW_MANAGER=\"/usr/bin/metacity\""
#	elog "of course this works for all other window managers as well"

	elog "The main file alteration monitoring functionality is"
	elog "provided by >=glib-2.16. Note that on a modern Linux system"
	elog "you do not need the USE=fam flag on it if you have inotify"
	elog "support in your linux kernel ( >=2.6.13 ) enabled."
	elog "USE=fam on glib is however useful for other situations,"
	elog "such as Gentoo/FreeBSD systems. A global USE=fam can also"
	elog "be useful for other packages that do not use the new file"
	elog "monitoring API yet that the new glib provides."
	elog
	elog
	elog "Add yourself to the plugdev group if you want"
	elog "automounting to work."
	elog
}
