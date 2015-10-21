. "tpch_kit_env.sh"

rm $tpch_kit_path/createtable.exist.$test_runner.*
$tpch_kit_path/kit_$test_runner/script_set/drop_tables_$data_type.sh

