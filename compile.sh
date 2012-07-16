#!/usr/bin/env bash

EXAMPLES="exam slides"

function error() {
	echo "Please install latexmk to compile."
	exit 1
}
which latexmk >/dev/null || error

OLDPWD="$PWD"
for e in $EXAMPLES; do
	cd examples/$e/
	latexmk -c $e >/dev/null
	latexmk -pdf $e >/dev/null
	cd $OLDPWD
done