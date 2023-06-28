#!/bin/bash

case "$1" in
  --init)
    git clone <git remote add origin https://github.com/dsw50209/projekt1-2.git> .
    export PATH=$PATH:$(pwd)
    ;;
  --error | -e)
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
      num_errors=$2
    else
      num_errors=100
    fi

    for ((i=1; i<=num_errors; i++)); do
      mkdir -p "error$i"
      echo "error$i.txt - created by skrypt.sh - $(date)" > "error$i/error$i.txt"
    done
    ;;
  --date | -d)
    echo $(date)
    ;;
  --logs | -l)
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
      num_logs=$2
    else
      num_logs=100
    fi

    for ((i=1; i<=num_logs; i++)); do
      echo "log$i.txt - created by skrypt.sh - $(date)" > "log$i.txt"
    done
    ;;
  --help | -h)
    echo "Dostępne opcje:"
    echo "  --date, -d - wyświetla dzisiejszą datę"
    echo "  --logs [liczba], -l [liczba] - tworzy automatycznie podaną liczbę plików logx.txt, gdzie x to numer pliku, domyślnie 100"
    echo "  --help, -h - wyświetla wszystkie dostępne opcje"
    ;;
  *)
    echo "Nieznana opcja. Użyj skrypt.sh --help, aby zobaczyć dostępne opcje."
    ;;
esac
