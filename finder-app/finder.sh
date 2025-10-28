#!/usr/bin/env bash

# ------------------------------------------------------------------
# Finder – counts files and matching lines in a directory tree.
#
# Usage:  finder.sh <filesdir> <searchstr>
#
# The script prints:
#   The number of files are X and the number of matching lines are Y
#
# It exits with status 1 and an error message if:
#   • One or both arguments are missing
#   • <filesdir> is not a directory
# ------------------------------------------------------------------

# 1️⃣  Validate arguments
if [ "$#" -lt 2 ]; then
  echo "Error: missing parameters.  Usage: $0 <filesdir> <searchstr>"
  exit 1
fi

filesdir="$1"
searchstr="$2"

# 2️⃣  Validate that <filesdir> exists and is a directory
if [ ! -d "$filesdir" ]; then
  echo "Error: $filesdir is not a directory"
  exit 1
fi

# 3️⃣  Count files (recursively)
num_files=$(find "$filesdir" -type f | wc -l)

# 4️⃣  Count matching lines (recursively, quiet errors)
num_lines=$(grep -r -h "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# 5️⃣  Print the result
echo "The number of files are $num_files and the number of matching lines are $num_lines"

exit 0
