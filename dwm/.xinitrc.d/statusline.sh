#!/bin/bash
while true; do
   xsetroot -name "$(acpi -b | awk '{ print $3, $4 }' | tr -d ',' ) | $( date +"%F %R:%S" )"
   sleep 1s
done &