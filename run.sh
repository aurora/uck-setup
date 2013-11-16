#!/usr/bin/env bash

# uck-setup
# Copyright (C) 2013 by Harald Lapp <harald@octris.org>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#
# This script can be found at:
# https://github.com/aurora/uck-setup
#

set -e

# determine linux
if ! command -v lsb_release >/dev/null 2>&1; then
    echo "operating system is not supported"
    uname -a
    exit 1
fi
    
LINUX="$(lsb_release -s -i | tr '[A-Z]' '[a-z]')-$(lsb_release -s -r)-$(uname -m)"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d $DIR/$LINUX ]; then
    echo "operating system is not supported"
    echo $LINUX
    exit 1
fi

# set ~/tmp as work-directory
if [ ! -d ~/tmp ]; then
    mkdir ~/tmp
fi

cd ~/tmp

# execute scripts
for i in $(ls -1 $DIR/$LINUX/enabled/); do 
    source $i
done
