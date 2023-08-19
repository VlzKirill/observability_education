#!/bin/bash

metrics=("metric1" "metric2" "metric3")

for metric in "${metrics[@]}"; do
    value=$((RANDOM % 101))
    echo "otus_important_metrics[$metric] $value"
done