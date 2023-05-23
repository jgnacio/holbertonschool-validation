#!/usr/bin/bash
cat plugins-list.txt | awk -F '[(|)]' '{ printf "%s%s\n", $2, $3 }' > plugins.txt