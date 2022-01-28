#!/bin/bash

echo -e "Looking for services to terminate...\n"

count=0
kcount=0

# Seek and Destroy
for s in "${services[@]}"
do
  if kill -9 $(pgrep $s); then
    echo -e "Killed $s\n"
    (( kcount++ ))
  else
    echo -e "$s not running\n"
  fi
  (( count++ ))
done

echo -e "$kcount running services terminated.\n$count services checked."
