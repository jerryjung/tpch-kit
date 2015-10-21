. "tpch_kit_env.sh"

echo -moveFromLocal /tpch_$data_size"G"/customer/
hadoop fs -moveFromLocal $tpch_kit_path/dbgen/customer.tbl /tpch_$data_size"G"/customer/
echo -moveFromLocal /tpch_$data_size"G"/lineitem/
hadoop fs -moveFromLocal $tpch_kit_path/dbgen/lineitem.tbl /tpch_$data_size"G"/lineitem/
echo -moveFromLocal /tpch_$data_size"G"/nation/
hadoop fs -moveFromLocal $tpch_kit_path/dbgen/nation.tbl /tpch_$data_size"G"/nation/
echo -moveFromLocal /tpch_$data_size"G"/orders/
hadoop fs -moveFromLocal $tpch_kit_path/dbgen/orders.tbl /tpch_$data_size"G"/orders/
echo -moveFromLocal /tpch_$data_size"G"/part/
hadoop fs -moveFromLocal $tpch_kit_path/dbgen/part.tbl /tpch_$data_size"G"/part/
echo -moveFromLocal /tpch_$data_size"G"/partsupp/
hadoop fs -moveFromLocal $tpch_kit_path/dbgen/partsupp.tbl /tpch_$data_size"G"/partsupp/
echo -moveFromLocal /tpch_$data_size"G"/region/
hadoop fs -moveFromLocal $tpch_kit_path/dbgen/region.tbl /tpch_$data_size"G"/region/
echo -moveFromLocal /tpch_$data_size"G"/supplier/
hadoop fs -moveFromLocal $tpch_kit_path/dbgen/supplier.tbl /tpch_$data_size"G"/supplier/
echo -moveFromLocal end
