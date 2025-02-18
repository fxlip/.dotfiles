#!/bin/bash

# ============================================================================
dpkg --set-selections < pkg.lst
apt-get update
apt-get dist-upgrade
apt-get dselect-upgrade
apt-get -f install

