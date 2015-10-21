. "tpch_kit_env.sh"

cp -f $tpch_kit_path/kit_$test_runner/script_set/query_run_single.sh $tpch_kit_path/.
cp -f $tpch_kit_path/kit_$test_runner/script_set/tpch_kit_run_env.sh $tpch_kit_path/.
cp -f $tpch_kit_path/kit_$test_runner/script_set/queries_option_conf.sh $tpch_kit_path/.


rm $tpch_kit_path/template/*

cp $tpch_kit_path/template_set/* $tpch_kit_path/template/.
sed s/tpch_kit/tpch_$data_size"G"/g $tpch_kit_path/template/create_textfile_table_template > $tpch_kit_path/template/create_textfile_$data_size"G"_table_template
cp -f $tpch_kit_path/template/create_textfile_$data_size"G"_table_template $tpch_kit_path/template/create_textfile_table_template
sed s/tpch_kit/tpch_$data_size"G"/g $tpch_kit_path/template/create_tmp_table_template > $tpch_kit_path/template/create_tmp_$data_size"G"_table_template
cp -f $tpch_kit_path/template/create_tmp_$data_size"G"_table_template $tpch_kit_path/template/create_tmp_table_template

rm $tpch_kit_path/queries/*

if [ Y == $queries_option_use_at ]
then
        $tpch_kit_path/queries_option_apply.sh
else
	cp $tpch_kit_path/queries_set/queries_$data_type/* $tpch_kit_path/queries/.
fi
