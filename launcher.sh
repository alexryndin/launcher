#!/usr/bin/env bash

bIFS=$IFS

SYSTEM_DESKTOP_ENTRIES="/usr/share/applications/ /usr/local/share/applications/"
LOCAL_DESKTOP_ENTRIES="$HOME/.local/share/applications/"

DESKTOP_ENTRIES_PATHS="$SYSTEM_DESKTOP_ENTRIES $LOCAL_DESKTOP_ENTRIES"

paths=$(find $DESKTOP_ENTRIES_PATHS -name '*.desktop' -print  | sort | uniq)

pr

IFS='
'
#for p in $paths; do
#    case $p in
#        $HOME/*)
#            name=$(grep 'Name=' "${p}" | head -1 | sed s/.*=//)
#            name+=" (local)"
#            ;;
#        *)
#            name=$(grep 'Name=' "${p}" | head -1 | sed s/.*=//)
#            name+=" (system)"
#            ;;
#    esac
#    paths_d+="$p;$name
#"
#done

echo "$paths" | awk

paths_d=${paths_d:0:(-1)} # Remove trailing newline

IFS=$bIFS

echo "$paths_d" | fzf -d ';' -n 1 --with-nth=2 --preview='cat {1} | grep "Name=\|Description=\|Comment=" ' \

                | cat

#run=$(echo "$res" | fzf)
#
#gtk-launch $run

launch () {
}


