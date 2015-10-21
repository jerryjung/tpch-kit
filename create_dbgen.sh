. "tpch_kit_env.sh"

echo $data_size"G Data Generate"
>$tpch_kit_path/dbgendata.exist.$data_size"G"
cd $tpch_kit_path/dbgen
$tpch_kit_path/dbgen/dbgen -fv -s $data_size
