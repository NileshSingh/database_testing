#!/bin/bash

getArray() {
    array1=() # Create array
    while IFS= read -r line # Read a line
    do
        array1+=("$line") # Append line to the array
    done < "$1"
}

getArray "aspenTable"

## compare same table column present in aspen and as well as cypress and also check new column present in cypress null  

for a in "${array1[@]}"; do

	echo "Compare Table $a" >> ./test/diff_result/diff_result
	echo "Compare Table $a"

  colnames=$(mysql -N -uroot -proot -e "SELECT group_concat(concat('\`', COLUMN_NAME, '\`'))  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$a' and TABLE_SCHEMA = 'server84'" server84)
	echo "$colnames"
	mysql -uroot -proot -e "SELECT $colnames FROM $a" server84 >> ./test/test84/file84_$a
	mysql -uroot -proot -e "SELECT $colnames FROM $a" server81 >> ./test/test81/file81_$a

	col84=$(mysql -N -uroot -proot -e "SELECT group_concat(QUOTE(COLUMN_NAME)) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'server84' and TABLE_NAME='$a'")

colnames1=$(mysql -N -uroot -proot -e "SELECT group_concat(COLUMN_NAME) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'server81' and TABLE_NAME='$a' and COLUMN_NAME NOT IN ()")
	echo "$colnames1" 
	colnames2=$(mysql -N -uroot -proot -e "SELECT group_concat($colnames1) ISNULL FROM $a" server81)

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



