#!/bin/bash
. "tpch_kit_run_env.sh"

$runing_path -u $connection_address -n "hadoop" -p "" -f $tpch_kit_path"/template/drop_orc_table_template"
$runing_path -u $connection_address -n "hadoop" -p "" -f $tpch_kit_path"/template/drop_tmp_table_template"
$runing_path -u $connection_address -n "hadoop" -p "" -e "show tables"
