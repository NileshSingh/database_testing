#!/bin/bash -   

#title          :databasetestingscript.sh

#description    :This script will test databases of IITBombayX(Aspen to cypress)

#author         :Nilesh Singh

#date           :20160208

#version        :1.0    

#usage          :./databasetestingscript_server.sh

#notes          :       

#bash_version   :4.2.25(1)-release

#============================================================================

if [ -d "test_result" ]
then
	rm -rf test_result
    echo "Directory deleted successfully"

fi

mkdir -p test_result/cypress/cypressTable
mkdir -p test_result/aspen/aspenTable
mkdir -p test_result/result
mkdir -p test_result/diff_result
mkdir -p test_result/sameTable
mkdir -p test_result/newTable

mkdir -p test_result/ModifiedTable/ModifiedTable81
mkdir -p test_result/ModifiedTable/ModifiedTable84

# command line argument

printf "Enter a Cypress IP address: " ; read -r cypressIP #$1
printf "Enter a Cypress username: " ; read -r Cy_username #$2
printf "Enter a Cypress password: " ; read -r Cy_pass #$3
printf "Enter a Aspen IP address: " ; read -r aspenIP #$4
printf "Enter a Aspen username: " ; read -r aspen_username #$5
printf "Enter a Aspen password: " ; read -r aspen_pass #$6
printf "Enter a Cypress Database: " ; read -r cypress_database #$7
printf "Enter a Aspen Database: " ; read -r aspen_database #$8


echo "*************************changed table data result***************************" >> ./test_result/result/report
echo ""
echo ""
getArray() {
    array1=() # Create array
    while IFS= read -r line # Read a line
    do
        array1+=("$line") # Append line to the array
    done < "$1"
}

getArray "aspenTable"

for a in "${array1[@]}"; do

	echo "Compare Table $a" >> ./test_result/result/report
	echo "Compare Table $a"

  colnames=$(mysql -N -h$aspenIP -u$aspen_username -p$aspen_pass -e "SELECT group_concat(concat('\`', COLUMN_NAME, '\`')) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$a' and TABLE_SCHEMA = '$aspen_database'" $aspen_database)
	echo "first colname :$colnames"
	mysql -h$aspenIP -u$aspen_username -p$aspen_pass -e "SELECT $colnames FROM $a" $aspen_database >> ./test_result/aspen/aspenTable/file84_$a
	mysql -h$cypressIP -u$Cy_username -p$Cy_pass -e "SELECT $colnames FROM $a" $cypress_database >> ./test_result/cypress/cypressTable/file81_$a

	col84=$(mysql -N -h$aspenIP -u$aspen_username -p$aspen_pass -e "SELECT group_concat(QUOTE(COLUMN_NAME)) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '$aspen_database' and TABLE_NAME='$a'" $aspen_database)

colnames1=$(mysql -N -h$cypressIP -u$Cy_username -p$Cy_pass $cypress_database -e "SELECT group_concat(COLUMN_NAME) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '$cypress_database' and TABLE_NAME='$a' and COLUMN_NAME NOT IN ($col84)")
	echo "second colname :$colnames1" 
	colnames2=$(mysql -N -h$cypressIP -u$Cy_username -p$Cy_pass $cypress_database -e "SELECT group_concat($colnames1) ISNULL FROM $a" )

	echo "third colname : $colnames2"
	if [ "$colnames2" == NULL ]
	then
		echo "NULL PASSED" >> ./test_result/result/report
	else
		echo "NULL FAILED" >> ./test_result/result/report
	fi

	if diff  ./test_result/aspen/aspenTable/file84_$a ./test_result/cypress/cypressTable/file81_$a >> ./test_result/diff_result/result_$a; then
	echo "PASSED1" >> ./test_result/result/report
	grep '^[a-zA-ZPASSED1]' ./test_result/diff_result/result_$a >> ./test_result/result/report
	
	
	else
	echo "FAILED2" >> ./test_result/result/report
	grep '^[a-zA-ZFAILED1]' ./test_result/diff_result/result_$a >> ./test_result/result/report
			
	echo "deleted_rec : " $(grep -o '<' ./test_result/diff_result/result_$a | wc -l) >> ./test_result/result/report
	echo "added_rec : " $(grep -o '>' ./test_result/diff_result/result_$a | wc -l) >> ./test_result/result/report
	echo "changed_rec :" $(grep '^[>]' ./test_result/diff_result/result_$a | wc -l) >> ./test_result/result/report

	fi

done

echo " " >> ./test_result/result/report
echo "Total Passed :" $(grep -o '^[PASSED1]' ./test_result/result/report | wc -l) >> ./test_result/result/report
echo "Total Failed :" $(grep -o '^[FAILED1]' ./test_result/result/report | wc -l) >> ./test_result/result/report

echo " " >> ./test_result/result/report

getArray2() {
    array2=() # Create array
    while IFS= read -r line # Read a line
    do
        array2+=("$line") # Append line to the array
    done < "$1"
}
getArray2 "aspenTable"

for a in "${array2[@]}"; do
  #echo [$a]
  str+="'"$a"'"","
 done

str="${str::-1}"


echo "***********************newTable with null value*****************************" >> ./test_result/result/report

echo " " >> ./test_result/result/report
echo " " >> ./test_result/result/report

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

echo "New table with null data: $a" >> ./test_result/result/report
echo "New table with null data: $a"
      colnames1=$(mysql -N -h$cypressIP -u$Cy_username -p$Cy_pass -e "SELECT group_concat(concat('\`', COLUMN_NAME, '\`')) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '$cypress_database' and TABLE_NAME='$a' ") 
	echo "$colnames1"
	colnames2=$(mysql -N -h$cypressIP -u$Cy_username -p$Cy_pass -e "SELECT group_concat($colnames1) ISNULL FROM $a" $cypress_database)

	echo "$colnames2"
	if [ "$colnames2" == NULL ]
	then
		echo "PASSED1" >> ./test_result/result/report
		echo "PASSED1"
	else
		echo "FAILED1" >> ./test_result/result/report
		echo "FAILED1"
	fi


done
echo "" >> ./test_result/result/report
echo "" >> ./test_result/result/report

mysql -h$cypressIP -u$Cy_username -p$Cy_pass -e "SELECT  TABLE_NAME FROM information_schema.TABLES  WHERE TABLE_SCHEMA = '$cypress_database' AND TABLE_NAME NOT IN ($str)" >> ./test_result/newTable/newTableResult
mysql -h$cypressIP -u$Cy_username -p$Cy_pass -e "SELECT  COUNT(*) FROM information_schema.TABLES  WHERE TABLE_SCHEMA = '$cypress_database' AND TABLE_NAME NOT IN ($str)" >> ./test_result/newTable/newTableCount

echo "New Table count :" $(grep '^[0-9]' ./test_result/newTable/newTableCount ) >> ./test_result/result/report
echo "New tables script done......"

echo "************************Modified Table Report************************" >> ./test_result/result/report
echo "" >> ./test_result/result/report

for a in "${array1[@]}"; do


  echo 

  echo "Compare Table $a" >> ./test_result/ModifiedTable/ModifiedTableResult.txt
  echo "--------------------------------------------------" >> ./test_result/ModifiedTable/ModifiedTableResult.txt


   mysql -h$cypressIP -u$Cy_username -p$Cy_pass -e "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$a' and TABLE_SCHEMA = '$cypress_database' " $cypress_database >> ./test_result/ModifiedTable/ModifiedTable81/file81_$a.txt

   mysql -h$aspenIP -u$aspen_username -p$aspen_pass -e "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$a' and TABLE_SCHEMA = '$aspen_database'" $aspen_database >> ./test_result/ModifiedTable/ModifiedTable84/file84_$a.txt


   if diff --speed-large-files ./test_result/ModifiedTable/ModifiedTable84/file84_$a.txt ./test_result/ModifiedTable/ModifiedTable81/file81_$a.txt >> ./test_result/ModifiedTable/ModifiedTableResult.txt; then
	echo PASSED3 >> ./test_result/ModifiedTable/ModifiedTableResult.txt
	grep '^[a-zA-Z0-9PASSED3]' ./test_result/ModifiedTable/ModifiedTableResult.txt >> ./test_result/result/report
    else
	
        echo FAILED3 >> ./test_result/ModifiedTable/ModifiedTableResult.txt
	grep '^[a-zA-Z0-9FAILED3]' ./test_result/ModifiedTable/ModifiedTableResult.txt >> ./test_result/result/report
	
	echo "deleted_rec : " $(grep -o '<' ./test_result/ModifiedTable/ModifiedTableResult.txt | wc -l) >> ./test_result/result/report
	echo "added_rec : " $(grep -o '>' ./test_result/ModifiedTable/ModifiedTableResult.txt | wc -l) >> ./test_result/result/report
	
    fi
	rm ./test_result/ModifiedTable/ModifiedTableResult.txt
   done

echo "Compare Table $a " >> ./test_result/result/report
echo "--------------------------------------------------"
echo "" >> ./test_result/result/report

echo "Total Passed :" $(grep -Eo '\bPASSED3\b' ./test_result/result/report | wc -l) >> ./test_result/result/report
echo "Total Modified Tables are  :" $(grep -Eo '\bFAILED3\b' ./test_result/result/report | wc -l) >> ./test_result/result/report

echo "" >> ./test_result/result/report


#find the same tables in both database
echo "************************Same Table Report**************************" >> ./test_result/result/report
echo " " >> ./test_result/result/report
echo " " >> ./test_result/result/report

mysql -h$cypressIP -u$Cy_username -p$Cy_pass -e "SELECT  TABLE_NAME FROM information_schema.TABLES  WHERE TABLE_SCHEMA = '$cypress_database' AND TABLE_NAME IN ($str)" >> ./test_result/sameTable/sameTableResult

mysql -h$cypressIP -u$Cy_username -p$Cy_pass -e "SELECT  COUNT(*) FROM information_schema.TABLES  WHERE TABLE_SCHEMA = '$cypress_database' AND TABLE_NAME IN ($str)" >> ./test_result/sameTable/sameTableCount
#mysql -uroot -proot -e "SELECT  COUNT(*) FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'server81' AND TABLE_NAME IN (SELECT  TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'server84')" >> ./report
echo "Same Table count :" $(grep '^[0-9]' ./test_result/sameTable/sameTableCount ) >> ./test_result/result/report
echo "same tables script done......"

echo "" >> ./test_result/result/report
echo ""

echo "Database equivalence completed...."














