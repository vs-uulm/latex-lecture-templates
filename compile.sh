#!/usr/bin/env bash

function error() {
	echo "Please install rubber to compile."
	exit 1
}
which rubber >/dev/null || error

rubber --clean --pdf main
rubber --pdf main

if [ "$?" -eq 0 ]; then
	which open >/dev/null && open main.pdf
fi