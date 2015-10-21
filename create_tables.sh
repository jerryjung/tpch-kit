#!/bin/bash
. "tpch_kit_env.sh"

if [ -e $tpch_kit_path/dbgendata.exist.$data_size"G" ]
then
        echo dbgen data exist!
else
        $tpch_kit_path/create_dbgen.sh
        $tpch_kit_path/create_hdfs_directory.sh
        $tpch_kit_path/move_hdfs_data.sh
fi

if [ -e $tpch_kit_path/createtable.exist.$test_runner.$data_type.$data_size"G" ]
then
        echo table exist!
else
        if [ -e $tpch_kit_path/createtable.exist.$test_runner.textfile.* ]
        then
                $tpch_kit_path/kit_$test_runner/script_set/drop_tables_textfile.sh
        elif [ -e $tpch_kit_path/createtable.exist.$test_runner.orc.* ]
        then
                $tpch_kit_path/kit_$test_runner/script_set/drop_tables_orc.sh
        elif [ -e $tpch_kit_path/createtable.exist.$test_runner.parquet.* ]
        then
                $tpch_kit_path/kit_$test_runner/script_set/drop_tables_parquet.sh
        fi
	rm $tpch_kit_path/createtable.exist.$test_runner.*

>$tpch_kit_path/createtable.exist.$test_runner.$data_type.$data_size"G"

$tpch_kit_path/kit_$test_runner/script_set/create_tables_$data_type.sh
fi
