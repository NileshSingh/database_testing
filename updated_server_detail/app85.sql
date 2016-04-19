-- MySQL dump 10.13  Distrib 5.6.24, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: edxapp
-- ------------------------------------------------------
-- Server version	5.6.24-2+deb.sury.org~precise+2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assessment_aiclassifier`
--

DROP TABLE IF EXISTS `assessment_aiclassifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_aiclassifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classifier_set_id` int(11) NOT NULL,
  `criterion_id` int(11) NOT NULL,
  `classifier_data` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_aiclassifier_714175dc` (`classifier_set_id`),
  KEY `assessment_aiclassifier_5c9b8f1c` (`criterion_id`),
  CONSTRAINT `classifier_set_id_refs_id_f80cbf6` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`),
  CONSTRAINT `criterion_id_refs_id_1954680e` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_aiclassifier`
--

LOCK TABLES `assessment_aiclassifier` WRITE;
/*!40000 ALTER TABLE `assessment_aiclassifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_aiclassifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_aiclassifierset`
--

DROP TABLE IF EXISTS `assessment_aiclassifierset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_aiclassifierset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubric_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `algorithm_id` varchar(128) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_aiclassifierset_27cb9807` (`rubric_id`),
  KEY `assessment_aiclassifierset_3b1c9c31` (`created_at`),
  KEY `assessment_aiclassifierset_53012c1e` (`algorithm_id`),
  KEY `assessment_aiclassifierset_b7271b` (`course_id`),
  KEY `assessment_aiclassifierset_67b70d25` (`item_id`),
  CONSTRAINT `rubric_id_refs_id_3fc8471c` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_aiclassifierset`
--

LOCK TABLES `assessment_aiclassifierset` WRITE;
/*!40000 ALTER TABLE `assessment_aiclassifierset` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_aiclassifierset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_aigradingworkflow`
--

DROP TABLE IF EXISTS `assessment_aigradingworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_aigradingworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `scheduled_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `submission_uuid` varchar(128) NOT NULL,
  `classifier_set_id` int(11) DEFAULT NULL,
  `algorithm_id` varchar(128) NOT NULL,
  `rubric_id` int(11) NOT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `student_id` varchar(40) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `essay_text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_aigradingworkflow_uuid_65ecbfd2_uniq` (`uuid`),
  KEY `assessment_aigradingworkflow_2bbc74ae` (`uuid`),
  KEY `assessment_aigradingworkflow_4bacaa90` (`scheduled_at`),
  KEY `assessment_aigradingworkflow_5d02c50a` (`completed_at`),
  KEY `assessment_aigradingworkflow_39d020e6` (`submission_uuid`),
  KEY `assessment_aigradingworkflow_714175dc` (`classifier_set_id`),
  KEY `assessment_aigradingworkflow_53012c1e` (`algorithm_id`),
  KEY `assessment_aigradingworkflow_27cb9807` (`rubric_id`),
  KEY `assessment_aigradingworkflow_3e970d24` (`assessment_id`),
  KEY `assessment_aigradingworkflow_42ff452e` (`student_id`),
  KEY `assessment_aigradingworkflow_67b70d25` (`item_id`),
  KEY `assessment_aigradingworkflow_b7271b` (`course_id`),
  CONSTRAINT `assessment_id_refs_id_1d8478e7` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `classifier_set_id_refs_id_1e9046d1` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`),
  CONSTRAINT `rubric_id_refs_id_23d5fb9c` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_aigradingworkflow`
--

LOCK TABLES `assessment_aigradingworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_aigradingworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_aigradingworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_aitrainingworkflow`
--

DROP TABLE IF EXISTS `assessment_aitrainingworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_aitrainingworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `algorithm_id` varchar(128) NOT NULL,
  `classifier_set_id` int(11) DEFAULT NULL,
  `scheduled_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `item_id` varchar(128) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_aitrainingworkflow_uuid_3019f8ef_uniq` (`uuid`),
  KEY `assessment_aitrainingworkflow_2bbc74ae` (`uuid`),
  KEY `assessment_aitrainingworkflow_53012c1e` (`algorithm_id`),
  KEY `assessment_aitrainingworkflow_714175dc` (`classifier_set_id`),
  KEY `assessment_aitrainingworkflow_4bacaa90` (`scheduled_at`),
  KEY `assessment_aitrainingworkflow_5d02c50a` (`completed_at`),
  KEY `assessment_aitrainingworkflow_67b70d25` (`item_id`),
  KEY `assessment_aitrainingworkflow_b7271b` (`course_id`),
  CONSTRAINT `classifier_set_id_refs_id_dcc7412` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_aitrainingworkflow`
--

LOCK TABLES `assessment_aitrainingworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_aitrainingworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_aitrainingworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_aitrainingworkflow_training_examples`
--

DROP TABLE IF EXISTS `assessment_aitrainingworkflow_training_examples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_aitrainingworkflow_training_examples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aitrainingworkflow_id` int(11) NOT NULL,
  `trainingexample_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_aitrainingworkfl_aitrainingworkflow_id_31fab8f6_uniq` (`aitrainingworkflow_id`,`trainingexample_id`),
  KEY `assessment_aitrainingworkflow_training_examples_5a806e6b` (`aitrainingworkflow_id`),
  KEY `assessment_aitrainingworkflow_training_examples_15b25ce1` (`trainingexample_id`),
  CONSTRAINT `aitrainingworkflow_id_refs_id_45c30582` FOREIGN KEY (`aitrainingworkflow_id`) REFERENCES `assessment_aitrainingworkflow` (`id`),
  CONSTRAINT `trainingexample_id_refs_id_bf13a24` FOREIGN KEY (`trainingexample_id`) REFERENCES `assessment_trainingexample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_aitrainingworkflow_training_examples`
--

LOCK TABLES `assessment_aitrainingworkflow_training_examples` WRITE;
/*!40000 ALTER TABLE `assessment_aitrainingworkflow_training_examples` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_aitrainingworkflow_training_examples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessment`
--

DROP TABLE IF EXISTS `assessment_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `rubric_id` int(11) NOT NULL,
  `scored_at` datetime NOT NULL,
  `scorer_id` varchar(40) NOT NULL,
  `score_type` varchar(2) NOT NULL,
  `feedback` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_assessment_39d020e6` (`submission_uuid`),
  KEY `assessment_assessment_27cb9807` (`rubric_id`),
  KEY `assessment_assessment_3227200` (`scored_at`),
  KEY `assessment_assessment_60ab7aa6` (`scorer_id`),
  CONSTRAINT `rubric_id_refs_id_1ab6dbc4` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessment`
--

LOCK TABLES `assessment_assessment` WRITE;
/*!40000 ALTER TABLE `assessment_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedback`
--

DROP TABLE IF EXISTS `assessment_assessmentfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `feedback_text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedback`
--

LOCK TABLES `assessment_assessmentfeedback` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedback_assessments`
--

DROP TABLE IF EXISTS `assessment_assessmentfeedback_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedback_assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentfeedback_id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_assessmentfeedba_assessmentfeedback_id_5e57c654_uniq` (`assessmentfeedback_id`,`assessment_id`),
  KEY `assessment_assessmentfeedback_assessments_58f1f0d` (`assessmentfeedback_id`),
  KEY `assessment_assessmentfeedback_assessments_3e970d24` (`assessment_id`),
  CONSTRAINT `assessment_id_refs_id_18029f82` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessmentfeedback_id_refs_id_6e442cb9` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedback_assessments`
--

LOCK TABLES `assessment_assessmentfeedback_assessments` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedback_options`
--

DROP TABLE IF EXISTS `assessment_assessmentfeedback_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedback_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentfeedback_id` int(11) NOT NULL,
  `assessmentfeedbackoption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_assessmentfeedba_assessmentfeedback_id_1570b37d_uniq` (`assessmentfeedback_id`,`assessmentfeedbackoption_id`),
  KEY `assessment_assessmentfeedback_options_58f1f0d` (`assessmentfeedback_id`),
  KEY `assessment_assessmentfeedback_options_4e523d64` (`assessmentfeedbackoption_id`),
  CONSTRAINT `assessmentfeedback_id_refs_id_5c27c412` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`),
  CONSTRAINT `assessmentfeedbackoption_id_refs_id_320d7533` FOREIGN KEY (`assessmentfeedbackoption_id`) REFERENCES `assessment_assessmentfeedbackoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedback_options`
--

LOCK TABLES `assessment_assessmentfeedback_options` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedbackoption`
--

DROP TABLE IF EXISTS `assessment_assessmentfeedbackoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedbackoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `text` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedbackoption`
--

LOCK TABLES `assessment_assessmentfeedbackoption` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedbackoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedbackoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentpart`
--

DROP TABLE IF EXISTS `assessment_assessmentpart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentpart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessment_id` int(11) NOT NULL,
  `option_id` int(11),
  `feedback` longtext NOT NULL,
  `criterion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_assessmentpart_3e970d24` (`assessment_id`),
  KEY `assessment_assessmentpart_2f3b0dc9` (`option_id`),
  KEY `assessment_assessmentpart_5c9b8f1c` (`criterion_id`),
  CONSTRAINT `assessment_id_refs_id_400d9bbc` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `criterion_id_refs_id_114c23bc` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`),
  CONSTRAINT `option_id_refs_id_4439dd5` FOREIGN KEY (`option_id`) REFERENCES `assessment_criterionoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentpart`
--

LOCK TABLES `assessment_assessmentpart` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentpart` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentpart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_criterion`
--

DROP TABLE IF EXISTS `assessment_criterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_criterion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubric_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `order_num` int(10) unsigned NOT NULL,
  `prompt` longtext NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_criterion_27cb9807` (`rubric_id`),
  CONSTRAINT `rubric_id_refs_id_d0b0c3c` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criterion`
--

LOCK TABLES `assessment_criterion` WRITE;
/*!40000 ALTER TABLE `assessment_criterion` DISABLE KEYS */;
INSERT INTO `assessment_criterion` VALUES (1,1,'Content',0,'Did the response describe a meal and did it describe why someone should chose to eat it? ','Content'),(2,1,'Organization & Clarity',1,'How well did the response use language?','Organization & Clarity'),(3,1,'Persuasiveness',2,'How well did the response convince you to try the meal that it describes?','Persuasiveness');
/*!40000 ALTER TABLE `assessment_criterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_criterionoption`
--

DROP TABLE IF EXISTS `assessment_criterionoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_criterionoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `criterion_id` int(11) NOT NULL,
  `order_num` int(10) unsigned NOT NULL,
  `points` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `explanation` longtext NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_criterionoption_5c9b8f1c` (`criterion_id`),
  CONSTRAINT `criterion_id_refs_id_2d9badce` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criterionoption`
--

LOCK TABLES `assessment_criterionoption` WRITE;
/*!40000 ALTER TABLE `assessment_criterionoption` DISABLE KEYS */;
INSERT INTO `assessment_criterionoption` VALUES (1,1,0,0,'Off Topic','The essay is off-topic or does not answer all or part of the question.','Off Topic'),(2,1,1,5,'No Explanation','A meal is described, but no argument is made to persuade the reader to try it.','No Explanation'),(3,1,2,5,'Unclear recommendation','A meal is not described, but an argument is made to persuade the reader to try it.','Unclear recommendation'),(4,1,3,10,'Persuasive recommendation','The essay give a good description of the meal and provides supporting reasons for trying the meal.','Persuasive recommendation'),(5,2,0,0,'Confusing','It is difficult to identify the argument and main idea. ','Confusing'),(6,2,1,1,'Basic Structure','The essay provides a main idea. Additional details are provided, and some support the main idea.','Basic Structure'),(7,2,2,2,'Clear Structure','The essay provides a clear main idea supported by specific details.','Clear Structure'),(8,2,3,3,'Complete Structure','The essay has a complete structure: an introduction, statement of main idea, supporting details and summary. \n','Complete Structure'),(9,3,0,0,'Unconvincing','The author did not present a persuasive argument, and I have no interest in trying this meal.','Unconvincing'),(10,3,1,2,'Interesting','The author’s argument was somewhat persuarsive. I need more information to consider trying this meal.','Interesting'),(11,3,2,4,'Persuasive','The author’s argument was persuasive, and I will consider trying the meal.','Persuasive'),(12,3,3,6,'Inspiring','The author presented an exceptionally strong case and has convinced me to try the meal. \n','Inspiring');
/*!40000 ALTER TABLE `assessment_criterionoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_peerworkflow`
--

DROP TABLE IF EXISTS `assessment_peerworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_peerworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(40) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `submission_uuid` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `grading_completed_at` datetime,
  `cancelled_at` datetime,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  KEY `assessment_peerworkflow_42ff452e` (`student_id`),
  KEY `assessment_peerworkflow_67b70d25` (`item_id`),
  KEY `assessment_peerworkflow_b7271b` (`course_id`),
  KEY `assessment_peerworkflow_3b1c9c31` (`created_at`),
  KEY `assessment_peerworkflow_5d02c50a` (`completed_at`),
  KEY `assessment_peerworkflow_course_id_35649cf3` (`course_id`,`item_id`,`student_id`),
  KEY `assessment_peerworkflow_2329decf` (`grading_completed_at`),
  KEY `assessment_peerworkflow_7ac2f658` (`cancelled_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_peerworkflow`
--

LOCK TABLES `assessment_peerworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_peerworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_peerworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_peerworkflowitem`
--

DROP TABLE IF EXISTS `assessment_peerworkflowitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_peerworkflowitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scorer_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `submission_uuid` varchar(128) NOT NULL,
  `started_at` datetime NOT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `scored` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_peerworkflowitem_60ab7aa6` (`scorer_id`),
  KEY `assessment_peerworkflowitem_337b96ff` (`author_id`),
  KEY `assessment_peerworkflowitem_39d020e6` (`submission_uuid`),
  KEY `assessment_peerworkflowitem_2918ef1c` (`started_at`),
  KEY `assessment_peerworkflowitem_3e970d24` (`assessment_id`),
  CONSTRAINT `assessment_id_refs_id_965795f` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `author_id_refs_id_59547df0` FOREIGN KEY (`author_id`) REFERENCES `assessment_peerworkflow` (`id`),
  CONSTRAINT `scorer_id_refs_id_59547df0` FOREIGN KEY (`scorer_id`) REFERENCES `assessment_peerworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_peerworkflowitem`
--

LOCK TABLES `assessment_peerworkflowitem` WRITE;
/*!40000 ALTER TABLE `assessment_peerworkflowitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_peerworkflowitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_rubric`
--

DROP TABLE IF EXISTS `assessment_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_rubric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_hash` varchar(40) NOT NULL,
  `structure_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_hash` (`content_hash`),
  KEY `assessment_rubric_36e74b05` (`structure_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_rubric`
--

LOCK TABLES `assessment_rubric` WRITE;
/*!40000 ALTER TABLE `assessment_rubric` DISABLE KEYS */;
INSERT INTO `assessment_rubric` VALUES (1,'b2783932b715f500b0af5f2e0d80757e54301353','ab95e8c199881793b6999c5efb1a5754fd7417d5');
/*!40000 ALTER TABLE `assessment_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_studenttrainingworkflow`
--

DROP TABLE IF EXISTS `assessment_studenttrainingworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_studenttrainingworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_studenttrainingworkflo_submission_uuid_7719d68f_uniq` (`submission_uuid`),
  KEY `assessment_studenttrainingworkflow_39d020e6` (`submission_uuid`),
  KEY `assessment_studenttrainingworkflow_42ff452e` (`student_id`),
  KEY `assessment_studenttrainingworkflow_67b70d25` (`item_id`),
  KEY `assessment_studenttrainingworkflow_b7271b` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_studenttrainingworkflow`
--

LOCK TABLES `assessment_studenttrainingworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_studenttrainingworkflowitem`
--

DROP TABLE IF EXISTS `assessment_studenttrainingworkflowitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_studenttrainingworkflowitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `order_num` int(10) unsigned NOT NULL,
  `started_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `training_example_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_studenttrainingworkflowitem_order_num_556a4784_uniq` (`order_num`,`workflow_id`),
  KEY `assessment_studenttrainingworkflowitem_26cddbc7` (`workflow_id`),
  KEY `assessment_studenttrainingworkflowitem_541d6663` (`training_example_id`),
  CONSTRAINT `training_example_id_refs_id_7d3f36e4` FOREIGN KEY (`training_example_id`) REFERENCES `assessment_trainingexample` (`id`),
  CONSTRAINT `workflow_id_refs_id_ce50a30` FOREIGN KEY (`workflow_id`) REFERENCES `assessment_studenttrainingworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_studenttrainingworkflowitem`
--

LOCK TABLES `assessment_studenttrainingworkflowitem` WRITE;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflowitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflowitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_trainingexample`
--

DROP TABLE IF EXISTS `assessment_trainingexample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_trainingexample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_answer` longtext NOT NULL,
  `rubric_id` int(11) NOT NULL,
  `content_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_hash` (`content_hash`),
  KEY `assessment_trainingexample_27cb9807` (`rubric_id`),
  CONSTRAINT `rubric_id_refs_id_7750db21` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_trainingexample`
--

LOCK TABLES `assessment_trainingexample` WRITE;
/*!40000 ALTER TABLE `assessment_trainingexample` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_trainingexample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_trainingexample_options_selected`
--

DROP TABLE IF EXISTS `assessment_trainingexample_options_selected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_trainingexample_options_selected` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trainingexample_id` int(11) NOT NULL,
  `criterionoption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_trainingexample_opti_trainingexample_id_4e82d83_uniq` (`trainingexample_id`,`criterionoption_id`),
  KEY `assessment_trainingexample_options_selected_15b25ce1` (`trainingexample_id`),
  KEY `assessment_trainingexample_options_selected_7bc05db9` (`criterionoption_id`),
  CONSTRAINT `criterionoption_id_refs_id_412a5b9b` FOREIGN KEY (`criterionoption_id`) REFERENCES `assessment_criterionoption` (`id`),
  CONSTRAINT `trainingexample_id_refs_id_5f0faa8d` FOREIGN KEY (`trainingexample_id`) REFERENCES `assessment_trainingexample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_trainingexample_options_selected`
--

LOCK TABLES `assessment_trainingexample_options_selected` WRITE;
/*!40000 ALTER TABLE `assessment_trainingexample_options_selected` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_trainingexample_options_selected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add task state',7,'add_taskmeta'),(20,'Can change task state',7,'change_taskmeta'),(21,'Can delete task state',7,'delete_taskmeta'),(22,'Can add saved group result',8,'add_tasksetmeta'),(23,'Can change saved group result',8,'change_tasksetmeta'),(24,'Can delete saved group result',8,'delete_tasksetmeta'),(25,'Can add interval',9,'add_intervalschedule'),(26,'Can change interval',9,'change_intervalschedule'),(27,'Can delete interval',9,'delete_intervalschedule'),(28,'Can add crontab',10,'add_crontabschedule'),(29,'Can change crontab',10,'change_crontabschedule'),(30,'Can delete crontab',10,'delete_crontabschedule'),(31,'Can add periodic tasks',11,'add_periodictasks'),(32,'Can change periodic tasks',11,'change_periodictasks'),(33,'Can delete periodic tasks',11,'delete_periodictasks'),(34,'Can add periodic task',12,'add_periodictask'),(35,'Can change periodic task',12,'change_periodictask'),(36,'Can delete periodic task',12,'delete_periodictask'),(37,'Can add worker',13,'add_workerstate'),(38,'Can change worker',13,'change_workerstate'),(39,'Can delete worker',13,'delete_workerstate'),(40,'Can add task',14,'add_taskstate'),(41,'Can change task',14,'change_taskstate'),(42,'Can delete task',14,'delete_taskstate'),(43,'Can add migration history',15,'add_migrationhistory'),(44,'Can change migration history',15,'change_migrationhistory'),(45,'Can delete migration history',15,'delete_migrationhistory'),(46,'Can add server circuit',16,'add_servercircuit'),(47,'Can change server circuit',16,'change_servercircuit'),(48,'Can delete server circuit',16,'delete_servercircuit'),(49,'Can add psychometric data',17,'add_psychometricdata'),(50,'Can change psychometric data',17,'change_psychometricdata'),(51,'Can delete psychometric data',17,'delete_psychometricdata'),(52,'Can add nonce',18,'add_nonce'),(53,'Can change nonce',18,'change_nonce'),(54,'Can delete nonce',18,'delete_nonce'),(55,'Can add association',19,'add_association'),(56,'Can change association',19,'change_association'),(57,'Can delete association',19,'delete_association'),(58,'Can add user open id',20,'add_useropenid'),(59,'Can change user open id',20,'change_useropenid'),(60,'Can delete user open id',20,'delete_useropenid'),(61,'Can add log entry',21,'add_logentry'),(62,'Can change log entry',21,'change_logentry'),(63,'Can delete log entry',21,'delete_logentry'),(64,'Can add cors model',22,'add_corsmodel'),(65,'Can change cors model',22,'change_corsmodel'),(66,'Can delete cors model',22,'delete_corsmodel'),(67,'Can add global status message',23,'add_globalstatusmessage'),(68,'Can change global status message',23,'change_globalstatusmessage'),(69,'Can delete global status message',23,'delete_globalstatusmessage'),(70,'Can add course message',24,'add_coursemessage'),(71,'Can change course message',24,'change_coursemessage'),(72,'Can delete course message',24,'delete_coursemessage'),(73,'Can add student module',25,'add_studentmodule'),(74,'Can change student module',25,'change_studentmodule'),(75,'Can delete student module',25,'delete_studentmodule'),(76,'Can add student module history',26,'add_studentmodulehistory'),(77,'Can change student module history',26,'change_studentmodulehistory'),(78,'Can delete student module history',26,'delete_studentmodulehistory'),(79,'Can add x module user state summary field',27,'add_xmoduleuserstatesummaryfield'),(80,'Can change x module user state summary field',27,'change_xmoduleuserstatesummaryfield'),(81,'Can delete x module user state summary field',27,'delete_xmoduleuserstatesummaryfield'),(82,'Can add x module student prefs field',28,'add_xmodulestudentprefsfield'),(83,'Can change x module student prefs field',28,'change_xmodulestudentprefsfield'),(84,'Can delete x module student prefs field',28,'delete_xmodulestudentprefsfield'),(85,'Can add x module student info field',29,'add_xmodulestudentinfofield'),(86,'Can change x module student info field',29,'change_xmodulestudentinfofield'),(87,'Can delete x module student info field',29,'delete_xmodulestudentinfofield'),(88,'Can add offline computed grade',30,'add_offlinecomputedgrade'),(89,'Can change offline computed grade',30,'change_offlinecomputedgrade'),(90,'Can delete offline computed grade',30,'delete_offlinecomputedgrade'),(91,'Can add offline computed grade log',31,'add_offlinecomputedgradelog'),(92,'Can change offline computed grade log',31,'change_offlinecomputedgradelog'),(93,'Can delete offline computed grade log',31,'delete_offlinecomputedgradelog'),(94,'Can add student field override',32,'add_studentfieldoverride'),(95,'Can change student field override',32,'change_studentfieldoverride'),(96,'Can delete student field override',32,'delete_studentfieldoverride'),(97,'Can add x block disable config',33,'add_xblockdisableconfig'),(98,'Can change x block disable config',33,'change_xblockdisableconfig'),(99,'Can delete x block disable config',33,'delete_xblockdisableconfig'),(100,'Can add anonymous user id',34,'add_anonymoususerid'),(101,'Can change anonymous user id',34,'change_anonymoususerid'),(102,'Can delete anonymous user id',34,'delete_anonymoususerid'),(103,'Can add user standing',35,'add_userstanding'),(104,'Can change user standing',35,'change_userstanding'),(105,'Can delete user standing',35,'delete_userstanding'),(106,'Can add user profile',36,'add_userprofile'),(107,'Can change user profile',36,'change_userprofile'),(108,'Can delete user profile',36,'delete_userprofile'),(109,'Can add user signup source',37,'add_usersignupsource'),(110,'Can change user signup source',37,'change_usersignupsource'),(111,'Can delete user signup source',37,'delete_usersignupsource'),(112,'Can add user test group',38,'add_usertestgroup'),(113,'Can change user test group',38,'change_usertestgroup'),(114,'Can delete user test group',38,'delete_usertestgroup'),(115,'Can add registration',39,'add_registration'),(116,'Can change registration',39,'change_registration'),(117,'Can delete registration',39,'delete_registration'),(118,'Can add pending name change',40,'add_pendingnamechange'),(119,'Can change pending name change',40,'change_pendingnamechange'),(120,'Can delete pending name change',40,'delete_pendingnamechange'),(121,'Can add pending email change',41,'add_pendingemailchange'),(122,'Can change pending email change',41,'change_pendingemailchange'),(123,'Can delete pending email change',41,'delete_pendingemailchange'),(124,'Can add password history',42,'add_passwordhistory'),(125,'Can change password history',42,'change_passwordhistory'),(126,'Can delete password history',42,'delete_passwordhistory'),(127,'Can add login failures',43,'add_loginfailures'),(128,'Can change login failures',43,'change_loginfailures'),(129,'Can delete login failures',43,'delete_loginfailures'),(130,'Can add historical course enrollment',44,'add_historicalcourseenrollment'),(131,'Can change historical course enrollment',44,'change_historicalcourseenrollment'),(132,'Can delete historical course enrollment',44,'delete_historicalcourseenrollment'),(133,'Can add course enrollment',45,'add_courseenrollment'),(134,'Can change course enrollment',45,'change_courseenrollment'),(135,'Can delete course enrollment',45,'delete_courseenrollment'),(136,'Can add manual enrollment audit',46,'add_manualenrollmentaudit'),(137,'Can change manual enrollment audit',46,'change_manualenrollmentaudit'),(138,'Can delete manual enrollment audit',46,'delete_manualenrollmentaudit'),(139,'Can add course enrollment allowed',47,'add_courseenrollmentallowed'),(140,'Can change course enrollment allowed',47,'change_courseenrollmentallowed'),(141,'Can delete course enrollment allowed',47,'delete_courseenrollmentallowed'),(142,'Can add course access role',48,'add_courseaccessrole'),(143,'Can change course access role',48,'change_courseaccessrole'),(144,'Can delete course access role',48,'delete_courseaccessrole'),(145,'Can add dashboard configuration',49,'add_dashboardconfiguration'),(146,'Can change dashboard configuration',49,'change_dashboardconfiguration'),(147,'Can delete dashboard configuration',49,'delete_dashboardconfiguration'),(148,'Can add linked in add to profile configuration',50,'add_linkedinaddtoprofileconfiguration'),(149,'Can change linked in add to profile configuration',50,'change_linkedinaddtoprofileconfiguration'),(150,'Can delete linked in add to profile configuration',50,'delete_linkedinaddtoprofileconfiguration'),(151,'Can add entrance exam configuration',51,'add_entranceexamconfiguration'),(152,'Can change entrance exam configuration',51,'change_entranceexamconfiguration'),(153,'Can delete entrance exam configuration',51,'delete_entranceexamconfiguration'),(154,'Can add language proficiency',52,'add_languageproficiency'),(155,'Can change language proficiency',52,'change_languageproficiency'),(156,'Can delete language proficiency',52,'delete_languageproficiency'),(157,'Can add course enrollment attribute',53,'add_courseenrollmentattribute'),(158,'Can change course enrollment attribute',53,'change_courseenrollmentattribute'),(159,'Can delete course enrollment attribute',53,'delete_courseenrollmentattribute'),(160,'Can add tracking log',54,'add_trackinglog'),(161,'Can change tracking log',54,'change_trackinglog'),(162,'Can delete tracking log',54,'delete_trackinglog'),(163,'Can add rate limit configuration',55,'add_ratelimitconfiguration'),(164,'Can change rate limit configuration',55,'change_ratelimitconfiguration'),(165,'Can delete rate limit configuration',55,'delete_ratelimitconfiguration'),(166,'Can add certificate whitelist',56,'add_certificatewhitelist'),(167,'Can change certificate whitelist',56,'change_certificatewhitelist'),(168,'Can delete certificate whitelist',56,'delete_certificatewhitelist'),(169,'Can add generated certificate',57,'add_generatedcertificate'),(170,'Can change generated certificate',57,'change_generatedcertificate'),(171,'Can delete generated certificate',57,'delete_generatedcertificate'),(172,'Can add example certificate set',58,'add_examplecertificateset'),(173,'Can change example certificate set',58,'change_examplecertificateset'),(174,'Can delete example certificate set',58,'delete_examplecertificateset'),(175,'Can add example certificate',59,'add_examplecertificate'),(176,'Can change example certificate',59,'change_examplecertificate'),(177,'Can delete example certificate',59,'delete_examplecertificate'),(178,'Can add certificate generation course setting',60,'add_certificategenerationcoursesetting'),(179,'Can change certificate generation course setting',60,'change_certificategenerationcoursesetting'),(180,'Can delete certificate generation course setting',60,'delete_certificategenerationcoursesetting'),(181,'Can add certificate generation configuration',61,'add_certificategenerationconfiguration'),(182,'Can change certificate generation configuration',61,'change_certificategenerationconfiguration'),(183,'Can delete certificate generation configuration',61,'delete_certificategenerationconfiguration'),(184,'Can add certificate html view configuration',62,'add_certificatehtmlviewconfiguration'),(185,'Can change certificate html view configuration',62,'change_certificatehtmlviewconfiguration'),(186,'Can delete certificate html view configuration',62,'delete_certificatehtmlviewconfiguration'),(187,'Can add badge assertion',63,'add_badgeassertion'),(188,'Can change badge assertion',63,'change_badgeassertion'),(189,'Can delete badge assertion',63,'delete_badgeassertion'),(190,'Can add badge image configuration',64,'add_badgeimageconfiguration'),(191,'Can change badge image configuration',64,'change_badgeimageconfiguration'),(192,'Can delete badge image configuration',64,'delete_badgeimageconfiguration'),(193,'Can add certificate template',65,'add_certificatetemplate'),(194,'Can change certificate template',65,'change_certificatetemplate'),(195,'Can delete certificate template',65,'delete_certificatetemplate'),(196,'Can add certificate template asset',66,'add_certificatetemplateasset'),(197,'Can change certificate template asset',66,'change_certificatetemplateasset'),(198,'Can delete certificate template asset',66,'delete_certificatetemplateasset'),(199,'Can add instructor task',67,'add_instructortask'),(200,'Can change instructor task',67,'change_instructortask'),(201,'Can delete instructor task',67,'delete_instructortask'),(202,'Can add course software',68,'add_coursesoftware'),(203,'Can change course software',68,'change_coursesoftware'),(204,'Can delete course software',68,'delete_coursesoftware'),(205,'Can add user license',69,'add_userlicense'),(206,'Can change user license',69,'change_userlicense'),(207,'Can delete user license',69,'delete_userlicense'),(208,'Can add course user group',70,'add_courseusergroup'),(209,'Can change course user group',70,'change_courseusergroup'),(210,'Can delete course user group',70,'delete_courseusergroup'),(211,'Can add course user group partition group',71,'add_courseusergrouppartitiongroup'),(212,'Can change course user group partition group',71,'change_courseusergrouppartitiongroup'),(213,'Can delete course user group partition group',71,'delete_courseusergrouppartitiongroup'),(214,'Can add course cohorts settings',72,'add_coursecohortssettings'),(215,'Can change course cohorts settings',72,'change_coursecohortssettings'),(216,'Can delete course cohorts settings',72,'delete_coursecohortssettings'),(217,'Can add course cohort',73,'add_coursecohort'),(218,'Can change course cohort',73,'change_coursecohort'),(219,'Can delete course cohort',73,'delete_coursecohort'),(220,'Can add course email',74,'add_courseemail'),(221,'Can change course email',74,'change_courseemail'),(222,'Can delete course email',74,'delete_courseemail'),(223,'Can add optout',75,'add_optout'),(224,'Can change optout',75,'change_optout'),(225,'Can delete optout',75,'delete_optout'),(226,'Can add course email template',76,'add_courseemailtemplate'),(227,'Can change course email template',76,'change_courseemailtemplate'),(228,'Can delete course email template',76,'delete_courseemailtemplate'),(229,'Can add course authorization',77,'add_courseauthorization'),(230,'Can change course authorization',77,'change_courseauthorization'),(231,'Can delete course authorization',77,'delete_courseauthorization'),(232,'Can add branding info config',78,'add_brandinginfoconfig'),(233,'Can change branding info config',78,'change_brandinginfoconfig'),(234,'Can delete branding info config',78,'delete_brandinginfoconfig'),(235,'Can add branding api config',79,'add_brandingapiconfig'),(236,'Can change branding api config',79,'change_brandingapiconfig'),(237,'Can delete branding api config',79,'delete_brandingapiconfig'),(238,'Can add external auth map',80,'add_externalauthmap'),(239,'Can change external auth map',80,'change_externalauthmap'),(240,'Can delete external auth map',80,'delete_externalauthmap'),(241,'Can add client',81,'add_client'),(242,'Can change client',81,'change_client'),(243,'Can delete client',81,'delete_client'),(244,'Can add grant',82,'add_grant'),(245,'Can change grant',82,'change_grant'),(246,'Can delete grant',82,'delete_grant'),(247,'Can add access token',83,'add_accesstoken'),(248,'Can change access token',83,'change_accesstoken'),(249,'Can delete access token',83,'delete_accesstoken'),(250,'Can add refresh token',84,'add_refreshtoken'),(251,'Can change refresh token',84,'change_refreshtoken'),(252,'Can delete refresh token',84,'delete_refreshtoken'),(253,'Can add trusted client',85,'add_trustedclient'),(254,'Can change trusted client',85,'change_trustedclient'),(255,'Can delete trusted client',85,'delete_trustedclient'),(256,'Can add article',86,'add_article'),(257,'Can change article',86,'change_article'),(258,'Can delete article',86,'delete_article'),(259,'Can edit all articles and lock/unlock/restore',86,'moderate'),(260,'Can change ownership of any article',86,'assign'),(261,'Can assign permissions to other users',86,'grant'),(262,'Can add Article for object',87,'add_articleforobject'),(263,'Can change Article for object',87,'change_articleforobject'),(264,'Can delete Article for object',87,'delete_articleforobject'),(265,'Can add article revision',88,'add_articlerevision'),(266,'Can change article revision',88,'change_articlerevision'),(267,'Can delete article revision',88,'delete_articlerevision'),(268,'Can add URL path',89,'add_urlpath'),(269,'Can change URL path',89,'change_urlpath'),(270,'Can delete URL path',89,'delete_urlpath'),(271,'Can add article plugin',90,'add_articleplugin'),(272,'Can change article plugin',90,'change_articleplugin'),(273,'Can delete article plugin',90,'delete_articleplugin'),(274,'Can add reusable plugin',91,'add_reusableplugin'),(275,'Can change reusable plugin',91,'change_reusableplugin'),(276,'Can delete reusable plugin',91,'delete_reusableplugin'),(277,'Can add simple plugin',92,'add_simpleplugin'),(278,'Can change simple plugin',92,'change_simpleplugin'),(279,'Can delete simple plugin',92,'delete_simpleplugin'),(280,'Can add revision plugin',93,'add_revisionplugin'),(281,'Can change revision plugin',93,'change_revisionplugin'),(282,'Can delete revision plugin',93,'delete_revisionplugin'),(283,'Can add revision plugin revision',94,'add_revisionpluginrevision'),(284,'Can change revision plugin revision',94,'change_revisionpluginrevision'),(285,'Can delete revision plugin revision',94,'delete_revisionpluginrevision'),(286,'Can add article subscription',95,'add_articlesubscription'),(287,'Can change article subscription',95,'change_articlesubscription'),(288,'Can delete article subscription',95,'delete_articlesubscription'),(289,'Can add type',96,'add_notificationtype'),(290,'Can change type',96,'change_notificationtype'),(291,'Can delete type',96,'delete_notificationtype'),(292,'Can add settings',97,'add_settings'),(293,'Can change settings',97,'change_settings'),(294,'Can delete settings',97,'delete_settings'),(295,'Can add subscription',98,'add_subscription'),(296,'Can change subscription',98,'change_subscription'),(297,'Can delete subscription',98,'delete_subscription'),(298,'Can add notification',99,'add_notification'),(299,'Can change notification',99,'change_notification'),(300,'Can delete notification',99,'delete_notification'),(301,'Can add score',100,'add_score'),(302,'Can change score',100,'change_score'),(303,'Can delete score',100,'delete_score'),(304,'Can add puzzle complete',101,'add_puzzlecomplete'),(305,'Can change puzzle complete',101,'change_puzzlecomplete'),(306,'Can delete puzzle complete',101,'delete_puzzlecomplete'),(307,'Can add note',102,'add_note'),(308,'Can change note',102,'change_note'),(309,'Can delete note',102,'delete_note'),(310,'Can add splash config',103,'add_splashconfig'),(311,'Can change splash config',103,'change_splashconfig'),(312,'Can delete splash config',103,'delete_splashconfig'),(313,'Can add user preference',104,'add_userpreference'),(314,'Can change user preference',104,'change_userpreference'),(315,'Can delete user preference',104,'delete_userpreference'),(316,'Can add user course tag',105,'add_usercoursetag'),(317,'Can change user course tag',105,'change_usercoursetag'),(318,'Can delete user course tag',105,'delete_usercoursetag'),(319,'Can add user org tag',106,'add_userorgtag'),(320,'Can change user org tag',106,'change_userorgtag'),(321,'Can delete user org tag',106,'delete_userorgtag'),(322,'Can add order',107,'add_order'),(323,'Can change order',107,'change_order'),(324,'Can delete order',107,'delete_order'),(325,'Can add order item',108,'add_orderitem'),(326,'Can change order item',108,'change_orderitem'),(327,'Can delete order item',108,'delete_orderitem'),(328,'Can add invoice',109,'add_invoice'),(329,'Can change invoice',109,'change_invoice'),(330,'Can delete invoice',109,'delete_invoice'),(331,'Can add invoice transaction',110,'add_invoicetransaction'),(332,'Can change invoice transaction',110,'change_invoicetransaction'),(333,'Can delete invoice transaction',110,'delete_invoicetransaction'),(334,'Can add invoice item',111,'add_invoiceitem'),(335,'Can change invoice item',111,'change_invoiceitem'),(336,'Can delete invoice item',111,'delete_invoiceitem'),(337,'Can add course registration code invoice item',112,'add_courseregistrationcodeinvoiceitem'),(338,'Can change course registration code invoice item',112,'change_courseregistrationcodeinvoiceitem'),(339,'Can delete course registration code invoice item',112,'delete_courseregistrationcodeinvoiceitem'),(340,'Can add invoice history',113,'add_invoicehistory'),(341,'Can change invoice history',113,'change_invoicehistory'),(342,'Can delete invoice history',113,'delete_invoicehistory'),(343,'Can add course registration code',114,'add_courseregistrationcode'),(344,'Can change course registration code',114,'change_courseregistrationcode'),(345,'Can delete course registration code',114,'delete_courseregistrationcode'),(346,'Can add registration code redemption',115,'add_registrationcoderedemption'),(347,'Can change registration code redemption',115,'change_registrationcoderedemption'),(348,'Can delete registration code redemption',115,'delete_registrationcoderedemption'),(349,'Can add coupon',116,'add_coupon'),(350,'Can change coupon',116,'change_coupon'),(351,'Can delete coupon',116,'delete_coupon'),(352,'Can add coupon redemption',117,'add_couponredemption'),(353,'Can change coupon redemption',117,'change_couponredemption'),(354,'Can delete coupon redemption',117,'delete_couponredemption'),(355,'Can add paid course registration',118,'add_paidcourseregistration'),(356,'Can change paid course registration',118,'change_paidcourseregistration'),(357,'Can delete paid course registration',118,'delete_paidcourseregistration'),(358,'Can add course reg code item',119,'add_courseregcodeitem'),(359,'Can change course reg code item',119,'change_courseregcodeitem'),(360,'Can delete course reg code item',119,'delete_courseregcodeitem'),(361,'Can add course reg code item annotation',120,'add_courseregcodeitemannotation'),(362,'Can change course reg code item annotation',120,'change_courseregcodeitemannotation'),(363,'Can delete course reg code item annotation',120,'delete_courseregcodeitemannotation'),(364,'Can add paid course registration annotation',121,'add_paidcourseregistrationannotation'),(365,'Can change paid course registration annotation',121,'change_paidcourseregistrationannotation'),(366,'Can delete paid course registration annotation',121,'delete_paidcourseregistrationannotation'),(367,'Can add certificate item',122,'add_certificateitem'),(368,'Can change certificate item',122,'change_certificateitem'),(369,'Can delete certificate item',122,'delete_certificateitem'),(370,'Can add donation configuration',123,'add_donationconfiguration'),(371,'Can change donation configuration',123,'change_donationconfiguration'),(372,'Can delete donation configuration',123,'delete_donationconfiguration'),(373,'Can add donation',124,'add_donation'),(374,'Can change donation',124,'change_donation'),(375,'Can delete donation',124,'delete_donation'),(376,'Can add course mode',125,'add_coursemode'),(377,'Can change course mode',125,'change_coursemode'),(378,'Can delete course mode',125,'delete_coursemode'),(379,'Can add course modes archive',126,'add_coursemodesarchive'),(380,'Can change course modes archive',126,'change_coursemodesarchive'),(381,'Can delete course modes archive',126,'delete_coursemodesarchive'),(382,'Can add software secure photo verification',127,'add_softwaresecurephotoverification'),(383,'Can change software secure photo verification',127,'change_softwaresecurephotoverification'),(384,'Can delete software secure photo verification',127,'delete_softwaresecurephotoverification'),(385,'Can add historical verification deadline',128,'add_historicalverificationdeadline'),(386,'Can change historical verification deadline',128,'change_historicalverificationdeadline'),(387,'Can delete historical verification deadline',128,'delete_historicalverificationdeadline'),(388,'Can add verification deadline',129,'add_verificationdeadline'),(389,'Can change verification deadline',129,'change_verificationdeadline'),(390,'Can delete verification deadline',129,'delete_verificationdeadline'),(391,'Can add verification checkpoint',130,'add_verificationcheckpoint'),(392,'Can change verification checkpoint',130,'change_verificationcheckpoint'),(393,'Can delete verification checkpoint',130,'delete_verificationcheckpoint'),(394,'Can add Verification Status',131,'add_verificationstatus'),(395,'Can change Verification Status',131,'change_verificationstatus'),(396,'Can delete Verification Status',131,'delete_verificationstatus'),(397,'Can add in course reverification configuration',132,'add_incoursereverificationconfiguration'),(398,'Can change in course reverification configuration',132,'change_incoursereverificationconfiguration'),(399,'Can delete in course reverification configuration',132,'delete_incoursereverificationconfiguration'),(400,'Can add skipped reverification',133,'add_skippedreverification'),(401,'Can change skipped reverification',133,'change_skippedreverification'),(402,'Can delete skipped reverification',133,'delete_skippedreverification'),(403,'Can add dark lang config',134,'add_darklangconfig'),(404,'Can change dark lang config',134,'change_darklangconfig'),(405,'Can delete dark lang config',134,'delete_darklangconfig'),(406,'Can add embargoed course',135,'add_embargoedcourse'),(407,'Can change embargoed course',135,'change_embargoedcourse'),(408,'Can delete embargoed course',135,'delete_embargoedcourse'),(409,'Can add embargoed state',136,'add_embargoedstate'),(410,'Can change embargoed state',136,'change_embargoedstate'),(411,'Can delete embargoed state',136,'delete_embargoedstate'),(412,'Can add restricted course',137,'add_restrictedcourse'),(413,'Can change restricted course',137,'change_restrictedcourse'),(414,'Can delete restricted course',137,'delete_restrictedcourse'),(415,'Can add country',138,'add_country'),(416,'Can change country',138,'change_country'),(417,'Can delete country',138,'delete_country'),(418,'Can add country access rule',139,'add_countryaccessrule'),(419,'Can change country access rule',139,'change_countryaccessrule'),(420,'Can delete country access rule',139,'delete_countryaccessrule'),(421,'Can add course access rule history',140,'add_courseaccessrulehistory'),(422,'Can change course access rule history',140,'change_courseaccessrulehistory'),(423,'Can delete course access rule history',140,'delete_courseaccessrulehistory'),(424,'Can add ip filter',141,'add_ipfilter'),(425,'Can change ip filter',141,'change_ipfilter'),(426,'Can delete ip filter',141,'delete_ipfilter'),(427,'Can add course rerun state',142,'add_coursererunstate'),(428,'Can change course rerun state',142,'change_coursererunstate'),(429,'Can delete course rerun state',142,'delete_coursererunstate'),(430,'Can add mobile api config',143,'add_mobileapiconfig'),(431,'Can change mobile api config',143,'change_mobileapiconfig'),(432,'Can delete mobile api config',143,'delete_mobileapiconfig'),(433,'Can add survey form',144,'add_surveyform'),(434,'Can change survey form',144,'change_surveyform'),(435,'Can delete survey form',144,'delete_surveyform'),(436,'Can add survey answer',145,'add_surveyanswer'),(437,'Can change survey answer',145,'change_surveyanswer'),(438,'Can delete survey answer',145,'delete_surveyanswer'),(439,'Can add x block asides config',146,'add_xblockasidesconfig'),(440,'Can change x block asides config',146,'change_xblockasidesconfig'),(441,'Can delete x block asides config',146,'delete_xblockasidesconfig'),(442,'Can add course overview',147,'add_courseoverview'),(443,'Can change course overview',147,'change_courseoverview'),(444,'Can delete course overview',147,'delete_courseoverview'),(445,'Can add course structure',148,'add_coursestructure'),(446,'Can change course structure',148,'change_coursestructure'),(447,'Can delete course structure',148,'delete_coursestructure'),(448,'Can add x domain proxy configuration',149,'add_xdomainproxyconfiguration'),(449,'Can change x domain proxy configuration',149,'change_xdomainproxyconfiguration'),(450,'Can delete x domain proxy configuration',149,'delete_xdomainproxyconfiguration'),(451,'Can add course team',150,'add_courseteam'),(452,'Can change course team',150,'change_courseteam'),(453,'Can delete course team',150,'delete_courseteam'),(454,'Can add course team membership',151,'add_courseteammembership'),(455,'Can change course team membership',151,'change_courseteammembership'),(456,'Can delete course team membership',151,'delete_courseteammembership'),(457,'Can add student item',152,'add_studentitem'),(458,'Can change student item',152,'change_studentitem'),(459,'Can delete student item',152,'delete_studentitem'),(460,'Can add submission',153,'add_submission'),(461,'Can change submission',153,'change_submission'),(462,'Can delete submission',153,'delete_submission'),(463,'Can add score',154,'add_score'),(464,'Can change score',154,'change_score'),(465,'Can delete score',154,'delete_score'),(466,'Can add score summary',155,'add_scoresummary'),(467,'Can change score summary',155,'change_scoresummary'),(468,'Can delete score summary',155,'delete_scoresummary'),(469,'Can add rubric',156,'add_rubric'),(470,'Can change rubric',156,'change_rubric'),(471,'Can delete rubric',156,'delete_rubric'),(472,'Can add criterion',157,'add_criterion'),(473,'Can change criterion',157,'change_criterion'),(474,'Can delete criterion',157,'delete_criterion'),(475,'Can add criterion option',158,'add_criterionoption'),(476,'Can change criterion option',158,'change_criterionoption'),(477,'Can delete criterion option',158,'delete_criterionoption'),(478,'Can add assessment',159,'add_assessment'),(479,'Can change assessment',159,'change_assessment'),(480,'Can delete assessment',159,'delete_assessment'),(481,'Can add assessment part',160,'add_assessmentpart'),(482,'Can change assessment part',160,'change_assessmentpart'),(483,'Can delete assessment part',160,'delete_assessmentpart'),(484,'Can add assessment feedback option',161,'add_assessmentfeedbackoption'),(485,'Can change assessment feedback option',161,'change_assessmentfeedbackoption'),(486,'Can delete assessment feedback option',161,'delete_assessmentfeedbackoption'),(487,'Can add assessment feedback',162,'add_assessmentfeedback'),(488,'Can change assessment feedback',162,'change_assessmentfeedback'),(489,'Can delete assessment feedback',162,'delete_assessmentfeedback'),(490,'Can add peer workflow',163,'add_peerworkflow'),(491,'Can change peer workflow',163,'change_peerworkflow'),(492,'Can delete peer workflow',163,'delete_peerworkflow'),(493,'Can add peer workflow item',164,'add_peerworkflowitem'),(494,'Can change peer workflow item',164,'change_peerworkflowitem'),(495,'Can delete peer workflow item',164,'delete_peerworkflowitem'),(496,'Can add training example',165,'add_trainingexample'),(497,'Can change training example',165,'change_trainingexample'),(498,'Can delete training example',165,'delete_trainingexample'),(499,'Can add student training workflow',166,'add_studenttrainingworkflow'),(500,'Can change student training workflow',166,'change_studenttrainingworkflow'),(501,'Can delete student training workflow',166,'delete_studenttrainingworkflow'),(502,'Can add student training workflow item',167,'add_studenttrainingworkflowitem'),(503,'Can change student training workflow item',167,'change_studenttrainingworkflowitem'),(504,'Can delete student training workflow item',167,'delete_studenttrainingworkflowitem'),(505,'Can add ai classifier set',168,'add_aiclassifierset'),(506,'Can change ai classifier set',168,'change_aiclassifierset'),(507,'Can delete ai classifier set',168,'delete_aiclassifierset'),(508,'Can add ai classifier',169,'add_aiclassifier'),(509,'Can change ai classifier',169,'change_aiclassifier'),(510,'Can delete ai classifier',169,'delete_aiclassifier'),(511,'Can add ai training workflow',170,'add_aitrainingworkflow'),(512,'Can change ai training workflow',170,'change_aitrainingworkflow'),(513,'Can delete ai training workflow',170,'delete_aitrainingworkflow'),(514,'Can add ai grading workflow',171,'add_aigradingworkflow'),(515,'Can change ai grading workflow',171,'change_aigradingworkflow'),(516,'Can delete ai grading workflow',171,'delete_aigradingworkflow'),(517,'Can add assessment workflow',172,'add_assessmentworkflow'),(518,'Can change assessment workflow',172,'change_assessmentworkflow'),(519,'Can delete assessment workflow',172,'delete_assessmentworkflow'),(520,'Can add assessment workflow step',173,'add_assessmentworkflowstep'),(521,'Can change assessment workflow step',173,'change_assessmentworkflowstep'),(522,'Can delete assessment workflow step',173,'delete_assessmentworkflowstep'),(523,'Can add assessment workflow cancellation',174,'add_assessmentworkflowcancellation'),(524,'Can change assessment workflow cancellation',174,'change_assessmentworkflowcancellation'),(525,'Can delete assessment workflow cancellation',174,'delete_assessmentworkflowcancellation'),(526,'Can add profile',175,'add_profile'),(527,'Can change profile',175,'change_profile'),(528,'Can delete profile',175,'delete_profile'),(529,'Can add video',176,'add_video'),(530,'Can change video',176,'change_video'),(531,'Can delete video',176,'delete_video'),(532,'Can add course video',177,'add_coursevideo'),(533,'Can change course video',177,'change_coursevideo'),(534,'Can delete course video',177,'delete_coursevideo'),(535,'Can add encoded video',178,'add_encodedvideo'),(536,'Can change encoded video',178,'change_encodedvideo'),(537,'Can delete encoded video',178,'delete_encodedvideo'),(538,'Can add subtitle',179,'add_subtitle'),(539,'Can change subtitle',179,'change_subtitle'),(540,'Can delete subtitle',179,'delete_subtitle'),(541,'Can add milestone',180,'add_milestone'),(542,'Can change milestone',180,'change_milestone'),(543,'Can delete milestone',180,'delete_milestone'),(544,'Can add milestone relationship type',181,'add_milestonerelationshiptype'),(545,'Can change milestone relationship type',181,'change_milestonerelationshiptype'),(546,'Can delete milestone relationship type',181,'delete_milestonerelationshiptype'),(547,'Can add course milestone',182,'add_coursemilestone'),(548,'Can change course milestone',182,'change_coursemilestone'),(549,'Can delete course milestone',182,'delete_coursemilestone'),(550,'Can add course content milestone',183,'add_coursecontentmilestone'),(551,'Can change course content milestone',183,'change_coursecontentmilestone'),(552,'Can delete course content milestone',183,'delete_coursecontentmilestone'),(553,'Can add user milestone',184,'add_usermilestone'),(554,'Can change user milestone',184,'change_usermilestone'),(555,'Can delete user milestone',184,'delete_usermilestone'),(556,'Can add proctored exam',185,'add_proctoredexam'),(557,'Can change proctored exam',185,'change_proctoredexam'),(558,'Can delete proctored exam',185,'delete_proctoredexam'),(559,'Can add proctored exam attempt',186,'add_proctoredexamstudentattempt'),(560,'Can change proctored exam attempt',186,'change_proctoredexamstudentattempt'),(561,'Can delete proctored exam attempt',186,'delete_proctoredexamstudentattempt'),(562,'Can add proctored exam student attempt history',187,'add_proctoredexamstudentattempthistory'),(563,'Can change proctored exam student attempt history',187,'change_proctoredexamstudentattempthistory'),(564,'Can delete proctored exam student attempt history',187,'delete_proctoredexamstudentattempthistory'),(565,'Can add proctored allowance',188,'add_proctoredexamstudentallowance'),(566,'Can change proctored allowance',188,'change_proctoredexamstudentallowance'),(567,'Can delete proctored allowance',188,'delete_proctoredexamstudentallowance'),(568,'Can add proctored allowance history',189,'add_proctoredexamstudentallowancehistory'),(569,'Can change proctored allowance history',189,'change_proctoredexamstudentallowancehistory'),(570,'Can delete proctored allowance history',189,'delete_proctoredexamstudentallowancehistory'),(571,'Can add organization',190,'add_organization'),(572,'Can change organization',190,'change_organization'),(573,'Can delete organization',190,'delete_organization'),(574,'Can add organization course',191,'add_organizationcourse'),(575,'Can change organization course',191,'change_organizationcourse'),(576,'Can delete organization course',191,'delete_organizationcourse'),(577,'Can add credit provider',192,'add_creditprovider'),(578,'Can change credit provider',192,'change_creditprovider'),(579,'Can delete credit provider',192,'delete_creditprovider'),(580,'Can add credit course',193,'add_creditcourse'),(581,'Can change credit course',193,'change_creditcourse'),(582,'Can delete credit course',193,'delete_creditcourse'),(583,'Can add credit requirement',194,'add_creditrequirement'),(584,'Can change credit requirement',194,'change_creditrequirement'),(585,'Can delete credit requirement',194,'delete_creditrequirement'),(586,'Can add historical credit requirement status',195,'add_historicalcreditrequirementstatus'),(587,'Can change historical credit requirement status',195,'change_historicalcreditrequirementstatus'),(588,'Can delete historical credit requirement status',195,'delete_historicalcreditrequirementstatus'),(589,'Can add credit requirement status',196,'add_creditrequirementstatus'),(590,'Can change credit requirement status',196,'change_creditrequirementstatus'),(591,'Can delete credit requirement status',196,'delete_creditrequirementstatus'),(592,'Can add credit eligibility',197,'add_crediteligibility'),(593,'Can change credit eligibility',197,'change_crediteligibility'),(594,'Can delete credit eligibility',197,'delete_crediteligibility'),(595,'Can add historical credit request',198,'add_historicalcreditrequest'),(596,'Can change historical credit request',198,'change_historicalcreditrequest'),(597,'Can delete historical credit request',198,'delete_historicalcreditrequest'),(598,'Can add credit request',199,'add_creditrequest'),(599,'Can change credit request',199,'change_creditrequest'),(600,'Can delete credit request',199,'delete_creditrequest'),(601,'Can add video upload config',200,'add_videouploadconfig'),(602,'Can change video upload config',200,'change_videouploadconfig'),(603,'Can delete video upload config',200,'delete_videouploadconfig'),(604,'Can add push notification config',201,'add_pushnotificationconfig'),(605,'Can change push notification config',201,'change_pushnotificationconfig'),(606,'Can delete push notification config',201,'delete_pushnotificationconfig'),(607,'Can add course creator',202,'add_coursecreator'),(608,'Can change course creator',202,'change_coursecreator'),(609,'Can delete course creator',202,'delete_coursecreator'),(610,'Can add studio config',203,'add_studioconfig'),(611,'Can change studio config',203,'change_studioconfig'),(612,'Can delete studio config',203,'delete_studioconfig');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_registration`
--

DROP TABLE IF EXISTS `auth_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `activation_key` (`activation_key`),
  CONSTRAINT `user_id_refs_id_3e5b0b5` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_registration`
--

LOCK TABLES `auth_registration` WRITE;
/*!40000 ALTER TABLE `auth_registration` DISABLE KEYS */;
INSERT INTO `auth_registration` VALUES (1,1,'32e541ef52b84d49892cf521ba0a9024'),(2,2,'73ab175cb49845afa6969ff26abc67d5'),(3,3,'62f61a7d10fb41deb665dd9d6c39e4d9'),(4,4,'db6b53cbd59d4314b66272e75650cc74'),(5,6,'e896f8eeba44492bac6f03314e301531'),(6,7,'db8e2fce973e46dba4b3c4e1af769122'),(7,8,'fccddf4216d24ff58b9904e2552c28ed'),(8,9,'ee540e8cc57e41ef806a55509fde469b');
/*!40000 ALTER TABLE `auth_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'honor','','','honor@example.com','pbkdf2_sha256$10000$5t8SMxi47G6H$nsnhPv1bZ2aIcvRlyeELLKwVzXTZVcCbEfSytpd94tw=',0,1,0,'2015-10-26 12:53:49','2015-10-26 12:53:49'),(2,'audit','','','audit@example.com','pbkdf2_sha256$10000$V8sdElNTlLAH$iGGUx7FrWT1UcVbdkPqC1jeZaEBQ0HNdCV7PDdSrjNA=',0,1,0,'2015-10-26 12:53:52','2015-10-26 12:53:52'),(3,'verified','','','verified@example.com','pbkdf2_sha256$10000$bKHOKtLJcevk$kZ428GX1dQa0Tb6jCg/NJt1jymo0MM09Edmi3LInYyw=',0,1,0,'2015-10-26 12:53:56','2015-10-26 12:53:56'),(4,'staff','','','staff@example.com','pbkdf2_sha256$10000$3daVK6TwcrJE$R/d7YVkI7gcfJ+GX4rw+G9MMQoXei6irgpOfecapxTY=',1,1,0,'2015-10-26 12:53:59','2015-10-26 12:53:59'),(5,'admin','','','admin@example.com','pbkdf2_sha256$10000$1V8G1vKuu3k6$zvnh5Vbst9XBJJG2Sr9/2q9w2vCIa+/kibVJEbXT/b0=',0,0,0,'2015-10-26 15:20:12','2015-10-26 15:20:12'),(6,'test','','','test@example.com','pbkdf2_sha256$10000$duw6RrsDZKeG$oDKhfEyfjULFnzOaO9DhSuEP291c3qojknn8Icgx17A=',0,0,0,'2015-10-26 16:27:04','2015-10-26 16:27:03'),(7,'abhilashks','','','abhilashks@it.iitb.ac.in','pbkdf2_sha256$10000$2O10pwGniCRT$UthHpZNhSgs3Ydsj8G41By52Jsgtq9KAcctLN05HL/g=',0,1,0,'2015-10-26 17:32:28','2015-10-26 16:33:26'),(8,'admin1','','','admin1@example.com','pbkdf2_sha256$10000$Qk2PHcCImXec$9EOj+VTJBgvDV2M6YceXxyafmKJehSDPNqKwTjGl2UM=',1,1,1,'2015-10-26 17:29:19','2015-10-26 16:41:26'),(9,'Deep','','','shinde.d@gmail.com','pbkdf2_sha256$10000$GDO1Abk49Lhx$D/AQ83bgeY6UPOkqalZyZF36aEewYtRKRnDyeZI6F4Y=',0,0,0,'2015-10-27 11:54:51','2015-10-27 11:54:50');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_userprofile`
--

DROP TABLE IF EXISTS `auth_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `meta` longtext NOT NULL,
  `courseware` varchar(255) NOT NULL,
  `gender` varchar(6),
  `mailing_address` longtext,
  `year_of_birth` int(11),
  `level_of_education` varchar(6),
  `goals` longtext,
  `allow_certificate` tinyint(1) NOT NULL,
  `country` varchar(2),
  `city` longtext,
  `bio` varchar(3000),
  `profile_image_uploaded_at` datetime,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `auth_userprofile_52094d6e` (`name`),
  KEY `auth_userprofile_75853655` (`language`),
  KEY `auth_userprofile_4ab6ab22` (`location`),
  KEY `auth_userprofile_35c2d6e` (`gender`),
  KEY `auth_userprofile_d85587` (`year_of_birth`),
  KEY `auth_userprofile_551e365c` (`level_of_education`),
  CONSTRAINT `user_id_refs_id_628b4c11` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_userprofile`
--

LOCK TABLES `auth_userprofile` WRITE;
/*!40000 ALTER TABLE `auth_userprofile` DISABLE KEYS */;
INSERT INTO `auth_userprofile` VALUES (1,1,'honor','','','','course.xml',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(2,2,'audit','','','','course.xml',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(3,3,'verified','','','','course.xml',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(4,4,'staff','','','','course.xml',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(5,6,'test','','','{\"session_id\": \"72e30b8bfd3e9ad828daa12279dd765e\"}','course.xml','m','',NULL,'','',1,'','',NULL,NULL),(6,7,'Abhilash K S','','','{\"session_id\": \"0b0ce5a3ec92fbbc92854cb236b3c659\"}','course.xml','','',NULL,'','',1,'','',NULL,NULL),(7,8,'admin1','','','{\"session_id\": null}','course.xml',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(8,9,'Deepak','','','{\"session_id\": \"994752b9482a8e6173a74b57d4bd09bb\"}','course.xml','m','ABC',1976,'m','ABCD',1,'','',NULL,NULL);
/*!40000 ALTER TABLE `auth_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branding_brandingapiconfig`
--

DROP TABLE IF EXISTS `branding_brandingapiconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branding_brandingapiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branding_brandingapiconfig_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_9f2ff49` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branding_brandingapiconfig`
--

LOCK TABLES `branding_brandingapiconfig` WRITE;
/*!40000 ALTER TABLE `branding_brandingapiconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `branding_brandingapiconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branding_brandinginfoconfig`
--

DROP TABLE IF EXISTS `branding_brandinginfoconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branding_brandinginfoconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `configuration` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branding_brandinginfoconfig_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_2d8a8248` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branding_brandinginfoconfig`
--

LOCK TABLES `branding_brandinginfoconfig` WRITE;
/*!40000 ALTER TABLE `branding_brandinginfoconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `branding_brandinginfoconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseauthorization`
--

DROP TABLE IF EXISTS `bulk_email_courseauthorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseauthorization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `email_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulk_email_courseauthorization_course_id_5bf93275_uniq` (`course_id`),
  KEY `bulk_email_courseauthorization_b7271b` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseauthorization`
--

LOCK TABLES `bulk_email_courseauthorization` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseauthorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_courseauthorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseemail`
--

DROP TABLE IF EXISTS `bulk_email_courseemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `slug` varchar(128) NOT NULL,
  `subject` varchar(128) NOT NULL,
  `html_message` longtext,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `to_option` varchar(64) NOT NULL,
  `text_message` longtext,
  `template_name` varchar(255),
  `from_addr` varchar(255),
  PRIMARY KEY (`id`),
  KEY `bulk_email_courseemail_6fe0a617` (`sender_id`),
  KEY `bulk_email_courseemail_36af87d1` (`slug`),
  KEY `bulk_email_courseemail_b7271b` (`course_id`),
  CONSTRAINT `sender_id_refs_id_70ed6279` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseemail`
--

LOCK TABLES `bulk_email_courseemail` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_courseemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseemailtemplate`
--

DROP TABLE IF EXISTS `bulk_email_courseemailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseemailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `html_template` longtext,
  `plain_template` longtext,
  `name` varchar(255),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseemailtemplate`
--

LOCK TABLES `bulk_email_courseemailtemplate` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseemailtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_courseemailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_optout`
--

DROP TABLE IF EXISTS `bulk_email_optout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_optout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `user_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulk_email_optout_course_id_4d6681e6_uniq` (`course_id`,`user_id`),
  KEY `bulk_email_optout_b7271b` (`course_id`),
  KEY `bulk_email_optout_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_61971984` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_optout`
--

LOCK TABLES `bulk_email_optout` WRITE;
/*!40000 ALTER TABLE `bulk_email_optout` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_optout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_c91f1bf` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_c91f1bf` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_badgeassertion`
--

DROP TABLE IF EXISTS `certificates_badgeassertion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_badgeassertion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `mode` varchar(100) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_badgeassertion_course_id_1c0cd3ff_uniq` (`course_id`,`user_id`,`mode`),
  KEY `certificates_badgeassertion_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_30664b3b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_badgeassertion`
--

LOCK TABLES `certificates_badgeassertion` WRITE;
/*!40000 ALTER TABLE `certificates_badgeassertion` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_badgeassertion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_badgeimageconfiguration`
--

DROP TABLE IF EXISTS `certificates_badgeimageconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_badgeimageconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(125) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mode` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_badgeimageconfiguration`
--

LOCK TABLES `certificates_badgeimageconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_badgeimageconfiguration` DISABLE KEYS */;
INSERT INTO `certificates_badgeimageconfiguration` VALUES (1,'honor','./honor.png',0),(2,'verified','./verified.png',0),(3,'professional','./professional.png',0);
/*!40000 ALTER TABLE `certificates_badgeimageconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificategenerationconfiguration`
--

DROP TABLE IF EXISTS `certificates_certificategenerationconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificategenerationconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certificategenerationconfiguration_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_544c5989` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificategenerationconfiguration`
--

LOCK TABLES `certificates_certificategenerationconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_certificategenerationconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificategenerationconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificategenerationcoursesetting`
--

DROP TABLE IF EXISTS `certificates_certificategenerationcoursesetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificategenerationcoursesetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certificategenerationcoursesetting_4b4b8186` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificategenerationcoursesetting`
--

LOCK TABLES `certificates_certificategenerationcoursesetting` WRITE;
/*!40000 ALTER TABLE `certificates_certificategenerationcoursesetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificategenerationcoursesetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatehtmlviewconfiguration`
--

DROP TABLE IF EXISTS `certificates_certificatehtmlviewconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatehtmlviewconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `configuration` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certificatehtmlviewconfiguration_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_7a7b24e9` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatehtmlviewconfiguration`
--

LOCK TABLES `certificates_certificatehtmlviewconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_certificatehtmlviewconfiguration` DISABLE KEYS */;
INSERT INTO `certificates_certificatehtmlviewconfiguration` VALUES (1,'2015-10-26 12:28:50',NULL,0,'{\"default\": {\"accomplishment_class_append\": \"accomplishment-certificate\", \"platform_name\": \"Your Platform Name Here\", \"logo_src\": \"/static/certificates/images/logo.png\", \"logo_url\": \"http://www.example.com\", \"company_verified_certificate_url\": \"http://www.example.com/verified-certificate\", \"company_privacy_url\": \"http://www.example.com/privacy-policy\", \"company_tos_url\": \"http://www.example.com/terms-service\", \"company_about_url\": \"http://www.example.com/about-us\"}, \"base\": {\"certificate_type\": \"base\", \"certificate_title\": \"Certificate of Achievement\", \"document_body_class_append\": \"is-base\"}, \"distinguished\": {\"certificate_type\": \"distinguished\", \"certificate_title\": \"Distinguished Certificate of Achievement\", \"document_body_class_append\": \"is-distinguished\"}}');
/*!40000 ALTER TABLE `certificates_certificatehtmlviewconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatetemplate`
--

DROP TABLE IF EXISTS `certificates_certificatetemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatetemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `template` longtext NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `course_key` varchar(255) DEFAULT NULL,
  `mode` varchar(125) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_certificatetemplate_organization_id_32b374fb_uniq` (`organization_id`,`course_key`,`mode`),
  KEY `certificates_certificatetemplate_68283273` (`organization_id`),
  KEY `certificates_certificatetemplate_4b4b8186` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatetemplate`
--

LOCK TABLES `certificates_certificatetemplate` WRITE;
/*!40000 ALTER TABLE `certificates_certificatetemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificatetemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatetemplateasset`
--

DROP TABLE IF EXISTS `certificates_certificatetemplateasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatetemplateasset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `asset` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatetemplateasset`
--

LOCK TABLES `certificates_certificatetemplateasset` WRITE;
/*!40000 ALTER TABLE `certificates_certificatetemplateasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificatetemplateasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatewhitelist`
--

DROP TABLE IF EXISTS `certificates_certificatewhitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatewhitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `whitelist` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certificatewhitelist_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_58456cfa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatewhitelist`
--

LOCK TABLES `certificates_certificatewhitelist` WRITE;
/*!40000 ALTER TABLE `certificates_certificatewhitelist` DISABLE KEYS */;
INSERT INTO `certificates_certificatewhitelist` VALUES (1,1,'edX/DemoX/Demo_Course',1),(2,2,'edX/DemoX/Demo_Course',1),(3,3,'edX/DemoX/Demo_Course',1);
/*!40000 ALTER TABLE `certificates_certificatewhitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_examplecertificate`
--

DROP TABLE IF EXISTS `certificates_examplecertificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_examplecertificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `example_cert_set_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `access_key` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `error_reason` longtext,
  `download_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `certificates_examplecertificate_uuid_451b331e` (`uuid`,`access_key`),
  KEY `certificates_examplecertificate_3b9264a` (`example_cert_set_id`),
  KEY `certificates_examplecertificate_752852c3` (`access_key`),
  CONSTRAINT `example_cert_set_id_refs_id_42261d76` FOREIGN KEY (`example_cert_set_id`) REFERENCES `certificates_examplecertificateset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_examplecertificate`
--

LOCK TABLES `certificates_examplecertificate` WRITE;
/*!40000 ALTER TABLE `certificates_examplecertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_examplecertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_examplecertificateset`
--

DROP TABLE IF EXISTS `certificates_examplecertificateset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_examplecertificateset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_examplecertificateset_4b4b8186` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_examplecertificateset`
--

LOCK TABLES `certificates_examplecertificateset` WRITE;
/*!40000 ALTER TABLE `certificates_examplecertificateset` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_examplecertificateset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_generatedcertificate`
--

DROP TABLE IF EXISTS `certificates_generatedcertificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_generatedcertificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `download_url` varchar(128) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `key` varchar(32) NOT NULL,
  `distinction` tinyint(1) NOT NULL,
  `status` varchar(32) NOT NULL,
  `verify_uuid` varchar(32) NOT NULL,
  `download_uuid` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `error_reason` varchar(512) NOT NULL,
  `mode` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_generatedcertificate_course_id_28d0a188_uniq` (`course_id`,`user_id`),
  KEY `certificates_generatedcertificate_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_71dc401e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_generatedcertificate`
--

LOCK TABLES `certificates_generatedcertificate` WRITE;
/*!40000 ALTER TABLE `certificates_generatedcertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_generatedcertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuit_servercircuit`
--

DROP TABLE IF EXISTS `circuit_servercircuit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuit_servercircuit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `schematic` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuit_servercircuit`
--

LOCK TABLES `circuit_servercircuit` WRITE;
/*!40000 ALTER TABLE `circuit_servercircuit` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuit_servercircuit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentstore_pushnotificationconfig`
--

DROP TABLE IF EXISTS `contentstore_pushnotificationconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentstore_pushnotificationconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentstore_pushnotificationconfig_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_1bce468b` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentstore_pushnotificationconfig`
--

LOCK TABLES `contentstore_pushnotificationconfig` WRITE;
/*!40000 ALTER TABLE `contentstore_pushnotificationconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentstore_pushnotificationconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentstore_videouploadconfig`
--

DROP TABLE IF EXISTS `contentstore_videouploadconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentstore_videouploadconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `profile_whitelist` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentstore_videouploadconfig_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_209c438f` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentstore_videouploadconfig`
--

LOCK TABLES `contentstore_videouploadconfig` WRITE;
/*!40000 ALTER TABLE `contentstore_videouploadconfig` DISABLE KEYS */;
INSERT INTO `contentstore_videouploadconfig` VALUES (1,'2015-10-26 12:34:30',NULL,0,'desktop_mp4,desktop_webm,mobile_low,youtube');
/*!40000 ALTER TABLE `contentstore_videouploadconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cors_csrf_xdomainproxyconfiguration`
--

DROP TABLE IF EXISTS `cors_csrf_xdomainproxyconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cors_csrf_xdomainproxyconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `whitelist` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cors_csrf_xdomainproxyconfiguration_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_3dfcfcb0` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cors_csrf_xdomainproxyconfiguration`
--

LOCK TABLES `cors_csrf_xdomainproxyconfiguration` WRITE;
/*!40000 ALTER TABLE `cors_csrf_xdomainproxyconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cors_csrf_xdomainproxyconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsheaders_corsmodel`
--

DROP TABLE IF EXISTS `corsheaders_corsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corsheaders_corsmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsheaders_corsmodel`
--

LOCK TABLES `corsheaders_corsmodel` WRITE;
/*!40000 ALTER TABLE `corsheaders_corsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsheaders_corsmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_action_state_coursererunstate`
--

DROP TABLE IF EXISTS `course_action_state_coursererunstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_action_state_coursererunstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `course_key` varchar(255) NOT NULL,
  `action` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `should_display` tinyint(1) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `source_course_key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_action_state_coursererunstate_course_key_12cfcd2a_uniq` (`course_key`,`action`),
  KEY `course_action_state_coursererunstate_5b876fa2` (`created_user_id`),
  KEY `course_action_state_coursererunstate_314d1d19` (`updated_user_id`),
  KEY `course_action_state_coursererunstate_4b4b8186` (`course_key`),
  KEY `course_action_state_coursererunstate_1bd4707b` (`action`),
  KEY `course_action_state_coursererunstate_1401c923` (`source_course_key`),
  CONSTRAINT `created_user_id_refs_id_1744bdeb` FOREIGN KEY (`created_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `updated_user_id_refs_id_1744bdeb` FOREIGN KEY (`updated_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_action_state_coursererunstate`
--

LOCK TABLES `course_action_state_coursererunstate` WRITE;
/*!40000 ALTER TABLE `course_action_state_coursererunstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_action_state_coursererunstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_creators_coursecreator`
--

DROP TABLE IF EXISTS `course_creators_coursecreator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_creators_coursecreator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `state_changed` datetime NOT NULL,
  `state` varchar(24) NOT NULL,
  `note` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_6a0e6044` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_creators_coursecreator`
--

LOCK TABLES `course_creators_coursecreator` WRITE;
/*!40000 ALTER TABLE `course_creators_coursecreator` DISABLE KEYS */;
INSERT INTO `course_creators_coursecreator` VALUES (1,9,'2015-10-27 11:55:28','unrequested','');
/*!40000 ALTER TABLE `course_creators_coursecreator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_coursecohort`
--

DROP TABLE IF EXISTS `course_groups_coursecohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_coursecohort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_user_group_id` int(11) NOT NULL,
  `assignment_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_user_group_id` (`course_user_group_id`),
  CONSTRAINT `course_user_group_id_refs_id_70143ff1` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_coursecohort`
--

LOCK TABLES `course_groups_coursecohort` WRITE;
/*!40000 ALTER TABLE `course_groups_coursecohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_coursecohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_coursecohortssettings`
--

DROP TABLE IF EXISTS `course_groups_coursecohortssettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_coursecohortssettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_cohorted` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `cohorted_discussions` longtext,
  `always_cohort_inline_discussions` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_coursecohortssettings`
--

LOCK TABLES `course_groups_coursecohortssettings` WRITE;
/*!40000 ALTER TABLE `course_groups_coursecohortssettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_coursecohortssettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_courseusergroup`
--

DROP TABLE IF EXISTS `course_groups_courseusergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_courseusergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `group_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_groups_courseusergroup_name_4c52f38_uniq` (`name`,`course_id`),
  KEY `course_groups_courseusergroup_b7271b` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_courseusergroup`
--

LOCK TABLES `course_groups_courseusergroup` WRITE;
/*!40000 ALTER TABLE `course_groups_courseusergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_courseusergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_courseusergroup_users`
--

DROP TABLE IF EXISTS `course_groups_courseusergroup_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_courseusergroup_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseusergroup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_groups_courseusergroup_u_courseusergroup_id_58983eb_uniq` (`courseusergroup_id`,`user_id`),
  KEY `course_groups_courseusergroup_users_3511e39c` (`courseusergroup_id`),
  KEY `course_groups_courseusergroup_users_403f60f` (`user_id`),
  CONSTRAINT `courseusergroup_id_refs_id_2d9e7f56` FOREIGN KEY (`courseusergroup_id`) REFERENCES `course_groups_courseusergroup` (`id`),
  CONSTRAINT `user_id_refs_id_40cc4b86` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_courseusergroup_users`
--

LOCK TABLES `course_groups_courseusergroup_users` WRITE;
/*!40000 ALTER TABLE `course_groups_courseusergroup_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_courseusergroup_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_courseusergrouppartitiongroup`
--

DROP TABLE IF EXISTS `course_groups_courseusergrouppartitiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_courseusergrouppartitiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_user_group_id` int(11) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_user_group_id` (`course_user_group_id`),
  CONSTRAINT `course_user_group_id_refs_id_145383c4` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_courseusergrouppartitiongroup`
--

LOCK TABLES `course_groups_courseusergrouppartitiongroup` WRITE;
/*!40000 ALTER TABLE `course_groups_courseusergrouppartitiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_courseusergrouppartitiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modes_coursemode`
--

DROP TABLE IF EXISTS `course_modes_coursemode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modes_coursemode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `mode_slug` varchar(100) NOT NULL,
  `mode_display_name` varchar(255) NOT NULL,
  `min_price` int(11) NOT NULL,
  `suggested_prices` varchar(255) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `expiration_datetime` datetime DEFAULT NULL,
  `description` longtext,
  `sku` varchar(255),
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_modes_coursemode_course_id_2fc09856_uniq` (`course_id`,`currency`,`mode_slug`),
  KEY `course_modes_coursemode_b7271b` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_coursemode`
--

LOCK TABLES `course_modes_coursemode` WRITE;
/*!40000 ALTER TABLE `course_modes_coursemode` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_modes_coursemode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modes_coursemodesarchive`
--

DROP TABLE IF EXISTS `course_modes_coursemodesarchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modes_coursemodesarchive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `mode_slug` varchar(100) NOT NULL,
  `mode_display_name` varchar(255) NOT NULL,
  `min_price` int(11) NOT NULL,
  `suggested_prices` varchar(255) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `expiration_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_modes_coursemodesarchive_b7271b` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_coursemodesarchive`
--

LOCK TABLES `course_modes_coursemodesarchive` WRITE;
/*!40000 ALTER TABLE `course_modes_coursemodesarchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_modes_coursemodesarchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_courseoverview`
--

DROP TABLE IF EXISTS `course_overviews_courseoverview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_courseoverview` (
  `id` varchar(255) NOT NULL,
  `_location` varchar(255) NOT NULL,
  `display_name` longtext,
  `display_number_with_default` longtext NOT NULL,
  `display_org_with_default` longtext NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `advertised_start` longtext,
  `course_image_url` longtext NOT NULL,
  `facebook_url` longtext,
  `social_sharing_url` longtext,
  `end_of_course_survey_url` longtext,
  `certificates_display_behavior` longtext,
  `certificates_show_before_end` tinyint(1) NOT NULL,
  `has_any_active_web_certificate` tinyint(1) NOT NULL,
  `cert_name_short` longtext NOT NULL,
  `cert_name_long` longtext NOT NULL,
  `lowest_passing_grade` decimal(5,2),
  `mobile_available` tinyint(1) NOT NULL,
  `visible_to_staff_only` tinyint(1) NOT NULL,
  `_pre_requisite_courses_json` longtext NOT NULL,
  `days_early_for_beta` double,
  `cert_html_view_enabled` tinyint(1) NOT NULL,
  `enrollment_start` datetime,
  `enrollment_end` datetime,
  `enrollment_domain` longtext,
  `invitation_only` tinyint(1) NOT NULL,
  `max_student_enrollments_allowed` int(11),
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverview`
--

LOCK TABLES `course_overviews_courseoverview` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverview` DISABLE KEYS */;
INSERT INTO `course_overviews_courseoverview` VALUES ('course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','edX Demonstration Course','DemoX','edX','2013-02-05 05:00:00',NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,NULL,NULL,'end',0,0,'','',0.60,0,0,'[]',NULL,0,NULL,NULL,NULL,0,NULL,'2015-10-26 17:17:07','2015-10-26 17:17:07',1);
/*!40000 ALTER TABLE `course_overviews_courseoverview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_structures_coursestructure`
--

DROP TABLE IF EXISTS `course_structures_coursestructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_structures_coursestructure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `structure_json` longtext,
  `discussion_id_map_json` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_structures_coursestructure`
--

LOCK TABLES `course_structures_coursestructure` WRITE;
/*!40000 ALTER TABLE `course_structures_coursestructure` DISABLE KEYS */;
INSERT INTO `course_structures_coursestructure` VALUES (1,'2015-10-26 17:29:29','2015-10-26 17:29:29','course-v1:edX+DemoX+Demo_Course','H4sIAPliLlYC/81dW3Mct3L+Kxu95CFxFS6Nm15OZFk+dsr2USwnzrVYuDTELS25OrtLy8qp/Pc0\ndimJl6GBwexyWFJZJM3F9DQa3V9f8bdnYbWO77bPni/+dvjyq9/4c0z//g/f4MX68N+zl+urzRb/\nYffxPf5TPHy9/9Xrb7589qz8Cn377Pp//OPi2duNT5joZ9mvtkg/yOvNhd/RDy6vViv6/mrr3+LZ\nO/xYPtdLAa0Tz5ertMFLWua/2tY59+93uLleKFmvuRNErOQARnpjBYiUEVMOWYXyiPGrLi/pax93\ny9/wLNGvXm53G79b0r996x24efZ52e6Ftuu49Kv9Qm8PFPWtw4FDzklxkAGCYjYb6YLS0gfQNpi+\nVV2OXllwxiQG1qoQHefojfYOs3D47H9o2bTcvl/5j2eX/mIvc7T64pubPF4cHvDs/xpp+G2ZcH1N\ngc8mI5dSYbDAY7I8kmBEg2gxMO0GZH7/8dOI/CjK7pyFIVb9257UVr5s8a9XeLkjefm06Uah0RGc\n4nRWvHAJtOBcai60RjakEL6scRoOjaexR2X8hpvdMn5+Rg7GpRh8koqkXXsbtdSQbSat4Zhig2L6\n3foCP6w37xZfLV5tt/7jtnkfzncXn56MSaUYMwePDqSSTvMMOntmBDfg+MAOlE+fhvdj6GoQzvbz\nens3QEUTMZEaykjPBK9tNJb+cMVjDmroyF6vcKJTO5K+Bt78hB8W/3q53DXziBaIV9stacNrKqxh\n0nDBRfAMUsxOSZ1MNMFmyZkbOrtf1rjFp93m6ihsGk/iMYXo/WYdVnjxSX5/P3u/N6wRz1bLi+WO\njG08x1sA6TNfrj96EqY0k9XAix8On1i8PHyiW+0XrZVX6w/t6v0uN569+t3v+TVdv38m5gh63EmI\nUYrICW8AD8qySKZVotJcgg6yFcTcWfbTt2eZgc/oI+OSd64VtNYiECKKzEGI0QU6JckKw6Kjv70k\nZseTTZJnEzPYiM6xbJM1oDxCzH7qm/soHWEUtN71vvnntSSZ7UAQR2bWSxcPDEUUtLvWQnAq8Ohc\nDtpY4qiG2LksgS9nc5LOawdAKl4HYTVJFHKuWM6dyyaN3hP/kggIPKEXLNjAQw6RCAf1IAoup6z9\nnI/lUaMZPZYm7NjC0frgBoIhuyyd4M6A4OCysdzzlDzZa+m1kM0ics+qcW85C9zLIMi/DI4khjlO\nDg4qb5kIg7v5F3p7v1ot/ly4uniNmz07L2O7U3OPDvDBK2nIvzUGQqKHawGW/iGnLUoYgkmPDQCq\nJB4TANzYe0d+LCterMgCyJ9yUSaRgdRikkAaci5UXaWrgR+/nuPl4sUGF/9BzzhoiD8tepjEwXq0\n2RuJHjTDoDNTiqnkWfAadQuTjiU5Y8hq4NGfcbdbXr49sKgo0pdF92TSPrv2A3eDJhEcaGWTQERI\nJMDkt2crQxRkW6MfCiI8BquqZJ3SScs68gAoufbAnQ+KjGWWDHU0zOJgXOVRnbQafRPNiybsFqNI\nRoIErtEh4Rn6TqhAh1uKZqhwIyJE6CPQaqgT0qrKk20JSeZAaxLyYs0xuPt6mIsUbQoEPg0wOmFa\nCGkCWUGeNcg8aLJ+JWBeDtGH5e58sQ80jYAiN+NcwVmy9dIq1AAFkDqDRhKcSpnTVzNG4GqUNZyf\nr5fr1frtx9sBy37XLAXSfZEJQ9AQMjqfgwGgE05+jLJqyKg/ekSuSuMRPDmhk3WhRKFVIoAoCJFL\nJRgm2jAmTapF5L5dXqaD+n+zu0ofF19fpfSxV9fJFLlOwSY6OSBIXiRZb0eEMUlA3rO5dV2Vvom6\njhHWJTfaZcU9ENT10udcsIwLHMlA9+g6VdzdnDEm0nnkDFkbA7nW3JCWNvmgn7t0nRGCWRVQGHIt\nfNROxowhWh8JQhg2HMs9qLfF+rKghV4xEVyJBB68TxFiYD4rQUDXkSOSeI6Diu4RHa4qeT1Scju8\nFZUCJa1XRmvIPpLNIjjiXHJJE/P7fS5U6Mk55155AVkROsRkDNmzxKVWjg9u6uv18nIPA2lb/eL1\nMu6uNu3wb2RWcSB1eljgRLnT0TnP0Vt7T+9j+r3kGTfrdLXPWA4y/fubv9B5kBJLlgFaS14ieKc8\nbXFkhHC9CCLE2fVtlb6J+tbYZJLUILL0kIIPIfHAuLGae6+yGGT8D7jdkqALMn4/4O7vtwtyghbf\nf0lb/127k9ic+p5V6P84JT9d3MlpkMwQDsxZAX1Fai25kg9L5FnQN63K7N7CwW+X8Yx+uD1QO7Sb\nxa9/v8LFr4jvFvz54pNH+2bnNzvianfUSGfjyQtg2RoO9NdFTy+ofUnteSWGvP4HokZH29bxNJ7Q\nr/0cpSZ8yzJ5YsByc6j0VApnmKipqI6cYakiGEUecir+IbDgVA4h5wwJelAdLYCEKIyJWYKi3TIe\nCMNDIFDKcxqG7TdNxvODp7nwBN/f7A9OxO4IOKByQltHKEcAqWrCg5mIA01oAjNLc29rlb4uR2pM\niclRUtNjLNdMgdcqXS3Z12sD+/wB+9rDr5xjIseWc/J3IXpnAZjjlpU0EQ9qtvKPKl0N/Hr1e1zu\nbdYPPmz3B/qX9XrVfphvuxb0WAspJukCAyGTQ2FtFiYzknECuwOcery0fpW4BnZ9S8duZGL/NhGr\n9VuCFW/9Ds8+vfmcPBkg55hmu+6dPIFI2T2ajhAZG8YCQ7wsK12XTi5K/vG3JX44QjmNnFWsblPS\nIFE/k+ZZXyz/F9PiXz5D7ulcmFfh3KakgQvfX1xgWtJhXHyLSAYwvut3IXL2ynKTwCGHjNFKnzS3\nJgbkZDTsU3AhqjS2SA76tPe59q5Yd1TQWpcC14ZcF3CEPDihMUjW6uxU4nOXYVTJmx4VNIqW0iIa\nEwjjKhs0z46ZECxnyZlmR+PeJivGPSaXHBOSNhqD4I7TxjOlwCYcjpP8dHWBm8IAAm/vr9pR7u13\n0oojc6CCMRkEMg/RumCjRJ1VkEPxwMfTDlXiGoT/xeX2A/GJxP/H9QYXv5z7y8VfxtSrPGS2eMas\nIIogBrn0mLI/TNN0gT8ojDNCcxffEslXK3/2+svmd4k6JG1EVNbJknPjySeWUJskGLNKiOFGikLA\nXtJf/fXKjzN8Ywsr593IlrrPKaESK5zkklSVzBKkMcWyKGmCdo5zJYdzSq9GF/DdLO1QBqISEp0J\nQLrZJSNyCPTMHJxTs1UwVelqUC2/4O8T6t6VD9YW0QfNwAXnS61mDAJYlC7iEGceu+ytSuJjxC8j\nkyZLo0zKQ2GEWfTsLZomnsmkvIreZ6nQAobovAHDpAWtUsyhGVXcVt15g3hW3v9suyyKe0xDXYv/\n26f8MyMlpqx3OkMi5Y/EQZ0s9zEx/UA+6NUK446AzuLlchOvlrvFm8MLrTf9Z69a+jr/2auSeMKz\nV63znvcYVsmbeCJbKjdHLqmDDoggo4kauGIuecOjE87F6LLyg5J/lOrPe4KVaG/Q6JQNZ6DIv+Q6\noSslN8RQzocKHh9b9qskHlP2x2up+RlUJfExDLOzMWtRCsFNs2E+eWLxFlET9YBh7Pez9353/qE0\nxfaKE7JkQEjOrQ8ghbIiMYkWLfk+FqUePPr/uV5flKP/zdIT7/qgdxSZ3sBGUjEZQiKdo5JlLJIl\nCcyI2XJYVbqOKbxjgNY8xe8t+K+aotpjpPXlJJR0L+rPTCBnFMhbtAT/RQwSstGoskvOc/kkanir\nNB4hU1Htk34o+/zmKmxxUgVZtXx4Zr1bpW+iCtaME6OVcco5MEI7xTSHiISDs7RxmPVHK58eX0r1\nBE5ES7nX1BNhtUkpES5WtO2ckfryLnIMLmo6idjbttrS69KxbEtZeQ+1nofghadlMrAQvcIoQGEJ\nWJPNb68mv9MBTa+bHCNKI0CMxiuWE/e0dcRzZ9sbcu6cVKUzNx7AWQnCZXItNSNHUhAYQcBeJhCA\nYTwyT96NBmGSjSR5OulsM0lI6u2x9oZQgYvJEHnALb07T9LaDE6R+mW9vOUSUlY6qiJgnqVAznVK\nKvuI2YDG3r5ox4NDQjGBvLukDBkeSSiPZFdkwZ38ozpXTlqqtyhyMFr/YvUWw8Yv4+dY/ZwpnAeJ\nakA1PxL0RiLmEPr//f0G97i6O/j/2UlIUoTsghB0xua2oMNETTSbP/hwpr4++3G9zbg7e0FbsMxL\n3JwRE3GzvCB70e3OlGkHimfnrSV1Sh6nNFYm8ri45tL7YXfmBj59s74ik3yDkA4kTy4U4YHAOND5\nJdvgXVApR6NYisy2tbGewrOp0tUg9L264B4OAIsxONJvhlBr0NoLybg0WpBa8k4+iZlYVRqPgFVk\nhKCMoqcEcjeN8oJcrdJUoiL9m3uxypcpINbaFMj+C9trliQXJRvqMXEDhJ6t8EFyY3OUSCerd7gI\nQcBo6KU9mEBWMwatnCrpxYTGcDEcdLw2S5LM0tdIp7VM5euPpVWDH0+gxKZK44niEYYWN9yh1YCg\nsiQI5Yrbz7OMMs02t6BKVgM7yMjvcHlJ7hb9HraHIG5jByCIXtrBhCEonHWZYlNKnjQ5mCGkPBSw\neTxgUyVuhK4/1Kj0VvM5KVBnEUltGGBGeKmUJydEM0FuD2mPNjYd7YCNpK5FnHATz8uQmcVuvfhm\ng/6iFwJWx0vNm9lqmX41saanpaaqS43SGuT/etIcZHK0zI7FRAYWonHCBDZc2TO5OutOhd4+Yn9Q\nPhf+3RDGeTwNcY+YBkn/BrfLt5eFH9cqdLsgNfrLBxL7gpbHuT/3tshlhwSvZIxWgAzOqmgJnMbS\nVI5xMJr46Na4SmMDFw+tV+VZN3ope/wMk70m8U3G5TJrJNDJsai4dmQSpZzPz6jR1cCjr1f+8t3i\nu19+/GHxmijpYU81ODsTe6p0NbBnWuD4tiJ4/3F3vr4827/zZlaVdJuSY+LakUO4Z224bhkRPr3t\n+vM80EG7F9ZXu0NV5b6j7EZlx/TwlvdIJtdqUglzl+oM0zQxumUdF5wjN9mRayuEY15lcqFLs7XQ\nqXm8VOVsdJmvqGOCgB4kKKCX9pr5xHgZExqz4MOh4JfrhIeJiu2u0hh+zONItmxTTf/0cKY6p6B/\nWvCnzOKzo0S/7tJ1hGBXy2ycjmXBpJBUtlIToMfSf1T64WVkwZAjp3tjaApCcIGDoFMDUQifI4GZ\nGLSwJQtmp4bmWHRCgvEqst781oOtFT2b09Ci1LEsWnpB8rwwgaBNsVbJhNkHExAUQm/CMJeIhkgB\nI+kyqwThTEcqTEgRrCbFVku9f2pSJAD1cTXCqt3QIOXLM3ABwEHyIjdpslMgyvuEtPhyn23D4tv1\n5qp/AHI1GTpzCqslWTtpAnJDE3+XseZlVoiJIJQhXxM0vYi22fMQDagUh6d8TB0HcHOuhS4KlfsY\nPALY5EoE2kJgwpYysDy4s48zUrJKWZPxvrws5U/EK/+5Lq0w7Mt31/WN/SGNatRp/mLdKonH9MPu\ny7jwCbLMGSL5PRxKAbtwgTFkjDnzJDIwVRqbYsS42SNFErcJ+arafL75xalK4jHF6R5m1T64CKQx\nGSfVKaLF0rqJUpsAmAYD6I+eVa7SeASgLbOInPvgXRl0DMppQ+YjGR8jJKeHOyn3Me5f/cdtyWNc\na8fOmNJgf9ecoaWHGs5OkTmttrHO5PDWyGpgx/hm2/p9fLMG2x64IHB6fO2LmDX3Ztxb45q4YyxV\nvd6tOh1RPL87iqs3IRwRycck5I2eLKonbxPIlKJXiWVy3hv1xKkSwjXqGk7JDR51DMO52QaeJLnK\npX6n4H8FNiSFdGahlMhoMcSqx2lPr9HVwKRR7ekPtj3NNejubu9V7W27O6bGVnXPPWuxoep8irPd\ncmFiF26tJnaPnskdW2U39/T7hirASWmTEAS3kTa3TEhV3HlneM4MwTFOP/3DHuTvcPW+C6rVHjpX\nCr1GV4PK6eLN2E6amYWypdNn2kSaSsn0MWukx1XIzySZbbX7IzpCuyvuR13pM1uksuWyoRq33sRl\nGdB8SMWv1/vrgl6eYy5VWHm5wueLf/7Lm/++Kk3Kixc/ffPz4cs33V2dtV6subs6G3rFphz6lg7w\nUwSs++JtZJXJP3EOclnPh+xVJnQEoozsA/gD3PJ6g1s6cH5iGqx6bc1MmqrlOp2mUr2pF9ZUWyZn\nPk8tLZ2TMHsA7TACs9mDp9PqgtVRy5IsK400Peep5U6xYzu1p/YAhgsDnkiF1N1ihePMbhxsvOzS\ng9VL0E/Swnl/NtDnH5ypREqGWa7F4BUIj57Geoi0BjXYXyswUHOOabm7WK++njUfcJuSBhb8uCbI\nerXCxSv60JThbtVLIp+AqFRpbGDYlHst7xEkJGpMHqyIpJ0JRmdBHrJWAX30WT2FqWBVEo+Zbbr3\n9Op1fE9Aqqo0ngyQjR9pPb88VUk8qTxJrl22DjM9CZRwTpZhEcmV2qOswggGnU6eqjQek0Ojrl+a\nLdpQpaxFceMqri9GXLTzYOu5RlYqy2Vmc3cuDtM0HcbeuyajD5nVBkoObdOkCzfuz83wJCoypICc\n/EBjnAoskg9IEFrG4Ib277EVYpXEkyrEmDidKu+1IHczh0jnynubLaEh8i78UCT8sRlUJfGYDLpZ\nAOuy9EKhCaVDCZWVOfEcQjJeZD14b/Pj3K5Vo6uBH+OHTNwkALx0ZLYNCA4uG1ukNXmdQdImySGZ\neYxCoCpZDXwpFx351erQ/NJdPM9MUmAUl8LO1o55n5CG139xebMQZvEzZtzsQ/S/+DDiDpvxJd9P\nAHZVaWzgX29x+gNWXZCrypgRxqqhkup5JmbdImpiCHVQSLt2r3rp6wnFfdTF9LNh6CplrW5qd76g\n1to08xSQGnnTYXUyqUgl2W7IwIQOKQntPGqHTCIbvonh+xKBv4q79abkRUuV1QVh459x+56QcV9q\nS6kYonNZFEglSysc4YlIiEo5QJ+HLmJ4FJtVpatBRKddD5PBspQhouOSjEEZACMZoYisORCGGHE5\n3cngcJXEY8LhP6z/fQJNB3dqiKf2FySWLAMkwZMRvFNeKxcZJOtFECFObme9azunrHV35v6Ute5O\nwexYq3ob9R+MvROLr6beijx+JMD8J7lK4klP8kAV/lNp0R9uEJh8uHVEBCWYKjU2UrtkMNvMVRH8\nkPLkvvfsg/YENrluxrGtgzumrHX32qwpa4Woy1iJqLPvVWA2W8cdAGdOARptQ0ICoeCsKsfA1Drc\nP/tY5UFTQoO1kbpPwCet0njUVEDLnj+RePddOZx04UzD6M3xWH9oDl2XDGAxCTFxok4Dk9Yb6zR4\nrtFHiWn48u5Po0BfbnDanW3aRPJTOFqhEYz3XjjSJLkMDEmcrNUTMKNVEk94SKrKbN7zUiVvuk/r\ngtPWMCPRMfDInTHOpQhcJXq4G+5v+Fx18mbv2l5t+udvVa9CmDlu1nJVw9QtaOjt6zpZ1Uz0SbsE\nmWQoVQSjtIdUCneABadyCDlnSE03R52kALdGV0v+pXMO5EP2MNPZy2QQGJdP5rrWWzRNl/KbOenm\nWvX7JWA+eCUNGVFjICTlrRZg6R/yWyP5YcMiXUJuS7/DxbeIKfj4rt+gEvNLxalMWSZwSnog3SA9\niZFlSronUdFUpbFBwv+8Xr8lBf+dv3y7vhrR/dIy7/+ppELuXkIwORVyd9hV1+49VBB7ygrYqAhQ\nEDZVRmvIPlpGjkogIOCSTt4MpYQfryi2SlyDOL9eLy/33W/EKb94vdyDlh6rVu0amMmqtXQznKr3\nvXpP7zwFBVWyTmjo7xuupI2IyjpZ2pV5IscmlUviBWNWCfEURm5VSTymI3YnsyYKJONJOAgQPAsy\ncAZWc6WZSqL1NobT6J8qcQ18+Wbj3x6iXpt1e9vzYHPKy3O8IGVfYqtP6bKyIbIaGFM+duhz+evV\nyD6l+5EEQdaXWy0NJiAsH1R24C2hH4O0dU8hZ1Al8Zhn7OZ9uaDIsfdJJiag4EFG39gYJTeROTNb\nMVyVrhOaLWRCQXCcZy/K2CEbkrMhkN7LGfPghNDHMeU1uhp48jPuZ/otXmzL1Rilgb2v0gAZc9LY\nzIIGZVXwnnkOgSvlyP9qQjsnsOxVsloQoSfWHIZs7h/SOTrM5eiVBWdMIptApETaOPRGe4dZuCG7\n/ohzxKrU9Xg946+THuL/+Xq1l9Cxdz2PDF/OaRmrxDWI6ZRQ621qJKM/xTdVSoA11gvUOgdlSCZi\nHqx0fcQBZ1XqGnj1YrfbLMPV3s8j4H7RHZer3n4499CjhtsZJ82OrpWoH6cmfWyCf97AaEv9wRSm\nC3JWbSzT6NFCmXwcPEfSHckmEDoOR+s7s+ljHjuPia+S1aAPOplzZ9+jQWdzks5rB4DlzkJhNRk8\n5FyxPLdYVsmbKJYtWKvLFap2Jh8VtY29RGPeTW2542NiPsYzzDk4BTF6IFtSRvVwH10ZYFjMSn8p\nfy2fPwhzrla7ZRnq+vJ8vYw9mccHS7GiJASR0PrBQeTz3Ot0k6bpW3kztbZaXix3mM7iOcZ3zYN5\n7wS8eLCQIumUwEDI5FBYm4XJLJss2u9GGd8KOKjFD29URouVN2qVh/V7vCRlgdtt8X6vCQgCopTo\npSqCb6x1uI/rQZIZpRuq97i9zmngXR+tLU5ume//4gv1nYcpaE3Hl9zIyByEGF0gtyZZYVhpSnFD\ngbXHPFdV8qYfsZaLi7uORLUd4I9GOY69AnnsVeczuzlV+iZCm+qNoJVS1mnXXY69LWzeM9ZymdnU\n9qqGPEvXGVM+WFsyWaAZuOB8gcqR9CsjOxxxuMatL2MzfhDiE6gXqdLYYGmOOrtRkxKPkc6lJCzK\nNZb+ukzfCRVEFrLJJz3JHbk1uo6ZvRl7d8rcMakafROVdUumaKxr29Cv2HWgqgVYR6y4ulO2rrJT\nWkRjQgSrbNA8O2ZCsJwl8tdnjYdXiWs4Pj9dXeBmnzD+/vL9EQrTbnX9PBH38G4n0rSoogOtLNlW\nREiW8CWXZMVDJO8ix/Ypp5U5hV3HpDo655gTD++1ixuXYiB9ogJo7W3UUpP9yxnRMTW7Oq3S1yMX\n3X5m1/ZWL6ireKzk87/abstNJn2p2e0+G7G/ROnt5qG7vh4xGTtAz1HSr2CRTouAZDIC+cJekAcp\njRa6FP7J5talewvTwbQ5MkHqOkBGRybRkFgItMCVbe9sHH/X3JBk3Lr2ST5fjM83jZzmMGvNWY24\nBlP5ZfLEV5MmT9zRTFxCykpH8pM9eJYCKZBErqEnT8qAnn3STZW+iRa1pTxnrJFWBqISEh0dAHKs\nXTIihyBNyME51dzafKf8QArUhMrRCgPMCNLwitA5edMELBJv9qfHJ+r7ImHkdZbL/4DsD2mbaAkw\nlzhDJHhQYm3D4wYn1DmNb9Wcv36wSuIJPdDkeHCokg1RQ1LGcylFYmRlyPnl7VHgUx38Kn0TD365\npIFBUIyWA0TrokxiH7pNJXQ7HEb69RwvFy82eIgT7i+p/NOiu1mydmn9vA5MlbzpMUKWjHKJXJns\nErnpsQws4VKnkFCpzPpTU9XC3IcqTxfLUX7oyNeZE4O08LqlNnekpz4yTT0nh1py6NUCv4cz34Vj\nm/V61+xuHL4+0Bav6yP+H/5HSIEb6AAA\n','H4sIAPliLlYC/6VX3Y4dNQx+lWpvC1Ls2HHcq0rwENxVTuxIFZRFlCIQ4t35ZirB/bBn9/zMHsWJ\n/f3NXy8eSUNnmzaPeNI63HbR2to7/lMv7968rJ9e94/f/k7vKn94+319ev36/OG71y+/fq63v/35\nS73Pj5/3l8+fP77+/Pb++vtqacKdaMaSzjo5W69ZMyNn9fHyzZuXPM2bVsnEQ2z4EDm9N3xg7WWP\nix+ZLY/scupiW6OkN8o8g2Rwn1fxZdZIWhCzCZ2KoRTa+uCsshqPi0sO463T+15yCOdtWcOSW5vK\nXFdx7GdoRPLuLj5zsuzjU1Y/vtrsz9ueDcPD5KSGtD7DJroamGTsXrnvttsao0RJZUkcmug5U+/d\nxlS07HHxcSzGsHamkeDXd9Q5I040C+V75phs645jnoHjnsKJKZWkSNU5nxc/J3SSpXiRnNqzRw6a\ntlfR6HrPvNN1uQ522aXwtu/Z1qSjgB+358Ujy7lLz9OxAe0BYC1sYM/ZtHu7imvfMsdqXZdIt+3k\n6Iqg7VTttOczHyziNEe3SjlHlh6XmNiCFSbcr+JROxYGrWo46uQ4Gi5gwNTTWtPHxRXLzgveMpr4\n8ojhshdLA7R3nRtwon72UnNeeLujYQaYEtXofe/9uHhmZdnIY9REgQAaGESSTEom8vvkCqy3cUAJ\nk5FzrXNsqGiNdIz+cXHuNSpDJu+GKWocXouHLlAN7b2LFy7I9um+DBvckzZksekCRMCV520vRRUr\nKFawHD0YdZqtNZKgLOAwilOS9gymS1CNPCjGvqYSzYf15233A451rLChW3351D1NGz7Grm15y+si\nMN55Wm2RNYIPgCGWAGROeX7yFuhcXwlaT2Ez19U2BaVtCK7HVXyUQu0npI3ANeACo6beelzbyf58\n5sQBinWQbAO+JDFqMBS7FUjkdivcPKdxCjdZC8/qufCd6u6wl+DnxgLxSrgZFNTQdhlhPiYwvzaw\nlftuO/C3gxOGPknSBjTQmqsFr9Hsf6C9eC+c0l0OdBvqBrk9AmPlSk+Rq7jbIeg6Ny6FC4ZXgPgQ\nOevGGs/lFYZmtiEtUDo5a4N0ERMb6UgQIMJdHC4KO1G/tIACXquYVjGv7nPQc3k1Ziy2im1PiT3g\n66hzYV0zrN3anqCEtcC4B8IEcLigbAdsP4sYwvg8TBDDRBLrYWHklTmYuy3um87A8W+RyT8+5LVS\nfVp1SeKH/5Z5Lq3/XvigWQDPJAz2xlixAt8QWgPweNRcw85RwsB9gOaPa64J+eAgr3VkICO0nR3W\nvGEcBvTduoLAtrku1y4EvDMLCRITEjjPyfF8zBST2iJIC0Bmy30CW8gTrTRm43Wzq3sdZeg+Qiu4\nt4ZPcJwsbMXZz0++x06BcYDWKhEIoy2uJFfQtoNs9nXMHR6WxF2HgFLegYjL6MkYGW89Lj6tIYMw\n8YomiRyqfUBN7coLBH5dxbf4QaTGpQ17d0DS8bO3K2FK+vzk2iguBfGG/OQFwyQnaEtTlZnFX9t+\npfgFPysTGIwLshTuIaj6rEXzcXE01M/ETFFIlB25lA+nX4p6dN3FNwK84x6hnyvjMCQFRtuWZU2d\nfT13UTltLATT8HEw1oxSSwQUip3IK1+Lr+iAOdwrm4wBe9vaHJxDyFw2nsv5sM1jUc1rLYsIdlOD\ndl83D4DeTTUYHLIdttgYd0hQABl77bMR8Tq2+NzCIdtKx+MyKfxFt9mTlQg6DZW/isOskBywu4EQ\n64vDT2/JuE3YAlbm87bHCu1g7DSTlSA3XGXiRUffoN/L3/8Aj/DDlBYPAAA=\n');
/*!40000 ALTER TABLE `course_structures_coursestructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_offlinecomputedgrade`
--

DROP TABLE IF EXISTS `courseware_offlinecomputedgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_offlinecomputedgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `gradeset` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_offlinecomputedgrade_user_id_926078f_uniq` (`user_id`,`course_id`),
  KEY `courseware_offlinecomputedgrade_403f60f` (`user_id`),
  KEY `courseware_offlinecomputedgrade_b7271b` (`course_id`),
  KEY `courseware_offlinecomputedgrade_3216ff68` (`created`),
  KEY `courseware_offlinecomputedgrade_8aac229` (`updated`),
  CONSTRAINT `user_id_refs_id_38cf339d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_offlinecomputedgrade`
--

LOCK TABLES `courseware_offlinecomputedgrade` WRITE;
/*!40000 ALTER TABLE `courseware_offlinecomputedgrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_offlinecomputedgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_offlinecomputedgradelog`
--

DROP TABLE IF EXISTS `courseware_offlinecomputedgradelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_offlinecomputedgradelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `seconds` int(11) NOT NULL,
  `nstudents` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_offlinecomputedgradelog_b7271b` (`course_id`),
  KEY `courseware_offlinecomputedgradelog_3216ff68` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_offlinecomputedgradelog`
--

LOCK TABLES `courseware_offlinecomputedgradelog` WRITE;
/*!40000 ALTER TABLE `courseware_offlinecomputedgradelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_offlinecomputedgradelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_studentfieldoverride`
--

DROP TABLE IF EXISTS `courseware_studentfieldoverride`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_studentfieldoverride` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `student_id` int(11) NOT NULL,
  `field` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_studentfieldoverride_course_id_53a9dc2e_uniq` (`course_id`,`field`,`location`,`student_id`),
  KEY `courseware_studentfieldoverride_b7271b` (`course_id`),
  KEY `courseware_studentfieldoverride_4ab6ab22` (`location`),
  KEY `courseware_studentfieldoverride_42ff452e` (`student_id`),
  KEY `courseware_studentfieldoverride_course_id_1b67c1fc` (`course_id`,`location`,`student_id`),
  CONSTRAINT `student_id_refs_id_7b49c12b` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentfieldoverride`
--

LOCK TABLES `courseware_studentfieldoverride` WRITE;
/*!40000 ALTER TABLE `courseware_studentfieldoverride` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_studentfieldoverride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_studentmodule`
--

DROP TABLE IF EXISTS `courseware_studentmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_studentmodule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_type` varchar(32) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `student_id` int(11) NOT NULL,
  `state` longtext,
  `grade` double DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `max_grade` double,
  `done` varchar(8) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_studentmodule_student_id_5eda921b_uniq` (`student_id`,`module_id`,`course_id`),
  KEY `courseware_studentmodule_42ff452e` (`student_id`),
  KEY `courseware_studentmodule_3216ff68` (`created`),
  KEY `courseware_studentmodule_6dff86b5` (`grade`),
  KEY `courseware_studentmodule_5436e97a` (`modified`),
  KEY `courseware_studentmodule_2d8768ff` (`module_type`),
  KEY `courseware_studentmodule_ac126a2` (`module_id`),
  KEY `courseware_studentmodule_1923c03f` (`done`),
  KEY `courseware_studentmodule_b7271b` (`course_id`),
  CONSTRAINT `student_id_refs_id_79ba2570` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentmodule`
--

LOCK TABLES `courseware_studentmodule` WRITE;
/*!40000 ALTER TABLE `courseware_studentmodule` DISABLE KEYS */;
INSERT INTO `courseware_studentmodule` VALUES (1,'course','block-v1:edX+DemoX+Demo_Course+type@course+block@course',7,'{\"position\": 4}',NULL,'2015-10-26 17:17:23','2015-10-26 17:19:34',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(2,'chapter','block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b',7,'{\"position\": 1}',NULL,'2015-10-26 17:17:23','2015-10-26 17:17:23',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(3,'sequential','block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction',7,'{\"position\": 1}',NULL,'2015-10-26 17:17:24','2015-10-26 17:17:24',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(4,'chapter','block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations',7,'{\"position\": 1}',NULL,'2015-10-26 17:17:41','2015-10-26 17:17:41',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(5,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@9cee77a606ea4c1aa5440e0ea5d0f618',7,'{\"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"9cee77a606ea4c1aa5440e0ea5d0f618_2_1\": [\"choice_3\"]}, \"correct_map\": {\"9cee77a606ea4c1aa5440e0ea5d0f618_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"msg\": \"\", \"answervariable\": null, \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"9cee77a606ea4c1aa5440e0ea5d0f618_2_1\": {}}, \"last_submission_time\": \"2015-10-26T17:18:49Z\"}',1,'2015-10-26 17:17:42','2015-10-26 17:18:49',1,'na','course-v1:edX+DemoX+Demo_Course'),(6,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@932e6f2ce8274072a355a94560216d1a',7,'{\"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"932e6f2ce8274072a355a94560216d1a_2_1\": \"choice_1\"}, \"correct_map\": {\"932e6f2ce8274072a355a94560216d1a_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"msg\": \"\", \"answervariable\": null, \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"932e6f2ce8274072a355a94560216d1a_2_1\": {}}, \"last_submission_time\": \"2015-10-26T17:19:05Z\"}',0,'2015-10-26 17:17:42','2015-10-26 17:19:05',1,'na','course-v1:edX+DemoX+Demo_Course'),(7,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@303034da25524878a2e66fb57c91cf85',7,'{\"correct_map\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"msg\": \"\", \"answervariable\": null, \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {}}, \"last_submission_time\": \"2015-10-26T17:19:13Z\", \"attempts\": 2, \"seed\": 1, \"done\": true, \"student_answers\": {\"303034da25524878a2e66fb57c91cf85_2_1\": \"choice_2\"}}',1,'2015-10-26 17:17:42','2015-10-26 17:19:13',1,'na','course-v1:edX+DemoX+Demo_Course'),(8,'sequential','block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5',7,'{\"position\": 7}',NULL,'2015-10-26 17:17:42','2015-10-26 17:18:54',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(9,'video','block-v1:edX+DemoX+Demo_Course+type@video+block@0b9e39477cf34507a7a48f74be381fdd',7,'{\"saved_video_position\": \"00:02:45\"}',NULL,'2015-10-26 17:17:42','2015-10-26 17:17:42',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(10,'video','block-v1:edX+DemoX+Demo_Course+type@video+block@7e9b434e6de3435ab99bd3fb25bde807',7,'{\"saved_video_position\": \"00:00:00\"}',NULL,'2015-10-26 17:17:49','2015-10-26 17:17:49',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(11,'video','block-v1:edX+DemoX+Demo_Course+type@video+block@5c90cffecd9b48b188cbfea176bf7fe9',7,'{\"saved_video_position\": \"00:05:10\"}',NULL,'2015-10-26 17:17:58','2015-10-26 17:17:58',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(12,'video','block-v1:edX+DemoX+Demo_Course+type@video+block@636541acbae448d98ab484b028c9a7f6',7,'{\"saved_video_position\": \"00:00:44\"}',NULL,'2015-10-26 17:18:34','2015-10-26 17:18:34',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(13,'chapter','block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions',7,'{\"position\": 3}',NULL,'2015-10-26 17:19:24','2015-10-26 17:19:29',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(14,'sequential','block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations',7,'{\"position\": 1}',NULL,'2015-10-26 17:19:24','2015-10-26 17:19:24',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(15,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_editmolB',7,'{\"seed\": 1, \"input_state\": {\"700x_editmolB_2_1\": {}}}',NULL,'2015-10-26 17:19:26','2015-10-26 17:19:26',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(16,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@python_grader',7,'{\"seed\": 1, \"input_state\": {\"python_grader_2_1\": {}}}',NULL,'2015-10-26 17:19:26','2015-10-26 17:19:26',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(17,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@free_form_simulation',7,'{\"seed\": 1, \"input_state\": {\"free_form_simulation_2_1\": {}}}',NULL,'2015-10-26 17:19:26','2015-10-26 17:19:26',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(18,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@logic_gate_problem',7,'{\"seed\": 1, \"input_state\": {\"logic_gate_problem_2_1\": {}}}',NULL,'2015-10-26 17:19:26','2015-10-26 17:19:26',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(19,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_proteinmake',7,'{\"seed\": 1, \"input_state\": {\"700x_proteinmake_2_1\": {}}}',NULL,'2015-10-26 17:19:26','2015-10-26 17:19:26',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(20,'sequential','block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations',7,'{\"position\": 1}',NULL,'2015-10-26 17:19:26','2015-10-26 17:19:26',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(21,'sequential','block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e',7,'{\"position\": 1}',NULL,'2015-10-26 17:19:29','2015-10-26 17:19:29',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(22,'chapter','block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration',7,'{\"position\": 2}',NULL,'2015-10-26 17:19:34','2015-10-26 17:19:34',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(23,'sequential','block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855',7,'{\"position\": 1}',NULL,'2015-10-26 17:19:34','2015-10-26 17:19:34',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(24,'course','block-v1:edX+DemoX+Demo_Course+type@course+block@course',9,'{\"position\": 2}',NULL,'2015-10-27 11:55:11','2015-10-27 11:57:36',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(25,'chapter','block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b',9,'{\"position\": 1}',NULL,'2015-10-27 11:55:12','2015-10-27 11:55:12',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(26,'sequential','block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction',9,'{\"position\": 1}',NULL,'2015-10-27 11:55:12','2015-10-27 11:55:12',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(27,'chapter','block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations',9,'{\"position\": 2}',NULL,'2015-10-27 11:57:36','2015-10-27 11:57:42',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(28,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@9cee77a606ea4c1aa5440e0ea5d0f618',9,'{\"seed\": 1, \"input_state\": {\"9cee77a606ea4c1aa5440e0ea5d0f618_2_1\": {}}}',NULL,'2015-10-27 11:57:37','2015-10-27 11:57:37',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(29,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@932e6f2ce8274072a355a94560216d1a',9,'{\"seed\": 1, \"input_state\": {\"932e6f2ce8274072a355a94560216d1a_2_1\": {}}}',NULL,'2015-10-27 11:57:37','2015-10-27 11:57:37',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(30,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@303034da25524878a2e66fb57c91cf85',9,'{\"seed\": 1, \"input_state\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {}}}',NULL,'2015-10-27 11:57:37','2015-10-27 11:57:37',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(31,'sequential','block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5',9,'{\"position\": 1}',NULL,'2015-10-27 11:57:37','2015-10-27 11:57:37',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(32,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@c554538a57664fac80783b99d9d6da7c',9,'{\"seed\": 1, \"input_state\": {\"c554538a57664fac80783b99d9d6da7c_2_1\": {}}}',NULL,'2015-10-27 11:57:42','2015-10-27 11:57:42',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(33,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@d2e35c1d294b4ba0b3b1048615605d2a',9,'{\"seed\": 1, \"input_state\": {\"d2e35c1d294b4ba0b3b1048615605d2a_2_1\": {}}}',NULL,'2015-10-27 11:57:42','2015-10-27 11:57:42',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(34,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@a0effb954cca4759994f1ac9e9434bf4',9,'{\"seed\": 1, \"input_state\": {\"a0effb954cca4759994f1ac9e9434bf4_4_1\": {}, \"a0effb954cca4759994f1ac9e9434bf4_2_1\": {}, \"a0effb954cca4759994f1ac9e9434bf4_3_1\": {}}}',NULL,'2015-10-27 11:57:42','2015-10-27 11:57:42',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(35,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@Sample_Algebraic_Problem',9,'{\"seed\": 1, \"input_state\": {\"Sample_Algebraic_Problem_2_1\": {}}}',NULL,'2015-10-27 11:57:43','2015-10-27 11:57:43',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(36,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@Sample_ChemFormula_Problem',9,'{\"seed\": 1, \"input_state\": {\"Sample_ChemFormula_Problem_2_1\": {}}}',NULL,'2015-10-27 11:57:43','2015-10-27 11:57:43',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(37,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@75f9562c77bc4858b61f907bb810d974',9,'{\"seed\": 1, \"input_state\": {\"75f9562c77bc4858b61f907bb810d974_2_1\": {}, \"75f9562c77bc4858b61f907bb810d974_3_1\": {}, \"75f9562c77bc4858b61f907bb810d974_4_1\": {}}}',NULL,'2015-10-27 11:57:43','2015-10-27 11:57:43',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(38,'problem','block-v1:edX+DemoX+Demo_Course+type@problem+block@0d759dee4f9d459c8956136dbde55f02',9,'{\"seed\": 1, \"input_state\": {\"0d759dee4f9d459c8956136dbde55f02_2_1\": {}}}',NULL,'2015-10-27 11:57:43','2015-10-27 11:57:43',NULL,'na','course-v1:edX+DemoX+Demo_Course'),(39,'sequential','block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions',9,'{\"position\": 7}',NULL,'2015-10-27 11:57:43','2015-10-27 11:57:56',NULL,'na','course-v1:edX+DemoX+Demo_Course');
/*!40000 ALTER TABLE `courseware_studentmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_studentmodulehistory`
--

DROP TABLE IF EXISTS `courseware_studentmodulehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_studentmodulehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_module_id` int(11) NOT NULL,
  `version` varchar(255),
  `created` datetime NOT NULL,
  `state` longtext,
  `grade` double DEFAULT NULL,
  `max_grade` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_studentmodulehistory_5656f5fe` (`student_module_id`),
  KEY `courseware_studentmodulehistory_659105e4` (`version`),
  KEY `courseware_studentmodulehistory_3216ff68` (`created`),
  CONSTRAINT `student_module_id_refs_id_1b79c90c` FOREIGN KEY (`student_module_id`) REFERENCES `courseware_studentmodule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentmodulehistory`
--

LOCK TABLES `courseware_studentmodulehistory` WRITE;
/*!40000 ALTER TABLE `courseware_studentmodulehistory` DISABLE KEYS */;
INSERT INTO `courseware_studentmodulehistory` VALUES (1,5,NULL,'2015-10-26 17:17:42','{\"seed\": 1, \"input_state\": {\"9cee77a606ea4c1aa5440e0ea5d0f618_2_1\": {}}}',NULL,NULL),(2,6,NULL,'2015-10-26 17:17:42','{\"seed\": 1, \"input_state\": {\"932e6f2ce8274072a355a94560216d1a_2_1\": {}}}',NULL,NULL),(3,7,NULL,'2015-10-26 17:17:42','{\"seed\": 1, \"input_state\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {}}}',NULL,NULL),(4,5,NULL,'2015-10-26 17:18:49','{\"seed\": 1, \"input_state\": {\"9cee77a606ea4c1aa5440e0ea5d0f618_2_1\": {}}}',1,1),(5,5,NULL,'2015-10-26 17:18:49','{\"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"9cee77a606ea4c1aa5440e0ea5d0f618_2_1\": [\"choice_3\"]}, \"correct_map\": {\"9cee77a606ea4c1aa5440e0ea5d0f618_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"msg\": \"\", \"answervariable\": null, \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"9cee77a606ea4c1aa5440e0ea5d0f618_2_1\": {}}, \"last_submission_time\": \"2015-10-26T17:18:49Z\"}',1,1),(6,6,NULL,'2015-10-26 17:19:05','{\"seed\": 1, \"input_state\": {\"932e6f2ce8274072a355a94560216d1a_2_1\": {}}}',0,1),(7,6,NULL,'2015-10-26 17:19:05','{\"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"932e6f2ce8274072a355a94560216d1a_2_1\": \"choice_1\"}, \"correct_map\": {\"932e6f2ce8274072a355a94560216d1a_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"msg\": \"\", \"answervariable\": null, \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"932e6f2ce8274072a355a94560216d1a_2_1\": {}}, \"last_submission_time\": \"2015-10-26T17:19:05Z\"}',0,1),(8,7,NULL,'2015-10-26 17:19:11','{\"seed\": 1, \"input_state\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {}}}',0,1),(9,7,NULL,'2015-10-26 17:19:11','{\"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"303034da25524878a2e66fb57c91cf85_2_1\": \"choice_0\"}, \"correct_map\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"msg\": \"\", \"answervariable\": null, \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {}}, \"last_submission_time\": \"2015-10-26T17:19:11Z\"}',0,1),(10,7,NULL,'2015-10-26 17:19:13','{\"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"303034da25524878a2e66fb57c91cf85_2_1\": \"choice_0\"}, \"correct_map\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"msg\": \"\", \"answervariable\": null, \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {}}, \"last_submission_time\": \"2015-10-26T17:19:11Z\"}',1,1),(11,7,NULL,'2015-10-26 17:19:13','{\"correct_map\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"msg\": \"\", \"answervariable\": null, \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {}}, \"last_submission_time\": \"2015-10-26T17:19:13Z\", \"attempts\": 2, \"seed\": 1, \"done\": true, \"student_answers\": {\"303034da25524878a2e66fb57c91cf85_2_1\": \"choice_2\"}}',1,1),(12,15,NULL,'2015-10-26 17:19:26','{\"seed\": 1, \"input_state\": {\"700x_editmolB_2_1\": {}}}',NULL,NULL),(13,16,NULL,'2015-10-26 17:19:26','{\"seed\": 1, \"input_state\": {\"python_grader_2_1\": {}}}',NULL,NULL),(14,17,NULL,'2015-10-26 17:19:26','{\"seed\": 1, \"input_state\": {\"free_form_simulation_2_1\": {}}}',NULL,NULL),(15,18,NULL,'2015-10-26 17:19:26','{\"seed\": 1, \"input_state\": {\"logic_gate_problem_2_1\": {}}}',NULL,NULL),(16,19,NULL,'2015-10-26 17:19:26','{\"seed\": 1, \"input_state\": {\"700x_proteinmake_2_1\": {}}}',NULL,NULL),(17,28,NULL,'2015-10-27 11:57:37','{\"seed\": 1, \"input_state\": {\"9cee77a606ea4c1aa5440e0ea5d0f618_2_1\": {}}}',NULL,NULL),(18,29,NULL,'2015-10-27 11:57:37','{\"seed\": 1, \"input_state\": {\"932e6f2ce8274072a355a94560216d1a_2_1\": {}}}',NULL,NULL),(19,30,NULL,'2015-10-27 11:57:37','{\"seed\": 1, \"input_state\": {\"303034da25524878a2e66fb57c91cf85_2_1\": {}}}',NULL,NULL),(20,32,NULL,'2015-10-27 11:57:42','{\"seed\": 1, \"input_state\": {\"c554538a57664fac80783b99d9d6da7c_2_1\": {}}}',NULL,NULL),(21,33,NULL,'2015-10-27 11:57:42','{\"seed\": 1, \"input_state\": {\"d2e35c1d294b4ba0b3b1048615605d2a_2_1\": {}}}',NULL,NULL),(22,34,NULL,'2015-10-27 11:57:42','{\"seed\": 1, \"input_state\": {\"a0effb954cca4759994f1ac9e9434bf4_4_1\": {}, \"a0effb954cca4759994f1ac9e9434bf4_2_1\": {}, \"a0effb954cca4759994f1ac9e9434bf4_3_1\": {}}}',NULL,NULL),(23,35,NULL,'2015-10-27 11:57:43','{\"seed\": 1, \"input_state\": {\"Sample_Algebraic_Problem_2_1\": {}}}',NULL,NULL),(24,36,NULL,'2015-10-27 11:57:43','{\"seed\": 1, \"input_state\": {\"Sample_ChemFormula_Problem_2_1\": {}}}',NULL,NULL),(25,37,NULL,'2015-10-27 11:57:43','{\"seed\": 1, \"input_state\": {\"75f9562c77bc4858b61f907bb810d974_2_1\": {}, \"75f9562c77bc4858b61f907bb810d974_3_1\": {}, \"75f9562c77bc4858b61f907bb810d974_4_1\": {}}}',NULL,NULL),(26,38,NULL,'2015-10-27 11:57:43','{\"seed\": 1, \"input_state\": {\"0d759dee4f9d459c8956136dbde55f02_2_1\": {}}}',NULL,NULL);
/*!40000 ALTER TABLE `courseware_studentmodulehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_xmodulestudentinfofield`
--

DROP TABLE IF EXISTS `courseware_xmodulestudentinfofield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_xmodulestudentinfofield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `student_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_xmodulestudentinfofield_student_id_3b624f99_uniq` (`student_id`,`field_name`),
  KEY `courseware_xmodulestudentinfofield_7e1499` (`field_name`),
  KEY `courseware_xmodulestudentinfofield_42ff452e` (`student_id`),
  KEY `courseware_xmodulestudentinfofield_3216ff68` (`created`),
  KEY `courseware_xmodulestudentinfofield_5436e97a` (`modified`),
  CONSTRAINT `student_id_refs_id_40304198` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmodulestudentinfofield`
--

LOCK TABLES `courseware_xmodulestudentinfofield` WRITE;
/*!40000 ALTER TABLE `courseware_xmodulestudentinfofield` DISABLE KEYS */;
INSERT INTO `courseware_xmodulestudentinfofield` VALUES (1,'youtube_is_available','true',7,'2015-10-26 17:17:26','2015-10-26 17:18:16'),(2,'youtube_is_available','true',9,'2015-10-27 11:55:15','2015-10-27 11:57:32');
/*!40000 ALTER TABLE `courseware_xmodulestudentinfofield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_xmodulestudentprefsfield`
--

DROP TABLE IF EXISTS `courseware_xmodulestudentprefsfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_xmodulestudentprefsfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(64) NOT NULL,
  `module_type` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `student_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_xmodulestudentprefsfield_student_id_67485bf9_uniq` (`student_id`,`module_type`,`field_name`),
  KEY `courseware_xmodulestudentprefsfield_7e1499` (`field_name`),
  KEY `courseware_xmodulestudentprefsfield_2d8768ff` (`module_type`),
  KEY `courseware_xmodulestudentprefsfield_42ff452e` (`student_id`),
  KEY `courseware_xmodulestudentprefsfield_3216ff68` (`created`),
  KEY `courseware_xmodulestudentprefsfield_5436e97a` (`modified`),
  CONSTRAINT `student_id_refs_id_28466bf5` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmodulestudentprefsfield`
--

LOCK TABLES `courseware_xmodulestudentprefsfield` WRITE;
/*!40000 ALTER TABLE `courseware_xmodulestudentprefsfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_xmodulestudentprefsfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_xmoduleuserstatesummaryfield`
--

DROP TABLE IF EXISTS `courseware_xmoduleuserstatesummaryfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_xmoduleuserstatesummaryfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(64) NOT NULL,
  `usage_id` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_xmodulecontentfield_definition_id_70cf2f4a_uniq` (`usage_id`,`field_name`),
  KEY `courseware_xmodulecontentfield_7e1499` (`field_name`),
  KEY `courseware_xmodulecontentfield_1d304ded` (`usage_id`),
  KEY `courseware_xmodulecontentfield_3216ff68` (`created`),
  KEY `courseware_xmodulecontentfield_5436e97a` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmoduleuserstatesummaryfield`
--

LOCK TABLES `courseware_xmoduleuserstatesummaryfield` WRITE;
/*!40000 ALTER TABLE `courseware_xmoduleuserstatesummaryfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_xmoduleuserstatesummaryfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditcourse`
--

DROP TABLE IF EXISTS `credit_creditcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditcourse`
--

LOCK TABLES `credit_creditcourse` WRITE;
/*!40000 ALTER TABLE `credit_creditcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_crediteligibility`
--

DROP TABLE IF EXISTS `credit_crediteligibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_crediteligibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `username` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `deadline` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_crediteligibility_username_6677e83e_uniq` (`username`,`course_id`),
  KEY `credit_crediteligibility_88b7ca3` (`username`),
  KEY `credit_crediteligibility_b7271b` (`course_id`),
  CONSTRAINT `course_id_refs_id_1121ea30` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_crediteligibility`
--

LOCK TABLES `credit_crediteligibility` WRITE;
/*!40000 ALTER TABLE `credit_crediteligibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_crediteligibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditprovider`
--

DROP TABLE IF EXISTS `credit_creditprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditprovider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `provider_id` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `provider_url` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `enable_integration` tinyint(1) NOT NULL,
  `provider_status_url` varchar(200) NOT NULL,
  `fulfillment_instructions` longtext,
  `provider_description` longtext NOT NULL,
  `eligibility_email_message` longtext NOT NULL,
  `receipt_email_message` longtext NOT NULL,
  `thumbnail_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_id` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditprovider`
--

LOCK TABLES `credit_creditprovider` WRITE;
/*!40000 ALTER TABLE `credit_creditprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditrequest`
--

DROP TABLE IF EXISTS `credit_creditrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `uuid` varchar(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `parameters` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `credit_creditrequest_username_4f2983ff_uniq` (`username`,`course_id`,`provider_id`),
  KEY `credit_creditrequest_88b7ca3` (`username`),
  KEY `credit_creditrequest_b7271b` (`course_id`),
  KEY `credit_creditrequest_261a2069` (`provider_id`),
  CONSTRAINT `course_id_refs_id_695439f0` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`),
  CONSTRAINT `provider_id_refs_id_209501fa` FOREIGN KEY (`provider_id`) REFERENCES `credit_creditprovider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditrequest`
--

LOCK TABLES `credit_creditrequest` WRITE;
/*!40000 ALTER TABLE `credit_creditrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditrequirement`
--

DROP TABLE IF EXISTS `credit_creditrequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditrequirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `criteria` longtext NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_creditrequirement_namespace_3b3e69b8_uniq` (`namespace`,`name`,`course_id`),
  KEY `credit_creditrequirement_b7271b` (`course_id`),
  CONSTRAINT `course_id_refs_id_5be83ade` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditrequirement`
--

LOCK TABLES `credit_creditrequirement` WRITE;
/*!40000 ALTER TABLE `credit_creditrequirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditrequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditrequirementstatus`
--

DROP TABLE IF EXISTS `credit_creditrequirementstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditrequirementstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `username` varchar(255) NOT NULL,
  `requirement_id` int(11) NOT NULL,
  `status` varchar(32) NOT NULL,
  `reason` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_creditrequirementstatus_username_408861c5_uniq` (`username`,`requirement_id`),
  KEY `credit_creditrequirementstatus_88b7ca3` (`username`),
  KEY `credit_creditrequirementstatus_6657a0ce` (`requirement_id`),
  CONSTRAINT `requirement_id_refs_id_1f08312b` FOREIGN KEY (`requirement_id`) REFERENCES `credit_creditrequirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditrequirementstatus`
--

LOCK TABLES `credit_creditrequirementstatus` WRITE;
/*!40000 ALTER TABLE `credit_creditrequirementstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditrequirementstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_historicalcreditrequest`
--

DROP TABLE IF EXISTS `credit_historicalcreditrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_historicalcreditrequest` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `uuid` varchar(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `parameters` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `credit_historicalcreditrequest_4a5fc416` (`id`),
  KEY `credit_historicalcreditrequest_2bbc74ae` (`uuid`),
  KEY `credit_historicalcreditrequest_88b7ca3` (`username`),
  KEY `credit_historicalcreditrequest_b7271b` (`course_id`),
  KEY `credit_historicalcreditrequest_261a2069` (`provider_id`),
  KEY `credit_historicalcreditrequest_1e5f15d6` (`history_user_id`),
  CONSTRAINT `course_id_refs_id_4fcbf662` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`),
  CONSTRAINT `history_user_id_refs_id_3ef1516a` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `provider_id_refs_id_72d984b8` FOREIGN KEY (`provider_id`) REFERENCES `credit_creditprovider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_historicalcreditrequest`
--

LOCK TABLES `credit_historicalcreditrequest` WRITE;
/*!40000 ALTER TABLE `credit_historicalcreditrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_historicalcreditrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_historicalcreditrequirementstatus`
--

DROP TABLE IF EXISTS `credit_historicalcreditrequirementstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_historicalcreditrequirementstatus` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `username` varchar(255) NOT NULL,
  `status` varchar(32) NOT NULL,
  `reason` longtext NOT NULL,
  `requirement_id` int(11) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `credit_historicalcreditrequirementstatus_4a5fc416` (`id`),
  KEY `credit_historicalcreditrequirementstatus_88b7ca3` (`username`),
  KEY `credit_historicalcreditrequirementstatus_6657a0ce` (`requirement_id`),
  KEY `credit_historicalcreditrequirementstatus_1e5f15d6` (`history_user_id`),
  CONSTRAINT `history_user_id_refs_id_6cbd064c` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `requirement_id_refs_id_4b64ec59` FOREIGN KEY (`requirement_id`) REFERENCES `credit_creditrequirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_historicalcreditrequirementstatus`
--

LOCK TABLES `credit_historicalcreditrequirementstatus` WRITE;
/*!40000 ALTER TABLE `credit_historicalcreditrequirementstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_historicalcreditrequirementstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dark_lang_darklangconfig`
--

DROP TABLE IF EXISTS `dark_lang_darklangconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dark_lang_darklangconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `released_languages` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dark_lang_darklangconfig_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_5c5fe834` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dark_lang_darklangconfig`
--

LOCK TABLES `dark_lang_darklangconfig` WRITE;
/*!40000 ALTER TABLE `dark_lang_darklangconfig` DISABLE KEYS */;
INSERT INTO `dark_lang_darklangconfig` VALUES (1,'2015-10-26 12:31:48',NULL,1,'');
/*!40000 ALTER TABLE `dark_lang_darklangconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-10-26 16:28:31',5,3,'6','test',2,'Changed password and email.'),(2,'2015-10-26 16:34:01',5,3,'7','abhilashks',2,'Changed password and is_active.'),(3,'2015-10-26 16:48:14',8,3,'5','admin',2,'Changed password, is_active, is_staff and is_superuser.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_permission`
--

DROP TABLE IF EXISTS `django_comment_client_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_permission` (
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_permission`
--

LOCK TABLES `django_comment_client_permission` WRITE;
/*!40000 ALTER TABLE `django_comment_client_permission` DISABLE KEYS */;
INSERT INTO `django_comment_client_permission` VALUES ('create_comment'),('create_sub_comment'),('create_thread'),('delete_comment'),('delete_thread'),('edit_content'),('endorse_comment'),('follow_commentable'),('follow_thread'),('manage_moderator'),('openclose_thread'),('see_all_cohorts'),('unfollow_commentable'),('unfollow_thread'),('unvote'),('update_comment'),('update_thread'),('vote');
/*!40000 ALTER TABLE `django_comment_client_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_permission_roles`
--

DROP TABLE IF EXISTS `django_comment_client_permission_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_permission_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_comment_client_permission_ro_permission_id_76bda6ae_uniq` (`permission_id`,`role_id`),
  KEY `django_comment_client_permission_roles_1e014c8f` (`permission_id`),
  KEY `django_comment_client_permission_roles_40f80fc0` (`role_id`),
  CONSTRAINT `permission_id_refs_name_49cfd2d9` FOREIGN KEY (`permission_id`) REFERENCES `django_comment_client_permission` (`name`),
  CONSTRAINT `role_id_refs_id_3e4a37ac` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_permission_roles`
--

LOCK TABLES `django_comment_client_permission_roles` WRITE;
/*!40000 ALTER TABLE `django_comment_client_permission_roles` DISABLE KEYS */;
INSERT INTO `django_comment_client_permission_roles` VALUES (47,'create_comment',1),(29,'create_comment',2),(30,'create_comment',3),(11,'create_comment',4),(74,'create_comment',5),(110,'create_comment',6),(92,'create_comment',7),(93,'create_comment',8),(48,'create_sub_comment',1),(24,'create_sub_comment',2),(31,'create_sub_comment',3),(6,'create_sub_comment',4),(69,'create_sub_comment',5),(111,'create_sub_comment',6),(87,'create_sub_comment',7),(94,'create_sub_comment',8),(49,'create_thread',1),(26,'create_thread',2),(32,'create_thread',3),(8,'create_thread',4),(71,'create_thread',5),(112,'create_thread',6),(89,'create_thread',7),(95,'create_thread',8),(50,'delete_comment',1),(16,'delete_comment',2),(33,'delete_comment',3),(113,'delete_comment',6),(79,'delete_comment',7),(96,'delete_comment',8),(51,'delete_thread',1),(13,'delete_thread',2),(34,'delete_thread',3),(114,'delete_thread',6),(76,'delete_thread',7),(97,'delete_thread',8),(52,'edit_content',1),(12,'edit_content',2),(35,'edit_content',3),(115,'edit_content',6),(75,'edit_content',7),(98,'edit_content',8),(53,'endorse_comment',1),(15,'endorse_comment',2),(36,'endorse_comment',3),(116,'endorse_comment',6),(78,'endorse_comment',7),(99,'endorse_comment',8),(54,'follow_commentable',1),(27,'follow_commentable',2),(37,'follow_commentable',3),(9,'follow_commentable',4),(72,'follow_commentable',5),(117,'follow_commentable',6),(90,'follow_commentable',7),(100,'follow_commentable',8),(55,'follow_thread',1),(21,'follow_thread',2),(38,'follow_thread',3),(3,'follow_thread',4),(66,'follow_thread',5),(118,'follow_thread',6),(84,'follow_thread',7),(101,'follow_thread',8),(18,'manage_moderator',1),(81,'manage_moderator',6),(56,'openclose_thread',1),(14,'openclose_thread',2),(39,'openclose_thread',3),(119,'openclose_thread',6),(77,'openclose_thread',7),(102,'openclose_thread',8),(57,'see_all_cohorts',1),(17,'see_all_cohorts',2),(40,'see_all_cohorts',3),(120,'see_all_cohorts',6),(80,'see_all_cohorts',7),(103,'see_all_cohorts',8),(58,'unfollow_commentable',1),(28,'unfollow_commentable',2),(41,'unfollow_commentable',3),(10,'unfollow_commentable',4),(73,'unfollow_commentable',5),(121,'unfollow_commentable',6),(91,'unfollow_commentable',7),(104,'unfollow_commentable',8),(59,'unfollow_thread',1),(22,'unfollow_thread',2),(42,'unfollow_thread',3),(4,'unfollow_thread',4),(67,'unfollow_thread',5),(122,'unfollow_thread',6),(85,'unfollow_thread',7),(105,'unfollow_thread',8),(60,'unvote',1),(25,'unvote',2),(43,'unvote',3),(7,'unvote',4),(70,'unvote',5),(123,'unvote',6),(88,'unvote',7),(106,'unvote',8),(61,'update_comment',1),(23,'update_comment',2),(44,'update_comment',3),(5,'update_comment',4),(68,'update_comment',5),(124,'update_comment',6),(86,'update_comment',7),(107,'update_comment',8),(62,'update_thread',1),(20,'update_thread',2),(45,'update_thread',3),(2,'update_thread',4),(65,'update_thread',5),(125,'update_thread',6),(83,'update_thread',7),(108,'update_thread',8),(63,'vote',1),(19,'vote',2),(46,'vote',3),(1,'vote',4),(64,'vote',5),(126,'vote',6),(82,'vote',7),(109,'vote',8);
/*!40000 ALTER TABLE `django_comment_client_permission_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_role`
--

DROP TABLE IF EXISTS `django_comment_client_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comment_client_role_b7271b` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_role`
--

LOCK TABLES `django_comment_client_role` WRITE;
/*!40000 ALTER TABLE `django_comment_client_role` DISABLE KEYS */;
INSERT INTO `django_comment_client_role` VALUES (1,'Administrator','course-v1:edX+DemoX+Demo_Course'),(2,'Moderator','course-v1:edX+DemoX+Demo_Course'),(3,'Community TA','course-v1:edX+DemoX+Demo_Course'),(4,'Student','course-v1:edX+DemoX+Demo_Course'),(5,'Student','edX/DemoX/Demo_Course'),(6,'Administrator','edX/DemoX/Demo_Course'),(7,'Moderator','edX/DemoX/Demo_Course'),(8,'Community TA','edX/DemoX/Demo_Course');
/*!40000 ALTER TABLE `django_comment_client_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_role_users`
--

DROP TABLE IF EXISTS `django_comment_client_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_role_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_comment_client_role_users_role_id_31943614_uniq` (`role_id`,`user_id`),
  KEY `django_comment_client_role_users_40f80fc0` (`role_id`),
  KEY `django_comment_client_role_users_403f60f` (`user_id`),
  CONSTRAINT `role_id_refs_id_547d37c8` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`),
  CONSTRAINT `user_id_refs_id_441b79e7` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_role_users`
--

LOCK TABLES `django_comment_client_role_users` WRITE;
/*!40000 ALTER TABLE `django_comment_client_role_users` DISABLE KEYS */;
INSERT INTO `django_comment_client_role_users` VALUES (5,4,7),(6,4,9),(1,5,1),(2,5,2),(3,5,3),(4,5,4);
/*!40000 ALTER TABLE `django_comment_client_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'task state','djcelery','taskmeta'),(8,'saved group result','djcelery','tasksetmeta'),(9,'interval','djcelery','intervalschedule'),(10,'crontab','djcelery','crontabschedule'),(11,'periodic tasks','djcelery','periodictasks'),(12,'periodic task','djcelery','periodictask'),(13,'worker','djcelery','workerstate'),(14,'task','djcelery','taskstate'),(15,'migration history','south','migrationhistory'),(16,'server circuit','circuit','servercircuit'),(17,'psychometric data','psychometrics','psychometricdata'),(18,'nonce','django_openid_auth','nonce'),(19,'association','django_openid_auth','association'),(20,'user open id','django_openid_auth','useropenid'),(21,'log entry','admin','logentry'),(22,'cors model','corsheaders','corsmodel'),(23,'global status message','status','globalstatusmessage'),(24,'course message','status','coursemessage'),(25,'student module','courseware','studentmodule'),(26,'student module history','courseware','studentmodulehistory'),(27,'x module user state summary field','courseware','xmoduleuserstatesummaryfield'),(28,'x module student prefs field','courseware','xmodulestudentprefsfield'),(29,'x module student info field','courseware','xmodulestudentinfofield'),(30,'offline computed grade','courseware','offlinecomputedgrade'),(31,'offline computed grade log','courseware','offlinecomputedgradelog'),(32,'student field override','courseware','studentfieldoverride'),(33,'x block disable config','xblock_django','xblockdisableconfig'),(34,'anonymous user id','student','anonymoususerid'),(35,'user standing','student','userstanding'),(36,'user profile','student','userprofile'),(37,'user signup source','student','usersignupsource'),(38,'user test group','student','usertestgroup'),(39,'registration','student','registration'),(40,'pending name change','student','pendingnamechange'),(41,'pending email change','student','pendingemailchange'),(42,'password history','student','passwordhistory'),(43,'login failures','student','loginfailures'),(44,'historical course enrollment','student','historicalcourseenrollment'),(45,'course enrollment','student','courseenrollment'),(46,'manual enrollment audit','student','manualenrollmentaudit'),(47,'course enrollment allowed','student','courseenrollmentallowed'),(48,'course access role','student','courseaccessrole'),(49,'dashboard configuration','student','dashboardconfiguration'),(50,'linked in add to profile configuration','student','linkedinaddtoprofileconfiguration'),(51,'entrance exam configuration','student','entranceexamconfiguration'),(52,'language proficiency','student','languageproficiency'),(53,'course enrollment attribute','student','courseenrollmentattribute'),(54,'tracking log','track','trackinglog'),(55,'rate limit configuration','util','ratelimitconfiguration'),(56,'certificate whitelist','certificates','certificatewhitelist'),(57,'generated certificate','certificates','generatedcertificate'),(58,'example certificate set','certificates','examplecertificateset'),(59,'example certificate','certificates','examplecertificate'),(60,'certificate generation course setting','certificates','certificategenerationcoursesetting'),(61,'certificate generation configuration','certificates','certificategenerationconfiguration'),(62,'certificate html view configuration','certificates','certificatehtmlviewconfiguration'),(63,'badge assertion','certificates','badgeassertion'),(64,'badge image configuration','certificates','badgeimageconfiguration'),(65,'certificate template','certificates','certificatetemplate'),(66,'certificate template asset','certificates','certificatetemplateasset'),(67,'instructor task','instructor_task','instructortask'),(68,'course software','licenses','coursesoftware'),(69,'user license','licenses','userlicense'),(70,'course user group','course_groups','courseusergroup'),(71,'course user group partition group','course_groups','courseusergrouppartitiongroup'),(72,'course cohorts settings','course_groups','coursecohortssettings'),(73,'course cohort','course_groups','coursecohort'),(74,'course email','bulk_email','courseemail'),(75,'optout','bulk_email','optout'),(76,'course email template','bulk_email','courseemailtemplate'),(77,'course authorization','bulk_email','courseauthorization'),(78,'branding info config','branding','brandinginfoconfig'),(79,'branding api config','branding','brandingapiconfig'),(80,'external auth map','external_auth','externalauthmap'),(81,'client','oauth2','client'),(82,'grant','oauth2','grant'),(83,'access token','oauth2','accesstoken'),(84,'refresh token','oauth2','refreshtoken'),(85,'trusted client','oauth2_provider','trustedclient'),(86,'article','wiki','article'),(87,'Article for object','wiki','articleforobject'),(88,'article revision','wiki','articlerevision'),(89,'URL path','wiki','urlpath'),(90,'article plugin','wiki','articleplugin'),(91,'reusable plugin','wiki','reusableplugin'),(92,'simple plugin','wiki','simpleplugin'),(93,'revision plugin','wiki','revisionplugin'),(94,'revision plugin revision','wiki','revisionpluginrevision'),(95,'article subscription','wiki','articlesubscription'),(96,'type','django_notify','notificationtype'),(97,'settings','django_notify','settings'),(98,'subscription','django_notify','subscription'),(99,'notification','django_notify','notification'),(100,'score','foldit','score'),(101,'puzzle complete','foldit','puzzlecomplete'),(102,'note','notes','note'),(103,'splash config','splash','splashconfig'),(104,'user preference','user_api','userpreference'),(105,'user course tag','user_api','usercoursetag'),(106,'user org tag','user_api','userorgtag'),(107,'order','shoppingcart','order'),(108,'order item','shoppingcart','orderitem'),(109,'invoice','shoppingcart','invoice'),(110,'invoice transaction','shoppingcart','invoicetransaction'),(111,'invoice item','shoppingcart','invoiceitem'),(112,'course registration code invoice item','shoppingcart','courseregistrationcodeinvoiceitem'),(113,'invoice history','shoppingcart','invoicehistory'),(114,'course registration code','shoppingcart','courseregistrationcode'),(115,'registration code redemption','shoppingcart','registrationcoderedemption'),(116,'coupon','shoppingcart','coupon'),(117,'coupon redemption','shoppingcart','couponredemption'),(118,'paid course registration','shoppingcart','paidcourseregistration'),(119,'course reg code item','shoppingcart','courseregcodeitem'),(120,'course reg code item annotation','shoppingcart','courseregcodeitemannotation'),(121,'paid course registration annotation','shoppingcart','paidcourseregistrationannotation'),(122,'certificate item','shoppingcart','certificateitem'),(123,'donation configuration','shoppingcart','donationconfiguration'),(124,'donation','shoppingcart','donation'),(125,'course mode','course_modes','coursemode'),(126,'course modes archive','course_modes','coursemodesarchive'),(127,'software secure photo verification','verify_student','softwaresecurephotoverification'),(128,'historical verification deadline','verify_student','historicalverificationdeadline'),(129,'verification deadline','verify_student','verificationdeadline'),(130,'verification checkpoint','verify_student','verificationcheckpoint'),(131,'Verification Status','verify_student','verificationstatus'),(132,'in course reverification configuration','verify_student','incoursereverificationconfiguration'),(133,'skipped reverification','verify_student','skippedreverification'),(134,'dark lang config','dark_lang','darklangconfig'),(135,'embargoed course','embargo','embargoedcourse'),(136,'embargoed state','embargo','embargoedstate'),(137,'restricted course','embargo','restrictedcourse'),(138,'country','embargo','country'),(139,'country access rule','embargo','countryaccessrule'),(140,'course access rule history','embargo','courseaccessrulehistory'),(141,'ip filter','embargo','ipfilter'),(142,'course rerun state','course_action_state','coursererunstate'),(143,'mobile api config','mobile_api','mobileapiconfig'),(144,'survey form','survey','surveyform'),(145,'survey answer','survey','surveyanswer'),(146,'x block asides config','lms_xblock','xblockasidesconfig'),(147,'course overview','course_overviews','courseoverview'),(148,'course structure','course_structures','coursestructure'),(149,'x domain proxy configuration','cors_csrf','xdomainproxyconfiguration'),(150,'course team','teams','courseteam'),(151,'course team membership','teams','courseteammembership'),(152,'student item','submissions','studentitem'),(153,'submission','submissions','submission'),(154,'score','submissions','score'),(155,'score summary','submissions','scoresummary'),(156,'rubric','assessment','rubric'),(157,'criterion','assessment','criterion'),(158,'criterion option','assessment','criterionoption'),(159,'assessment','assessment','assessment'),(160,'assessment part','assessment','assessmentpart'),(161,'assessment feedback option','assessment','assessmentfeedbackoption'),(162,'assessment feedback','assessment','assessmentfeedback'),(163,'peer workflow','assessment','peerworkflow'),(164,'peer workflow item','assessment','peerworkflowitem'),(165,'training example','assessment','trainingexample'),(166,'student training workflow','assessment','studenttrainingworkflow'),(167,'student training workflow item','assessment','studenttrainingworkflowitem'),(168,'ai classifier set','assessment','aiclassifierset'),(169,'ai classifier','assessment','aiclassifier'),(170,'ai training workflow','assessment','aitrainingworkflow'),(171,'ai grading workflow','assessment','aigradingworkflow'),(172,'assessment workflow','workflow','assessmentworkflow'),(173,'assessment workflow step','workflow','assessmentworkflowstep'),(174,'assessment workflow cancellation','workflow','assessmentworkflowcancellation'),(175,'profile','edxval','profile'),(176,'video','edxval','video'),(177,'course video','edxval','coursevideo'),(178,'encoded video','edxval','encodedvideo'),(179,'subtitle','edxval','subtitle'),(180,'milestone','milestones','milestone'),(181,'milestone relationship type','milestones','milestonerelationshiptype'),(182,'course milestone','milestones','coursemilestone'),(183,'course content milestone','milestones','coursecontentmilestone'),(184,'user milestone','milestones','usermilestone'),(185,'proctored exam','edx_proctoring','proctoredexam'),(186,'proctored exam attempt','edx_proctoring','proctoredexamstudentattempt'),(187,'proctored exam student attempt history','edx_proctoring','proctoredexamstudentattempthistory'),(188,'proctored allowance','edx_proctoring','proctoredexamstudentallowance'),(189,'proctored allowance history','edx_proctoring','proctoredexamstudentallowancehistory'),(190,'organization','organizations','organization'),(191,'organization course','organizations','organizationcourse'),(192,'credit provider','credit','creditprovider'),(193,'credit course','credit','creditcourse'),(194,'credit requirement','credit','creditrequirement'),(195,'historical credit requirement status','credit','historicalcreditrequirementstatus'),(196,'credit requirement status','credit','creditrequirementstatus'),(197,'credit eligibility','credit','crediteligibility'),(198,'historical credit request','credit','historicalcreditrequest'),(199,'credit request','credit','creditrequest'),(200,'video upload config','contentstore','videouploadconfig'),(201,'push notification config','contentstore','pushnotificationconfig'),(202,'course creator','course_creators','coursecreator'),(203,'studio config','xblock_config','studioconfig');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_association`
--

DROP TABLE IF EXISTS `django_openid_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` longtext NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` longtext NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_association`
--

LOCK TABLES `django_openid_auth_association` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_nonce`
--

DROP TABLE IF EXISTS `django_openid_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(2047) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_nonce`
--

LOCK TABLES `django_openid_auth_nonce` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_useropenid`
--

DROP TABLE IF EXISTS `django_openid_auth_useropenid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_useropenid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `claimed_id` longtext NOT NULL,
  `display_id` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_openid_auth_useropenid_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_418e9d10` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_useropenid`
--

LOCK TABLES `django_openid_auth_useropenid` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_useropenid` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_auth_useropenid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictask_17d2d99d` (`interval_id`),
  KEY `djcelery_periodictask_7aa5fda` (`crontab_id`),
  CONSTRAINT `crontab_id_refs_id_1400a18c` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `interval_id_refs_id_dfabcb7` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_355bfc27` (`state`),
  KEY `djcelery_taskstate_52094d6e` (`name`),
  KEY `djcelery_taskstate_f459b00` (`tstamp`),
  KEY `djcelery_taskstate_20fc5b84` (`worker_id`),
  KEY `djcelery_taskstate_c91f1bf` (`hidden`),
  CONSTRAINT `worker_id_refs_id_4e3453a` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_1475381c` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edx_proctoring_proctoredexamstudentattempthistory`
--

DROP TABLE IF EXISTS `edx_proctoring_proctoredexamstudentattempthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edx_proctoring_proctoredexamstudentattempthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `attempt_code` varchar(255) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `allowed_time_limit_mins` int(11) NOT NULL,
  `status` varchar(64) NOT NULL,
  `taking_as_proctored` tinyint(1) NOT NULL,
  `is_sample_attempt` tinyint(1) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `edx_proctoring_proctoredexamstudentattempthistory_403f60f` (`user_id`),
  KEY `edx_proctoring_proctoredexamstudentattempthistory_2a65e6a8` (`proctored_exam_id`),
  KEY `edx_proctoring_proctoredexamstudentattempthistory_5418718e` (`attempt_code`),
  KEY `edx_proctoring_proctoredexamstudentattempthistory_d5e787` (`external_id`),
  CONSTRAINT `proctored_exam_id_refs_id_36867662` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `user_id_refs_id_45fbb4f6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edx_proctoring_proctoredexamstudentattempthistory`
--

LOCK TABLES `edx_proctoring_proctoredexamstudentattempthistory` WRITE;
/*!40000 ALTER TABLE `edx_proctoring_proctoredexamstudentattempthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `edx_proctoring_proctoredexamstudentattempthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_coursevideo`
--

DROP TABLE IF EXISTS `edxval_coursevideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_coursevideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edxval_coursevideo_course_id_5cff2d8c_uniq` (`course_id`,`video_id`),
  KEY `edxval_coursevideo_5d9d774` (`video_id`),
  CONSTRAINT `video_id_refs_id_7520c050` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_coursevideo`
--

LOCK TABLES `edxval_coursevideo` WRITE;
/*!40000 ALTER TABLE `edxval_coursevideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_coursevideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_encodedvideo`
--

DROP TABLE IF EXISTS `edxval_encodedvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_encodedvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `url` varchar(200) NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `bitrate` int(10) unsigned NOT NULL,
  `profile_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `edxval_encodedvideo_141c6eec` (`profile_id`),
  KEY `edxval_encodedvideo_5d9d774` (`video_id`),
  CONSTRAINT `profile_id_refs_id_692d754` FOREIGN KEY (`profile_id`) REFERENCES `edxval_profile` (`id`),
  CONSTRAINT `video_id_refs_id_176ce1a0` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_encodedvideo`
--

LOCK TABLES `edxval_encodedvideo` WRITE;
/*!40000 ALTER TABLE `edxval_encodedvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_encodedvideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_profile`
--

DROP TABLE IF EXISTS `edxval_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(50) NOT NULL,
  `extension` varchar(10) DEFAULT 'mp4',
  `width` int(10) unsigned DEFAULT '1',
  `height` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name` (`profile_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_profile`
--

LOCK TABLES `edxval_profile` WRITE;
/*!40000 ALTER TABLE `edxval_profile` DISABLE KEYS */;
INSERT INTO `edxval_profile` VALUES (1,'desktop_mp4','mp4',1280,720),(2,'desktop_webm','webm',1280,720),(3,'mobile_high','mp4',960,540),(4,'mobile_low','mp4',640,360),(5,'youtube','mp4',1920,1080);
/*!40000 ALTER TABLE `edxval_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_subtitle`
--

DROP TABLE IF EXISTS `edxval_subtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_subtitle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `video_id` int(11) NOT NULL,
  `fmt` varchar(20) NOT NULL,
  `language` varchar(8) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `edxval_subtitle_5d9d774` (`video_id`),
  KEY `edxval_subtitle_306df28f` (`fmt`),
  KEY `edxval_subtitle_75853655` (`language`),
  CONSTRAINT `video_id_refs_id_788bc3d3` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_subtitle`
--

LOCK TABLES `edxval_subtitle` WRITE;
/*!40000 ALTER TABLE `edxval_subtitle` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_subtitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_video`
--

DROP TABLE IF EXISTS `edxval_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `edx_video_id` varchar(100) NOT NULL,
  `client_video_id` varchar(255) NOT NULL,
  `duration` double NOT NULL,
  `created` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edx_video_id` (`edx_video_id`),
  KEY `edxval_video_21c0a8f7` (`client_video_id`),
  KEY `edxval_video_36528e23` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_video`
--

LOCK TABLES `edxval_video` WRITE;
/*!40000 ALTER TABLE `edxval_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_country`
--

DROP TABLE IF EXISTS `embargo_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_country`
--

LOCK TABLES `embargo_country` WRITE;
/*!40000 ALTER TABLE `embargo_country` DISABLE KEYS */;
INSERT INTO `embargo_country` VALUES (6,'AD'),(234,'AE'),(1,'AF'),(10,'AG'),(8,'AI'),(3,'AL'),(12,'AM'),(7,'AO'),(9,'AQ'),(11,'AR'),(5,'AS'),(15,'AT'),(14,'AU'),(13,'AW'),(2,'AX'),(16,'AZ'),(29,'BA'),(20,'BB'),(19,'BD'),(22,'BE'),(36,'BF'),(35,'BG'),(18,'BH'),(37,'BI'),(24,'BJ'),(184,'BL'),(25,'BM'),(34,'BN'),(27,'BO'),(28,'BQ'),(32,'BR'),(17,'BS'),(26,'BT'),(31,'BV'),(30,'BW'),(21,'BY'),(23,'BZ'),(41,'CA'),(48,'CC'),(52,'CD'),(43,'CF'),(51,'CG'),(216,'CH'),(55,'CI'),(53,'CK'),(45,'CL'),(40,'CM'),(46,'CN'),(49,'CO'),(54,'CR'),(57,'CU'),(38,'CV'),(58,'CW'),(47,'CX'),(59,'CY'),(60,'CZ'),(83,'DE'),(62,'DJ'),(61,'DK'),(63,'DM'),(64,'DO'),(4,'DZ'),(65,'EC'),(70,'EE'),(66,'EG'),(246,'EH'),(69,'ER'),(209,'ES'),(71,'ET'),(75,'FI'),(74,'FJ'),(72,'FK'),(143,'FM'),(73,'FO'),(76,'FR'),(80,'GA'),(235,'GB'),(88,'GD'),(82,'GE'),(77,'GF'),(92,'GG'),(84,'GH'),(85,'GI'),(87,'GL'),(81,'GM'),(93,'GN'),(89,'GP'),(68,'GQ'),(86,'GR'),(206,'GS'),(91,'GT'),(90,'GU'),(94,'GW'),(95,'GY'),(100,'HK'),(97,'HM'),(99,'HN'),(56,'HR'),(96,'HT'),(101,'HU'),(104,'ID'),(107,'IE'),(109,'IL'),(108,'IM'),(103,'IN'),(33,'IO'),(106,'IQ'),(105,'IR'),(102,'IS'),(110,'IT'),(113,'JE'),(111,'JM'),(114,'JO'),(112,'JP'),(116,'KE'),(119,'KG'),(39,'KH'),(117,'KI'),(50,'KM'),(186,'KN'),(163,'KP'),(207,'KR'),(118,'KW'),(42,'KY'),(115,'KZ'),(120,'LA'),(122,'LB'),(187,'LC'),(126,'LI'),(210,'LK'),(124,'LR'),(123,'LS'),(127,'LT'),(128,'LU'),(121,'LV'),(125,'LY'),(149,'MA'),(145,'MC'),(144,'MD'),(147,'ME'),(188,'MF'),(131,'MG'),(137,'MH'),(130,'MK'),(135,'ML'),(151,'MM'),(146,'MN'),(129,'MO'),(164,'MP'),(138,'MQ'),(139,'MR'),(148,'MS'),(136,'MT'),(140,'MU'),(134,'MV'),(132,'MW'),(142,'MX'),(133,'MY'),(150,'MZ'),(152,'NA'),(156,'NC'),(159,'NE'),(162,'NF'),(160,'NG'),(158,'NI'),(155,'NL'),(165,'NO'),(154,'NP'),(153,'NR'),(161,'NU'),(157,'NZ'),(166,'OM'),(170,'PA'),(173,'PE'),(78,'PF'),(171,'PG'),(174,'PH'),(167,'PK'),(176,'PL'),(189,'PM'),(175,'PN'),(178,'PR'),(169,'PS'),(177,'PT'),(168,'PW'),(172,'PY'),(179,'QA'),(180,'RE'),(181,'RO'),(196,'RS'),(182,'RU'),(183,'RW'),(194,'SA'),(203,'SB'),(197,'SC'),(211,'SD'),(215,'SE'),(199,'SG'),(185,'SH'),(202,'SI'),(213,'SJ'),(201,'SK'),(198,'SL'),(192,'SM'),(195,'SN'),(204,'SO'),(212,'SR'),(208,'SS'),(193,'ST'),(67,'SV'),(200,'SX'),(217,'SY'),(214,'SZ'),(230,'TC'),(44,'TD'),(79,'TF'),(223,'TG'),(221,'TH'),(219,'TJ'),(224,'TK'),(222,'TL'),(229,'TM'),(227,'TN'),(225,'TO'),(228,'TR'),(226,'TT'),(231,'TV'),(218,'TW'),(220,'TZ'),(233,'UA'),(232,'UG'),(236,'UM'),(237,'US'),(238,'UY'),(239,'UZ'),(98,'VA'),(190,'VC'),(241,'VE'),(243,'VG'),(244,'VI'),(242,'VN'),(240,'VU'),(245,'WF'),(191,'WS'),(247,'YE'),(141,'YT'),(205,'ZA'),(248,'ZM'),(249,'ZW');
/*!40000 ALTER TABLE `embargo_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_countryaccessrule`
--

DROP TABLE IF EXISTS `embargo_countryaccessrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_countryaccessrule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_type` varchar(255) NOT NULL,
  `restricted_course_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `embargo_countryaccessrule_restricted_course_id_39cc34f6_uniq` (`restricted_course_id`,`country_id`),
  KEY `embargo_countryaccessrule_3cd064f4` (`restricted_course_id`),
  KEY `embargo_countryaccessrule_534dd89` (`country_id`),
  CONSTRAINT `country_id_refs_id_986058d` FOREIGN KEY (`country_id`) REFERENCES `embargo_country` (`id`),
  CONSTRAINT `restricted_course_id_refs_id_386dcce4` FOREIGN KEY (`restricted_course_id`) REFERENCES `embargo_restrictedcourse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_countryaccessrule`
--

LOCK TABLES `embargo_countryaccessrule` WRITE;
/*!40000 ALTER TABLE `embargo_countryaccessrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_countryaccessrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_courseaccessrulehistory`
--

DROP TABLE IF EXISTS `embargo_courseaccessrulehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_courseaccessrulehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `snapshot` longtext,
  PRIMARY KEY (`id`),
  KEY `embargo_courseaccessrulehistory_67f1b7ce` (`timestamp`),
  KEY `embargo_courseaccessrulehistory_4b4b8186` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_courseaccessrulehistory`
--

LOCK TABLES `embargo_courseaccessrulehistory` WRITE;
/*!40000 ALTER TABLE `embargo_courseaccessrulehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_courseaccessrulehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_embargoedcourse`
--

DROP TABLE IF EXISTS `embargo_embargoedcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_embargoedcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `embargoed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_embargoedcourse`
--

LOCK TABLES `embargo_embargoedcourse` WRITE;
/*!40000 ALTER TABLE `embargo_embargoedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_embargoedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_embargoedstate`
--

DROP TABLE IF EXISTS `embargo_embargoedstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_embargoedstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `embargoed_countries` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `embargo_embargoedstate_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_2fdfa2c7` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_embargoedstate`
--

LOCK TABLES `embargo_embargoedstate` WRITE;
/*!40000 ALTER TABLE `embargo_embargoedstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_embargoedstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_ipfilter`
--

DROP TABLE IF EXISTS `embargo_ipfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_ipfilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `whitelist` longtext NOT NULL,
  `blacklist` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `embargo_ipfilter_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_22c1f5d3` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_ipfilter`
--

LOCK TABLES `embargo_ipfilter` WRITE;
/*!40000 ALTER TABLE `embargo_ipfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_ipfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_restrictedcourse`
--

DROP TABLE IF EXISTS `embargo_restrictedcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_restrictedcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `enroll_msg_key` varchar(255) NOT NULL,
  `access_msg_key` varchar(255) NOT NULL,
  `disable_access_check` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_restrictedcourse`
--

LOCK TABLES `embargo_restrictedcourse` WRITE;
/*!40000 ALTER TABLE `embargo_restrictedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_restrictedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_auth_externalauthmap`
--

DROP TABLE IF EXISTS `external_auth_externalauthmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_auth_externalauthmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) NOT NULL,
  `external_domain` varchar(255) NOT NULL,
  `external_credentials` longtext NOT NULL,
  `external_email` varchar(255) NOT NULL,
  `external_name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `internal_password` varchar(31) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `dtsignup` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_auth_externalauthmap_external_id_43b2cec2_uniq` (`external_id`,`external_domain`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `external_auth_externalauthmap_d5e787` (`external_id`),
  KEY `external_auth_externalauthmap_5a8ffdb4` (`external_domain`),
  KEY `external_auth_externalauthmap_5ebdf9e3` (`external_email`),
  KEY `external_auth_externalauthmap_c1a016f` (`external_name`),
  CONSTRAINT `user_id_refs_id_79ca099` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_auth_externalauthmap`
--

LOCK TABLES `external_auth_externalauthmap` WRITE;
/*!40000 ALTER TABLE `external_auth_externalauthmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_auth_externalauthmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foldit_puzzlecomplete`
--

DROP TABLE IF EXISTS `foldit_puzzlecomplete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foldit_puzzlecomplete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `unique_user_id` varchar(50) NOT NULL,
  `puzzle_id` int(11) NOT NULL,
  `puzzle_set` int(11) NOT NULL,
  `puzzle_subset` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `foldit_puzzlecomplete_user_id_998bccf_uniq` (`user_id`,`puzzle_id`,`puzzle_set`,`puzzle_subset`),
  KEY `foldit_puzzlecomplete_403f60f` (`user_id`),
  KEY `foldit_puzzlecomplete_7fd8b882` (`unique_user_id`),
  KEY `foldit_puzzlecomplete_4798a2b8` (`puzzle_set`),
  KEY `foldit_puzzlecomplete_59f06bcd` (`puzzle_subset`),
  CONSTRAINT `user_id_refs_id_37e9437b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foldit_puzzlecomplete`
--

LOCK TABLES `foldit_puzzlecomplete` WRITE;
/*!40000 ALTER TABLE `foldit_puzzlecomplete` DISABLE KEYS */;
/*!40000 ALTER TABLE `foldit_puzzlecomplete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foldit_score`
--

DROP TABLE IF EXISTS `foldit_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foldit_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `unique_user_id` varchar(50) NOT NULL,
  `puzzle_id` int(11) NOT NULL,
  `best_score` double NOT NULL,
  `current_score` double NOT NULL,
  `score_version` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foldit_score_403f60f` (`user_id`),
  KEY `foldit_score_7fd8b882` (`unique_user_id`),
  KEY `foldit_score_3624c060` (`best_score`),
  KEY `foldit_score_4b9d886e` (`current_score`),
  CONSTRAINT `user_id_refs_id_4c07957f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foldit_score`
--

LOCK TABLES `foldit_score` WRITE;
/*!40000 ALTER TABLE `foldit_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `foldit_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_task_instructortask`
--

DROP TABLE IF EXISTS `instructor_task_instructortask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_task_instructortask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` varchar(50) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `task_key` varchar(255) NOT NULL,
  `task_input` varchar(255) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `task_state` varchar(50) DEFAULT NULL,
  `task_output` varchar(1024) DEFAULT NULL,
  `requester_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `subtasks` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor_task_instructortask_7519c74c` (`task_type`),
  KEY `instructor_task_instructortask_b7271b` (`course_id`),
  KEY `instructor_task_instructortask_303aae90` (`task_key`),
  KEY `instructor_task_instructortask_3ff01bab` (`task_id`),
  KEY `instructor_task_instructortask_731e67a4` (`task_state`),
  KEY `instructor_task_instructortask_47357461` (`requester_id`),
  CONSTRAINT `requester_id_refs_id_568d871a` FOREIGN KEY (`requester_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_task_instructortask`
--

LOCK TABLES `instructor_task_instructortask` WRITE;
/*!40000 ALTER TABLE `instructor_task_instructortask` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_task_instructortask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses_coursesoftware`
--

DROP TABLE IF EXISTS `licenses_coursesoftware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses_coursesoftware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses_coursesoftware`
--

LOCK TABLES `licenses_coursesoftware` WRITE;
/*!40000 ALTER TABLE `licenses_coursesoftware` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses_coursesoftware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses_userlicense`
--

DROP TABLE IF EXISTS `licenses_userlicense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses_userlicense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `serial` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `licenses_userlicense_4c6ed3c1` (`software_id`),
  KEY `licenses_userlicense_403f60f` (`user_id`),
  CONSTRAINT `software_id_refs_id_61d8418` FOREIGN KEY (`software_id`) REFERENCES `licenses_coursesoftware` (`id`),
  CONSTRAINT `user_id_refs_id_2f3a1cb3` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses_userlicense`
--

LOCK TABLES `licenses_userlicense` WRITE;
/*!40000 ALTER TABLE `licenses_userlicense` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses_userlicense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lms_xblock_xblockasidesconfig`
--

DROP TABLE IF EXISTS `lms_xblock_xblockasidesconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lms_xblock_xblockasidesconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `disabled_blocks` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lms_xblock_xblockasidesconfig_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_552627bc` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lms_xblock_xblockasidesconfig`
--

LOCK TABLES `lms_xblock_xblockasidesconfig` WRITE;
/*!40000 ALTER TABLE `lms_xblock_xblockasidesconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `lms_xblock_xblockasidesconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_coursecontentmilestone`
--

DROP TABLE IF EXISTS `milestones_coursecontentmilestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_coursecontentmilestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `content_id` varchar(255) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `milestone_relationship_type_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_coursecontentmilestone_course_id_2ad29201_uniq` (`course_id`,`content_id`,`milestone_id`),
  KEY `milestones_coursecontentmilestone_b7271b` (`course_id`),
  KEY `milestones_coursecontentmilestone_cc8ff3c` (`content_id`),
  KEY `milestones_coursecontentmilestone_6305d6e1` (`milestone_id`),
  KEY `milestones_coursecontentmilestone_595c57ff` (`milestone_relationship_type_id`),
  CONSTRAINT `milestone_id_refs_id_28054124` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`),
  CONSTRAINT `milestone_relationship_type_id_refs_id_d7ab186` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_coursecontentmilestone`
--

LOCK TABLES `milestones_coursecontentmilestone` WRITE;
/*!40000 ALTER TABLE `milestones_coursecontentmilestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_coursecontentmilestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_coursemilestone`
--

DROP TABLE IF EXISTS `milestones_coursemilestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_coursemilestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `milestone_relationship_type_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_coursemilestone_course_id_79eab3b7_uniq` (`course_id`,`milestone_id`),
  KEY `milestones_coursemilestone_b7271b` (`course_id`),
  KEY `milestones_coursemilestone_6305d6e1` (`milestone_id`),
  KEY `milestones_coursemilestone_595c57ff` (`milestone_relationship_type_id`),
  CONSTRAINT `milestone_id_refs_id_3289bcac` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`),
  CONSTRAINT `milestone_relationship_type_id_refs_id_78b5fc4a` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_coursemilestone`
--

LOCK TABLES `milestones_coursemilestone` WRITE;
/*!40000 ALTER TABLE `milestones_coursemilestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_coursemilestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_milestone`
--

DROP TABLE IF EXISTS `milestones_milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_milestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_milestone_namespace_43016c0b_uniq` (`namespace`,`name`),
  KEY `milestones_milestone_14fbf689` (`namespace`),
  KEY `milestones_milestone_52094d6e` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_milestone`
--

LOCK TABLES `milestones_milestone` WRITE;
/*!40000 ALTER TABLE `milestones_milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_milestonerelationshiptype`
--

DROP TABLE IF EXISTS `milestones_milestonerelationshiptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_milestonerelationshiptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_milestonerelationshiptype`
--

LOCK TABLES `milestones_milestonerelationshiptype` WRITE;
/*!40000 ALTER TABLE `milestones_milestonerelationshiptype` DISABLE KEYS */;
INSERT INTO `milestones_milestonerelationshiptype` VALUES (1,'2015-10-26 12:33:42','2015-10-26 12:33:42','fulfills','Autogenerated milestone relationship type \"fulfills\"',1),(2,'2015-10-26 12:33:42','2015-10-26 12:33:42','requires','Autogenerated milestone relationship type \"requires\"',1);
/*!40000 ALTER TABLE `milestones_milestonerelationshiptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_usermilestone`
--

DROP TABLE IF EXISTS `milestones_usermilestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_usermilestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `source` longtext NOT NULL,
  `collected` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_usermilestone_user_id_52468351_uniq` (`user_id`,`milestone_id`),
  KEY `milestones_usermilestone_403f60f` (`user_id`),
  KEY `milestones_usermilestone_6305d6e1` (`milestone_id`),
  CONSTRAINT `milestone_id_refs_id_50805ba0` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_usermilestone`
--

LOCK TABLES `milestones_usermilestone` WRITE;
/*!40000 ALTER TABLE `milestones_usermilestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_usermilestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_api_mobileapiconfig`
--

DROP TABLE IF EXISTS `mobile_api_mobileapiconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_api_mobileapiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `video_profiles` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_api_mobileapiconfig_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_683d0b38` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_api_mobileapiconfig`
--

LOCK TABLES `mobile_api_mobileapiconfig` WRITE;
/*!40000 ALTER TABLE `mobile_api_mobileapiconfig` DISABLE KEYS */;
INSERT INTO `mobile_api_mobileapiconfig` VALUES (1,'2015-10-26 12:32:01',NULL,0,'mobile_low,mobile_high,youtube');
/*!40000 ALTER TABLE `mobile_api_mobileapiconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_note`
--

DROP TABLE IF EXISTS `notes_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `quote` longtext NOT NULL,
  `range_start` varchar(2048) NOT NULL,
  `range_start_offset` int(11) NOT NULL,
  `range_end` varchar(2048) NOT NULL,
  `range_end_offset` int(11) NOT NULL,
  `tags` longtext NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_note_403f60f` (`user_id`),
  KEY `notes_note_b7271b` (`course_id`),
  KEY `notes_note_a9794fa` (`uri`),
  KEY `notes_note_3216ff68` (`created`),
  KEY `notes_note_8aac229` (`updated`),
  CONSTRAINT `user_id_refs_id_360715cc` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_note`
--

LOCK TABLES `notes_note` WRITE;
/*!40000 ALTER TABLE `notes_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_articlesubscription`
--

DROP TABLE IF EXISTS `notifications_articlesubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_articlesubscription` (
  `subscription_ptr_id` int(11) NOT NULL,
  `articleplugin_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  UNIQUE KEY `subscription_ptr_id` (`subscription_ptr_id`),
  CONSTRAINT `articleplugin_ptr_id_refs_id_71ed584a` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`),
  CONSTRAINT `subscription_ptr_id_refs_id_75c0b518` FOREIGN KEY (`subscription_ptr_id`) REFERENCES `notify_subscription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_articlesubscription`
--

LOCK TABLES `notifications_articlesubscription` WRITE;
/*!40000 ALTER TABLE `notifications_articlesubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_articlesubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_notification`
--

DROP TABLE IF EXISTS `notify_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT NULL,
  `message` longtext NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `is_viewed` tinyint(1) NOT NULL,
  `is_emailed` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notify_notification_104f5ac1` (`subscription_id`),
  CONSTRAINT `subscription_id_refs_id_4506c2b1` FOREIGN KEY (`subscription_id`) REFERENCES `notify_subscription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_notification`
--

LOCK TABLES `notify_notification` WRITE;
/*!40000 ALTER TABLE `notify_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_notificationtype`
--

DROP TABLE IF EXISTS `notify_notificationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_notificationtype` (
  `key` varchar(128) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`),
  KEY `notify_notificationtype_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_db87c88` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_notificationtype`
--

LOCK TABLES `notify_notificationtype` WRITE;
/*!40000 ALTER TABLE `notify_notificationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_notificationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_settings`
--

DROP TABLE IF EXISTS `notify_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `interval` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notify_settings_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_65d6ee1a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_settings`
--

LOCK TABLES `notify_settings` WRITE;
/*!40000 ALTER TABLE `notify_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_subscription`
--

DROP TABLE IF EXISTS `notify_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settings_id` int(11) NOT NULL,
  `notification_type_id` varchar(128) NOT NULL,
  `object_id` varchar(64) DEFAULT NULL,
  `send_emails` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notify_subscription_7ccd9267` (`settings_id`),
  KEY `notify_subscription_66aa0f6f` (`notification_type_id`),
  CONSTRAINT `notification_type_id_refs_key_455be5e7` FOREIGN KEY (`notification_type_id`) REFERENCES `notify_notificationtype` (`key`),
  CONSTRAINT `settings_id_refs_id_3b7225d5` FOREIGN KEY (`settings_id`) REFERENCES `notify_settings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_subscription`
--

LOCK TABLES `notify_subscription` WRITE;
/*!40000 ALTER TABLE `notify_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_accesstoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  `expires` datetime NOT NULL,
  `scope` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_accesstoken_403f60f` (`user_id`),
  KEY `oauth2_accesstoken_4a4e8ffb` (`client_id`),
  KEY `oauth2_accesstoken_40536067` (`token`),
  CONSTRAINT `client_id_refs_id_1a991434` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`),
  CONSTRAINT `user_id_refs_id_38bf2247` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_accesstoken`
--

LOCK TABLES `oauth2_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_client`
--

DROP TABLE IF EXISTS `oauth2_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11),
  `url` varchar(200) NOT NULL,
  `redirect_uri` varchar(200) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `client_type` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_client_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_3d1c1660` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_client`
--

LOCK TABLES `oauth2_client` WRITE;
/*!40000 ALTER TABLE `oauth2_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_grant`
--

DROP TABLE IF EXISTS `oauth2_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_grant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `expires` datetime NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_grant_403f60f` (`user_id`),
  KEY `oauth2_grant_4a4e8ffb` (`client_id`),
  CONSTRAINT `client_id_refs_id_4d099213` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`),
  CONSTRAINT `user_id_refs_id_37f50fe6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_grant`
--

LOCK TABLES `oauth2_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_trustedclient`
--

DROP TABLE IF EXISTS `oauth2_provider_trustedclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_trustedclient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_provider_trustedclient_4a4e8ffb` (`client_id`),
  CONSTRAINT `client_id_refs_id_9203534` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_trustedclient`
--

LOCK TABLES `oauth2_provider_trustedclient` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_trustedclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_trustedclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_refreshtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `access_token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  KEY `oauth2_refreshtoken_403f60f` (`user_id`),
  KEY `oauth2_refreshtoken_4a4e8ffb` (`client_id`),
  CONSTRAINT `access_token_id_refs_id_20869e47` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_accesstoken` (`id`),
  CONSTRAINT `client_id_refs_id_798730c8` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`),
  CONSTRAINT `user_id_refs_id_78216905` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_refreshtoken`
--

LOCK TABLES `oauth2_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_organization`
--

DROP TABLE IF EXISTS `organizations_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `logo` varchar(255),
  PRIMARY KEY (`id`),
  KEY `organizations_organization_52094d6e` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_organization`
--

LOCK TABLES `organizations_organization` WRITE;
/*!40000 ALTER TABLE `organizations_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_organizationcourse`
--

DROP TABLE IF EXISTS `organizations_organizationcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_organizationcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_organizationcourse_course_id_6c0495ff_uniq` (`course_id`,`organization_id`),
  KEY `organizations_organizationcourse_b7271b` (`course_id`),
  KEY `organizations_organizationcourse_68283273` (`organization_id`),
  CONSTRAINT `organization_id_refs_id_245d0496` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_organizationcourse`
--

LOCK TABLES `organizations_organizationcourse` WRITE;
/*!40000 ALTER TABLE `organizations_organizationcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_organizationcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexam`
--

DROP TABLE IF EXISTS `proctoring_proctoredexam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `content_id` varchar(255) NOT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `exam_name` longtext NOT NULL,
  `time_limit_mins` int(11) NOT NULL,
  `is_proctored` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexam_course_id_323890c0_uniq` (`course_id`,`content_id`),
  KEY `proctoring_proctoredexam_b7271b` (`course_id`),
  KEY `proctoring_proctoredexam_cc8ff3c` (`content_id`),
  KEY `proctoring_proctoredexam_d5e787` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexam`
--

LOCK TABLES `proctoring_proctoredexam` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexam` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentallowance`
--

DROP TABLE IF EXISTS `proctoring_proctoredexamstudentallowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentallowance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexamstudentallowance_user_id_152c2f60_uniq` (`user_id`,`proctored_exam_id`,`key`),
  KEY `proctoring_proctoredexamstudentallowance_403f60f` (`user_id`),
  KEY `proctoring_proctoredexamstudentallowance_2a65e6a8` (`proctored_exam_id`),
  CONSTRAINT `proctored_exam_id_refs_id_36fd3e88` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `user_id_refs_id_1342a3e0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentallowance`
--

LOCK TABLES `proctoring_proctoredexamstudentallowance` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowance` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentallowancehistory`
--

DROP TABLE IF EXISTS `proctoring_proctoredexamstudentallowancehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentallowancehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `allowance_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctoredexamstudentallowancehistory_403f60f` (`user_id`),
  KEY `proctoring_proctoredexamstudentallowancehistory_2a65e6a8` (`proctored_exam_id`),
  CONSTRAINT `proctored_exam_id_refs_id_7aa3a2a7` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `user_id_refs_id_9f0f801` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentallowancehistory`
--

LOCK TABLES `proctoring_proctoredexamstudentallowancehistory` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowancehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowancehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentattempt`
--

DROP TABLE IF EXISTS `proctoring_proctoredexamstudentattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentattempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `allowed_time_limit_mins` int(11) NOT NULL,
  `status` varchar(64) NOT NULL,
  `taking_as_proctored` tinyint(1) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `attempt_code` varchar(255),
  `is_sample_attempt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctoredexamstudentattempt_403f60f` (`user_id`),
  KEY `proctoring_proctoredexamstudentattempt_2a65e6a8` (`proctored_exam_id`),
  KEY `proctoring_proctoredexamstudentattempt_d5e787` (`external_id`),
  KEY `proctoring_proctoredexamstudentattempt_5418718e` (`attempt_code`),
  CONSTRAINT `proctored_exam_id_refs_id_14b3166d` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `user_id_refs_id_20733995` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentattempt`
--

LOCK TABLES `proctoring_proctoredexamstudentattempt` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psychometrics_psychometricdata`
--

DROP TABLE IF EXISTS `psychometrics_psychometricdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psychometrics_psychometricdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentmodule_id` int(11) NOT NULL,
  `done` tinyint(1) NOT NULL,
  `attempts` int(11) NOT NULL,
  `checktimes` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `studentmodule_id` (`studentmodule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychometrics_psychometricdata`
--

LOCK TABLES `psychometrics_psychometricdata` WRITE;
/*!40000 ALTER TABLE `psychometrics_psychometricdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `psychometrics_psychometricdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_certificateitem`
--

DROP TABLE IF EXISTS `shoppingcart_certificateitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_certificateitem` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  `course_enrollment_id` int(11) NOT NULL,
  `mode` varchar(50) NOT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_certificateitem_b7271b` (`course_id`),
  KEY `shoppingcart_certificateitem_61aec0f5` (`course_enrollment_id`),
  KEY `shoppingcart_certificateitem_4160619e` (`mode`),
  CONSTRAINT `course_enrollment_id_refs_id_7fb73bcb` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `orderitem_ptr_id_refs_id_2c143b30` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_certificateitem`
--

LOCK TABLES `shoppingcart_certificateitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_certificateitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_certificateitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_coupon`
--

DROP TABLE IF EXISTS `shoppingcart_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `percentage_discount` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `expiration_date` datetime,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_coupon_65da3d2c` (`code`),
  KEY `shoppingcart_coupon_4a21cf42` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_259aadc` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_coupon`
--

LOCK TABLES `shoppingcart_coupon` WRITE;
/*!40000 ALTER TABLE `shoppingcart_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_couponredemption`
--

DROP TABLE IF EXISTS `shoppingcart_couponredemption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_couponredemption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_couponredemption_7cc8fcf5` (`order_id`),
  KEY `shoppingcart_couponredemption_403f60f` (`user_id`),
  KEY `shoppingcart_couponredemption_3d64d1a0` (`coupon_id`),
  CONSTRAINT `coupon_id_refs_id_3ee57fde` FOREIGN KEY (`coupon_id`) REFERENCES `shoppingcart_coupon` (`id`),
  CONSTRAINT `order_id_refs_id_a24e699` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `user_id_refs_id_5e9b8167` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_couponredemption`
--

LOCK TABLES `shoppingcart_couponredemption` WRITE;
/*!40000 ALTER TABLE `shoppingcart_couponredemption` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_couponredemption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregcodeitem`
--

DROP TABLE IF EXISTS `shoppingcart_courseregcodeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregcodeitem` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  `mode` varchar(50) NOT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_courseregcodeitem_b7271b` (`course_id`),
  KEY `shoppingcart_courseregcodeitem_4160619e` (`mode`),
  CONSTRAINT `orderitem_ptr_id_refs_id_5b990f81` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregcodeitem`
--

LOCK TABLES `shoppingcart_courseregcodeitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregcodeitemannotation`
--

DROP TABLE IF EXISTS `shoppingcart_courseregcodeitemannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregcodeitemannotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(128) NOT NULL,
  `annotation` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregcodeitemannotation`
--

LOCK TABLES `shoppingcart_courseregcodeitemannotation` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitemannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitemannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregistrationcode`
--

DROP TABLE IF EXISTS `shoppingcart_courseregistrationcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregistrationcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `invoice_id` int(11),
  `order_id` int(11),
  `mode_slug` varchar(100),
  `invoice_item_id` int(11),
  `is_valid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shoppingcart_courseregistrationcode_code_3519de67_uniq` (`code`),
  KEY `shoppingcart_courseregistrationcode_65da3d2c` (`code`),
  KEY `shoppingcart_courseregistrationcode_b7271b` (`course_id`),
  KEY `shoppingcart_courseregistrationcode_4a21cf42` (`created_by_id`),
  KEY `shoppingcart_courseregistrationcode_59f72b12` (`invoice_id`),
  KEY `shoppingcart_courseregistrationcode_7cc8fcf5` (`order_id`),
  KEY `shoppingcart_courseregistrationcode_7f8999bf` (`invoice_item_id`),
  CONSTRAINT `created_by_id_refs_id_38397037` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `invoice_id_refs_id_66a0f518` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`),
  CONSTRAINT `invoice_item_id_refs_invoiceitem_ptr_id_75aaa71a` FOREIGN KEY (`invoice_item_id`) REFERENCES `shoppingcart_courseregistrationcodeinvoiceitem` (`invoiceitem_ptr_id`),
  CONSTRAINT `order_id_refs_id_41c927c9` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregistrationcode`
--

LOCK TABLES `shoppingcart_courseregistrationcode` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregistrationcodeinvoiceitem`
--

DROP TABLE IF EXISTS `shoppingcart_courseregistrationcodeinvoiceitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregistrationcodeinvoiceitem` (
  `invoiceitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  PRIMARY KEY (`invoiceitem_ptr_id`),
  KEY `shoppingcart_courseregistrationcodeinvoiceitem_b7271b` (`course_id`),
  CONSTRAINT `invoiceitem_ptr_id_refs_id_74a11b46` FOREIGN KEY (`invoiceitem_ptr_id`) REFERENCES `shoppingcart_invoiceitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregistrationcodeinvoiceitem`
--

LOCK TABLES `shoppingcart_courseregistrationcodeinvoiceitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcodeinvoiceitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcodeinvoiceitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_donation`
--

DROP TABLE IF EXISTS `shoppingcart_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_donation` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `donation_type` varchar(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_donation_b7271b` (`course_id`),
  CONSTRAINT `orderitem_ptr_id_refs_id_48ec75b5` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_donation`
--

LOCK TABLES `shoppingcart_donation` WRITE;
/*!40000 ALTER TABLE `shoppingcart_donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_donationconfiguration`
--

DROP TABLE IF EXISTS `shoppingcart_donationconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_donationconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_donationconfiguration_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_4b5d9481` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_donationconfiguration`
--

LOCK TABLES `shoppingcart_donationconfiguration` WRITE;
/*!40000 ALTER TABLE `shoppingcart_donationconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_donationconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoice`
--

DROP TABLE IF EXISTS `shoppingcart_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_amount` double NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `internal_reference` varchar(255),
  `is_valid` tinyint(1) NOT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `address_line_2` varchar(255),
  `address_line_3` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `zip` varchar(15),
  `country` varchar(64),
  `recipient_name` varchar(255) NOT NULL,
  `recipient_email` varchar(255) NOT NULL,
  `customer_reference_number` varchar(63),
  `company_contact_name` varchar(255) NOT NULL,
  `company_contact_email` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoice_356fde5e` (`company_name`),
  KEY `shoppingcart_invoice_b7271b` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoice`
--

LOCK TABLES `shoppingcart_invoice` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoicehistory`
--

DROP TABLE IF EXISTS `shoppingcart_invoicehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoicehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `snapshot` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoicehistory_67f1b7ce` (`timestamp`),
  KEY `shoppingcart_invoicehistory_59f72b12` (`invoice_id`),
  CONSTRAINT `invoice_id_refs_id_239c2b7c` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoicehistory`
--

LOCK TABLES `shoppingcart_invoicehistory` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoicehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoicehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoiceitem`
--

DROP TABLE IF EXISTS `shoppingcart_invoiceitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoiceitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` decimal(30,2) NOT NULL,
  `currency` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoiceitem_59f72b12` (`invoice_id`),
  CONSTRAINT `invoice_id_refs_id_5c894802` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoiceitem`
--

LOCK TABLES `shoppingcart_invoiceitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoiceitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoiceitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoicetransaction`
--

DROP TABLE IF EXISTS `shoppingcart_invoicetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoicetransaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` decimal(30,2) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `comments` longtext,
  `status` varchar(32) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `last_modified_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoicetransaction_59f72b12` (`invoice_id`),
  KEY `shoppingcart_invoicetransaction_4a21cf42` (`created_by_id`),
  KEY `shoppingcart_invoicetransaction_4329392e` (`last_modified_by_id`),
  CONSTRAINT `created_by_id_refs_id_7259d0bb` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `invoice_id_refs_id_71a49d14` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`),
  CONSTRAINT `last_modified_by_id_refs_id_7259d0bb` FOREIGN KEY (`last_modified_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoicetransaction`
--

LOCK TABLES `shoppingcart_invoicetransaction` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoicetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoicetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_order`
--

DROP TABLE IF EXISTS `shoppingcart_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `status` varchar(32) NOT NULL,
  `purchase_time` datetime DEFAULT NULL,
  `bill_to_first` varchar(64) NOT NULL,
  `bill_to_last` varchar(64) NOT NULL,
  `bill_to_street1` varchar(128) NOT NULL,
  `bill_to_street2` varchar(128) NOT NULL,
  `bill_to_city` varchar(64) NOT NULL,
  `bill_to_state` varchar(8) NOT NULL,
  `bill_to_postalcode` varchar(16) NOT NULL,
  `bill_to_country` varchar(64) NOT NULL,
  `bill_to_ccnum` varchar(8) NOT NULL,
  `bill_to_cardtype` varchar(32) NOT NULL,
  `processor_reply_dump` longtext NOT NULL,
  `refunded_time` datetime,
  `company_name` varchar(255),
  `company_contact_name` varchar(255),
  `company_contact_email` varchar(255),
  `recipient_name` varchar(255),
  `recipient_email` varchar(255),
  `customer_reference_number` varchar(63),
  `order_type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_order_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_1ee6a98d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_order`
--

LOCK TABLES `shoppingcart_order` WRITE;
/*!40000 ALTER TABLE `shoppingcart_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_orderitem`
--

DROP TABLE IF EXISTS `shoppingcart_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(32) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_cost` decimal(30,2) NOT NULL,
  `line_desc` varchar(1024) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `fulfilled_time` datetime,
  `report_comments` longtext NOT NULL,
  `refund_requested_time` datetime,
  `service_fee` decimal(30,2) NOT NULL,
  `list_price` decimal(30,2),
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_orderitem_7cc8fcf5` (`order_id`),
  KEY `shoppingcart_orderitem_403f60f` (`user_id`),
  KEY `shoppingcart_orderitem_36528e23` (`status`),
  KEY `shoppingcart_orderitem_7ba80d96` (`fulfilled_time`),
  KEY `shoppingcart_orderitem_416112c1` (`refund_requested_time`),
  CONSTRAINT `order_id_refs_id_7c77b3f0` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `user_id_refs_id_26d51bf0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_orderitem`
--

LOCK TABLES `shoppingcart_orderitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_paidcourseregistration`
--

DROP TABLE IF EXISTS `shoppingcart_paidcourseregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_paidcourseregistration` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `course_enrollment_id` int(11),
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_paidcourseregistration_b7271b` (`course_id`),
  KEY `shoppingcart_paidcourseregistration_4160619e` (`mode`),
  KEY `shoppingcart_paidcourseregistration_61aec0f5` (`course_enrollment_id`),
  CONSTRAINT `course_enrollment_id_refs_id_23f9e41a` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `orderitem_ptr_id_refs_id_278f6267` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_paidcourseregistration`
--

LOCK TABLES `shoppingcart_paidcourseregistration` WRITE;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistration` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_paidcourseregistrationannotation`
--

DROP TABLE IF EXISTS `shoppingcart_paidcourseregistrationannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_paidcourseregistrationannotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(128) NOT NULL,
  `annotation` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_paidcourseregistrationannotation`
--

LOCK TABLES `shoppingcart_paidcourseregistrationannotation` WRITE;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistrationannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistrationannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_registrationcoderedemption`
--

DROP TABLE IF EXISTS `shoppingcart_registrationcoderedemption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_registrationcoderedemption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11),
  `registration_code_id` int(11) NOT NULL,
  `redeemed_by_id` int(11) NOT NULL,
  `redeemed_at` datetime DEFAULT NULL,
  `course_enrollment_id` int(11),
  PRIMARY KEY (`id`),
  KEY `shoppingcart_registrationcoderedemption_7cc8fcf5` (`order_id`),
  KEY `shoppingcart_registrationcoderedemption_2da4c824` (`registration_code_id`),
  KEY `shoppingcart_registrationcoderedemption_1eaeb986` (`redeemed_by_id`),
  KEY `shoppingcart_registrationcoderedemption_61aec0f5` (`course_enrollment_id`),
  CONSTRAINT `course_enrollment_id_refs_id_36b79ed9` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `order_id_refs_id_53a8a5c9` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `redeemed_by_id_refs_id_4e320dc9` FOREIGN KEY (`redeemed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `registration_code_id_refs_id_4d01e47b` FOREIGN KEY (`registration_code_id`) REFERENCES `shoppingcart_courseregistrationcode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_registrationcoderedemption`
--

LOCK TABLES `shoppingcart_registrationcoderedemption` WRITE;
/*!40000 ALTER TABLE `shoppingcart_registrationcoderedemption` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_registrationcoderedemption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'status','0001_initial','2015-10-26 12:26:40'),(2,'courseware','0001_initial','2015-10-26 12:26:41'),(3,'courseware','0002_add_indexes','2015-10-26 12:26:43'),(4,'courseware','0003_done_grade_cache','2015-10-26 12:26:45'),(5,'courseware','0004_add_field_studentmodule_course_id','2015-10-26 12:26:47'),(6,'courseware','0005_auto__add_offlinecomputedgrade__add_unique_offlinecomputedgrade_user_c','2015-10-26 12:26:49'),(7,'courseware','0006_create_student_module_history','2015-10-26 12:26:50'),(8,'courseware','0007_allow_null_version_in_history','2015-10-26 12:26:51'),(9,'courseware','0008_add_xmodule_storage','2015-10-26 12:26:58'),(10,'courseware','0009_add_field_default','2015-10-26 12:27:01'),(11,'courseware','0010_rename_xblock_field_content_to_user_state_summary','2015-10-26 12:27:01'),(12,'courseware','0011_add_model_StudentFieldOverride','2015-10-26 12:27:03'),(13,'courseware','0012_auto__del_unique_studentfieldoverride_course_id_location_student__add_','2015-10-26 12:27:03'),(14,'courseware','0013_auto__add_field_studentfieldoverride_created__add_field_studentfieldov','2015-10-26 12:27:05'),(15,'xblock_django','0001_initial','2015-10-26 12:27:06'),(16,'student','0001_initial','2015-10-26 12:27:07'),(17,'student','0002_text_to_varchar_and_indexes','2015-10-26 12:27:11'),(18,'student','0003_auto__add_usertestgroup','2015-10-26 12:27:13'),(19,'student','0004_add_email_index','2015-10-26 12:27:14'),(20,'student','0005_name_change','2015-10-26 12:27:15'),(21,'student','0006_expand_meta_field','2015-10-26 12:27:16'),(22,'student','0007_convert_to_utf8','2015-10-26 12:27:16'),(23,'student','0008__auto__add_courseregistration','2015-10-26 12:27:17'),(24,'student','0009_auto__del_courseregistration__add_courseenrollment','2015-10-26 12:27:17'),(25,'student','0010_auto__chg_field_courseenrollment_course_id','2015-10-26 12:27:18'),(26,'student','0011_auto__chg_field_courseenrollment_user__del_unique_courseenrollment_use','2015-10-26 12:27:18'),(27,'student','0012_auto__add_field_userprofile_gender__add_field_userprofile_date_of_birt','2015-10-26 12:27:22'),(28,'student','0013_auto__chg_field_userprofile_meta','2015-10-26 12:27:23'),(29,'student','0014_auto__del_courseenrollment','2015-10-26 12:27:23'),(30,'student','0015_auto__add_courseenrollment__add_unique_courseenrollment_user_course_id','2015-10-26 12:27:24'),(31,'student','0016_auto__add_field_courseenrollment_date__chg_field_userprofile_country','2015-10-26 12:27:25'),(32,'student','0017_rename_date_to_created','2015-10-26 12:27:26'),(33,'student','0018_auto','2015-10-26 12:27:26'),(34,'student','0019_create_approved_demographic_fields_fall_2012','2015-10-26 12:27:32'),(35,'student','0020_add_test_center_user','2015-10-26 12:27:35'),(36,'student','0021_remove_askbot','2015-10-26 12:27:35'),(37,'student','0022_auto__add_courseenrollmentallowed__add_unique_courseenrollmentallowed_','2015-10-26 12:27:37'),(38,'student','0023_add_test_center_registration','2015-10-26 12:27:48'),(39,'student','0024_add_allow_certificate','2015-10-26 12:27:49'),(40,'student','0025_auto__add_field_courseenrollmentallowed_auto_enroll','2015-10-26 12:27:50'),(41,'student','0026_auto__remove_index_student_testcenterregistration_accommodation_request','2015-10-26 12:27:50'),(42,'student','0027_add_active_flag_and_mode_to_courseware_enrollment','2015-10-26 12:27:52'),(43,'student','0028_auto__add_userstanding','2015-10-26 12:27:53'),(44,'student','0029_add_lookup_table_between_user_and_anonymous_student_id','2015-10-26 12:27:54'),(45,'student','0029_remove_pearson','2015-10-26 12:27:54'),(46,'student','0030_auto__chg_field_anonymoususerid_anonymous_user_id','2015-10-26 12:27:55'),(47,'student','0031_drop_student_anonymoususerid_temp_archive','2015-10-26 12:27:55'),(48,'student','0032_add_field_UserProfile_country_add_field_UserProfile_city','2015-10-26 12:27:57'),(49,'student','0032_auto__add_loginfailures','2015-10-26 12:27:58'),(50,'student','0033_auto__add_passwordhistory','2015-10-26 12:27:59'),(51,'student','0034_auto__add_courseaccessrole','2015-10-26 12:28:01'),(52,'student','0035_access_roles','2015-10-26 12:28:02'),(53,'student','0036_access_roles_orgless','2015-10-26 12:28:02'),(54,'student','0037_auto__add_courseregistrationcode','2015-10-26 12:28:05'),(55,'student','0038_auto__add_usersignupsource','2015-10-26 12:28:06'),(56,'student','0039_auto__del_courseregistrationcode','2015-10-26 12:28:06'),(57,'student','0040_auto__del_field_usersignupsource_user_id__add_field_usersignupsource_u','2015-10-26 12:28:08'),(58,'student','0041_add_dashboard_config','2015-10-26 12:28:09'),(59,'student','0042_grant_sales_admin_roles','2015-10-26 12:28:09'),(60,'student','0043_auto__add_linkedinaddtoprofileconfiguration','2015-10-26 12:28:10'),(61,'student','0044_linkedin_add_company_identifier','2015-10-26 12:28:10'),(62,'student','0045_add_trk_partner_to_linkedin_config','2015-10-26 12:28:11'),(63,'student','0046_auto__add_entranceexamconfiguration__add_unique_entranceexamconfigurat','2015-10-26 12:28:13'),(64,'student','0047_add_bio_field','2015-10-26 12:28:14'),(65,'student','0048_add_profile_image_version','2015-10-26 12:28:15'),(66,'student','0049_auto__add_languageproficiency__add_unique_languageproficiency_code_use','2015-10-26 12:28:16'),(67,'student','0050_auto__add_manualenrollmentaudit','2015-10-26 12:28:17'),(68,'student','0051_auto__add_courseenrollmentattribute','2015-10-26 12:28:18'),(69,'student','0052_auto__add_historicalcourseenrollment','2015-10-26 12:28:21'),(70,'track','0001_initial','2015-10-26 12:28:22'),(71,'track','0002_auto__add_field_trackinglog_host__chg_field_trackinglog_event_type__ch','2015-10-26 12:28:24'),(72,'util','0001_initial','2015-10-26 12:28:25'),(73,'util','0002_default_rate_limit_config','2015-10-26 12:28:25'),(74,'certificates','0001_added_generatedcertificates','2015-10-26 12:28:26'),(75,'certificates','0002_auto__add_field_generatedcertificate_download_url','2015-10-26 12:28:27'),(76,'certificates','0003_auto__add_field_generatedcertificate_enabled','2015-10-26 12:28:27'),(77,'certificates','0004_auto__add_field_generatedcertificate_graded_certificate_id__add_field_','2015-10-26 12:28:29'),(78,'certificates','0005_auto__add_field_generatedcertificate_name','2015-10-26 12:28:30'),(79,'certificates','0006_auto__chg_field_generatedcertificate_certificate_id','2015-10-26 12:28:31'),(80,'certificates','0007_auto__add_revokedcertificate','2015-10-26 12:28:31'),(81,'certificates','0008_auto__del_revokedcertificate__del_field_generatedcertificate_name__add','2015-10-26 12:28:36'),(82,'certificates','0009_auto__del_field_generatedcertificate_graded_download_url__del_field_ge','2015-10-26 12:28:38'),(83,'certificates','0010_auto__del_field_generatedcertificate_enabled__add_field_generatedcerti','2015-10-26 12:28:40'),(84,'certificates','0011_auto__del_field_generatedcertificate_certificate_id__add_field_generat','2015-10-26 12:28:41'),(85,'certificates','0012_auto__add_field_generatedcertificate_name__add_field_generatedcertific','2015-10-26 12:28:43'),(86,'certificates','0013_auto__add_field_generatedcertificate_error_reason','2015-10-26 12:28:44'),(87,'certificates','0014_adding_whitelist','2015-10-26 12:28:45'),(88,'certificates','0015_adding_mode_for_verified_certs','2015-10-26 12:28:46'),(89,'certificates','0016_change_course_key_fields','2015-10-26 12:28:46'),(90,'certificates','0017_auto__add_certificategenerationconfiguration','2015-10-26 12:28:47'),(91,'certificates','0018_add_example_cert_models','2015-10-26 12:28:49'),(92,'certificates','0019_auto__add_certificatehtmlviewconfiguration','2015-10-26 12:28:50'),(93,'certificates','0020_certificatehtmlviewconfiguration_data','2015-10-26 12:28:50'),(94,'certificates','0021_auto__add_badgeassertion__add_unique_badgeassertion_course_id_user__ad','2015-10-26 12:28:52'),(95,'certificates','0022_default_modes','2015-10-26 12:28:52'),(96,'certificates','0023_auto__del_unique_badgeassertion_course_id_user__add_unique_badgeassert','2015-10-26 12:28:52'),(97,'certificates','0024_auto__add_certificatetemplate__add_unique_certificatetemplate_organiza','2015-10-26 12:28:54'),(98,'instructor_task','0001_initial','2015-10-26 12:28:56'),(99,'instructor_task','0002_add_subtask_field','2015-10-26 12:28:57'),(100,'licenses','0001_initial','2015-10-26 12:28:59'),(101,'course_groups','0001_initial','2015-10-26 12:29:02'),(102,'course_groups','0002_add_model_CourseUserGroupPartitionGroup','2015-10-26 12:29:02'),(103,'course_groups','0003_auto__add_coursecohort__add_coursecohortssettings','2015-10-26 12:29:03'),(104,'course_groups','0004_auto__del_field_coursecohortssettings_cohorted_discussions__add_field_','2015-10-26 12:29:03'),(105,'bulk_email','0001_initial','2015-10-26 12:29:06'),(106,'bulk_email','0002_change_field_names','2015-10-26 12:29:07'),(107,'bulk_email','0003_add_optout_user','2015-10-26 12:29:09'),(108,'bulk_email','0004_migrate_optout_user','2015-10-26 12:29:09'),(109,'bulk_email','0005_remove_optout_email','2015-10-26 12:29:09'),(110,'bulk_email','0006_add_course_email_template','2015-10-26 12:29:10'),(111,'bulk_email','0007_load_course_email_template','2015-10-26 12:29:10'),(112,'bulk_email','0008_add_course_authorizations','2015-10-26 12:29:10'),(113,'bulk_email','0009_force_unique_course_ids','2015-10-26 12:29:11'),(114,'bulk_email','0010_auto__chg_field_optout_course_id__add_field_courseemail_template_name_','2015-10-26 12:29:13'),(115,'branding','0001_initial','2015-10-26 12:29:14'),(116,'branding','0002_auto__add_brandingapiconfig','2015-10-26 12:29:15'),(117,'external_auth','0001_initial','2015-10-26 12:29:17'),(118,'oauth2','0001_initial','2015-10-26 12:29:23'),(119,'oauth2','0002_auto__chg_field_client_user','2015-10-26 12:29:23'),(120,'oauth2','0003_auto__add_field_client_name','2015-10-26 12:29:24'),(121,'oauth2','0004_auto__add_index_accesstoken_token','2015-10-26 12:29:24'),(122,'oauth2_provider','0001_initial','2015-10-26 12:29:26'),(123,'wiki','0001_initial','2015-10-26 12:29:38'),(124,'wiki','0002_auto__add_field_articleplugin_created','2015-10-26 12:29:38'),(125,'wiki','0003_auto__add_field_urlpath_article','2015-10-26 12:29:40'),(126,'wiki','0004_populate_urlpath__article','2015-10-26 12:29:40'),(127,'wiki','0005_auto__chg_field_urlpath_article','2015-10-26 12:29:41'),(128,'wiki','0006_auto__add_attachmentrevision__add_image__add_attachment','2015-10-26 12:29:44'),(129,'wiki','0007_auto__add_articlesubscription','2015-10-26 12:29:44'),(130,'wiki','0008_auto__add_simpleplugin__add_revisionpluginrevision__add_imagerevision_','2015-10-26 12:29:50'),(131,'wiki','0009_auto__add_field_imagerevision_width__add_field_imagerevision_height','2015-10-26 12:29:51'),(132,'wiki','0010_auto__chg_field_imagerevision_image','2015-10-26 12:29:52'),(133,'wiki','0011_auto__chg_field_imagerevision_width__chg_field_imagerevision_height','2015-10-26 12:29:53'),(134,'django_notify','0001_initial','2015-10-26 12:29:57'),(135,'notifications','0001_initial','2015-10-26 12:29:58'),(136,'foldit','0001_initial','2015-10-26 12:30:02'),(137,'django_comment_client','0001_initial','2015-10-26 12:30:05'),(138,'django_comment_common','0001_initial','2015-10-26 12:30:06'),(139,'notes','0001_initial','2015-10-26 12:30:08'),(140,'splash','0001_initial','2015-10-26 12:30:09'),(141,'splash','0002_auto__add_field_splashconfig_unaffected_url_paths','2015-10-26 12:30:09'),(142,'user_api','0001_initial','2015-10-26 12:30:11'),(143,'user_api','0002_auto__add_usercoursetags__add_unique_usercoursetags_user_course_id_key','2015-10-26 12:30:12'),(144,'user_api','0003_rename_usercoursetags','2015-10-26 12:30:13'),(145,'user_api','0004_auto__add_userorgtag__add_unique_userorgtag_user_org_key__chg_field_us','2015-10-26 12:30:14'),(146,'shoppingcart','0001_initial','2015-10-26 12:30:19'),(147,'shoppingcart','0002_auto__add_field_paidcourseregistration_mode','2015-10-26 12:30:20'),(148,'shoppingcart','0003_auto__del_field_orderitem_line_cost','2015-10-26 12:30:20'),(149,'shoppingcart','0004_auto__add_field_orderitem_fulfilled_time','2015-10-26 12:30:21'),(150,'shoppingcart','0005_auto__add_paidcourseregistrationannotation__add_field_orderitem_report','2015-10-26 12:30:22'),(151,'shoppingcart','0006_auto__add_field_order_refunded_time__add_field_orderitem_refund_reques','2015-10-26 12:30:23'),(152,'shoppingcart','0007_auto__add_field_orderitem_service_fee','2015-10-26 12:30:25'),(153,'shoppingcart','0008_auto__add_coupons__add_couponredemption__chg_field_certificateitem_cou','2015-10-26 12:30:29'),(154,'shoppingcart','0009_auto__del_coupons__add_courseregistrationcode__add_coupon__chg_field_c','2015-10-26 12:30:34'),(155,'shoppingcart','0010_auto__add_registrationcoderedemption__del_field_courseregistrationcode','2015-10-26 12:30:38'),(156,'shoppingcart','0011_auto__add_invoice__add_field_courseregistrationcode_invoice','2015-10-26 12:30:40'),(157,'shoppingcart','0012_auto__del_field_courseregistrationcode_transaction_group_name__del_fie','2015-10-26 12:30:46'),(158,'shoppingcart','0013_auto__add_field_invoice_is_valid','2015-10-26 12:30:47'),(159,'shoppingcart','0014_auto__del_field_invoice_tax_id__add_field_invoice_address_line_1__add_','2015-10-26 12:30:53'),(160,'shoppingcart','0015_auto__del_field_invoice_purchase_order_number__del_field_invoice_compa','2015-10-26 12:30:57'),(161,'shoppingcart','0016_auto__del_field_invoice_company_email__del_field_invoice_company_refer','2015-10-26 12:30:59'),(162,'shoppingcart','0017_auto__add_field_courseregistrationcode_order__chg_field_registrationco','2015-10-26 12:31:02'),(163,'shoppingcart','0018_auto__add_donation','2015-10-26 12:31:02'),(164,'shoppingcart','0019_auto__add_donationconfiguration','2015-10-26 12:31:03'),(165,'shoppingcart','0020_auto__add_courseregcodeitem__add_courseregcodeitemannotation__add_fiel','2015-10-26 12:31:08'),(166,'shoppingcart','0021_auto__add_field_orderitem_created__add_field_orderitem_modified','2015-10-26 12:31:10'),(167,'shoppingcart','0022_auto__add_field_registrationcoderedemption_course_enrollment__add_fiel','2015-10-26 12:31:13'),(168,'shoppingcart','0023_auto__add_field_coupon_expiration_date','2015-10-26 12:31:13'),(169,'shoppingcart','0024_auto__add_field_courseregistrationcode_mode_slug','2015-10-26 12:31:14'),(170,'shoppingcart','0025_update_invoice_models','2015-10-26 12:31:21'),(171,'shoppingcart','0026_migrate_invoices','2015-10-26 12:31:21'),(172,'shoppingcart','0027_add_invoice_history','2015-10-26 12:31:22'),(173,'shoppingcart','0028_auto__add_field_courseregistrationcode_is_valid','2015-10-26 12:31:23'),(174,'course_modes','0001_initial','2015-10-26 12:31:25'),(175,'course_modes','0002_auto__add_field_coursemode_currency','2015-10-26 12:31:26'),(176,'course_modes','0003_auto__add_unique_coursemode_course_id_currency_mode_slug','2015-10-26 12:31:26'),(177,'course_modes','0004_auto__add_field_coursemode_expiration_date','2015-10-26 12:31:26'),(178,'course_modes','0005_auto__add_field_coursemode_expiration_datetime','2015-10-26 12:31:27'),(179,'course_modes','0006_expiration_date_to_datetime','2015-10-26 12:31:27'),(180,'course_modes','0007_add_description','2015-10-26 12:31:28'),(181,'course_modes','0007_auto__add_coursemodesarchive__chg_field_coursemode_course_id','2015-10-26 12:31:29'),(182,'course_modes','0008_auto__del_field_coursemodesarchive_description__add_field_coursemode_s','2015-10-26 12:31:29'),(183,'verify_student','0001_initial','2015-10-26 12:31:32'),(184,'verify_student','0002_auto__add_field_softwaresecurephotoverification_window','2015-10-26 12:31:34'),(185,'verify_student','0003_auto__add_field_softwaresecurephotoverification_display','2015-10-26 12:31:35'),(186,'verify_student','0004_auto__add_verificationcheckpoint__add_unique_verificationcheckpoint_co','2015-10-26 12:31:39'),(187,'verify_student','0005_auto__add_incoursereverificationconfiguration','2015-10-26 12:31:40'),(188,'verify_student','0006_auto__add_skippedreverification__add_unique_skippedreverification_user','2015-10-26 12:31:41'),(189,'verify_student','0007_auto__add_field_verificationstatus_location_id','2015-10-26 12:31:42'),(190,'verify_student','0008_auto__del_field_verificationcheckpoint_checkpoint_name__add_field_veri','2015-10-26 12:31:44'),(191,'verify_student','0009_auto__change_softwaresecurephotoverification_window_id_default_none','2015-10-26 12:31:44'),(192,'verify_student','0010_auto__del_field_softwaresecurephotoverification_window','2015-10-26 12:31:45'),(193,'verify_student','0011_add_verification_deadline','2015-10-26 12:31:47'),(194,'verify_student','0012_populate_verification_deadlines','2015-10-26 12:31:47'),(195,'dark_lang','0001_initial','2015-10-26 12:31:48'),(196,'dark_lang','0002_enable_on_install','2015-10-26 12:31:48'),(197,'reverification','0001_initial','2015-10-26 12:31:49'),(198,'reverification','0002_auto__del_midcoursereverificationwindow','2015-10-26 12:31:49'),(199,'embargo','0001_initial','2015-10-26 12:31:52'),(200,'embargo','0002_add_country_access_models','2015-10-26 12:31:54'),(201,'embargo','0003_add_countries','2015-10-26 12:31:55'),(202,'embargo','0004_migrate_embargo_config','2015-10-26 12:31:55'),(203,'embargo','0005_add_courseaccessrulehistory','2015-10-26 12:31:55'),(204,'embargo','0006_auto__add_field_restrictedcourse_disable_access_check','2015-10-26 12:31:56'),(205,'course_action_state','0001_initial','2015-10-26 12:31:59'),(206,'course_action_state','0002_add_rerun_display_name','2015-10-26 12:32:00'),(207,'mobile_api','0001_initial','2015-10-26 12:32:01'),(208,'survey','0001_initial','2015-10-26 12:32:03'),(209,'lms_xblock','0001_initial','2015-10-26 12:32:04'),(210,'course_overviews','0001_initial','2015-10-26 12:32:05'),(211,'course_overviews','0002_add_days_early_for_beta','2015-10-26 12:32:06'),(212,'course_overviews','0003_add_cert_html_view_enabled','2015-10-26 12:32:06'),(213,'course_overviews','0004_default_lowest_passing_grade_to_None','2015-10-26 12:32:07'),(214,'course_overviews','0005_add_enrollment_fields','2015-10-26 12:32:09'),(215,'course_overviews','0006_add_version_and_timestamp','2015-10-26 12:32:11'),(216,'course_structures','0001_initial','2015-10-26 12:32:12'),(217,'course_structures','0002_auto__add_field_coursestructure_discussion_id_map_json','2015-10-26 12:32:13'),(218,'cors_csrf','0001_initial','2015-10-26 12:32:14'),(219,'teams','0001_initial','2015-10-26 12:32:17'),(220,'teams','0002_auto__add_field_courseteam_discussion_id','2015-10-26 12:32:18'),(221,'teams','0003_auto__add_index_courseteam_name','2015-10-26 12:32:18'),(222,'submissions','0001_initial','2015-10-26 12:32:24'),(223,'submissions','0002_auto__add_scoresummary','2015-10-26 12:32:25'),(224,'submissions','0003_auto__del_field_submission_answer__add_field_submission_raw_answer','2015-10-26 12:32:27'),(225,'submissions','0004_auto__add_field_score_reset','2015-10-26 12:32:27'),(226,'assessment','0001_initial','2015-10-26 12:32:39'),(227,'assessment','0002_auto__add_assessmentfeedbackoption__del_field_assessmentfeedback_feedb','2015-10-26 12:32:43'),(228,'assessment','0003_add_index_pw_course_item_student','2015-10-26 12:32:43'),(229,'assessment','0004_auto__add_field_peerworkflow_graded_count','2015-10-26 12:32:44'),(230,'assessment','0005_auto__del_field_peerworkflow_graded_count__add_field_peerworkflow_grad','2015-10-26 12:32:47'),(231,'assessment','0006_auto__add_field_assessmentpart_feedback','2015-10-26 12:32:47'),(232,'assessment','0007_auto__chg_field_assessmentpart_feedback','2015-10-26 12:32:47'),(233,'assessment','0008_student_training','2015-10-26 12:32:53'),(234,'assessment','0009_auto__add_unique_studenttrainingworkflowitem_order_num_workflow','2015-10-26 12:32:53'),(235,'assessment','0010_auto__add_unique_studenttrainingworkflow_submission_uuid','2015-10-26 12:32:53'),(236,'assessment','0011_ai_training','2015-10-26 12:33:00'),(237,'assessment','0012_move_algorithm_id_to_classifier_set','2015-10-26 12:33:06'),(238,'assessment','0013_auto__add_field_aigradingworkflow_essay_text','2015-10-26 12:33:07'),(239,'assessment','0014_auto__add_field_aitrainingworkflow_item_id__add_field_aitrainingworkfl','2015-10-26 12:33:09'),(240,'assessment','0015_auto__add_unique_aitrainingworkflow_uuid__add_unique_aigradingworkflow','2015-10-26 12:33:09'),(241,'assessment','0016_auto__add_field_aiclassifierset_course_id__add_field_aiclassifierset_i','2015-10-26 12:33:11'),(242,'assessment','0016_auto__add_field_rubric_structure_hash','2015-10-26 12:33:12'),(243,'assessment','0017_rubric_structure_hash','2015-10-26 12:33:12'),(244,'assessment','0018_auto__add_field_assessmentpart_criterion','2015-10-26 12:33:14'),(245,'assessment','0019_assessmentpart_criterion_field','2015-10-26 12:33:14'),(246,'assessment','0020_assessmentpart_criterion_not_null','2015-10-26 12:33:15'),(247,'assessment','0021_assessmentpart_option_nullable','2015-10-26 12:33:15'),(248,'assessment','0022__add_label_fields','2015-10-26 12:33:17'),(249,'assessment','0023_assign_criteria_and_option_labels','2015-10-26 12:33:17'),(250,'assessment','0024_auto__chg_field_assessmentpart_criterion','2015-10-26 12:33:17'),(251,'assessment','0025_auto__add_field_peerworkflow_cancelled_at','2015-10-26 12:33:18'),(252,'workflow','0001_initial','2015-10-26 12:33:20'),(253,'workflow','0002_auto__add_field_assessmentworkflow_course_id__add_field_assessmentwork','2015-10-26 12:33:22'),(254,'workflow','0003_auto__add_assessmentworkflowstep','2015-10-26 12:33:23'),(255,'workflow','0004_auto__add_assessmentworkflowcancellation','2015-10-26 12:33:24'),(256,'edxval','0001_initial','2015-10-26 12:33:30'),(257,'edxval','0002_default_profiles','2015-10-26 12:33:30'),(258,'edxval','0003_status_and_created_fields','2015-10-26 12:33:33'),(259,'edxval','0004_remove_profile_fields','2015-10-26 12:33:35'),(260,'milestones','0001_initial','2015-10-26 12:33:42'),(261,'milestones','0002_seed_relationship_types','2015-10-26 12:33:42'),(262,'edx_proctoring','0001_initial','2015-10-26 12:33:48'),(263,'edx_proctoring','0002_auto__add_field_proctoredexamstudentattempt_attempt_code__add_field_pr','2015-10-26 12:33:50'),(264,'edx_proctoring','0003_auto__add_proctoredexamstudentattempthistory','2015-10-26 12:33:52'),(265,'organizations','0001_initial','2015-10-26 12:33:55'),(266,'organizations','0002_auto__add_field_organization_logo','2015-10-26 12:33:55'),(267,'credit','0001_initial','2015-10-26 12:34:01'),(268,'credit','0002_rename_credit_requirement_criteria_field','2015-10-26 12:34:02'),(269,'credit','0003_add_creditrequirementstatus_reason','2015-10-26 12:34:03'),(270,'credit','0004_auto__add_field_creditrequirement_display_name','2015-10-26 12:34:03'),(271,'credit','0005_auto__add_field_creditprovider_provider_url__add_field_creditprovider_','2015-10-26 12:34:05'),(272,'credit','0006_auto__add_creditrequest__add_unique_creditrequest_username_course_prov','2015-10-26 12:34:12'),(273,'credit','0007_auto__add_field_creditprovider_enable_integration__chg_field_creditpro','2015-10-26 12:34:13'),(274,'credit','0008_delete_credit_provider_timestamp','2015-10-26 12:34:15'),(275,'credit','0009_auto__del_field_crediteligibility_provider','2015-10-26 12:34:16'),(276,'credit','0010_add_creditrequirementstatus_history','2015-10-26 12:34:18'),(277,'credit','0011_auto__add_field_creditrequirement_order','2015-10-26 12:34:19'),(278,'credit','0012_remove_m2m_course_and_provider','2015-10-26 12:34:20'),(279,'credit','0013_add_provider_status_url','2015-10-26 12:34:21'),(280,'credit','0014_auto__add_field_creditprovider_fulfillment_instructions','2015-10-26 12:34:22'),(281,'credit','0015_auto__add_field_creditprovider_provider_description','2015-10-26 12:34:22'),(282,'credit','0016_auto__add_field_creditprovider_eligibility_email_message__add_field_cr','2015-10-26 12:34:23'),(283,'credit','0017_auto__add_field_creditprovider_thumbnail_url','2015-10-26 12:34:24'),(284,'contentstore','0001_initial','2015-10-26 12:34:30'),(285,'contentstore','0002_auto__del_field_videouploadconfig_status_whitelist','2015-10-26 12:34:31'),(286,'contentstore','0003_auto__add_pushnotificationconfig','2015-10-26 12:34:32'),(287,'course_creators','0001_initial','2015-10-26 12:34:33'),(288,'xblock_config','0001_initial','2015-10-26 12:34:34');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splash_splashconfig`
--

DROP TABLE IF EXISTS `splash_splashconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `splash_splashconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `cookie_name` longtext NOT NULL,
  `cookie_allowed_values` longtext NOT NULL,
  `unaffected_usernames` longtext NOT NULL,
  `redirect_url` varchar(200) NOT NULL,
  `unaffected_url_paths` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `splash_splashconfig_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_6eda4de4` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `splash_splashconfig`
--

LOCK TABLES `splash_splashconfig` WRITE;
/*!40000 ALTER TABLE `splash_splashconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `splash_splashconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_coursemessage`
--

DROP TABLE IF EXISTS `status_coursemessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_coursemessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `global_message_id` int(11) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `message` longtext,
  PRIMARY KEY (`id`),
  KEY `status_coursemessage_573f36a3` (`global_message_id`),
  KEY `status_coursemessage_4b4b8186` (`course_key`),
  CONSTRAINT `global_message_id_refs_id_31b1d445` FOREIGN KEY (`global_message_id`) REFERENCES `status_globalstatusmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_coursemessage`
--

LOCK TABLES `status_coursemessage` WRITE;
/*!40000 ALTER TABLE `status_coursemessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_coursemessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_globalstatusmessage`
--

DROP TABLE IF EXISTS `status_globalstatusmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_globalstatusmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `message` longtext,
  PRIMARY KEY (`id`),
  KEY `status_globalstatusmessage_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_30826a87` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_globalstatusmessage`
--

LOCK TABLES `status_globalstatusmessage` WRITE;
/*!40000 ALTER TABLE `status_globalstatusmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_globalstatusmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_anonymoususerid`
--

DROP TABLE IF EXISTS `student_anonymoususerid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_anonymoususerid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `anonymous_user_id` varchar(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `anonymous_user_id` (`anonymous_user_id`),
  KEY `student_anonymoususerid_403f60f` (`user_id`),
  KEY `student_anonymoususerid_b7271b` (`course_id`),
  CONSTRAINT `user_id_refs_id_3c7085d6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_anonymoususerid`
--

LOCK TABLES `student_anonymoususerid` WRITE;
/*!40000 ALTER TABLE `student_anonymoususerid` DISABLE KEYS */;
INSERT INTO `student_anonymoususerid` VALUES (1,7,'8f14e45fceea167a5a36dedd4bea2543',''),(2,7,'b1cbf16e220bf615591b33e20a0f64c1','course-v1:edX+DemoX+Demo_Course'),(3,9,'45c48cce2e2d7fbdea1afc51c7c6ad26',''),(4,9,'e430d50f68a3d337b5296f0c5820b95b','course-v1:edX+DemoX+Demo_Course');
/*!40000 ALTER TABLE `student_anonymoususerid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseaccessrole`
--

DROP TABLE IF EXISTS `student_courseaccessrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseaccessrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `org` varchar(64) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `role` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courseaccessrole_user_id_4f474414_uniq` (`user_id`,`org`,`course_id`,`role`),
  KEY `student_courseaccessrole_403f60f` (`user_id`),
  KEY `student_courseaccessrole_4f5f82e2` (`org`),
  KEY `student_courseaccessrole_b7271b` (`course_id`),
  KEY `student_courseaccessrole_1f4f7d5f` (`role`),
  CONSTRAINT `user_id_refs_id_6ac23885` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseaccessrole`
--

LOCK TABLES `student_courseaccessrole` WRITE;
/*!40000 ALTER TABLE `student_courseaccessrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseaccessrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollment`
--

DROP TABLE IF EXISTS `student_courseenrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `mode` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courseenrollment_user_id_7dd8e37_uniq` (`user_id`,`course_id`),
  KEY `student_courseenrollment_403f60f` (`user_id`),
  KEY `student_courseenrollment_b7271b` (`course_id`),
  KEY `student_courseenrollment_3216ff68` (`created`),
  CONSTRAINT `user_id_refs_id_12c84363` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollment`
--

LOCK TABLES `student_courseenrollment` WRITE;
/*!40000 ALTER TABLE `student_courseenrollment` DISABLE KEYS */;
INSERT INTO `student_courseenrollment` VALUES (1,1,'edX/DemoX/Demo_Course','2015-10-26 12:53:50',1,'honor'),(2,2,'edX/DemoX/Demo_Course','2015-10-26 12:53:53',1,'audit'),(3,3,'edX/DemoX/Demo_Course','2015-10-26 12:53:57',1,'verified'),(4,4,'edX/DemoX/Demo_Course','2015-10-26 12:54:00',1,'honor'),(5,7,'course-v1:edX+DemoX+Demo_Course','2015-10-26 17:17:07',1,'honor'),(6,9,'course-v1:edX+DemoX+Demo_Course','2015-10-27 11:54:52',1,'honor');
/*!40000 ALTER TABLE `student_courseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollmentallowed`
--

DROP TABLE IF EXISTS `student_courseenrollmentallowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollmentallowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `auto_enroll` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courseenrollmentallowed_email_593a7a6f_uniq` (`email`,`course_id`),
  KEY `student_courseenrollmentallowed_3904588a` (`email`),
  KEY `student_courseenrollmentallowed_b7271b` (`course_id`),
  KEY `student_courseenrollmentallowed_3216ff68` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollmentallowed`
--

LOCK TABLES `student_courseenrollmentallowed` WRITE;
/*!40000 ALTER TABLE `student_courseenrollmentallowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseenrollmentallowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollmentattribute`
--

DROP TABLE IF EXISTS `student_courseenrollmentattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollmentattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_id` int(11) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_courseenrollmentattribute_ab10102` (`enrollment_id`),
  CONSTRAINT `enrollment_id_refs_id_68b9e622` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollmentattribute`
--

LOCK TABLES `student_courseenrollmentattribute` WRITE;
/*!40000 ALTER TABLE `student_courseenrollmentattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseenrollmentattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_dashboardconfiguration`
--

DROP TABLE IF EXISTS `student_dashboardconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_dashboardconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `recent_enrollment_time_delta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_dashboardconfiguration_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_113873e8` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_dashboardconfiguration`
--

LOCK TABLES `student_dashboardconfiguration` WRITE;
/*!40000 ALTER TABLE `student_dashboardconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_dashboardconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_entranceexamconfiguration`
--

DROP TABLE IF EXISTS `student_entranceexamconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_entranceexamconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `skip_entrance_exam` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_entranceexamconfiguration_user_id_577afb10_uniq` (`user_id`,`course_id`),
  KEY `student_entranceexamconfiguration_403f60f` (`user_id`),
  KEY `student_entranceexamconfiguration_b7271b` (`course_id`),
  KEY `student_entranceexamconfiguration_3216ff68` (`created`),
  KEY `student_entranceexamconfiguration_8aac229` (`updated`),
  CONSTRAINT `user_id_refs_id_636c23ea` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_entranceexamconfiguration`
--

LOCK TABLES `student_entranceexamconfiguration` WRITE;
/*!40000 ALTER TABLE `student_entranceexamconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_entranceexamconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_historicalcourseenrollment`
--

DROP TABLE IF EXISTS `student_historicalcourseenrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_historicalcourseenrollment` (
  `id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `mode` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `student_historicalcourseenrollment_4a5fc416` (`id`),
  KEY `student_historicalcourseenrollment_b7271b` (`course_id`),
  KEY `student_historicalcourseenrollment_3216ff68` (`created`),
  KEY `student_historicalcourseenrollment_403f60f` (`user_id`),
  KEY `student_historicalcourseenrollment_1e5f15d6` (`history_user_id`),
  CONSTRAINT `history_user_id_refs_id_24ec95a7` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_id_refs_id_24ec95a7` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_historicalcourseenrollment`
--

LOCK TABLES `student_historicalcourseenrollment` WRITE;
/*!40000 ALTER TABLE `student_historicalcourseenrollment` DISABLE KEYS */;
INSERT INTO `student_historicalcourseenrollment` VALUES (1,'edX/DemoX/Demo_Course','2015-10-26 12:53:50',1,'honor',1,1,'2015-10-26 12:53:50',NULL,'+'),(1,'edX/DemoX/Demo_Course','2015-10-26 12:53:50',0,'honor',1,2,'2015-10-26 12:53:50',NULL,'~'),(1,'edX/DemoX/Demo_Course','2015-10-26 12:53:50',1,'honor',1,3,'2015-10-26 12:53:50',NULL,'~'),(2,'edX/DemoX/Demo_Course','2015-10-26 12:53:53',1,'honor',2,4,'2015-10-26 12:53:53',NULL,'+'),(2,'edX/DemoX/Demo_Course','2015-10-26 12:53:53',0,'honor',2,5,'2015-10-26 12:53:53',NULL,'~'),(2,'edX/DemoX/Demo_Course','2015-10-26 12:53:53',1,'audit',2,6,'2015-10-26 12:53:54',NULL,'~'),(3,'edX/DemoX/Demo_Course','2015-10-26 12:53:57',1,'honor',3,7,'2015-10-26 12:53:57',NULL,'+'),(3,'edX/DemoX/Demo_Course','2015-10-26 12:53:57',0,'honor',3,8,'2015-10-26 12:53:57',NULL,'~'),(3,'edX/DemoX/Demo_Course','2015-10-26 12:53:57',1,'verified',3,9,'2015-10-26 12:53:57',NULL,'~'),(4,'edX/DemoX/Demo_Course','2015-10-26 12:54:00',1,'honor',4,10,'2015-10-26 12:54:00',NULL,'+'),(4,'edX/DemoX/Demo_Course','2015-10-26 12:54:00',0,'honor',4,11,'2015-10-26 12:54:00',NULL,'~'),(4,'edX/DemoX/Demo_Course','2015-10-26 12:54:00',1,'honor',4,12,'2015-10-26 12:54:00',NULL,'~'),(5,'course-v1:edX+DemoX+Demo_Course','2015-10-26 17:17:07',1,'honor',7,13,'2015-10-26 17:17:07',NULL,'+'),(5,'course-v1:edX+DemoX+Demo_Course','2015-10-26 17:17:07',0,'honor',7,14,'2015-10-26 17:17:07',NULL,'~'),(5,'course-v1:edX+DemoX+Demo_Course','2015-10-26 17:17:07',1,'honor',7,15,'2015-10-26 17:17:07',NULL,'~'),(6,'course-v1:edX+DemoX+Demo_Course','2015-10-27 11:54:52',1,'honor',9,16,'2015-10-27 11:54:52',NULL,'+'),(6,'course-v1:edX+DemoX+Demo_Course','2015-10-27 11:54:52',0,'honor',9,17,'2015-10-27 11:54:52',NULL,'~'),(6,'course-v1:edX+DemoX+Demo_Course','2015-10-27 11:54:52',1,'honor',9,18,'2015-10-27 11:54:52',NULL,'~'),(6,'course-v1:edX+DemoX+Demo_Course','2015-10-27 11:54:52',1,'honor',9,19,'2015-10-27 11:54:52',NULL,'~');
/*!40000 ALTER TABLE `student_historicalcourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_languageproficiency`
--

DROP TABLE IF EXISTS `student_languageproficiency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_languageproficiency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_profile_id` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_languageproficiency_code_684c62e5_uniq` (`code`,`user_profile_id`),
  KEY `student_languageproficiency_634d39b9` (`user_profile_id`),
  CONSTRAINT `user_profile_id_refs_id_45a55200` FOREIGN KEY (`user_profile_id`) REFERENCES `auth_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_languageproficiency`
--

LOCK TABLES `student_languageproficiency` WRITE;
/*!40000 ALTER TABLE `student_languageproficiency` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_languageproficiency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_linkedinaddtoprofileconfiguration`
--

DROP TABLE IF EXISTS `student_linkedinaddtoprofileconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_linkedinaddtoprofileconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `dashboard_tracking_code` longtext NOT NULL,
  `company_identifier` longtext NOT NULL,
  `trk_partner_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_linkedinaddtoprofileconfiguration_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_6b969b96` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_linkedinaddtoprofileconfiguration`
--

LOCK TABLES `student_linkedinaddtoprofileconfiguration` WRITE;
/*!40000 ALTER TABLE `student_linkedinaddtoprofileconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_linkedinaddtoprofileconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_loginfailures`
--

DROP TABLE IF EXISTS `student_loginfailures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_loginfailures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `failure_count` int(11) NOT NULL,
  `lockout_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_loginfailures_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_1958efbb` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_loginfailures`
--

LOCK TABLES `student_loginfailures` WRITE;
/*!40000 ALTER TABLE `student_loginfailures` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_loginfailures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_manualenrollmentaudit`
--

DROP TABLE IF EXISTS `student_manualenrollmentaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_manualenrollmentaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_id` int(11) DEFAULT NULL,
  `enrolled_by_id` int(11) DEFAULT NULL,
  `enrolled_email` varchar(255) NOT NULL,
  `time_stamp` datetime DEFAULT NULL,
  `state_transition` varchar(255) NOT NULL,
  `reason` longtext,
  PRIMARY KEY (`id`),
  KEY `student_manualenrollmentaudit_ab10102` (`enrollment_id`),
  KEY `student_manualenrollmentaudit_5eb5fa8a` (`enrolled_by_id`),
  KEY `student_manualenrollmentaudit_3dd381cb` (`enrolled_email`),
  CONSTRAINT `enrolled_by_id_refs_id_57fa6daa` FOREIGN KEY (`enrolled_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `enrollment_id_refs_id_57857654` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_manualenrollmentaudit`
--

LOCK TABLES `student_manualenrollmentaudit` WRITE;
/*!40000 ALTER TABLE `student_manualenrollmentaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_manualenrollmentaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_passwordhistory`
--

DROP TABLE IF EXISTS `student_passwordhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_passwordhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `time_set` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_passwordhistory_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_12f67826` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_passwordhistory`
--

LOCK TABLES `student_passwordhistory` WRITE;
/*!40000 ALTER TABLE `student_passwordhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_passwordhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_pendingemailchange`
--

DROP TABLE IF EXISTS `student_pendingemailchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_pendingemailchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `new_email` varchar(255) NOT NULL,
  `activation_key` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `activation_key` (`activation_key`),
  KEY `student_pendingemailchange_7a937929` (`new_email`),
  CONSTRAINT `user_id_refs_id_5ada0599` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_pendingemailchange`
--

LOCK TABLES `student_pendingemailchange` WRITE;
/*!40000 ALTER TABLE `student_pendingemailchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_pendingemailchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_pendingnamechange`
--

DROP TABLE IF EXISTS `student_pendingnamechange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_pendingnamechange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `rationale` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_26ca64d9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_pendingnamechange`
--

LOCK TABLES `student_pendingnamechange` WRITE;
/*!40000 ALTER TABLE `student_pendingnamechange` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_pendingnamechange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usersignupsource`
--

DROP TABLE IF EXISTS `student_usersignupsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usersignupsource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_usersignupsource_1ff577e6` (`site`),
  KEY `student_usersignupsource_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_38a4bd6e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usersignupsource`
--

LOCK TABLES `student_usersignupsource` WRITE;
/*!40000 ALTER TABLE `student_usersignupsource` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usersignupsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_userstanding`
--

DROP TABLE IF EXISTS `student_userstanding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_userstanding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `account_status` varchar(31) NOT NULL,
  `changed_by_id` int(11) NOT NULL,
  `standing_last_changed_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `student_userstanding_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_450a33b` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_id_refs_id_450a33b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_userstanding`
--

LOCK TABLES `student_userstanding` WRITE;
/*!40000 ALTER TABLE `student_userstanding` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_userstanding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usertestgroup`
--

DROP TABLE IF EXISTS `student_usertestgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usertestgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_usertestgroup_52094d6e` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usertestgroup`
--

LOCK TABLES `student_usertestgroup` WRITE;
/*!40000 ALTER TABLE `student_usertestgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usertestgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usertestgroup_users`
--

DROP TABLE IF EXISTS `student_usertestgroup_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usertestgroup_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usertestgroup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_usertestgroup_users_usertestgroup_id_372991b0_uniq` (`usertestgroup_id`,`user_id`),
  KEY `student_usertestgroup_users_44f27cdf` (`usertestgroup_id`),
  KEY `student_usertestgroup_users_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_76b8a7b4` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `usertestgroup_id_refs_id_6d724f9e` FOREIGN KEY (`usertestgroup_id`) REFERENCES `student_usertestgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usertestgroup_users`
--

LOCK TABLES `student_usertestgroup_users` WRITE;
/*!40000 ALTER TABLE `student_usertestgroup_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usertestgroup_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_score`
--

DROP TABLE IF EXISTS `submissions_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_item_id` int(11) NOT NULL,
  `submission_id` int(11) DEFAULT NULL,
  `points_earned` int(10) unsigned NOT NULL,
  `points_possible` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `reset` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_score_fa84001` (`student_item_id`),
  KEY `submissions_score_4c29dca6` (`submission_id`),
  KEY `submissions_score_3b1c9c31` (`created_at`),
  CONSTRAINT `student_item_id_refs_id_73268c7b` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`),
  CONSTRAINT `submission_id_refs_id_61c630d2` FOREIGN KEY (`submission_id`) REFERENCES `submissions_submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_score`
--

LOCK TABLES `submissions_score` WRITE;
/*!40000 ALTER TABLE `submissions_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_scoresummary`
--

DROP TABLE IF EXISTS `submissions_scoresummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_scoresummary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_item_id` int(11) NOT NULL,
  `highest_id` int(11) NOT NULL,
  `latest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_item_id` (`student_item_id`),
  KEY `submissions_scoresummary_29a06c9b` (`highest_id`),
  KEY `submissions_scoresummary_1efb24d9` (`latest_id`),
  CONSTRAINT `highest_id_refs_id_1bdc0a18` FOREIGN KEY (`highest_id`) REFERENCES `submissions_score` (`id`),
  CONSTRAINT `latest_id_refs_id_1bdc0a18` FOREIGN KEY (`latest_id`) REFERENCES `submissions_score` (`id`),
  CONSTRAINT `student_item_id_refs_id_42ae1898` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_scoresummary`
--

LOCK TABLES `submissions_scoresummary` WRITE;
/*!40000 ALTER TABLE `submissions_scoresummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_scoresummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_studentitem`
--

DROP TABLE IF EXISTS `submissions_studentitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_studentitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `item_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submissions_studentitem_course_id_139002f5_uniq` (`course_id`,`student_id`,`item_id`),
  KEY `submissions_studentitem_42ff452e` (`student_id`),
  KEY `submissions_studentitem_b7271b` (`course_id`),
  KEY `submissions_studentitem_67b70d25` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_studentitem`
--

LOCK TABLES `submissions_studentitem` WRITE;
/*!40000 ALTER TABLE `submissions_studentitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_studentitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_submission`
--

DROP TABLE IF EXISTS `submissions_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `student_item_id` int(11) NOT NULL,
  `attempt_number` int(10) unsigned NOT NULL,
  `submitted_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `raw_answer` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_submission_2bbc74ae` (`uuid`),
  KEY `submissions_submission_fa84001` (`student_item_id`),
  KEY `submissions_submission_4452d192` (`submitted_at`),
  KEY `submissions_submission_3b1c9c31` (`created_at`),
  CONSTRAINT `student_item_id_refs_id_b5cccc` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_submission`
--

LOCK TABLES `submissions_submission` WRITE;
/*!40000 ALTER TABLE `submissions_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_surveyanswer`
--

DROP TABLE IF EXISTS `survey_surveyanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_surveyanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_value` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_surveyanswer_403f60f` (`user_id`),
  KEY `survey_surveyanswer_1d0aabf2` (`form_id`),
  KEY `survey_surveyanswer_7e1499` (`field_name`),
  CONSTRAINT `form_id_refs_id_b3860d7` FOREIGN KEY (`form_id`) REFERENCES `survey_surveyform` (`id`),
  CONSTRAINT `user_id_refs_id_1f52b4a2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_surveyanswer`
--

LOCK TABLES `survey_surveyanswer` WRITE;
/*!40000 ALTER TABLE `survey_surveyanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_surveyanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_surveyform`
--

DROP TABLE IF EXISTS `survey_surveyform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_surveyform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `form` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_surveyform`
--

LOCK TABLES `survey_surveyform` WRITE;
/*!40000 ALTER TABLE `survey_surveyform` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_surveyform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_courseteam`
--

DROP TABLE IF EXISTS `teams_courseteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_courseteam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `topic_id` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(300) NOT NULL,
  `country` varchar(2) NOT NULL,
  `language` varchar(16) NOT NULL,
  `discussion_topic_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_id` (`team_id`),
  UNIQUE KEY `discussion_topic_id` (`discussion_topic_id`),
  KEY `teams_courseteam_b7271b` (`course_id`),
  KEY `teams_courseteam_57732028` (`topic_id`),
  KEY `teams_courseteam_52094d6e` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_courseteam`
--

LOCK TABLES `teams_courseteam` WRITE;
/*!40000 ALTER TABLE `teams_courseteam` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_courseteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_courseteammembership`
--

DROP TABLE IF EXISTS `teams_courseteammembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_courseteammembership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teams_courseteammembership_user_id_68e6b83d_uniq` (`user_id`,`team_id`),
  KEY `teams_courseteammembership_403f60f` (`user_id`),
  KEY `teams_courseteammembership_30753b9` (`team_id`),
  CONSTRAINT `team_id_refs_id_679497a3` FOREIGN KEY (`team_id`) REFERENCES `teams_courseteam` (`id`),
  CONSTRAINT `user_id_refs_id_543bbd41` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_courseteammembership`
--

LOCK TABLES `teams_courseteammembership` WRITE;
/*!40000 ALTER TABLE `teams_courseteammembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_courseteammembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_trackinglog`
--

DROP TABLE IF EXISTS `track_trackinglog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_trackinglog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dtcreated` datetime NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `event_source` varchar(32) NOT NULL,
  `event_type` varchar(512) NOT NULL,
  `event` longtext NOT NULL,
  `agent` varchar(256) NOT NULL,
  `page` varchar(512),
  `time` datetime NOT NULL,
  `host` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_trackinglog`
--

LOCK TABLES `track_trackinglog` WRITE;
/*!40000 ALTER TABLE `track_trackinglog` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_trackinglog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_usercoursetag`
--

DROP TABLE IF EXISTS `user_api_usercoursetag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_usercoursetag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_usercoursetags_user_id_5fb7c4f8_uniq` (`user_id`,`course_id`,`key`),
  KEY `user_api_usercoursetags_403f60f` (`user_id`),
  KEY `user_api_usercoursetags_45544485` (`key`),
  KEY `user_api_usercoursetags_b7271b` (`course_id`),
  CONSTRAINT `user_id_refs_id_47a9a367` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_usercoursetag`
--

LOCK TABLES `user_api_usercoursetag` WRITE;
/*!40000 ALTER TABLE `user_api_usercoursetag` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_usercoursetag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userorgtag`
--

DROP TABLE IF EXISTS `user_api_userorgtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userorgtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `org` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_userorgtag_user_id_22120c6f_uniq` (`user_id`,`org`,`key`),
  KEY `user_api_userorgtag_user_id_22120c6f` (`user_id`,`org`,`key`),
  KEY `user_api_userorgtag_403f60f` (`user_id`),
  KEY `user_api_userorgtag_45544485` (`key`),
  KEY `user_api_userorgtag_4f5f82e2` (`org`),
  CONSTRAINT `user_id_refs_id_1ab48e81` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userorgtag`
--

LOCK TABLES `user_api_userorgtag` WRITE;
/*!40000 ALTER TABLE `user_api_userorgtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userorgtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userpreference`
--

DROP TABLE IF EXISTS `user_api_userpreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userpreference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_userpreference_user_id_3f760072_uniq` (`user_id`,`key`),
  KEY `user_api_userpreference_403f60f` (`user_id`),
  KEY `user_api_userpreference_45544485` (`key`),
  CONSTRAINT `user_id_refs_id_cb8c462` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userpreference`
--

LOCK TABLES `user_api_userpreference` WRITE;
/*!40000 ALTER TABLE `user_api_userpreference` DISABLE KEYS */;
INSERT INTO `user_api_userpreference` VALUES (1,6,'pref-lang','en'),(2,7,'pref-lang','en'),(3,9,'pref-lang','en');
/*!40000 ALTER TABLE `user_api_userpreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `util_ratelimitconfiguration`
--

DROP TABLE IF EXISTS `util_ratelimitconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `util_ratelimitconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `util_ratelimitconfiguration_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_76a26307` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `util_ratelimitconfiguration`
--

LOCK TABLES `util_ratelimitconfiguration` WRITE;
/*!40000 ALTER TABLE `util_ratelimitconfiguration` DISABLE KEYS */;
INSERT INTO `util_ratelimitconfiguration` VALUES (1,'2015-10-26 12:28:25',NULL,1);
/*!40000 ALTER TABLE `util_ratelimitconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_historicalverificationdeadline`
--

DROP TABLE IF EXISTS `verify_student_historicalverificationdeadline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_historicalverificationdeadline` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `deadline` datetime NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `verify_student_historicalverificationdeadline_4a5fc416` (`id`),
  KEY `verify_student_historicalverificationdeadline_4b4b8186` (`course_key`),
  KEY `verify_student_historicalverificationdeadline_1e5f15d6` (`history_user_id`),
  CONSTRAINT `history_user_id_refs_id_54fb356` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_historicalverificationdeadline`
--

LOCK TABLES `verify_student_historicalverificationdeadline` WRITE;
/*!40000 ALTER TABLE `verify_student_historicalverificationdeadline` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_historicalverificationdeadline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_incoursereverificationconfiguration`
--

DROP TABLE IF EXISTS `verify_student_incoursereverificationconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_incoursereverificationconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_incoursereverificationconfiguration_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_54d203d6` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_incoursereverificationconfiguration`
--

LOCK TABLES `verify_student_incoursereverificationconfiguration` WRITE;
/*!40000 ALTER TABLE `verify_student_incoursereverificationconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_incoursereverificationconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_skippedreverification`
--

DROP TABLE IF EXISTS `verify_student_skippedreverification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_skippedreverification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `checkpoint_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `verify_student_skippedreverification_user_id_18ca55e6_uniq` (`user_id`,`course_id`),
  KEY `verify_student_skippedreverification_403f60f` (`user_id`),
  KEY `verify_student_skippedreverification_b7271b` (`course_id`),
  KEY `verify_student_skippedreverification_59ce1bc8` (`checkpoint_id`),
  CONSTRAINT `checkpoint_id_refs_id_217abe4f` FOREIGN KEY (`checkpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`),
  CONSTRAINT `user_id_refs_id_d95a880` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_skippedreverification`
--

LOCK TABLES `verify_student_skippedreverification` WRITE;
/*!40000 ALTER TABLE `verify_student_skippedreverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_skippedreverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_softwaresecurephotoverification`
--

DROP TABLE IF EXISTS `verify_student_softwaresecurephotoverification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_softwaresecurephotoverification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `status_changed` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `face_image_url` varchar(255) NOT NULL,
  `photo_id_image_url` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `reviewing_user_id` int(11) DEFAULT NULL,
  `reviewing_service` varchar(255) NOT NULL,
  `error_msg` longtext NOT NULL,
  `error_code` varchar(50) NOT NULL,
  `photo_id_key` longtext NOT NULL,
  `display` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_softwaresecurephotoverification_403f60f` (`user_id`),
  KEY `verify_student_softwaresecurephotoverification_78ec3aab` (`receipt_id`),
  KEY `verify_student_softwaresecurephotoverification_3b1c9c31` (`created_at`),
  KEY `verify_student_softwaresecurephotoverification_7b0821a` (`updated_at`),
  KEY `verify_student_softwaresecurephotoverification_4452d192` (`submitted_at`),
  KEY `verify_student_softwaresecurephotoverification_4d3e9a4c` (`reviewing_user_id`),
  KEY `verify_student_softwaresecurephotoverification_35eebcb6` (`display`),
  CONSTRAINT `reviewing_user_id_refs_id_2915bdf9` FOREIGN KEY (`reviewing_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_id_refs_id_2915bdf9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_softwaresecurephotoverification`
--

LOCK TABLES `verify_student_softwaresecurephotoverification` WRITE;
/*!40000 ALTER TABLE `verify_student_softwaresecurephotoverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_softwaresecurephotoverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_verificationcheckpoint`
--

DROP TABLE IF EXISTS `verify_student_verificationcheckpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_verificationcheckpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `checkpoint_location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `verify_student_verificationcheckpoint_course_id_22b4cc19_uniq` (`course_id`,`checkpoint_location`),
  KEY `verify_student_verificationcheckpoint_b7271b` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationcheckpoint`
--

LOCK TABLES `verify_student_verificationcheckpoint` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationcheckpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_verificationcheckpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_verificationcheckpoint_photo_verification`
--

DROP TABLE IF EXISTS `verify_student_verificationcheckpoint_photo_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_verificationcheckpoint_photo_verification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verificationcheckpoint_id` int(11) NOT NULL,
  `softwaresecurephotoverification_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `verify_student_verifica_verificationcheckpoint_id_6c1a9271_uniq` (`verificationcheckpoint_id`,`softwaresecurephotoverification_id`),
  KEY `verify_student_verificationcheckpoint_photo_verification_3cf2e62` (`verificationcheckpoint_id`),
  KEY `verify_student_verificationcheckpoint_photo_verification_23f9cca` (`softwaresecurephotoverification_id`),
  CONSTRAINT `softwaresecurephotoverification_id_refs_id_5efb90e` FOREIGN KEY (`softwaresecurephotoverification_id`) REFERENCES `verify_student_softwaresecurephotoverification` (`id`),
  CONSTRAINT `verificationcheckpoint_id_refs_id_65c780bd` FOREIGN KEY (`verificationcheckpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationcheckpoint_photo_verification`
--

LOCK TABLES `verify_student_verificationcheckpoint_photo_verification` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationcheckpoint_photo_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_verificationcheckpoint_photo_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_verificationdeadline`
--

DROP TABLE IF EXISTS `verify_student_verificationdeadline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_verificationdeadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `deadline` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationdeadline`
--

LOCK TABLES `verify_student_verificationdeadline` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationdeadline` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_verificationdeadline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_verificationstatus`
--

DROP TABLE IF EXISTS `verify_student_verificationstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_verificationstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkpoint_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(32) NOT NULL,
  `timestamp` datetime NOT NULL,
  `response` longtext,
  `error` longtext,
  PRIMARY KEY (`id`),
  KEY `verify_student_verificationstatus_59ce1bc8` (`checkpoint_id`),
  KEY `verify_student_verificationstatus_403f60f` (`user_id`),
  KEY `verify_student_verificationstatus_36528e23` (`status`),
  CONSTRAINT `checkpoint_id_refs_id_70d70b21` FOREIGN KEY (`checkpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`),
  CONSTRAINT `user_id_refs_id_bfc6370` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationstatus`
--

LOCK TABLES `verify_student_verificationstatus` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_verificationstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_article`
--

DROP TABLE IF EXISTS `wiki_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_revision_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `group_read` tinyint(1) NOT NULL,
  `group_write` tinyint(1) NOT NULL,
  `other_read` tinyint(1) NOT NULL,
  `other_write` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `current_revision_id` (`current_revision_id`),
  KEY `wiki_article_5d52dd10` (`owner_id`),
  KEY `wiki_article_425ae3c4` (`group_id`),
  CONSTRAINT `current_revision_id_refs_id_45053cfc` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `group_id_refs_id_108bfee4` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `owner_id_refs_id_61eb4a7d` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_article`
--

LOCK TABLES `wiki_article` WRITE;
/*!40000 ALTER TABLE `wiki_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articleforobject`
--

DROP TABLE IF EXISTS `wiki_articleforobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articleforobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `is_mptt` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_articleforobject_content_type_id_764c4355_uniq` (`content_type_id`,`object_id`),
  KEY `wiki_articleforobject_30525a19` (`article_id`),
  KEY `wiki_articleforobject_1bb8f392` (`content_type_id`),
  CONSTRAINT `article_id_refs_id_5099436` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `content_type_id_refs_id_37828764` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articleforobject`
--

LOCK TABLES `wiki_articleforobject` WRITE;
/*!40000 ALTER TABLE `wiki_articleforobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_articleforobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articleplugin`
--

DROP TABLE IF EXISTS `wiki_articleplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articleplugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_articleplugin_30525a19` (`article_id`),
  CONSTRAINT `article_id_refs_id_6d39b736` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articleplugin`
--

LOCK TABLES `wiki_articleplugin` WRITE;
/*!40000 ALTER TABLE `wiki_articleplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_articleplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articlerevision`
--

DROP TABLE IF EXISTS `wiki_articlerevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articlerevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_number` int(11) NOT NULL,
  `user_message` longtext NOT NULL,
  `automatic_log` longtext NOT NULL,
  `ip_address` char(15) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `previous_revision_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `article_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `title` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_articlerevision_article_id_37184d30_uniq` (`article_id`,`revision_number`),
  KEY `wiki_articlerevision_403f60f` (`user_id`),
  KEY `wiki_articlerevision_49bc38cc` (`previous_revision_id`),
  KEY `wiki_articlerevision_30525a19` (`article_id`),
  CONSTRAINT `article_id_refs_id_5c88570a` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `previous_revision_id_refs_id_56ae1c95` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `user_id_refs_id_44d98ec` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articlerevision`
--

LOCK TABLES `wiki_articlerevision` WRITE;
/*!40000 ALTER TABLE `wiki_articlerevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_articlerevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articlesubscription`
--

DROP TABLE IF EXISTS `wiki_articlesubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articlesubscription` (
  `subscription_ptr_id` int(11) NOT NULL,
  `articleplugin_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  UNIQUE KEY `subscription_ptr_id` (`subscription_ptr_id`),
  CONSTRAINT `articleplugin_ptr_id_refs_id_3431ff1d` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`),
  CONSTRAINT `subscription_ptr_id_refs_id_51760b8b` FOREIGN KEY (`subscription_ptr_id`) REFERENCES `notify_subscription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articlesubscription`
--

LOCK TABLES `wiki_articlesubscription` WRITE;
/*!40000 ALTER TABLE `wiki_articlesubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_articlesubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_attachment`
--

DROP TABLE IF EXISTS `wiki_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_attachment` (
  `reusableplugin_ptr_id` int(11) NOT NULL,
  `current_revision_id` int(11) DEFAULT NULL,
  `original_filename` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`reusableplugin_ptr_id`),
  UNIQUE KEY `current_revision_id` (`current_revision_id`),
  CONSTRAINT `current_revision_id_refs_id_2198feb4` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_attachmentrevision` (`id`),
  CONSTRAINT `reusableplugin_ptr_id_refs_articleplugin_ptr_id_6644e87a` FOREIGN KEY (`reusableplugin_ptr_id`) REFERENCES `wiki_reusableplugin` (`articleplugin_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_attachment`
--

LOCK TABLES `wiki_attachment` WRITE;
/*!40000 ALTER TABLE `wiki_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_attachmentrevision`
--

DROP TABLE IF EXISTS `wiki_attachmentrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_attachmentrevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_number` int(11) NOT NULL,
  `user_message` longtext NOT NULL,
  `automatic_log` longtext NOT NULL,
  `ip_address` char(15) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `previous_revision_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `attachment_id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_attachmentrevision_403f60f` (`user_id`),
  KEY `wiki_attachmentrevision_49bc38cc` (`previous_revision_id`),
  KEY `wiki_attachmentrevision_12119fef` (`attachment_id`),
  CONSTRAINT `attachment_id_refs_reusableplugin_ptr_id_640583da` FOREIGN KEY (`attachment_id`) REFERENCES `wiki_attachment` (`reusableplugin_ptr_id`),
  CONSTRAINT `previous_revision_id_refs_id_41bbf5` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_attachmentrevision` (`id`),
  CONSTRAINT `user_id_refs_id_2eaca84c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_attachmentrevision`
--

LOCK TABLES `wiki_attachmentrevision` WRITE;
/*!40000 ALTER TABLE `wiki_attachmentrevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_attachmentrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_image`
--

DROP TABLE IF EXISTS `wiki_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_image` (
  `revisionplugin_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`revisionplugin_ptr_id`),
  CONSTRAINT `revisionplugin_ptr_id_refs_articleplugin_ptr_id_3bd5f4f` FOREIGN KEY (`revisionplugin_ptr_id`) REFERENCES `wiki_revisionplugin` (`articleplugin_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_image`
--

LOCK TABLES `wiki_image` WRITE;
/*!40000 ALTER TABLE `wiki_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_imagerevision`
--

DROP TABLE IF EXISTS `wiki_imagerevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_imagerevision` (
  `revisionpluginrevision_ptr_id` int(11) NOT NULL,
  `image` varchar(2000),
  `width` smallint(6),
  `height` smallint(6),
  PRIMARY KEY (`revisionpluginrevision_ptr_id`),
  CONSTRAINT `revisionpluginrevision_ptr_id_refs_id_5b9fc791` FOREIGN KEY (`revisionpluginrevision_ptr_id`) REFERENCES `wiki_revisionpluginrevision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_imagerevision`
--

LOCK TABLES `wiki_imagerevision` WRITE;
/*!40000 ALTER TABLE `wiki_imagerevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_imagerevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_reusableplugin`
--

DROP TABLE IF EXISTS `wiki_reusableplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_reusableplugin` (
  `articleplugin_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  CONSTRAINT `articleplugin_ptr_id_refs_id_4ca661fd` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_reusableplugin`
--

LOCK TABLES `wiki_reusableplugin` WRITE;
/*!40000 ALTER TABLE `wiki_reusableplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_reusableplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_reusableplugin_articles`
--

DROP TABLE IF EXISTS `wiki_reusableplugin_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_reusableplugin_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reusableplugin_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_reusableplugin_articles_reusableplugin_id_5057060e_uniq` (`reusableplugin_id`,`article_id`),
  KEY `wiki_reusableplugin_articles_28b0b358` (`reusableplugin_id`),
  KEY `wiki_reusableplugin_articles_30525a19` (`article_id`),
  CONSTRAINT `article_id_refs_id_2f51faad` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `reusableplugin_id_refs_articleplugin_ptr_id_44b45e30` FOREIGN KEY (`reusableplugin_id`) REFERENCES `wiki_reusableplugin` (`articleplugin_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_reusableplugin_articles`
--

LOCK TABLES `wiki_reusableplugin_articles` WRITE;
/*!40000 ALTER TABLE `wiki_reusableplugin_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_reusableplugin_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_revisionplugin`
--

DROP TABLE IF EXISTS `wiki_revisionplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_revisionplugin` (
  `articleplugin_ptr_id` int(11) NOT NULL,
  `current_revision_id` int(11),
  PRIMARY KEY (`articleplugin_ptr_id`),
  UNIQUE KEY `current_revision_id` (`current_revision_id`),
  CONSTRAINT `articleplugin_ptr_id_refs_id_353cebff` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`),
  CONSTRAINT `current_revision_id_refs_id_44938e26` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_revisionpluginrevision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_revisionplugin`
--

LOCK TABLES `wiki_revisionplugin` WRITE;
/*!40000 ALTER TABLE `wiki_revisionplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_revisionplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_revisionpluginrevision`
--

DROP TABLE IF EXISTS `wiki_revisionpluginrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_revisionpluginrevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_number` int(11) NOT NULL,
  `user_message` longtext NOT NULL,
  `automatic_log` longtext NOT NULL,
  `ip_address` char(15) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `previous_revision_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `plugin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_revisionpluginrevision_403f60f` (`user_id`),
  KEY `wiki_revisionpluginrevision_49bc38cc` (`previous_revision_id`),
  KEY `wiki_revisionpluginrevision_2857ccbf` (`plugin_id`),
  CONSTRAINT `plugin_id_refs_articleplugin_ptr_id_41bbc69c` FOREIGN KEY (`plugin_id`) REFERENCES `wiki_revisionplugin` (`articleplugin_ptr_id`),
  CONSTRAINT `previous_revision_id_refs_id_78fffe43` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_revisionpluginrevision` (`id`),
  CONSTRAINT `user_id_refs_id_32d8f395` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_revisionpluginrevision`
--

LOCK TABLES `wiki_revisionpluginrevision` WRITE;
/*!40000 ALTER TABLE `wiki_revisionpluginrevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_revisionpluginrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_simpleplugin`
--

DROP TABLE IF EXISTS `wiki_simpleplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_simpleplugin` (
  `articleplugin_ptr_id` int(11) NOT NULL,
  `article_revision_id` int(11) NOT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  KEY `wiki_simpleplugin_4c23b602` (`article_revision_id`),
  CONSTRAINT `article_revision_id_refs_id_6df37b12` FOREIGN KEY (`article_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `articleplugin_ptr_id_refs_id_5da3402e` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_simpleplugin`
--

LOCK TABLES `wiki_simpleplugin` WRITE;
/*!40000 ALTER TABLE `wiki_simpleplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_simpleplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_urlpath`
--

DROP TABLE IF EXISTS `wiki_urlpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_urlpath` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_urlpath_site_id_4d33647e_uniq` (`site_id`,`parent_id`,`slug`),
  KEY `wiki_urlpath_56ae2a2a` (`slug`),
  KEY `wiki_urlpath_6223029` (`site_id`),
  KEY `wiki_urlpath_63f17a16` (`parent_id`),
  KEY `wiki_urlpath_42b06ff6` (`lft`),
  KEY `wiki_urlpath_6eabc1a6` (`rght`),
  KEY `wiki_urlpath_102f80d8` (`tree_id`),
  KEY `wiki_urlpath_2a8f42e8` (`level`),
  KEY `wiki_urlpath_30525a19` (`article_id`),
  CONSTRAINT `article_id_refs_id_68e8a637` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `parent_id_refs_id_52d1e703` FOREIGN KEY (`parent_id`) REFERENCES `wiki_urlpath` (`id`),
  CONSTRAINT `site_id_refs_id_b44555e` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_urlpath`
--

LOCK TABLES `wiki_urlpath` WRITE;
/*!40000 ALTER TABLE `wiki_urlpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_urlpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assessmentworkflow`
--

DROP TABLE IF EXISTS `workflow_assessmentworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assessmentworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` varchar(100) NOT NULL,
  `status_changed` datetime NOT NULL,
  `submission_uuid` varchar(36) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `workflow_assessmentworkflow_course_id_60399953` (`course_id`,`item_id`,`status`),
  KEY `workflow_assessmentworkflow_b7271b` (`course_id`),
  KEY `workflow_assessmentworkflow_67b70d25` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assessmentworkflow`
--

LOCK TABLES `workflow_assessmentworkflow` WRITE;
/*!40000 ALTER TABLE `workflow_assessmentworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assessmentworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assessmentworkflowcancellation`
--

DROP TABLE IF EXISTS `workflow_assessmentworkflowcancellation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assessmentworkflowcancellation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `comments` longtext NOT NULL,
  `cancelled_by_id` varchar(40) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_assessmentworkflowcancellation_26cddbc7` (`workflow_id`),
  KEY `workflow_assessmentworkflowcancellation_8569167` (`cancelled_by_id`),
  KEY `workflow_assessmentworkflowcancellation_3b1c9c31` (`created_at`),
  CONSTRAINT `workflow_id_refs_id_6461f996` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assessmentworkflowcancellation`
--

LOCK TABLES `workflow_assessmentworkflowcancellation` WRITE;
/*!40000 ALTER TABLE `workflow_assessmentworkflowcancellation` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assessmentworkflowcancellation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assessmentworkflowstep`
--

DROP TABLE IF EXISTS `workflow_assessmentworkflowstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assessmentworkflowstep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `submitter_completed_at` datetime DEFAULT NULL,
  `assessment_completed_at` datetime DEFAULT NULL,
  `order_num` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_assessmentworkflowstep_26cddbc7` (`workflow_id`),
  CONSTRAINT `workflow_id_refs_id_69d0b483` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assessmentworkflowstep`
--

LOCK TABLES `workflow_assessmentworkflowstep` WRITE;
/*!40000 ALTER TABLE `workflow_assessmentworkflowstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assessmentworkflowstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_config_studioconfig`
--

DROP TABLE IF EXISTS `xblock_config_studioconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_config_studioconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `disabled_blocks` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_config_studioconfig_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_6ef7f7d7` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_config_studioconfig`
--

LOCK TABLES `xblock_config_studioconfig` WRITE;
/*!40000 ALTER TABLE `xblock_config_studioconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_config_studioconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_django_xblockdisableconfig`
--

DROP TABLE IF EXISTS `xblock_django_xblockdisableconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_django_xblockdisableconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `disabled_blocks` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_django_xblockdisableconfig_16905482` (`changed_by_id`),
  CONSTRAINT `changed_by_id_refs_id_1ff69d70` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_django_xblockdisableconfig`
--

LOCK TABLES `xblock_django_xblockdisableconfig` WRITE;
/*!40000 ALTER TABLE `xblock_django_xblockdisableconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_django_xblockdisableconfig` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-19 20:33:57
