#!/bin/bash

case "$1" in
  --date)
    echo $(date)
    ;;
  --logs)
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
      num_logs=$2
    else
      num_logs=100
    fi

    for ((i=1; i<=num_logs; i++)); do
      echo "log$i.txt - created by skrypt.sh - $(date)" > "log$i.txt"
    done
    ;;
  --help)
    echo "Dostępne opcje:"
    echo "  --date - wyświetla dzisiejszą datę"
    echo "  --logs [liczba] - tworzy automatycznie podaną liczbę plików logx.txt, gdzie x to numer pliku, domyślnie 100"
    echo "  --help - wyświetla wszystkie dostępne opcje"
    ;;
  *)
    echo "Nieznana opcja. Użyj skrypt.sh --help, aby zobaczyć dostępne opcje."
    ;;
esac
