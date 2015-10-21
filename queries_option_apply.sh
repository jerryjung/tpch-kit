#!/bin/bash
. "tpch_kit_env.sh"
. "queries_option_conf.sh"

OLD_IFS=$IFS
IFS=,
option_applied_querise_id=""
default_option_apply_queries_id=""
option_applied_at="Y"

echo ""
echo "===== Query Option Set Start ====="
echo ""

if [ -n "$queries_option1" ]
then
	for apply_data_size in $queries_option1_use_data_size
	do
		if [ $data_size = $apply_data_size ]
		then
			for query_id in $queries_option1_use_query_id
			do
				target_query=$(ls $tpch_kit_path/queries_set/queries_$data_type/q$query_id*)
				query_name=$(echo $target_query | awk -F'/' '{print $NF}')
        			echo $queries_option1 > $tpch_kit_path/queries/$query_name
				cat $target_query >> $tpch_kit_path/queries/$query_name
                                if [ -z "$option1_applied_querise_id" ]
                                then
                                        option1_applied_querise_id=$query_id
                                else
                                        option1_applied_querise_id="$option1_applied_querise_id $query_id"
                                fi
			done
			echo "queries_option1=$queries_option1"
		        echo "option1_applied_querise_id=$option1_applied_querise_id"
			echo ""
		fi
	done
fi

if [ -n "$queries_option2" ]
then
        for apply_data_size in $queries_option2_use_data_size
        do
                if [ $data_size = $apply_data_size ]
                then
		        for query_id in $queries_option2_use_query_id
		        do
				target_query=$(ls $tpch_kit_path/queries_set/queries_$data_type/q$query_id*)
                                query_name=$(echo $target_query | awk -F'/' '{print $NF}')
                                echo $queries_option2 > $tpch_kit_path/queries/$query_name
                                cat $target_query >> $tpch_kit_path/queries/$query_name
				if [ -z "$option2_applied_querise_id" ]
				then
                                        option2_applied_querise_id=$query_id
                                else
                                        option2_applied_querise_id="$option2_applied_querise_id $query_id"
                                fi
                        done
			echo "queries_option2=$queries_option2"
		        echo "option2_applied_querise_id=$option2_applied_querise_id"
			echo ""
                fi
        done
fi

if [ -n "$queries_option3" ]
then
        for apply_data_size in $queries_option3_use_data_size
        do
                if [ $data_size = $apply_data_size ]
                then
                        for query_id in $queries_option3_use_query_id
                        do
				target_query=$(ls $tpch_kit_path/queries_set/queries_$data_type/q$query_id*)
                                query_name=$(echo $target_query | awk -F'/' '{print $NF}')
                                echo $queries_option3 > $tpch_kit_path/queries/$query_name
                                cat $target_query >> $tpch_kit_path/queries/$query_name
				if [ -z "$option3_applied_querise_id" ]
				then
					option3_applied_querise_id=$query_id
				else
					option3_applied_querise_id="$option3_applied_querise_id $query_id"
				fi
                        done
			echo "queries_option3=$queries_option3"
		        echo "option3_applied_querise_id=$option3_applied_querise_id"
			echo ""
                fi
        done
fi

option_applied_querise_id="$option1_applied_querise_id $option2_applied_querise_id $option3_applied_querise_id"

IFS=$OLD_IFS

for query_id in $(ls $tpch_kit_path/queries_set/queries_$data_type/ |cut -c2-3)
do
	for option_applied_query_id in $option_applied_querise_id
	do
		if [ $query_id = $option_applied_query_id ]
		then
			option_applied_at="N"
			break
		else
			option_applied_at="Y"
		fi
	done
	if [ "Y" = $option_applied_at ]
	then 
		if [ -z "$default_option_apply_queries_id" ]
		then
			default_option_apply_queries_id=$query_id
		else
			default_option_apply_queries_id="$default_option_apply_queries_id $query_id"
		fi
	fi
done

echo "queries_default_option=$queries_default_option"

for query_id in $default_option_apply_queries_id
do
	target_query=$(ls $tpch_kit_path/queries_set/queries_$data_type/q$query_id*)
        query_name=$(echo $target_query | awk -F'/' '{print $NF}')
        echo $queries_default_option > $tpch_kit_path/queries/$query_name
        cat $target_query >> $tpch_kit_path/queries/$query_name
done

echo "default_option_apply_queries_id=$default_option_apply_queries_id"

echo ""
echo "===== Query Option Set Finish ====="
echo ""
