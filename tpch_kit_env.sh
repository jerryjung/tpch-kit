export tpch_kit_path=`pwd`

#test_runner option saprk,hive 
export test_runner=hive

#data_size GB size
export data_size=2

#data_type option textfile, orc, parquet
export data_type=textfile

#running_score repeat count
export running_score=3

#if delete_dbgen_data_at is Y, hdfs direcotry delete 
export delete_dbgen_data_at=N

#if drop_table_at is Y, drop table after test run
export drop_table_at=Y

#report_type optin html,
export report_type=html

#query option use
export queries_option_use_at=Y
