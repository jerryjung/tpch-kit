#!/bin/bash

. "tpch_kit_env.sh"

mv $tpch_kit_path/report/"TPC_H_REPORT_CHART_"* $tpch_kit_path/report/old_chart/.
/usr/bin/python $tpch_kit_path/report_set/create_report_chart.py $data_size $tpch_kit_path
