#!/bin/bash

if [ -f "loadtables.sh" ]; then
 source loadtables.sh
else
 echo "File loadtables.sh does not exist. Exiting.."
 exit
fi

DIRECTORY="data"
BACKUPDIRECTORY="mysqldatabackup"
if [ ! -d "$BACKUPDIRECTORY" ]; then
 mkdir "$BACKUPDIRECTORY"
fi

if [ ! -d "$DIRECTORY" ]; then
 echo "Directory $DIRECTORY containing data from IITBombayX Aspen server does not exist. Please check."
 exit
fi


echo "#### LIST OF INCLUDED TABLE of Cypress to be there          ###"
echo $cypress_tables_names
echo "###############################################################"


SQLFile_edxapp_cy_entire=edxapp_cy_entire.sql
SQLFile_edxapp_cy_schema_only=edxapp_cy_schema_only.sql
SQLFile_edxapp_cy_select_tabledata=edxapp_cy_select_tabledata.sql
SQLFile_edxapp_aspen_select_tabledata=edxapp_aspen_select_tabledata.sql

DBSERVER_LOCALHOST=localhost

DATABASE_EDXAPP=edxapp
NEWDATABASE=edxapp8

USER_EDX=edxapp001
USER_ROOT=root


echo "#### Make a backup of an entire database $DATABASE_EDXAPP (new release) ###"
sudo mysqldump --opt --user=${USER_ROOT} -p ${DATABASE_EDXAPP} | gzip -9 > "$BACKUPDIRECTORY/${SQLFile_edxapp_cy_entire}.gz"


echo "#### Make a backup of an entire database $DATABASE_EDXAPP without data, schema_only (new release) ###"
sudo mysqldump --opt --user=${USER_ROOT} -p ${DATABASE_EDXAPP} --no-data | gzip -9 > "$DIRECTORY/${SQLFile_edxapp_cy_schema_only}.gz"



echo "#### Make a backup of a database $DATABASE_EDXAPP of selected tables with only data  (new release) ###"
sudo mysqldump --opt --user=${USER_ROOT} -p ${DATABASE_EDXAPP} --tables $cypress_tables_names --no-create-info | gzip -9 > "$DIRECTORY/${SQLFile_edxapp_cy_select_tabledata}.gz" 



echo "#### Create new $NEWDATABASE database and grant edxapp required permissions (new release) ###"
Q1="DROP DATABASE IF EXISTS ${NEWDATABASE};"
Q2="CREATE DATABASE IF NOT EXISTS ${NEWDATABASE};"
Q3="GRANT ALL PRIVILEGES ON ${NEWDATABASE} . * TO ${USER_EDX}@${DBSERVER_LOCALHOST} WITH GRANT OPTION;"
Q4="FLUSH PRIVILEGES;"

SQL="${Q1}${Q2}${Q3}${Q4}"
sudo mysql --user=${USER_ROOT} -p -e "$SQL"


echo "#### Load the dump file of File_edxapp_cy_schema_only in new $NEWDATABASE database (new release) ###"
gzip -dc "$DIRECTORY/${SQLFile_edxapp_cy_schema_only}.gz" | sudo mysql -f --user=${USER_ROOT} -p ${NEWDATABASE}


echo "#### Load the dump file File_edxapp_cy_select_tabledata in new $NEWDATABASE database (new release) ###"
gzip -dc "$DIRECTORY/${SQLFile_edxapp_cy_select_tabledata}.gz" | sudo mysql -f --user=${USER_ROOT} -p ${NEWDATABASE}


echo "#### Load the dump file of File_edxapp_aspen_select_tabledata in new $NEWDATABASE database (new release) ###"
gzip -dc "$DIRECTORY/${SQLFile_edxapp_aspen_select_tabledata}.gz" | sudo mysql -f --user=${USER_ROOT} -p ${NEWDATABASE}

echo "###Go to /edx/app/edxapp/lms.auth.json and cms.auth.json and change DATABASES default.NAME/read_replica.NAME to $NEWDATABASE at two occurrences"




