#!/usr/bin/env bash

# Author: Tommy Miland - 2019
# A small shell script to print kingjamesbibleonline.org's Popular Bible Verse

#------------------------------------------------------------------------------#
#
# MIT License
#
# Copyright (c) 2019 Tommy Miland
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#------------------------------------------------------------------------------#

# Icons used for printing
CROSS='✝'
BQUOTE='❝'
EQUOTE='❞'
# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
  ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  DIM="$(tput dim)"
  NC="$(tput sgr0)"
else
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  YELLOW='\033[0;33m'
  BLUE='\033[0;34m'
  BOLD="\033[1m"
  DIM="\033[2m"
  NC='\033[0m'
fi
# Maximum column width
width=$((70))

# URL for KJBO
VOTD_URL="https://www.kingjamesbibleonline.org/popular-bible-verses-widget.php"

# Grab POPBV from URL
get_votd () {
  w3m -dump "$VOTD_URL"
}

MESSAGE=$(
  get_votd |
  fold -w ${width} -s
)

RIGHTS="Powered by kingjamesbibleonline.org"

TITLE=$(figlet -f slant POPBV)

DESCRIPTION="These verses inspire, encourage, feed the mind, and heal the soul."

header () {
  clear
  echo -e "${BLUE}${BOLD}Popular Bible Verse${NC} ${CROSS}"
  echo -e "${DIM}${DESCRIPTION}${NC}"
  echo -e "${GREEN}"
  echo -e "${TITLE}"
  echo -e "${NC}"
  echo -e "${BLUE}${MESSAGE}${NC} ${YELLOW}(KJV)${NC}\n"
  echo -e "${RIGHTS}"
}

votd() {
  header
}

votd "$@"
