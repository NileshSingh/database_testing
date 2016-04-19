  #!/bin/bash -     

#split -d -l 1000000 ./test_result/changedTable/changedTable81/file81_courseware_studentmodulehistory.txt ./test_result/testsplit/output_file

 
#diff --speed-large-files ./test_result/changedTable/changedTable81/file81_courseware_studentmodulehistory.txt ./test_result/changedTable/changedTable84/file84_courseware_studentmodulehistory.txt >>./diff_largeFile1.txt


number=00
while [ "$number" -lt 24 ]
do
        printf "\t%02d" "$number"
        

diff ./test_result/testsplit1/output_file$number ./test_resut/testsplit2/output_file$number >> ./test_result/result_$number.txt

number=`expr $number + 1 `
done
