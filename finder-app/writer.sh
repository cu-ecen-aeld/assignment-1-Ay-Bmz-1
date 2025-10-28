#!/usr/bin/env bash

# writer – creates a file (and any missing directories) and writes a given string into it.
# Usage: writer.sh <writefile> <writestr>
# Exits with status 1 and an error message if:
#   • One or both arguments are missing
#   • The file cannot be created / written to

if [ "$#" -lt 2 ]; then
  echo "Error: missing parameters.  Usage: $0 <writefile> <writestr>"
  exit 1
fi

writefile="$1"
writestr="$2"

dir=$(dirname "$writefile")
mkdir -p "$dir" 2>/dev/null
if [ "$?" -ne 0 ]; then
  echo "Error: could not create directory $dir"
  exit 1
fi

printf '%s' "$writestr" > "$writefile" 2>/dev/null
if [ "$?" -ne 0 ]; then
  echo "Error: could not write to file $writefile"
  exit 1
fi

exit 0
