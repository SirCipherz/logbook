#!/bin/bash

init() {
    test -n "$LOGBOOK" || export LOGBOOK="$HOME/.logbook"
    touch /tmp/logbook
    gpg --recipient "$GPG_KEY" --output "$LOGBOOK" --encrypt /tmp/logbook
    rm /tmp/logbook
}

check() {
    test -n "$LOGBOOK" || export LOGBOOK="$HOME/.logbook"
    test -f "$LOGBOOK" && return 0

    echo "can't find any logbook file"
    read -p "would you like to create it ? (Y/n)" -n 1 q
    
    test $q = "n" && return 0
    init
}

new_entry() {
    echo -n -e "\n$(date +"%d/%m/%Y")\n    " >> /tmp/logbook
}


write() {
    check
    gpg --output /tmp/logbook --quiet --decrypt "$LOGBOOK"

    new_entry
    $EDITOR /tmp/logbook

    gpg --output "$LOGBOOK" --recipient "$GPG_KEY" --quiet --yes \
        --encrypt /tmp/logbook

    rm /tmp/logbook
}

show() {
    check
    gpg --quiet --decrypt "$LOGBOOK" | less
}

case "${@: -1}" in
    init) shift;                init ;;
    check) shift;               check ;;
    read) shift;                show ;;
    write) shift;               write ;;
esac
