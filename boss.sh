#!/bin/bash
. config.sh

mkdir -p $BOSS_OUTDIR
while [ true ]; do
    sleep $BOSS_INTERVAL;
    if [ `xprintidle` -lt $IDLE_LIMIT ]; then
        WINID=`xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)" | awk '{print $5}'`;
        TIMESTAMP=`date +"%D %T"`;
        if [ $WINID == "0x0" ]; then
            WINNAME="PhpStorm" # Cheat!
        else
            WINNAME=`xprop -id $WINID| grep -i "WM_NAME(STRING)"| sed s/WM_NAME\(STRING\)\ =\ \"// | sed s/\"//`;
        fi
        echo $TIMESTAMP, $WINNAME >> $BOSS_OUTDIR/raw;
        for rule in $RULES; do
            echo $WINNAME | grep --silent -i $rule && echo $TIMESTAMP, $rule >> $BOSS_OUTDIR/tagged
        done
    fi
done

