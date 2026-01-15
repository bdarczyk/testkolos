#!/bin/bash

PIPE="kolejka_danych"

if [ ! -p $PIPE ]; then
    mkfifo $PIPE
fi

(
    sleep 2
    echo "SYSTEM_OK" > $PIPE 
) &

DANE=$(cat $PIPE)

WYNIK=$(echo "$DANE" | tr '[:upper]' '[:lower]')
echo "odebrano status: $WYNIK"
rm $PIPE