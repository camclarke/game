#!/usr/bin/env bash
# Fails if a file that .gitattributes routes through Git LFS was committed as a
# raw binary instead of an LFS pointer. A raw binary stays in git history
# forever, so every future clone downloads it, even after the file is deleted.
#
# Reads blobs from the git index, so it works before the first commit and in CI
# (where the checkout leaves the index equal to HEAD).
set -uo pipefail

# An LFS pointer is a small text file (well under 1 KB) whose first line is this.
pointer_header='^version https://git-lfs.github.com/spec/v1'

bad=0
while IFS= read -r -d '' path; do
  size=$(git cat-file -s ":$path")
  if [ "$size" -gt 1024 ] || ! git cat-file blob ":$path" | grep -q "$pointer_header"; then
    echo "NOT an LFS pointer: $path ($size bytes)"
    bad=1
  fi
done < <(git ls-files -z -- ':(attr:filter=lfs)')

if [ "$bad" -ne 0 ]; then
  echo
  echo "Fix: run 'git lfs install', then for each file: git rm --cached <file> && git add <file>"
  exit 1
fi
echo "LFS pointer check passed."
