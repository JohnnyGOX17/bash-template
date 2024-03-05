#! /usr/bin/env bash
#
# `-e` if a command fails, exit script
# `-u` treat unset variables as an error
# `-o pipefail` cause any errors here to propagate to a pipe
#
# References:
#  * https://sipb.mit.edu/doc/safe-shell/
#  * [bash strict mode](https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425)
#  * https://betterdev.blog/minimal-safe-bash-script-template/
set -eu -o pipefail

export SH_CLEAR='\033[0m'
export SH_RED='\033[0;31m'
export SH_GREEN='\033[0;32m'
export SH_ORANGE='\033[0;33m'
export SH_BLUE='\033[0;34m'
export SH_PURPLE='\033[0;35m'
export SH_CYAN='\033[0;36m'
export SH_YELLOW='\033[1;33m'

info() {
  echo >&2 -e "${SH_BLUE}INFO [$(date +"%T")]:${SH_CLEAR} ${1-}"
}

warn() {
  echo >&2 -e "${SH_YELLOW}WARN [$(date +"%T")]:${SH_CLEAR} ${1-}"
}

error() {
  local code=${2-1} # default exit status 1
  echo >&2 -e "${SH_RED}ERROR [$(date +"%T")]:${SH_CLEAR} ${1-}"
  exit "$code"
}
