#!/bin/sh
#
# carbon-c-relay Carbon-like graphite line mode relay
#
# description: Enhanced C implementation of Carbon relay, \
#              aggregator and rewriter

PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="Graphite Carbon Relay"
NAME=carbon-c-relay
DAEMON=/usr/sbin/carbon-c-relay
CONFIG=/etc/carbon/$NAME.conf
OPTS="-f $CONFIG"
PIDFILE=/var/run/$NAME.pid
LOCKFILE=/var/lock/subsys/$NAME
SCRIPTNAME=/etc/init.d/$NAME
DAEMON_USER="carbon"
DISABLE=1

# Define LSB log_* functions.
. /etc/rc.d/init.d/functions

# Exit if the package is not installed
[ -x "$DAEMON" ] || exit 0

# Read configuration variable file if it is present
[ -e /etc/sysconfig/$NAME ] && . /etc/sysconfig/$NAME

[ "$DISABLE" = "0" ] || exit 0

#
# Function that starts the daemon/service
#
$DAEMON $OPTS
