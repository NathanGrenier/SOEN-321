#!/usr/bin/env bash
set -euo pipefail

RESULTS_DIR="./results"
ALL=false

# parse args
while [ "$#" -gt 0 ]; do
    case "$1" in
        --all) ALL=true; shift ;;
        -h|--help) echo "Usage: $0 [--all]"; exit 0 ;;
        *) echo "Unknown option: $1"; echo "Usage: $0 [--all]"; exit 1 ;;
    esac
done

if [ ! -d "$RESULTS_DIR" ]; then
    echo "No results directory at $RESULTS_DIR"
    exit 0
fi

if [ "$ALL" = true ]; then
    # Remove all .csv and .log files under results (recursive). Keeps directories intact.
    find "$RESULTS_DIR" -type f \( -name '*.csv' -o -name '*.log' \) -print -delete
    echo "Removed .csv and .log files from $RESULTS_DIR"
else
    # Only remove .log files
    find "$RESULTS_DIR" -type f -name '*.log' -print -delete
    echo "Removed .log files from $RESULTS_DIR"
fi