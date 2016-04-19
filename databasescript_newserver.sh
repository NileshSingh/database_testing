#!/bin/bash

getArray() {
    array1=() # Create array
    while IFS= read -r line # Read a line
    do
        array1+=("$line") # Append line to the array
    done < "$1"
}

getArray "aspenTable"

for a in "${array1[@]}"; do

	echo "Compare Table $a" >> ./test/diff_result/diff_result
	echo "Compare Table $a"

  colnames=$(mysql -N -h10.105.24.91 -uaspen -pmooc123 -e "SELECT group_concat(concat('\`', COLUMN_NAME, '\`')) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$a' and TABLE_SCHEMA = 'edxapp'" edxapp)
	echo "$colnames"
	mysql -h10.105.24.91 -uaspen -pmooc123 -e "SELECT $colnames FROM $a" edxapp >> ./test/test84/file84_$a
	mysql -h10.105.24.92 -ucypress -pmooc123 -e "SELECT $colnames FROM $a" edxapp8 >> ./test/test81/file81_$a

	col84=$(mysql -N -h10.105.24.91 -uaspen -pmooc123 -e "SELECT group_concat(QUOTE(COLUMN_NAME)) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'edxapp' and TABLE_NAME='$a'" edxapp)

colnames1=$(mysql -N -h10.105.24.92 -ucypress -pmooc123 edxapp8 -e "SELECT group_concat(COLUMN_NAME) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'edxapp8' and TABLE_NAME='$a' and COLUMN_NAME NOT IN ($col84)")
	echo "$colnames1" 
	colnames2=$(mysql -N -h10.105.24.92 -ucypress -pmooc123 edxapp8 -e "SELECT group_concat($colnames1) ISNULL FROM $a" )

	echo "$colnames2"
	if [ "$colnames2" == NULL ]
	then
		echo "PASSED1" >> ./test/diff_result/diff_result
	else
		echo "FAILED1" >> ./test/diff_result/diff_result
	fi

	if diff  ./test/test84/file84_$a ./test/test81/file81_$a >> ./test/diff_result/result_$a; then
	echo "PASSED2" >> ./test/diff_result/diff_result
	
	else
	echo "FAILED2" >> ./test/diff_result/diff_result

	fi

done





