#!/bin/bash
. "tpch_kit_env.sh"

$tpch_kit_path/runner_set.sh

$tpch_kit_path/create_tables.sh

$tpch_kit_path/query_run_all.sh

$tpch_kit_path/create_report.sh 

$tpch_kit_path/create_chart.sh

if [ Y == $drop_table_at ]
then
	$tpch_kit_path/drop_tables.sh
fi

if [ Y == $delete_dbgen_data_at ]
then
	$tpch_kit_path/delete_hdfs_directory.sh
fi
