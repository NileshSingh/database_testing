#!/bin/bash



echo "************************change data report ************************" >> ./report
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

echo "************************New Table Report************************" >> ./report

getArray2() {
    array2=() # Create array
    while IFS= read -r line # Read a line
    do
        array2+=("$line") # Append line to the array
    done < "$1"
}
getArray2 "newTable"

for a in "${array2[@]}"; do
#mysql  -uroot -proot -e "SELECT  TABLE_NAME FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'server81' AND TABLE_NAME NOT IN ($str)" >> ./test/newtable/newTable 

echo "New table with null data: $a" >> ./test/newTable/newTable
echo "New table with null data: $a"
      colnames3=$(mysql -N -h10.105.24.92 -ucypress -pmooc123 -e edxapp8 "SELECT group_concat(concat('\`', COLUMN_NAME, '\`')) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'edxapp8' and TABLE_NAME='$a' ") 
	echo "$colnames3"
	colnames2=$(mysql -N -h10.105.24.92 -ucypress -pmooc123 -e "SELECT group_concat($colnames3) ISNULL FROM $a" edxapp8)

	echo "$colnames4"
	if [ "$colnames4" == NULL ]
	then
		echo "PASSED3" >> ./test/newTable/newTable
		echo "PASSED3"
	else
		echo "FAILED3" >> ./test/newTable/newTable
		echo "FAILED3"
	fi

done



