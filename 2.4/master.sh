#!/bin/sh

# ------------------------------------------------------------------------------
# Rancher 2.3 CIS benchmark
#
# ------------------------------------------------------------------------------

# Load dependencies
. ./helper.sh

# Check for required program(s)
req_progs='awk grep'
for p in $req_progs; do
  command -v "$p" >/dev/null 2>&1 || { printf "%s command not found.\n" "$p"; exit 1; }
done

# Load all the tests from master/ and run them
main () {
  for test in master/master_*.sh
  do
     . ./"$test"
  done
}

main "$@"
