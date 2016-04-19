#!/bin/bash
####################################
#
# database compare script.
#
####################################

array1=( assessment_aiclassifier assessment_aiclassifierset assessment_aigradingworkflow assessment_aitrainingworkflow assessment_aitrainingworkflow_training_examples
assessment_assessment assessment_assessmentfeedback assessment_assessmentfeedback_assessments assessment_assessmentfeedback_options
assessment_assessmentfeedbackoption assessment_assessmentpart assessment_criterion assessment_criterionoption assessment_peerworkflow
assessment_peerworkflowitem assessment_rubric assessment_studenttrainingworkflow assessment_studenttrainingworkflowitem assessment_trainingexample
assessment_trainingexample_options_selected auth_group auth_group_permissions auth_permission auth_registration auth_user auth_user_groups
auth_user_user_permissions shoppingcart_coupon bulk_email_courseauthorization bulk_email_courseemail bulk_email_courseemailtemplate
bulk_email_optout celery_taskmeta celery_tasksetmeta certificates_certificatewhitelist certificates_generatedcertificate circuit_servercircuit
course_action_state_coursererunstate course_creators_coursecreator course_groups_courseusergroup course_groups_courseusergroup_users
course_groups_courseusergrouppartitiongroup course_modes_coursemode course_modes_coursemodesarchive courseware_course_subject courseware_offlinecomputedgrade
courseware_offlinecomputedgradelog courseware_organization courseware_studentmodule courseware_studentmodulehistory courseware_subject
courseware_xmodulestudentinfofield courseware_xmodulestudentprefsfield courseware_xmoduleuserstatesummaryfield dark_lang_darklangconfig
django_admin_log django_comment_client_permission django_comment_client_permission_roles django_comment_client_role django_comment_client_role_users
django_content_type django_openid_auth_association django_openid_auth_nonce django_openid_auth_useropenid django_session django_site
djcelery_crontabschedule djcelery_intervalschedule djcelery_periodictask djcelery_periodictasks djcelery_taskstate djcelery_workerstate
edxval_coursevideo edxval_encodedvideo edxval_profile edxval_subtitle edxval_video embargo_embargoedcourse embargo_embargoedstate embargo_ipfilter
external_auth_externalauthmap foldit_puzzlecomplete foldit_score instructor_task_instructortask licenses_coursesoftware licenses_userlicense linkedin_linkedin
lms_xblock_xblockasidesconfig notes_note notifications_articlesubscription notify_notification notify_notificationtype notify_settings
notify_subscription oauth2_accesstoken oauth2_client oauth2_grant oauth2_provider_trustedclient oauth2_refreshtoken psychometrics_psychometricdata
reverification_midcoursereverificationwindow shoppingcart_certificateitem shoppingcart_coupon shoppingcart_couponredemption shoppingcart_courseregcodeitem
shoppingcart_courseregcodeitemannotation shoppingcart_courseregistrationcode shoppingcart_donation shoppingcart_donationconfiguration
shoppingcart_invoice shoppingcart_order shoppingcart_orderitem shoppingcart_paidcourseregistration shoppingcart_paidcourseregistrationannotation
shoppingcart_registrationcoderedemption south_migrationhistory splash_splashconfig student_anonymoususerid student_courseaccessrole
student_courseenrollment student_courseenrollmentallowed student_dashboardconfiguration student_loginfailures student_mooc_city student_mooc_person
student_mooc_state student_passwordhistory student_pendingemailchange student_pendingnamechange student_usersignupsource student_userstanding
student_usertestgroup student_usertestgroup_users submissions_score submissions_scoresummary submissions_studentitem submissions_submission
survey_surveyanswer survey_surveyform track_trackinglog user_api_usercoursetag user_api_userorgtag user_api_userpreference verify_student_softwaresecurephotoverification
wiki_article wiki_articleforobject wiki_articleplugin wiki_articlerevision wiki_articlesubscription wiki_attachment wiki_attachmentrevision
wiki_image wiki_imagerevision wiki_reusableplugin wiki_reusableplugin_articles wiki_revisionplugin wiki_revisionpluginrevision wiki_simpleplugin
wiki_urlpath workflow_assessmentworkflow workflow_assessmentworkflowstep ) 

#for a in "${array1[@]}"; do

 # echo 
  #echo "Table Name $a"
  #echo "Table Name $a" >> ~/test_result/ModifiedTable/ModifiedTableResult.txt
  #echo "--------------------------------------------------" >> ~/test_result/ModifiedTable/ModifiedTableResult.txt

   #mysql -uroot -proot -e "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$a' and TABLE_SCHEMA = 'server81' " server81 >> ~/test_result/ModifiedTable/ModifiedTable81/file81_$a.txt
   #mysql -uroot -proot -e "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'assessment_peerworkflow' and TABLE_SCHEMA = 'server84'" server84 >> ~/test_result/ModifiedTable/ModifiedTable84/file84_$a.txt


  colnames=$(mysql -N server84 -uroot -proot -e "SELECT group_concat(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'shoppingcart_coupon' and TABLE_SCHEMA = 'server84'")
   #echo "$colnames"
  echo "$colnames" 

	mysql -uroot -proot -e "SELECT $colnames FROM shoppingcart_coupon" server84 >> ./test/file1
	mysql -uroot -proot -e "SELECT $colnames FROM shoppingcart_coupon" server81 >> ./test/file2

	##mysql -uroot -proot -e "SELECT COLUMN_NAME FROM assessment_peerworkflow WHERE TABLE_SCHEMA = 'server81' AND NOT EXISTS
      colnames1=$(mysql -N -uroot -proot -e "SELECT group_concat(COLUMN_NAME) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'server81' and TABLE_NAME='shoppingcart_coupon' and COLUMN_NAME NOT IN (SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'server84' and TABLE_NAME='shoppingcart_coupon')")
	echo "$colnames1" 
	colnames2=$(mysql -N -uroot -proot -e "SELECT group_concat($colnames1) ISNULL FROM shoppingcart_coupon" server81) >> ./test/test3

	echo "$colnames2"
	if [ "$colnames2" == NULL ]
	then
		echo "PASSED"
	else
		echo "FAILED"
	fi

#SELECT  TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'server84'

   diff  ./test/file1 ./test/file2 >> ./test/test4
  

#done

