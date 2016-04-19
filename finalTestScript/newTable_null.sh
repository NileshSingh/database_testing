#!/bin/bash

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
      colnames1=$(mysql -N -uroot -proot -e "SELECT group_concat(concat('\`', COLUMN_NAME, '\`')) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'server81' and TABLE_NAME='$a' ") 
	echo "$colnames1"
	colnames2=$(mysql -N -uroot -proot -e "SELECT group_concat($colnames1) ISNULL FROM $a" server81)

	echo "$colnames2"
	if [ "$colnames2" == NULL ]
	then
		echo "PASSED" >> ./test/newTable/newTable
		echo "PASSED"
	else
		echo "FAILED" >> ./test/newTable/newTable
		echo "FAILED"
	fi

#mysql -h$cypressIP -u$Cy_username -p$Cy_pass -e "SELECT  COUNT(*) FROM information_schema.TABLES  WHERE TABLE_SCHEMA = '$cypress_database' AND TABLE_NAME NOT IN ($str)" >> ./test/newtable/newTable_count 

#echo "New Table count :" $(grep '^[0-9]' ./test_result/newTable/newTableCount.txt ) >> ./report
#echo "New tables script done......"

done
