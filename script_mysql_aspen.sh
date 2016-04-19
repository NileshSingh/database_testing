#!/bin/bash

DIRECTORY="data"
if [ ! -d "$DIRECTORY" ]; then
 mkdir "$DIRECTORY"
fi
source loadtables.sh

echo "#### LIST OF INCLUDED TABLE of Aspen to be added to Cypress ###"
echo $aspen_tables_names
echo "###############################################################"



SQLFile_edxapp_aspen_select_tabledata=edxapp_aspen_select_tabledata.sql
DATABASE_EDXAPP=edxapp
USER_ROOT=root


echo "#### Make a backup of $DATABASE_EDXAPP database of selected tables with only data  (old release) ###"
sudo mysqldump --opt --user=${USER_ROOT} -p ${DATABASE_EDXAPP} --tables $aspen_tables_names --complete-insert --no-create-info | gzip -9 > "$DIRECTORY/${SQLFile_edxapp_aspen_select_tabledata}.gz"





