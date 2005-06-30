dnl  Copyright 2005 Red Hat, Inc.
dnl
dnl  Permission to use, copy, modify, distribute, and sell this software
dnl  and its documentation for any purpose is hereby granted without
dnl  fee, provided that the above copyright notice appear in all copies
dnl  and that both that copyright notice and this permission notice
dnl  appear in supporting documentation, and that the name of Red Hat
dnl  not be used in advertising or publicity pertaining to distribution
dnl  of the software without specific, written prior permission.  Red
dnl  Hat makes no representations about the suitability of this software
dnl  for any purpose.  It is provided "as is" without express or implied
dnl  warranty.
dnl
dnl  RED HAT DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
dnl  INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN
dnl  NO EVENT SHALL RED HAT BE LIABLE FOR ANY SPECIAL, INDIRECT OR
dnl  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
dnl  OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
dnl  NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
dnl  CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
dnl
dnl Process this file with autoconf to create configure.

# UTILFONT_MAPFILES()
# -------------------
# Adds --with-mapfiles=path and verifies map file location.  If no explicit
# path is given, then it tries to find an appropriate one by first falling
# back to $prefix and finally to $x_libraries.  If no prefix is given, then
# it tries /usr/X11R6.
AC_DEFUN([UTILFONT_MAPFILES],[
AC_PATH_X
AC_ARG_WITH(mapfiles, [  --with-mapfiles=path    path to mapfiles],
	TMPFUDIR=$with_mapfiles,
	TMPFUDIR=)
AC_MSG_CHECKING([for font map files])
if ! test -e "$TMPFUDIR/map-ISO8859-1" ; then
    TMPPFX=`echo $prefix`
    if test "$prefix" = "NONE" ; then
        TMPPFX="/usr/X11R6"
    fi
    TMPFUDIR="$TMPPFX/lib/X11/fonts/util"
    if ! test -e "$TMPFUDIR/map-ISO8859-1" ; then
        TMPFUDIR="$x_libraries/X11/fonts/util"
        if ! test -e "$TMPFUDIR/map-ISO8859-1" ; then
	    AC_MSG_ERROR([Not found])
        fi
    fi
fi
AC_MSG_RESULT($TMPFUDIR)
$1_PATH="$TMPFUDIR"
])
