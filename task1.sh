#!/bin/bash
PIPE="kolejka_danych"
if [ ! -p $PIPE ]; then mkfifo $PIPE; fi

( sleep 2; echo "SYSTEM_OK" > $PIPE ) &

echo "Czekam na dane..."
DANE=$(cat $PIPE)
WYNIK=$(echo "$DANE" | tr '[:upper:]' '[:lower:]')
echo "Odebrano: $WYNIK"
rm $PIPE
