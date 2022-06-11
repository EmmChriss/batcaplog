#!/usr/bin/env bash

TIMESTAMP="$(date +%s)"
for bat in /sys/class/power_supply/BAT*; do
  bat_name="$(basename "$bat")"
  CAP_NOW="$(cat "$bat/energy_full")"
  CAP_DESIGN="$(cat "$bat/energy_full_design")"
  CAP="$(awk -v c="$CAP_NOW" -v d="$CAP_DESIGN" 'BEGIN { print (c * 100 / d) }')"
  printf "%s,%s,%.3f\n" "$TIMESTAMP" "$bat_name" "$CAP" >> /var/log/batcaplog
done
