#!/bin/sh
getArray2() {
    array2=() # Create array
    while IFS= read -r line # Read a line
    do
        array2+=("$line") # Append line to the array
    done < "$1"
}
getArray2 "aspenTable"

#find data are changed or not after porting data aspen to cypress i.e 

#old version to new version database

#aspen = mysql -h10.105.24.84  -uaspen -pmooc123 -e "SELECT  TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'edxapp'" >> ./newTableCount1.txt 
#mysql -h10.105.24.81 -ucypress -pmooc123 -e "SELECT  TABLE_NAME FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'edxapp8' AND TABLE_NAME NOT IN ($aspenTable)" >> ./newTableResult.txt 
#mysql -h10.105.24.81  -ucypress -pmooc123 -e "SELECT  COUNT(*) FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'edxapp8' AND TABLE_NAME NOT IN (SELECT  TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'edxapp')" >> ./newTableCount.txt 


#mysql -h10.105.24.84  -ucypress -pmooc123 -e SELECT  TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'edxapp'>> abc.txt;
#getArray2 "abc"

#str
for a in "${array2[@]}"; do
  #echo [$a]
  str+="'"$a"'"","
 done

str="${str::-1}"
echo $str >> ./abc
mysql -h10.105.24.81  -ucypress -pmooc123 -e "SELECT  COUNT(*) FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'edxapp8' AND TABLE_NAME IN ($str)" >> ./newTableCount.txt 
