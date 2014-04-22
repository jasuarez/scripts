#!/bin/sh
#
# Creates a tunnel through ssh and redirect transparently smtp traffic
# through the tunnel.
#
# This allows to send email outside Intranet  network without the VPN.
#
# Juan A. Suarez Romero <jasuarez@igalia.com>  Mon, 26 Jan 2009 00:23:37 +0100

MAILSERVER=mail.acme.com
SSH=user@acme.com

# Create a tunnel
ssh ${SSH} -L 2525:${MAILSERVER}:25 -f -N

# Redirect mail traffic
sudo iptables -t nat -A OUTPUT -p tcp -d ${MAILSERVER} --dport 25 -j REDIRECT --to-ports 2525

