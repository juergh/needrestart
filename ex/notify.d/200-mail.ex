#!/bin/sh

# needrestart - Restart daemons after library updates.
#
# Authors:
#   Thomas Liske <thomas@fiasko-nw.net>
#
# Copyright Holder:
#   2013 - 2014 (C) Thomas Liske [http://fiasko-nw.net/~thomas/]
#
# License:
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#

# Use /usr/bin/mail to notify a user via e-mail.

MAILX='/usr/bin/mail'
test -x "$MAILX" || exit 1

echo "[$0] notify user $NR_USERNAME on $NR_SESSION via mail" 1>&2

{
    echo "Your session on host $(hostname -f) ($NR_SESSION) is running obsolete binaries or libraries as listed below."
    echo
    echo "Please consider to relogin or restart the affected processes!"
    echo
    cat
} | fold -s -w 72 | "$MAILX" -s "Relogin or restarts on host $(hostname) required!" "$NR_USERNAME"
