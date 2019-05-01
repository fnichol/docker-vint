#!/usr/bin/env sh

main() {
  set -eu

  # If the first argument is a flag or option, then invoke program
  if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    exec /usr/bin/vint "$@"
  else
    exec "$@"
  fi
}

main "$@"
