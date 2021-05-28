#!/bin/sh

while getopts ":h" opt; do
    case $opt in
    h)
        echo "maketar FOLDER"  >&2
        echo " -- will create a tar.gz archive of FOLDER in the same location"  >&2
        echo "or"  >&2
        echo "maketar FOLDER DESTINATION_FOLDER"  >&2
        echo " -- will create a tar.gz archive of FOLDER inside DESTINATION_FOLDER"  >&2
        exit 1
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        ;;
    esac
done

if [ ! -z "$1" ];
    then
    FOLDER="$1"

    if [ -z "$2" ];
        then
        cd "$FOLDER"
        cd ../
        tar -czvf "$FOLDER.tar.gz" "$(basename "$FOLDER")"

    else
        DESTINATION="$2"
        cd "$FOLDER"
        cd ../
        tar -czvf "$DESTINATION/$(basename "$FOLDER").tar.gz" "$(basename "$FOLDER")"
    fi
fi