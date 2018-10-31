#!/usr/bin/env bash
set -e

# Builds all the documents in localization folders
docs_dir="doc*"
for d in ${docs_dir} ; do
  rm -rf $d/build
  sphinx-build -W -b html $d/source $d/build/html
done

# Copy this back to the main folder
docs_dir="doc-*"
for d in ${docs_dir} ; do
  cp -r $d/build/html doc/build/html/${d#*-}
done
