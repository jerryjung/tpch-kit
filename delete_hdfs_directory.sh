. "tpch_kit_env.sh"

rm $tpch_kit_path/dbgendata.exist.$data_size"G"
hadoop fs -rm -R /tpch_$data_size"G"
