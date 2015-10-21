. "tpch_kit_env.sh"

echo mkdir /tpch_$data_size"G"
hadoop fs -mkdir /tpch_$data_size"G"
echo mkdir /tpch_$data_size"G"/customer
hadoop fs -mkdir /tpch_$data_size"G"/customer
echo mkdir /tpch_$data_size"G"/lineitem
hadoop fs -mkdir /tpch_$data_size"G"/lineitem
echo mkdir /tpch_$data_size"G"/nation
hadoop fs -mkdir /tpch_$data_size"G"/nation
echo mkdir /tpch_$data_size"G"/orders
hadoop fs -mkdir /tpch_$data_size"G"/orders
echo mkdir /tpch_$data_size"G"/part
hadoop fs -mkdir /tpch_$data_size"G"/part
echo mkdir /tpch_$data_size"G"/partsupp
hadoop fs -mkdir /tpch_$data_size"G"/partsupp
echo mkdir /tpch_$data_size"G"/region
hadoop fs -mkdir /tpch_$data_size"G"/region
echo mkdir /tpch_$data_size"G"/supplier
hadoop fs -mkdir /tpch_$data_size"G"/supplier
echo mkdir end 
