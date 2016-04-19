#!/bin/bash

getArray() {
    array1=() # Create array
    while IFS= read -r line # Read a line
    do
        array1+=("$line") # Append line to the array
    done < "$1"
}

getArray "consumerTable"

for a in "${array1[@]}"; do

	echo "Compare Table $a" >> ./test/diff_result/diff_result
	echo "Compare Table $a"

  colnames=$(mysql -N -uroot -proot -e "SELECT group_concat(concat('\`', COLUMN_NAME, '\`')) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$a' and TABLE_SCHEMA = 'consumer1'" consumer1)
	echo "first colname :$colnames"
	mysql -uroot -proot -e "SELECT $colnames FROM $a" consumer1 >> ./test/test84/file84_$a
	mysql -uroot -proot -e "SELECT $colnames FROM $a" consumer2 >> ./test/test81/file81_$a

	col84=$(mysql -N -uroot -proot -e "SELECT group_concat(QUOTE(COLUMN_NAME)) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'consumer1' and TABLE_NAME='$a'" consumer1)

colnames1=$(mysql -N -uroot -proot consumer2 -e "SELECT group_concat(COLUMN_NAME) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'consumer2' and TABLE_NAME='$a' and COLUMN_NAME NOT IN ($col84)")
	echo "second colname :$colnames1" 
	colnames2=$(mysql -N -uroot -proot consumer2 -e "SELECT group_concat($colnames1) ISNULL FROM $a" )

	echo "third colname : $colnames2"
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



