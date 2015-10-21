#!/bin/bash
. "tpch_kit_env.sh"

score=0
totalScor=0

if [ == $1 ]
then
	totalScore=$running_score
else
	totalScore=$1
fi

if [ -d $tpch_kit_path/result/$test_runner/$data_type/$data_size"G" ]
then
	rm $tpch_kit_path/result/$test_runner/$data_type/$data_size"G"/*
else
	mkdir $tpch_kit_path/result/$test_runner/$data_type/$data_size"G"
fi

while [ $score -lt $totalScore ]
do
	score=`expr $score + 1`
	echo ===== $score Test Start =====
	for query_id in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22
	do
		echo query $query_id run
		nohup $tpch_kit_path/query_run_single.sh $query_id > $tpch_kit_path/result/$test_runner/$data_type/$data_size"G"/$test_runner.$data_type.$data_size"G".query.$query_id.$score 
	done
done
