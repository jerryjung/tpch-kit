#!/bin/bash
. "tpch_kit_run_env.sh"

$runing_path -u $connection_address -n "hadoop" -p "" -f $tpch_kit_path"/template/create_textfile_table_template"
$runing_path -u $connection_address -n "hadoop" -p "" -f $tpch_kit_path"/template/create_tmp_table_template"
$runing_path -u $connection_address -n "hadoop" -p "" -f $tpch_kit_path"/template/create_parquet_table_template"
$runing_path -u $connection_address -n "hadoop" -p "" -f $tpch_kit_path"/template/insert_parquet_table_template"
$runing_path -u $connection_address -n "hadoop" -p "" -f $tpch_kit_path"/template/drop_textfile_table_template"
$runing_path -u $connection_address  -n "hadoop" -p "" -e "show tables"
