#!/bin/bash
. config.sh
echo "TODAY"
echo "============================="
cat $BOSS_OUTDIR/tagged | grep -i `date +"%D"` | sed "s/.*\,\ //" | sort | uniq -c | awk -v intr=$BOSS_INTERVAL '{print ($1 * intr) / 60, "minutes using", $2}'

echo ""
echo "OVERALL"
echo "============================="
cat $BOSS_OUTDIR/tagged | sed "s/.*\,\ //" | sort | uniq -c | awk -v intr=$BOSS_INTERVAL '{print ($1 * intr) / 60, "minutes using", $2}'
