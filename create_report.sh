#!/bin/bash

. "tpch_kit_env.sh"
export TEST_RUNNER=$(echo $test_runner|tr [a-z] [A-Z])
export DATA_TYPE=$(echo $data_type|tr [a-z] [A-Z])

mv $tpch_kit_path/report/'TPC_H_'$TEST_RUNNER'_'$DATA_TYPE'_'$data_size'G_REPORT_'*.$report_type $tpch_kit_path/report/old_report/.
/usr/bin/python $tpch_kit_path/report_set/create_report_$report_type.py $test_runner $data_type $data_size $running_score $tpch_kit_path
