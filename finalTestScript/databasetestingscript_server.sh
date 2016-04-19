

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


#taking aspen database tables from file i.e aspenTable
if [ -d "test_result" ]
then
	rm -rf test_result
    echo "Directory deleted successfully"

fi

mkdir -p test_result/changedTable/changedTable81
mkdir -p test_result/changedTable/changedTable84

mkdir -p test_result/ModifiedTable/ModifiedTable81
mkdir -p test_result/ModifiedTable/ModifiedTable84

mkdir -p test_result/newTable
mkdir -p test_result/sameTable



getArray() {
    array1=() # Create array
    while IFS= read -r line # Read a line
    do
        array1+=("$line") # Append line to the array
    done < "$1"
}

getArray "aspenTable"

#find data are changed or not after porting data aspen to cypress i.e 

#old version to new version database

echo "************************Changed Table Report*************************" >> ./report
echo "" >> ./report

for a in "${array1[@]}"; do


  echo 

  echo "Compare Table $a" >> ./test_result/changedTable/ChangedTableResult.txt
  echo "--------------------------------------------------" >> ./test_result/changedTable/ChangedTableResult.txt


      mysql -h$1 -u$2 -p$3 -e "select * from $a" edxapp8 >> ./test_result/changedTable/changedTable81/file81_$a.txt

      mysql -h$4 -u$5 -p$6 -e "select * from $a" edxapp >> ./test_result/changedTable/changedTable84/file84_$a.txt


    if diff ./test_result/changedTable/changedTable81/file81_$a.txt ./test_result/changedTable/changedTable84/file84_$a.txt >> ./test_result/changedTable/ChangedTableResult.txt; then
	echo PASSED >> ./test_result/changedTable/ChangedTableResult.txt
	grep '^[a-zA-ZPASSED]' ./test_result/changedTable/ChangedTableResult.txt >> ./report
    else
	
	
	
        echo FAILED >> ./test_result/changedTable/ChangedTableResult.txt
	grep '^[a-zA-ZFAILED]' ./test_result/changedTable/ChangedTableResult.txt >> ./report
			
	echo "deleted_rec : " $(grep -o '<' ./test_result/changedTable/ChangedTableResult.txt | wc -l) >> ./report
	echo "added_rec : " $(grep -o '>' ./test_result/changedTable/ChangedTableResult.txt | wc -l) >> ./report
	echo "changed_rec :" $(grep '^[>]' ./test_result/changedTable/ChangedTableResult.txt | wc -l) >> ./report
	
    fi
	rm ./test_result/changedTable/ChangedTableResult.txt
done

echo "Compare Table $a " >> ./report
echo "--------------------------------------------------"
echo "" >> ./report

# Total tables are failed 
echo "" >> ./report
echo "" >> ./report

echo "Total failed :" $(grep '^[FAILED]' ./report | wc -l) >> ./report
echo "--------------" >> ./report

# Total tables are passed
echo "" >> ./report
echo "" >> ./report
echo "Total Passed :" $(grep '^[PASSED]' ./report | wc -l) >> ./report
echo "--------------" >> ./report
echo "" >> ./report	
echo "" >> ./report	

#find Tables are modified or not after porting database aspen to cypress i.e 
#old version to new version database
echo "************************Modified Table Report************************" >> ./report
echo "" >> ./report
for a in "${array1[@]}"; do


  echo 

  echo "Compare Table $a" >> ./test_result/ModifiedTable/ModifiedTableResult.txt
  echo "--------------------------------------------------" >> ./test_result/ModifiedTable/ModifiedTableResult.txt


   mysql -h$1 -u$2 -p$3 -e "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$a' and TABLE_SCHEMA = 'edxapp8' " edxapp8 >> ./test_result/ModifiedTable/ModifiedTable81/file81_$a.txt

   mysql -h$4 -u$5 -p$6 -uaspen -pmooc123 -e "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$a' and TABLE_SCHEMA = 'edxapp'" edxapp >> ./test_result/ModifiedTable/ModifiedTable84/file84_$a.txt


   if diff --speed-large-files ./test_result/ModifiedTable/ModifiedTable84/file84_$a.txt ./test_result/ModifiedTable/ModifiedTable81/file81_$a.txt >> ./test_result/ModifiedTable/ModifiedTableResult.txt; then
	echo PASSED >> ./test_result/ModifiedTable/ModifiedTableResult.txt
	grep '^[a-zA-ZPASSED]' ./test_result/ModifiedTable/ModifiedTableResult.txt >> ./report
    else
	
        echo FAILED >> ./test_result/ModifiedTable/ModifiedTableResult.txt
	grep '^[a-zA-Z0-9FAILED]' ./test_result/ModifiedTable/ModifiedTableResult.txt >> ./report
	
	echo "deleted_rec : " $(grep -o '<' ./test_result/ModifiedTable/ModifiedTableResult.txt | wc -l) >> ./report
	echo "added_rec : " $(grep -o '>' ./test_result/ModifiedTable/ModifiedTableResult.txt | wc -l) >> ./report
	
    fi
	rm ./test_result/ModifiedTable/ModifiedTableResult.txt
   done

echo "Compare Table $a " >> ./report
echo "--------------------------------------------------"
echo "" >> ./report

# Total tables are failed 
echo "" >> ./report
echo "" >> ./report

echo "Modified table script done......"


# find new tables are introduced in new version i.e cypress 
echo "************************New Table Report************************" >> ./report

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

mysql -h$1 -u$2 -p$3 -e "SELECT  TABLE_NAME FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'edxapp8' AND TABLE_NAME NOT IN ($str)" >> ./test_result/newTable/newTableResult.txt 
mysql -h$1 -u$2 -p$3 -e "SELECT  COUNT(*) FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'edxapp8' AND TABLE_NAME NOT IN ($str)" >> ./test_result/newTable/newTableCount.txt 

echo "New Table count :" $(grep '^[0-9]' ./test_result/newTable/newTableCount.txt ) >> ./report
echo "New tables script done......"


#find the same tables in both database
echo "************************Same Table Report**************************" >> ./report

mysql -h$1 -u$2 -p$3 -e "SELECT  TABLE_NAME FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'edxapp8' AND TABLE_NAME IN ($str)" >> ./test_result/sameTable/sameTableResult.txt 

mysql -h$1 -u$2 -p$3 -e "SELECT  COUNT(*) FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'edxapp8' AND TABLE_NAME IN ($str)" >> ./test_result/sameTable/sameTableCount.txt 
#mysql -uroot -proot -e "SELECT  COUNT(*) FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'server81' AND TABLE_NAME IN (SELECT  TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'server84')" >> ./report
echo "Same Table count :" $(grep '^[0-9]' ./test_result/sameTable/sameTableCount.txt ) >> ./report
echo "same tables script done......"

echo ""
echo ""

echo "Database equivalence check successfully completed...."





