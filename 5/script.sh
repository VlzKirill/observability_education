#!/bin/bash

metric1=$((RANDOM%100))
metric2=$((RANDOM%100))
metric3=$((RANDOM%100))

case "$1" in
  metric1)
    echo $metric1
    ;;
  metric2)
    echo $metric2
    ;;
  metric3)
    echo $metric3
    ;;
  *)
    echo "[{\"{#METRIC}\":\"metric1\"},{\"{#METRIC}\":\"metric2\"},{\"{#METRIC}\":\"metric3\"}]"
    ;;
esac
