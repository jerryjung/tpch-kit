#!/bin/bash
. "tpch_kit_run_env.sh"

if [ Y == $catch_delete_at ]
then
        for i in `cat $hadoop_slaves_path`;
        do
                echo "===== $i =====" &&
                ssh -tt $i "vmstat && sudo sh -c \"sync; echo 3 > /proc/sys/vm/drop_caches\" && vmstat"
        done
fi

echo ====== Start q$1 ======
echo Start Time Line
echo $(($(date +%s%N)/1000000))
$runing_path -u $connection_address -n "hadoop" -p "" -f $tpch_kit_path/queries/q$1_*
echo End Time Line
echo $(($(date +%s%N)/1000000))
