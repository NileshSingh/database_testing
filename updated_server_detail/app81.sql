-- MySQL dump 10.13  Distrib 5.6.24, for debian-linux-gnu (x86_64)
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
  KEY `assessment_aiclassifier_a36470e4` (`criterion_id`),
  CONSTRAINT `classifier_set_id_refs_id_f80cbf6` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`),
  CONSTRAINT `criterion_id_refs_id_e6ab97f2` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`)
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
  KEY `assessment_aiclassifierset_ff48d8e5` (`course_id`),
  KEY `assessment_aiclassifierset_67b70d25` (`item_id`),
  CONSTRAINT `rubric_id_refs_id_c037b8e4` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
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
  UNIQUE KEY `assessment_aigradingworkflow_uuid_492e936265ecbfd2_uniq` (`uuid`),
  KEY `assessment_aigradingworkflow_2bbc74ae` (`uuid`),
  KEY `assessment_aigradingworkflow_4bacaa90` (`scheduled_at`),
  KEY `assessment_aigradingworkflow_a2fd3af6` (`completed_at`),
  KEY `assessment_aigradingworkflow_39d020e6` (`submission_uuid`),
  KEY `assessment_aigradingworkflow_714175dc` (`classifier_set_id`),
  KEY `assessment_aigradingworkflow_53012c1e` (`algorithm_id`),
  KEY `assessment_aigradingworkflow_27cb9807` (`rubric_id`),
  KEY `assessment_aigradingworkflow_c168f2dc` (`assessment_id`),
  KEY `assessment_aigradingworkflow_42ff452e` (`student_id`),
  KEY `assessment_aigradingworkflow_67b70d25` (`item_id`),
  KEY `assessment_aigradingworkflow_ff48d8e5` (`course_id`),
  CONSTRAINT `assessment_id_refs_id_1d8478e7` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `classifier_set_id_refs_id_1e9046d1` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`),
  CONSTRAINT `rubric_id_refs_id_dc2a0464` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
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
  UNIQUE KEY `assessment_aitrainingworkflow_uuid_284fdaa93019f8ef_uniq` (`uuid`),
  KEY `assessment_aitrainingworkflow_2bbc74ae` (`uuid`),
  KEY `assessment_aitrainingworkflow_53012c1e` (`algorithm_id`),
  KEY `assessment_aitrainingworkflow_714175dc` (`classifier_set_id`),
  KEY `assessment_aitrainingworkflow_4bacaa90` (`scheduled_at`),
  KEY `assessment_aitrainingworkflow_a2fd3af6` (`completed_at`),
  KEY `assessment_aitrainingworkflow_67b70d25` (`item_id`),
  KEY `assessment_aitrainingworkflow_ff48d8e5` (`course_id`),
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
  UNIQUE KEY `assessment_aitraini_aitrainingworkflow_id_4b50cfbece05470a_uniq` (`aitrainingworkflow_id`,`trainingexample_id`),
  KEY `assessment_aitrainingworkflow_training_examples_a57f9195` (`aitrainingworkflow_id`),
  KEY `assessment_aitrainingworkflow_training_examples_ea4da31f` (`trainingexample_id`),
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
  KEY `assessment_assessment_9f54855a` (`scorer_id`),
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
  UNIQUE KEY `assessment_assessmen_assessmentfeedback_id_36925aaa1a839ac_uniq` (`assessmentfeedback_id`,`assessment_id`),
  KEY `assessment_assessmentfeedback_assessments_58f1f0d` (`assessmentfeedback_id`),
  KEY `assessment_assessmentfeedback_assessments_c168f2dc` (`assessment_id`),
  CONSTRAINT `assessment_id_refs_id_e7fd607e` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessmentfeedback_id_refs_id_91bbd347` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`)
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
  UNIQUE KEY `assessment_assessmen_assessmentfeedback_id_14efc9eea8f4c83_uniq` (`assessmentfeedback_id`,`assessmentfeedbackoption_id`),
  KEY `assessment_assessmentfeedback_options_58f1f0d` (`assessmentfeedback_id`),
  KEY `assessment_assessmentfeedback_options_4e523d64` (`assessmentfeedbackoption_id`),
  CONSTRAINT `assessmentfeedback_id_refs_id_5c27c412` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`),
  CONSTRAINT `assessmentfeedbackoption_id_refs_id_cdf28acd` FOREIGN KEY (`assessmentfeedbackoption_id`) REFERENCES `assessment_assessmentfeedbackoption` (`id`)
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
  KEY `assessment_assessmentpart_c168f2dc` (`assessment_id`),
  KEY `assessment_assessmentpart_2f3b0dc9` (`option_id`),
  KEY `assessment_assessmentpart_a36470e4` (`criterion_id`),
  CONSTRAINT `assessment_id_refs_id_bff26444` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `criterion_id_refs_id_eeb3dc44` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`),
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
  CONSTRAINT `rubric_id_refs_id_f2f4f3c4` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
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
  KEY `assessment_criterionoption_a36470e4` (`criterion_id`),
  CONSTRAINT `criterion_id_refs_id_d2645232` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`)
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
  KEY `assessment_peerworkflow_ff48d8e5` (`course_id`),
  KEY `assessment_peerworkflow_3b1c9c31` (`created_at`),
  KEY `assessment_peerworkflow_a2fd3af6` (`completed_at`),
  KEY `assessment_peerworkflow_course_id_5ca23fddca9b630d` (`course_id`,`item_id`,`student_id`),
  KEY `assessment_peerworkflow_dcd62131` (`grading_completed_at`),
  KEY `assessment_peerworkflow_853d09a8` (`cancelled_at`)
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
  KEY `assessment_peerworkflowitem_9f54855a` (`scorer_id`),
  KEY `assessment_peerworkflowitem_cc846901` (`author_id`),
  KEY `assessment_peerworkflowitem_39d020e6` (`submission_uuid`),
  KEY `assessment_peerworkflowitem_d6e710e4` (`started_at`),
  KEY `assessment_peerworkflowitem_c168f2dc` (`assessment_id`),
  CONSTRAINT `assessment_id_refs_id_f69a86a1` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
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
  UNIQUE KEY `assessment_studenttrainin_submission_uuid_6d32c6477719d68f_uniq` (`submission_uuid`),
  KEY `assessment_studenttrainingworkflow_39d020e6` (`submission_uuid`),
  KEY `assessment_studenttrainingworkflow_42ff452e` (`student_id`),
  KEY `assessment_studenttrainingworkflow_67b70d25` (`item_id`),
  KEY `assessment_studenttrainingworkflow_ff48d8e5` (`course_id`)
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
  UNIQUE KEY `assessment_studenttrainingworkf_order_num_1391289faa95b87c_uniq` (`order_num`,`workflow_id`),
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
  UNIQUE KEY `assessment_trainingexa_trainingexample_id_60940991fb17d27d_uniq` (`trainingexample_id`,`criterionoption_id`),
  KEY `assessment_trainingexample_options_selected_ea4da31f` (`trainingexample_id`),
  KEY `assessment_trainingexample_options_selected_843fa247` (`criterionoption_id`),
  CONSTRAINT `criterionoption_id_refs_id_bed5a465` FOREIGN KEY (`criterionoption_id`) REFERENCES `assessment_criterionoption` (`id`),
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
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  KEY `auth_permission_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add task state',7,'add_taskmeta'),(20,'Can change task state',7,'change_taskmeta'),(21,'Can delete task state',7,'delete_taskmeta'),(22,'Can add saved group result',8,'add_tasksetmeta'),(23,'Can change saved group result',8,'change_tasksetmeta'),(24,'Can delete saved group result',8,'delete_tasksetmeta'),(25,'Can add interval',9,'add_intervalschedule'),(26,'Can change interval',9,'change_intervalschedule'),(27,'Can delete interval',9,'delete_intervalschedule'),(28,'Can add crontab',10,'add_crontabschedule'),(29,'Can change crontab',10,'change_crontabschedule'),(30,'Can delete crontab',10,'delete_crontabschedule'),(31,'Can add periodic tasks',11,'add_periodictasks'),(32,'Can change periodic tasks',11,'change_periodictasks'),(33,'Can delete periodic tasks',11,'delete_periodictasks'),(34,'Can add periodic task',12,'add_periodictask'),(35,'Can change periodic task',12,'change_periodictask'),(36,'Can delete periodic task',12,'delete_periodictask'),(37,'Can add worker',13,'add_workerstate'),(38,'Can change worker',13,'change_workerstate'),(39,'Can delete worker',13,'delete_workerstate'),(40,'Can add task',14,'add_taskstate'),(41,'Can change task',14,'change_taskstate'),(42,'Can delete task',14,'delete_taskstate'),(43,'Can add migration history',15,'add_migrationhistory'),(44,'Can change migration history',15,'change_migrationhistory'),(45,'Can delete migration history',15,'delete_migrationhistory'),(46,'Can add server circuit',16,'add_servercircuit'),(47,'Can change server circuit',16,'change_servercircuit'),(48,'Can delete server circuit',16,'delete_servercircuit'),(49,'Can add psychometric data',17,'add_psychometricdata'),(50,'Can change psychometric data',17,'change_psychometricdata'),(51,'Can delete psychometric data',17,'delete_psychometricdata'),(52,'Can add nonce',18,'add_nonce'),(53,'Can change nonce',18,'change_nonce'),(54,'Can delete nonce',18,'delete_nonce'),(55,'Can add association',19,'add_association'),(56,'Can change association',19,'change_association'),(57,'Can delete association',19,'delete_association'),(58,'Can add user open id',20,'add_useropenid'),(59,'Can change user open id',20,'change_useropenid'),(60,'Can delete user open id',20,'delete_useropenid'),(61,'Can add log entry',21,'add_logentry'),(62,'Can change log entry',21,'change_logentry'),(63,'Can delete log entry',21,'delete_logentry'),(64,'Can add cors model',22,'add_corsmodel'),(65,'Can change cors model',22,'change_corsmodel'),(66,'Can delete cors model',22,'delete_corsmodel'),(67,'Can add student module',23,'add_studentmodule'),(68,'Can change student module',23,'change_studentmodule'),(69,'Can delete student module',23,'delete_studentmodule'),(70,'Can add student module history',24,'add_studentmodulehistory'),(71,'Can change student module history',24,'change_studentmodulehistory'),(72,'Can delete student module history',24,'delete_studentmodulehistory'),(73,'Can add x module user state summary field',25,'add_xmoduleuserstatesummaryfield'),(74,'Can change x module user state summary field',25,'change_xmoduleuserstatesummaryfield'),(75,'Can delete x module user state summary field',25,'delete_xmoduleuserstatesummaryfield'),(76,'Can add x module student prefs field',26,'add_xmodulestudentprefsfield'),(77,'Can change x module student prefs field',26,'change_xmodulestudentprefsfield'),(78,'Can delete x module student prefs field',26,'delete_xmodulestudentprefsfield'),(79,'Can add x module student info field',27,'add_xmodulestudentinfofield'),(80,'Can change x module student info field',27,'change_xmodulestudentinfofield'),(81,'Can delete x module student info field',27,'delete_xmodulestudentinfofield'),(82,'Can add offline computed grade',28,'add_offlinecomputedgrade'),(83,'Can change offline computed grade',28,'change_offlinecomputedgrade'),(84,'Can delete offline computed grade',28,'delete_offlinecomputedgrade'),(85,'Can add offline computed grade log',29,'add_offlinecomputedgradelog'),(86,'Can change offline computed grade log',29,'change_offlinecomputedgradelog'),(87,'Can delete offline computed grade log',29,'delete_offlinecomputedgradelog'),(88,'Can add student field override',30,'add_studentfieldoverride'),(89,'Can change student field override',30,'change_studentfieldoverride'),(90,'Can delete student field override',30,'delete_studentfieldoverride'),(91,'Can add x block disable config',31,'add_xblockdisableconfig'),(92,'Can change x block disable config',31,'change_xblockdisableconfig'),(93,'Can delete x block disable config',31,'delete_xblockdisableconfig'),(94,'Can add anonymous user id',32,'add_anonymoususerid'),(95,'Can change anonymous user id',32,'change_anonymoususerid'),(96,'Can delete anonymous user id',32,'delete_anonymoususerid'),(97,'Can add user standing',33,'add_userstanding'),(98,'Can change user standing',33,'change_userstanding'),(99,'Can delete user standing',33,'delete_userstanding'),(100,'Can add user profile',34,'add_userprofile'),(101,'Can change user profile',34,'change_userprofile'),(102,'Can delete user profile',34,'delete_userprofile'),(103,'Can add user signup source',35,'add_usersignupsource'),(104,'Can change user signup source',35,'change_usersignupsource'),(105,'Can delete user signup source',35,'delete_usersignupsource'),(106,'Can add user test group',36,'add_usertestgroup'),(107,'Can change user test group',36,'change_usertestgroup'),(108,'Can delete user test group',36,'delete_usertestgroup'),(109,'Can add registration',37,'add_registration'),(110,'Can change registration',37,'change_registration'),(111,'Can delete registration',37,'delete_registration'),(112,'Can add pending name change',38,'add_pendingnamechange'),(113,'Can change pending name change',38,'change_pendingnamechange'),(114,'Can delete pending name change',38,'delete_pendingnamechange'),(115,'Can add pending email change',39,'add_pendingemailchange'),(116,'Can change pending email change',39,'change_pendingemailchange'),(117,'Can delete pending email change',39,'delete_pendingemailchange'),(118,'Can add password history',40,'add_passwordhistory'),(119,'Can change password history',40,'change_passwordhistory'),(120,'Can delete password history',40,'delete_passwordhistory'),(121,'Can add login failures',41,'add_loginfailures'),(122,'Can change login failures',41,'change_loginfailures'),(123,'Can delete login failures',41,'delete_loginfailures'),(124,'Can add course enrollment',42,'add_courseenrollment'),(125,'Can change course enrollment',42,'change_courseenrollment'),(126,'Can delete course enrollment',42,'delete_courseenrollment'),(127,'Can add manual enrollment audit',43,'add_manualenrollmentaudit'),(128,'Can change manual enrollment audit',43,'change_manualenrollmentaudit'),(129,'Can delete manual enrollment audit',43,'delete_manualenrollmentaudit'),(130,'Can add course enrollment allowed',44,'add_courseenrollmentallowed'),(131,'Can change course enrollment allowed',44,'change_courseenrollmentallowed'),(132,'Can delete course enrollment allowed',44,'delete_courseenrollmentallowed'),(133,'Can add course access role',45,'add_courseaccessrole'),(134,'Can change course access role',45,'change_courseaccessrole'),(135,'Can delete course access role',45,'delete_courseaccessrole'),(136,'Can add dashboard configuration',46,'add_dashboardconfiguration'),(137,'Can change dashboard configuration',46,'change_dashboardconfiguration'),(138,'Can delete dashboard configuration',46,'delete_dashboardconfiguration'),(139,'Can add linked in add to profile configuration',47,'add_linkedinaddtoprofileconfiguration'),(140,'Can change linked in add to profile configuration',47,'change_linkedinaddtoprofileconfiguration'),(141,'Can delete linked in add to profile configuration',47,'delete_linkedinaddtoprofileconfiguration'),(142,'Can add entrance exam configuration',48,'add_entranceexamconfiguration'),(143,'Can change entrance exam configuration',48,'change_entranceexamconfiguration'),(144,'Can delete entrance exam configuration',48,'delete_entranceexamconfiguration'),(145,'Can add language proficiency',49,'add_languageproficiency'),(146,'Can change language proficiency',49,'change_languageproficiency'),(147,'Can delete language proficiency',49,'delete_languageproficiency'),(148,'Can add course enrollment attribute',50,'add_courseenrollmentattribute'),(149,'Can change course enrollment attribute',50,'change_courseenrollmentattribute'),(150,'Can delete course enrollment attribute',50,'delete_courseenrollmentattribute'),(151,'Can add tracking log',51,'add_trackinglog'),(152,'Can change tracking log',51,'change_trackinglog'),(153,'Can delete tracking log',51,'delete_trackinglog'),(154,'Can add rate limit configuration',52,'add_ratelimitconfiguration'),(155,'Can change rate limit configuration',52,'change_ratelimitconfiguration'),(156,'Can delete rate limit configuration',52,'delete_ratelimitconfiguration'),(157,'Can add certificate whitelist',53,'add_certificatewhitelist'),(158,'Can change certificate whitelist',53,'change_certificatewhitelist'),(159,'Can delete certificate whitelist',53,'delete_certificatewhitelist'),(160,'Can add generated certificate',54,'add_generatedcertificate'),(161,'Can change generated certificate',54,'change_generatedcertificate'),(162,'Can delete generated certificate',54,'delete_generatedcertificate'),(163,'Can add example certificate set',55,'add_examplecertificateset'),(164,'Can change example certificate set',55,'change_examplecertificateset'),(165,'Can delete example certificate set',55,'delete_examplecertificateset'),(166,'Can add example certificate',56,'add_examplecertificate'),(167,'Can change example certificate',56,'change_examplecertificate'),(168,'Can delete example certificate',56,'delete_examplecertificate'),(169,'Can add certificate generation course setting',57,'add_certificategenerationcoursesetting'),(170,'Can change certificate generation course setting',57,'change_certificategenerationcoursesetting'),(171,'Can delete certificate generation course setting',57,'delete_certificategenerationcoursesetting'),(172,'Can add certificate generation configuration',58,'add_certificategenerationconfiguration'),(173,'Can change certificate generation configuration',58,'change_certificategenerationconfiguration'),(174,'Can delete certificate generation configuration',58,'delete_certificategenerationconfiguration'),(175,'Can add certificate html view configuration',59,'add_certificatehtmlviewconfiguration'),(176,'Can change certificate html view configuration',59,'change_certificatehtmlviewconfiguration'),(177,'Can delete certificate html view configuration',59,'delete_certificatehtmlviewconfiguration'),(178,'Can add badge assertion',60,'add_badgeassertion'),(179,'Can change badge assertion',60,'change_badgeassertion'),(180,'Can delete badge assertion',60,'delete_badgeassertion'),(181,'Can add badge image configuration',61,'add_badgeimageconfiguration'),(182,'Can change badge image configuration',61,'change_badgeimageconfiguration'),(183,'Can delete badge image configuration',61,'delete_badgeimageconfiguration'),(184,'Can add instructor task',62,'add_instructortask'),(185,'Can change instructor task',62,'change_instructortask'),(186,'Can delete instructor task',62,'delete_instructortask'),(187,'Can add course software',63,'add_coursesoftware'),(188,'Can change course software',63,'change_coursesoftware'),(189,'Can delete course software',63,'delete_coursesoftware'),(190,'Can add user license',64,'add_userlicense'),(191,'Can change user license',64,'change_userlicense'),(192,'Can delete user license',64,'delete_userlicense'),(193,'Can add course user group',65,'add_courseusergroup'),(194,'Can change course user group',65,'change_courseusergroup'),(195,'Can delete course user group',65,'delete_courseusergroup'),(196,'Can add course user group partition group',66,'add_courseusergrouppartitiongroup'),(197,'Can change course user group partition group',66,'change_courseusergrouppartitiongroup'),(198,'Can delete course user group partition group',66,'delete_courseusergrouppartitiongroup'),(199,'Can add course cohorts settings',67,'add_coursecohortssettings'),(200,'Can change course cohorts settings',67,'change_coursecohortssettings'),(201,'Can delete course cohorts settings',67,'delete_coursecohortssettings'),(202,'Can add course cohort',68,'add_coursecohort'),(203,'Can change course cohort',68,'change_coursecohort'),(204,'Can delete course cohort',68,'delete_coursecohort'),(205,'Can add course email',69,'add_courseemail'),(206,'Can change course email',69,'change_courseemail'),(207,'Can delete course email',69,'delete_courseemail'),(208,'Can add optout',70,'add_optout'),(209,'Can change optout',70,'change_optout'),(210,'Can delete optout',70,'delete_optout'),(211,'Can add course email template',71,'add_courseemailtemplate'),(212,'Can change course email template',71,'change_courseemailtemplate'),(213,'Can delete course email template',71,'delete_courseemailtemplate'),(214,'Can add course authorization',72,'add_courseauthorization'),(215,'Can change course authorization',72,'change_courseauthorization'),(216,'Can delete course authorization',72,'delete_courseauthorization'),(217,'Can add branding info config',73,'add_brandinginfoconfig'),(218,'Can change branding info config',73,'change_brandinginfoconfig'),(219,'Can delete branding info config',73,'delete_brandinginfoconfig'),(220,'Can add branding api config',74,'add_brandingapiconfig'),(221,'Can change branding api config',74,'change_brandingapiconfig'),(222,'Can delete branding api config',74,'delete_brandingapiconfig'),(223,'Can add external auth map',75,'add_externalauthmap'),(224,'Can change external auth map',75,'change_externalauthmap'),(225,'Can delete external auth map',75,'delete_externalauthmap'),(226,'Can add client',76,'add_client'),(227,'Can change client',76,'change_client'),(228,'Can delete client',76,'delete_client'),(229,'Can add grant',77,'add_grant'),(230,'Can change grant',77,'change_grant'),(231,'Can delete grant',77,'delete_grant'),(232,'Can add access token',78,'add_accesstoken'),(233,'Can change access token',78,'change_accesstoken'),(234,'Can delete access token',78,'delete_accesstoken'),(235,'Can add refresh token',79,'add_refreshtoken'),(236,'Can change refresh token',79,'change_refreshtoken'),(237,'Can delete refresh token',79,'delete_refreshtoken'),(238,'Can add trusted client',80,'add_trustedclient'),(239,'Can change trusted client',80,'change_trustedclient'),(240,'Can delete trusted client',80,'delete_trustedclient'),(241,'Can add article',81,'add_article'),(242,'Can change article',81,'change_article'),(243,'Can delete article',81,'delete_article'),(244,'Can edit all articles and lock/unlock/restore',81,'moderate'),(245,'Can change ownership of any article',81,'assign'),(246,'Can assign permissions to other users',81,'grant'),(247,'Can add Article for object',82,'add_articleforobject'),(248,'Can change Article for object',82,'change_articleforobject'),(249,'Can delete Article for object',82,'delete_articleforobject'),(250,'Can add article revision',83,'add_articlerevision'),(251,'Can change article revision',83,'change_articlerevision'),(252,'Can delete article revision',83,'delete_articlerevision'),(253,'Can add URL path',84,'add_urlpath'),(254,'Can change URL path',84,'change_urlpath'),(255,'Can delete URL path',84,'delete_urlpath'),(256,'Can add article plugin',85,'add_articleplugin'),(257,'Can change article plugin',85,'change_articleplugin'),(258,'Can delete article plugin',85,'delete_articleplugin'),(259,'Can add reusable plugin',86,'add_reusableplugin'),(260,'Can change reusable plugin',86,'change_reusableplugin'),(261,'Can delete reusable plugin',86,'delete_reusableplugin'),(262,'Can add simple plugin',87,'add_simpleplugin'),(263,'Can change simple plugin',87,'change_simpleplugin'),(264,'Can delete simple plugin',87,'delete_simpleplugin'),(265,'Can add revision plugin',88,'add_revisionplugin'),(266,'Can change revision plugin',88,'change_revisionplugin'),(267,'Can delete revision plugin',88,'delete_revisionplugin'),(268,'Can add revision plugin revision',89,'add_revisionpluginrevision'),(269,'Can change revision plugin revision',89,'change_revisionpluginrevision'),(270,'Can delete revision plugin revision',89,'delete_revisionpluginrevision'),(271,'Can add article subscription',90,'add_articlesubscription'),(272,'Can change article subscription',90,'change_articlesubscription'),(273,'Can delete article subscription',90,'delete_articlesubscription'),(274,'Can add type',91,'add_notificationtype'),(275,'Can change type',91,'change_notificationtype'),(276,'Can delete type',91,'delete_notificationtype'),(277,'Can add settings',92,'add_settings'),(278,'Can change settings',92,'change_settings'),(279,'Can delete settings',92,'delete_settings'),(280,'Can add subscription',93,'add_subscription'),(281,'Can change subscription',93,'change_subscription'),(282,'Can delete subscription',93,'delete_subscription'),(283,'Can add notification',94,'add_notification'),(284,'Can change notification',94,'change_notification'),(285,'Can delete notification',94,'delete_notification'),(286,'Can add score',95,'add_score'),(287,'Can change score',95,'change_score'),(288,'Can delete score',95,'delete_score'),(289,'Can add puzzle complete',96,'add_puzzlecomplete'),(290,'Can change puzzle complete',96,'change_puzzlecomplete'),(291,'Can delete puzzle complete',96,'delete_puzzlecomplete'),(292,'Can add note',97,'add_note'),(293,'Can change note',97,'change_note'),(294,'Can delete note',97,'delete_note'),(295,'Can add splash config',98,'add_splashconfig'),(296,'Can change splash config',98,'change_splashconfig'),(297,'Can delete splash config',98,'delete_splashconfig'),(298,'Can add user preference',99,'add_userpreference'),(299,'Can change user preference',99,'change_userpreference'),(300,'Can delete user preference',99,'delete_userpreference'),(301,'Can add user course tag',100,'add_usercoursetag'),(302,'Can change user course tag',100,'change_usercoursetag'),(303,'Can delete user course tag',100,'delete_usercoursetag'),(304,'Can add user org tag',101,'add_userorgtag'),(305,'Can change user org tag',101,'change_userorgtag'),(306,'Can delete user org tag',101,'delete_userorgtag'),(307,'Can add course team',102,'add_courseteam'),(308,'Can change course team',102,'change_courseteam'),(309,'Can delete course team',102,'delete_courseteam'),(310,'Can add course team membership',103,'add_courseteammembership'),(311,'Can change course team membership',103,'change_courseteammembership'),(312,'Can delete course team membership',103,'delete_courseteammembership'),(313,'Can add order',104,'add_order'),(314,'Can change order',104,'change_order'),(315,'Can delete order',104,'delete_order'),(316,'Can add order item',105,'add_orderitem'),(317,'Can change order item',105,'change_orderitem'),(318,'Can delete order item',105,'delete_orderitem'),(319,'Can add invoice',106,'add_invoice'),(320,'Can change invoice',106,'change_invoice'),(321,'Can delete invoice',106,'delete_invoice'),(322,'Can add invoice transaction',107,'add_invoicetransaction'),(323,'Can change invoice transaction',107,'change_invoicetransaction'),(324,'Can delete invoice transaction',107,'delete_invoicetransaction'),(325,'Can add invoice item',108,'add_invoiceitem'),(326,'Can change invoice item',108,'change_invoiceitem'),(327,'Can delete invoice item',108,'delete_invoiceitem'),(328,'Can add course registration code invoice item',109,'add_courseregistrationcodeinvoiceitem'),(329,'Can change course registration code invoice item',109,'change_courseregistrationcodeinvoiceitem'),(330,'Can delete course registration code invoice item',109,'delete_courseregistrationcodeinvoiceitem'),(331,'Can add invoice history',110,'add_invoicehistory'),(332,'Can change invoice history',110,'change_invoicehistory'),(333,'Can delete invoice history',110,'delete_invoicehistory'),(334,'Can add course registration code',111,'add_courseregistrationcode'),(335,'Can change course registration code',111,'change_courseregistrationcode'),(336,'Can delete course registration code',111,'delete_courseregistrationcode'),(337,'Can add registration code redemption',112,'add_registrationcoderedemption'),(338,'Can change registration code redemption',112,'change_registrationcoderedemption'),(339,'Can delete registration code redemption',112,'delete_registrationcoderedemption'),(340,'Can add coupon',113,'add_coupon'),(341,'Can change coupon',113,'change_coupon'),(342,'Can delete coupon',113,'delete_coupon'),(343,'Can add coupon redemption',114,'add_couponredemption'),(344,'Can change coupon redemption',114,'change_couponredemption'),(345,'Can delete coupon redemption',114,'delete_couponredemption'),(346,'Can add paid course registration',115,'add_paidcourseregistration'),(347,'Can change paid course registration',115,'change_paidcourseregistration'),(348,'Can delete paid course registration',115,'delete_paidcourseregistration'),(349,'Can add course reg code item',116,'add_courseregcodeitem'),(350,'Can change course reg code item',116,'change_courseregcodeitem'),(351,'Can delete course reg code item',116,'delete_courseregcodeitem'),(352,'Can add course reg code item annotation',117,'add_courseregcodeitemannotation'),(353,'Can change course reg code item annotation',117,'change_courseregcodeitemannotation'),(354,'Can delete course reg code item annotation',117,'delete_courseregcodeitemannotation'),(355,'Can add paid course registration annotation',118,'add_paidcourseregistrationannotation'),(356,'Can change paid course registration annotation',118,'change_paidcourseregistrationannotation'),(357,'Can delete paid course registration annotation',118,'delete_paidcourseregistrationannotation'),(358,'Can add certificate item',119,'add_certificateitem'),(359,'Can change certificate item',119,'change_certificateitem'),(360,'Can delete certificate item',119,'delete_certificateitem'),(361,'Can add donation configuration',120,'add_donationconfiguration'),(362,'Can change donation configuration',120,'change_donationconfiguration'),(363,'Can delete donation configuration',120,'delete_donationconfiguration'),(364,'Can add donation',121,'add_donation'),(365,'Can change donation',121,'change_donation'),(366,'Can delete donation',121,'delete_donation'),(367,'Can add course mode',122,'add_coursemode'),(368,'Can change course mode',122,'change_coursemode'),(369,'Can delete course mode',122,'delete_coursemode'),(370,'Can add course modes archive',123,'add_coursemodesarchive'),(371,'Can change course modes archive',123,'change_coursemodesarchive'),(372,'Can delete course modes archive',123,'delete_coursemodesarchive'),(373,'Can add software secure photo verification',124,'add_softwaresecurephotoverification'),(374,'Can change software secure photo verification',124,'change_softwaresecurephotoverification'),(375,'Can delete software secure photo verification',124,'delete_softwaresecurephotoverification'),(376,'Can add verification checkpoint',125,'add_verificationcheckpoint'),(377,'Can change verification checkpoint',125,'change_verificationcheckpoint'),(378,'Can delete verification checkpoint',125,'delete_verificationcheckpoint'),(379,'Can add Verification Status',126,'add_verificationstatus'),(380,'Can change Verification Status',126,'change_verificationstatus'),(381,'Can delete Verification Status',126,'delete_verificationstatus'),(382,'Can add in course reverification configuration',127,'add_incoursereverificationconfiguration'),(383,'Can change in course reverification configuration',127,'change_incoursereverificationconfiguration'),(384,'Can delete in course reverification configuration',127,'delete_incoursereverificationconfiguration'),(385,'Can add skipped reverification',128,'add_skippedreverification'),(386,'Can change skipped reverification',128,'change_skippedreverification'),(387,'Can delete skipped reverification',128,'delete_skippedreverification'),(388,'Can add dark lang config',129,'add_darklangconfig'),(389,'Can change dark lang config',129,'change_darklangconfig'),(390,'Can delete dark lang config',129,'delete_darklangconfig'),(391,'Can add embargoed course',130,'add_embargoedcourse'),(392,'Can change embargoed course',130,'change_embargoedcourse'),(393,'Can delete embargoed course',130,'delete_embargoedcourse'),(394,'Can add embargoed state',131,'add_embargoedstate'),(395,'Can change embargoed state',131,'change_embargoedstate'),(396,'Can delete embargoed state',131,'delete_embargoedstate'),(397,'Can add restricted course',132,'add_restrictedcourse'),(398,'Can change restricted course',132,'change_restrictedcourse'),(399,'Can delete restricted course',132,'delete_restrictedcourse'),(400,'Can add country',133,'add_country'),(401,'Can change country',133,'change_country'),(402,'Can delete country',133,'delete_country'),(403,'Can add country access rule',134,'add_countryaccessrule'),(404,'Can change country access rule',134,'change_countryaccessrule'),(405,'Can delete country access rule',134,'delete_countryaccessrule'),(406,'Can add course access rule history',135,'add_courseaccessrulehistory'),(407,'Can change course access rule history',135,'change_courseaccessrulehistory'),(408,'Can delete course access rule history',135,'delete_courseaccessrulehistory'),(409,'Can add ip filter',136,'add_ipfilter'),(410,'Can change ip filter',136,'change_ipfilter'),(411,'Can delete ip filter',136,'delete_ipfilter'),(412,'Can add course rerun state',137,'add_coursererunstate'),(413,'Can change course rerun state',137,'change_coursererunstate'),(414,'Can delete course rerun state',137,'delete_coursererunstate'),(415,'Can add mobile api config',138,'add_mobileapiconfig'),(416,'Can change mobile api config',138,'change_mobileapiconfig'),(417,'Can delete mobile api config',138,'delete_mobileapiconfig'),(418,'Can add survey form',139,'add_surveyform'),(419,'Can change survey form',139,'change_surveyform'),(420,'Can delete survey form',139,'delete_surveyform'),(421,'Can add survey answer',140,'add_surveyanswer'),(422,'Can change survey answer',140,'change_surveyanswer'),(423,'Can delete survey answer',140,'delete_surveyanswer'),(424,'Can add x block asides config',141,'add_xblockasidesconfig'),(425,'Can change x block asides config',141,'change_xblockasidesconfig'),(426,'Can delete x block asides config',141,'delete_xblockasidesconfig'),(427,'Can add course overview',142,'add_courseoverview'),(428,'Can change course overview',142,'change_courseoverview'),(429,'Can delete course overview',142,'delete_courseoverview'),(430,'Can add course structure',143,'add_coursestructure'),(431,'Can change course structure',143,'change_coursestructure'),(432,'Can delete course structure',143,'delete_coursestructure'),(433,'Can add x domain proxy configuration',144,'add_xdomainproxyconfiguration'),(434,'Can change x domain proxy configuration',144,'change_xdomainproxyconfiguration'),(435,'Can delete x domain proxy configuration',144,'delete_xdomainproxyconfiguration'),(436,'Can add student item',145,'add_studentitem'),(437,'Can change student item',145,'change_studentitem'),(438,'Can delete student item',145,'delete_studentitem'),(439,'Can add submission',146,'add_submission'),(440,'Can change submission',146,'change_submission'),(441,'Can delete submission',146,'delete_submission'),(442,'Can add score',147,'add_score'),(443,'Can change score',147,'change_score'),(444,'Can delete score',147,'delete_score'),(445,'Can add score summary',148,'add_scoresummary'),(446,'Can change score summary',148,'change_scoresummary'),(447,'Can delete score summary',148,'delete_scoresummary'),(448,'Can add rubric',149,'add_rubric'),(449,'Can change rubric',149,'change_rubric'),(450,'Can delete rubric',149,'delete_rubric'),(451,'Can add criterion',150,'add_criterion'),(452,'Can change criterion',150,'change_criterion'),(453,'Can delete criterion',150,'delete_criterion'),(454,'Can add criterion option',151,'add_criterionoption'),(455,'Can change criterion option',151,'change_criterionoption'),(456,'Can delete criterion option',151,'delete_criterionoption'),(457,'Can add assessment',152,'add_assessment'),(458,'Can change assessment',152,'change_assessment'),(459,'Can delete assessment',152,'delete_assessment'),(460,'Can add assessment part',153,'add_assessmentpart'),(461,'Can change assessment part',153,'change_assessmentpart'),(462,'Can delete assessment part',153,'delete_assessmentpart'),(463,'Can add assessment feedback option',154,'add_assessmentfeedbackoption'),(464,'Can change assessment feedback option',154,'change_assessmentfeedbackoption'),(465,'Can delete assessment feedback option',154,'delete_assessmentfeedbackoption'),(466,'Can add assessment feedback',155,'add_assessmentfeedback'),(467,'Can change assessment feedback',155,'change_assessmentfeedback'),(468,'Can delete assessment feedback',155,'delete_assessmentfeedback'),(469,'Can add peer workflow',156,'add_peerworkflow'),(470,'Can change peer workflow',156,'change_peerworkflow'),(471,'Can delete peer workflow',156,'delete_peerworkflow'),(472,'Can add peer workflow item',157,'add_peerworkflowitem'),(473,'Can change peer workflow item',157,'change_peerworkflowitem'),(474,'Can delete peer workflow item',157,'delete_peerworkflowitem'),(475,'Can add training example',158,'add_trainingexample'),(476,'Can change training example',158,'change_trainingexample'),(477,'Can delete training example',158,'delete_trainingexample'),(478,'Can add student training workflow',159,'add_studenttrainingworkflow'),(479,'Can change student training workflow',159,'change_studenttrainingworkflow'),(480,'Can delete student training workflow',159,'delete_studenttrainingworkflow'),(481,'Can add student training workflow item',160,'add_studenttrainingworkflowitem'),(482,'Can change student training workflow item',160,'change_studenttrainingworkflowitem'),(483,'Can delete student training workflow item',160,'delete_studenttrainingworkflowitem'),(484,'Can add ai classifier set',161,'add_aiclassifierset'),(485,'Can change ai classifier set',161,'change_aiclassifierset'),(486,'Can delete ai classifier set',161,'delete_aiclassifierset'),(487,'Can add ai classifier',162,'add_aiclassifier'),(488,'Can change ai classifier',162,'change_aiclassifier'),(489,'Can delete ai classifier',162,'delete_aiclassifier'),(490,'Can add ai training workflow',163,'add_aitrainingworkflow'),(491,'Can change ai training workflow',163,'change_aitrainingworkflow'),(492,'Can delete ai training workflow',163,'delete_aitrainingworkflow'),(493,'Can add ai grading workflow',164,'add_aigradingworkflow'),(494,'Can change ai grading workflow',164,'change_aigradingworkflow'),(495,'Can delete ai grading workflow',164,'delete_aigradingworkflow'),(496,'Can add assessment workflow',165,'add_assessmentworkflow'),(497,'Can change assessment workflow',165,'change_assessmentworkflow'),(498,'Can delete assessment workflow',165,'delete_assessmentworkflow'),(499,'Can add assessment workflow step',166,'add_assessmentworkflowstep'),(500,'Can change assessment workflow step',166,'change_assessmentworkflowstep'),(501,'Can delete assessment workflow step',166,'delete_assessmentworkflowstep'),(502,'Can add assessment workflow cancellation',167,'add_assessmentworkflowcancellation'),(503,'Can change assessment workflow cancellation',167,'change_assessmentworkflowcancellation'),(504,'Can delete assessment workflow cancellation',167,'delete_assessmentworkflowcancellation'),(505,'Can add profile',168,'add_profile'),(506,'Can change profile',168,'change_profile'),(507,'Can delete profile',168,'delete_profile'),(508,'Can add video',169,'add_video'),(509,'Can change video',169,'change_video'),(510,'Can delete video',169,'delete_video'),(511,'Can add course video',170,'add_coursevideo'),(512,'Can change course video',170,'change_coursevideo'),(513,'Can delete course video',170,'delete_coursevideo'),(514,'Can add encoded video',171,'add_encodedvideo'),(515,'Can change encoded video',171,'change_encodedvideo'),(516,'Can delete encoded video',171,'delete_encodedvideo'),(517,'Can add subtitle',172,'add_subtitle'),(518,'Can change subtitle',172,'change_subtitle'),(519,'Can delete subtitle',172,'delete_subtitle'),(520,'Can add milestone',173,'add_milestone'),(521,'Can change milestone',173,'change_milestone'),(522,'Can delete milestone',173,'delete_milestone'),(523,'Can add milestone relationship type',174,'add_milestonerelationshiptype'),(524,'Can change milestone relationship type',174,'change_milestonerelationshiptype'),(525,'Can delete milestone relationship type',174,'delete_milestonerelationshiptype'),(526,'Can add course milestone',175,'add_coursemilestone'),(527,'Can change course milestone',175,'change_coursemilestone'),(528,'Can delete course milestone',175,'delete_coursemilestone'),(529,'Can add course content milestone',176,'add_coursecontentmilestone'),(530,'Can change course content milestone',176,'change_coursecontentmilestone'),(531,'Can delete course content milestone',176,'delete_coursecontentmilestone'),(532,'Can add user milestone',177,'add_usermilestone'),(533,'Can change user milestone',177,'change_usermilestone'),(534,'Can delete user milestone',177,'delete_usermilestone'),(535,'Can add credit provider',178,'add_creditprovider'),(536,'Can change credit provider',178,'change_creditprovider'),(537,'Can delete credit provider',178,'delete_creditprovider'),(538,'Can add credit course',179,'add_creditcourse'),(539,'Can change credit course',179,'change_creditcourse'),(540,'Can delete credit course',179,'delete_creditcourse'),(541,'Can add credit requirement',180,'add_creditrequirement'),(542,'Can change credit requirement',180,'change_creditrequirement'),(543,'Can delete credit requirement',180,'delete_creditrequirement'),(544,'Can add historical credit requirement status',181,'add_historicalcreditrequirementstatus'),(545,'Can change historical credit requirement status',181,'change_historicalcreditrequirementstatus'),(546,'Can delete historical credit requirement status',181,'delete_historicalcreditrequirementstatus'),(547,'Can add credit requirement status',182,'add_creditrequirementstatus'),(548,'Can change credit requirement status',182,'change_creditrequirementstatus'),(549,'Can delete credit requirement status',182,'delete_creditrequirementstatus'),(550,'Can add credit eligibility',183,'add_crediteligibility'),(551,'Can change credit eligibility',183,'change_crediteligibility'),(552,'Can delete credit eligibility',183,'delete_crediteligibility'),(553,'Can add historical credit request',184,'add_historicalcreditrequest'),(554,'Can change historical credit request',184,'change_historicalcreditrequest'),(555,'Can delete historical credit request',184,'delete_historicalcreditrequest'),(556,'Can add credit request',185,'add_creditrequest'),(557,'Can change credit request',185,'change_creditrequest'),(558,'Can delete credit request',185,'delete_creditrequest'),(559,'Can add video upload config',186,'add_videouploadconfig'),(560,'Can change video upload config',186,'change_videouploadconfig'),(561,'Can delete video upload config',186,'delete_videouploadconfig'),(562,'Can add push notification config',187,'add_pushnotificationconfig'),(563,'Can change push notification config',187,'change_pushnotificationconfig'),(564,'Can delete push notification config',187,'delete_pushnotificationconfig'),(565,'Can add course creator',188,'add_coursecreator'),(566,'Can change course creator',188,'change_coursecreator'),(567,'Can delete course creator',188,'delete_coursecreator'),(568,'Can add studio config',189,'add_studioconfig'),(569,'Can change studio config',189,'change_studioconfig'),(570,'Can delete studio config',189,'delete_studioconfig'),(571,'Can add organization',190,'add_organization'),(572,'Can change organization',190,'change_organization'),(573,'Can delete organization',190,'delete_organization'),(574,'Can add subject',191,'add_subject'),(575,'Can change subject',191,'change_subject'),(576,'Can delete subject',191,'delete_subject'),(577,'Can add course_subject',192,'add_course_subject'),(578,'Can change course_subject',192,'change_course_subject'),(579,'Can delete course_subject',192,'delete_course_subject'),(580,'Can add mooc_state',193,'add_mooc_state'),(581,'Can change mooc_state',193,'change_mooc_state'),(582,'Can delete mooc_state',193,'delete_mooc_state'),(583,'Can add mooc_city',194,'add_mooc_city'),(584,'Can change mooc_city',194,'change_mooc_city'),(585,'Can delete mooc_city',194,'delete_mooc_city'),(586,'Can add mooc_person',195,'add_mooc_person'),(587,'Can change mooc_person',195,'change_mooc_person'),(588,'Can delete mooc_person',195,'delete_mooc_person');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_registration`
--

LOCK TABLES `auth_registration` WRITE;
/*!40000 ALTER TABLE `auth_registration` DISABLE KEYS */;
INSERT INTO `auth_registration` VALUES (1,1,'c44b567d4227448587626b700f9c5368'),(2,2,'da7446f1cd164e91b085a2cd7500dda1'),(3,3,'a3b7236f3bd14500abf2bdcce9c392a4'),(4,4,'ea59c06245154790aa56a9403a5ed2ab'),(5,5,'4015380bba344dca8b3d9e04c0ba6893');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'honor','','','honor@example.com','pbkdf2_sha256$10000$H4vPAlmIcGbZ$eDXlSwEc9bngnJF8Q2lhxgYy5nM3MIyRJCh7FNwMAWM=',0,1,0,'2015-10-29 14:28:05','2015-10-29 14:28:05'),(2,'audit','','','audit@example.com','pbkdf2_sha256$10000$vK1hN88LFJnV$fGNeN1NxgkB3cQpf9uS/IkLWrAVzwdlMBElC1bA7xBI=',0,1,0,'2015-10-29 14:28:08','2015-10-29 14:28:08'),(3,'verified','','','verified@example.com','pbkdf2_sha256$10000$0pYun3l6AAuI$KXGliiC4sWay9jw0GBdFL4voW0dUvO8gXJCS4tMQ1z0=',0,1,0,'2015-10-29 14:28:11','2015-10-29 14:28:11'),(4,'staff','','','staff@example.com','pbkdf2_sha256$10000$Ks4wif0kYKsP$jVC2sBzhu1j5PIaEN43e3Oo3xPn5SWPzGVjEumBdT3w=',1,1,0,'2015-10-29 14:28:14','2015-10-29 14:28:14'),(5,'admin','','','admin@example.com','pbkdf2_sha256$10000$izERu8HN92hH$89S6kMQ5vKW9xc+m1Br7W4byJ17f9FNVPMEKGZKF/VE=',1,1,1,'2015-11-27 07:35:25','2015-11-27 07:27:28');
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
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `auth_userprofile_8a7ac9ab` (`language`),
  KEY `auth_userprofile_b54954de` (`location`),
  KEY `auth_userprofile_fca3d292` (`gender`),
  KEY `auth_userprofile_d85587` (`year_of_birth`),
  KEY `auth_userprofile_551e365c` (`level_of_education`),
  CONSTRAINT `user_id_refs_id_628b4c11` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_userprofile`
--

LOCK TABLES `auth_userprofile` WRITE;
/*!40000 ALTER TABLE `auth_userprofile` DISABLE KEYS */;
INSERT INTO `auth_userprofile` VALUES (1,1,'honor','','','','course.xml',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(2,2,'audit','','','','course.xml',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(3,3,'verified','','','','course.xml',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(4,4,'staff','','','','course.xml',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(5,5,'admin','','','{\"session_id\": null}','course.xml',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL);
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
  CONSTRAINT `changed_by_id_refs_id_d2757db8` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `bulk_email_courseauthorization_course_id_4f6cee675bf93275_uniq` (`course_id`),
  KEY `bulk_email_courseauthorization_ff48d8e5` (`course_id`)
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
  KEY `bulk_email_courseemail_901f59e9` (`sender_id`),
  KEY `bulk_email_courseemail_36af87d1` (`slug`),
  KEY `bulk_email_courseemail_ff48d8e5` (`course_id`),
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
  UNIQUE KEY `bulk_email_optout_course_id_368f7519b2997e1a_uniq` (`course_id`,`user_id`),
  KEY `bulk_email_optout_ff48d8e5` (`course_id`),
  KEY `bulk_email_optout_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_9e68e67c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `certificates_badgeassertion_course_id_f465e63872f731f_uniq` (`course_id`,`user_id`),
  KEY `certificates_badgeassertion_fbfc09f1` (`user_id`),
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
  CONSTRAINT `changed_by_id_refs_id_abb3a677` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `certificates_certificategenerationcoursesetting_b4b47e7a` (`course_key`)
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
  CONSTRAINT `changed_by_id_refs_id_8584db17` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatehtmlviewconfiguration`
--

LOCK TABLES `certificates_certificatehtmlviewconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_certificatehtmlviewconfiguration` DISABLE KEYS */;
INSERT INTO `certificates_certificatehtmlviewconfiguration` VALUES (1,'2015-10-29 14:05:05',NULL,0,'{\"default\": {\"accomplishment_class_append\": \"accomplishment-certificate\", \"platform_name\": \"Your Platform Name Here\", \"logo_src\": \"/static/certificates/images/logo.png\", \"logo_url\": \"http://www.example.com\", \"company_verified_certificate_url\": \"http://www.example.com/verified-certificate\", \"company_privacy_url\": \"http://www.example.com/privacy-policy\", \"company_tos_url\": \"http://www.example.com/terms-service\", \"company_about_url\": \"http://www.example.com/about-us\"}, \"base\": {\"certificate_type\": \"base\", \"certificate_title\": \"Certificate of Achievement\", \"document_body_class_append\": \"is-base\"}, \"distinguished\": {\"certificate_type\": \"distinguished\", \"certificate_title\": \"Distinguished Certificate of Achievement\", \"document_body_class_append\": \"is-distinguished\"}}');
/*!40000 ALTER TABLE `certificates_certificatehtmlviewconfiguration` ENABLE KEYS */;
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
  KEY `certificates_certificatewhitelist_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_a7ba9306` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `certificates_examplecertificate_uuid_183b9188451b331e` (`uuid`,`access_key`),
  KEY `certificates_examplecertificate_3b9264a` (`example_cert_set_id`),
  KEY `certificates_examplecertificate_752852c3` (`access_key`),
  CONSTRAINT `example_cert_set_id_refs_id_bdd9e28a` FOREIGN KEY (`example_cert_set_id`) REFERENCES `certificates_examplecertificateset` (`id`)
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
  KEY `certificates_examplecertificateset_b4b47e7a` (`course_key`)
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
  UNIQUE KEY `certificates_generatedcertifica_course_id_1389f6b2d72f5e78_uniq` (`course_id`,`user_id`),
  KEY `certificates_generatedcertificate_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_8e23bfe2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  CONSTRAINT `changed_by_id_refs_id_e431b975` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
INSERT INTO `contentstore_videouploadconfig` VALUES (1,'2015-10-29 14:10:06',NULL,0,'desktop_mp4,desktop_webm,mobile_low,youtube');
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
  UNIQUE KEY `course_action_state_coursererun_course_key_cf5da77ed3032d6_uniq` (`course_key`,`action`),
  KEY `course_action_state_coursererunstate_5b876fa2` (`created_user_id`),
  KEY `course_action_state_coursererunstate_ceb2e2e7` (`updated_user_id`),
  KEY `course_action_state_coursererunstate_b4b47e7a` (`course_key`),
  KEY `course_action_state_coursererunstate_1bd4707b` (`action`),
  KEY `course_action_state_coursererunstate_ebfe36dd` (`source_course_key`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_creators_coursecreator`
--

LOCK TABLES `course_creators_coursecreator` WRITE;
/*!40000 ALTER TABLE `course_creators_coursecreator` DISABLE KEYS */;
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
  CONSTRAINT `course_user_group_id_refs_id_8febc00f` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
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
  UNIQUE KEY `course_groups_courseusergroup_name_63f7511804c52f38_uniq` (`name`,`course_id`),
  KEY `course_groups_courseusergroup_ff48d8e5` (`course_id`)
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
  UNIQUE KEY `course_groups_courseus_courseusergroup_id_46691806058983eb_uniq` (`courseusergroup_id`,`user_id`),
  KEY `course_groups_courseusergroup_users_caee1c64` (`courseusergroup_id`),
  KEY `course_groups_courseusergroup_users_fbfc09f1` (`user_id`),
  CONSTRAINT `courseusergroup_id_refs_id_d26180aa` FOREIGN KEY (`courseusergroup_id`) REFERENCES `course_groups_courseusergroup` (`id`),
  CONSTRAINT `user_id_refs_id_bf33b47a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `course_modes_coursemode_course_id_69505c92fc09856_uniq` (`course_id`,`currency`,`mode_slug`),
  KEY `course_modes_coursemode_ff48d8e5` (`course_id`)
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
  KEY `course_modes_coursemodesarchive_ff48d8e5` (`course_id`)
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
  `lowest_passing_grade` decimal(5,2) NOT NULL,
  `mobile_available` tinyint(1) NOT NULL,
  `visible_to_staff_only` tinyint(1) NOT NULL,
  `_pre_requisite_courses_json` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverview`
--

LOCK TABLES `course_overviews_courseoverview` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverview` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_structures_coursestructure`
--

LOCK TABLES `course_structures_coursestructure` WRITE;
/*!40000 ALTER TABLE `course_structures_coursestructure` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_structures_coursestructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_course_subject`
--

DROP TABLE IF EXISTS `courseware_course_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_course_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_course_subject`
--

LOCK TABLES `courseware_course_subject` WRITE;
/*!40000 ALTER TABLE `courseware_course_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_course_subject` ENABLE KEYS */;
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
  UNIQUE KEY `courseware_offlinecomputedgrade_user_id_46133bbd0926078f_uniq` (`user_id`,`course_id`),
  KEY `courseware_offlinecomputedgrade_fbfc09f1` (`user_id`),
  KEY `courseware_offlinecomputedgrade_ff48d8e5` (`course_id`),
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
  KEY `courseware_offlinecomputedgradelog_ff48d8e5` (`course_id`),
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
-- Table structure for table `courseware_organization`
--

DROP TABLE IF EXISTS `courseware_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` varchar(255) NOT NULL,
  `org_name` longtext NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `url` longtext NOT NULL,
  `information` longtext NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `header_graphic` varchar(255) NOT NULL,
  `contact_marketing` varchar(255) NOT NULL,
  `contact_course_content` varchar(255) NOT NULL,
  `contact_review_process` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_organization`
--

LOCK TABLES `courseware_organization` WRITE;
/*!40000 ALTER TABLE `courseware_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_organization` ENABLE KEYS */;
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
  UNIQUE KEY `courseware_studentfieldoverride_course_id_39dd7eaeac5623d2_uniq` (`course_id`,`field`,`location`,`student_id`),
  KEY `courseware_studentfieldoverride_ff48d8e5` (`course_id`),
  KEY `courseware_studentfieldoverride_b54954de` (`location`),
  KEY `courseware_studentfieldoverride_42ff452e` (`student_id`),
  KEY `courseware_studentfieldoverride_course_id_344e77afe4983e04` (`course_id`,`location`,`student_id`),
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
  UNIQUE KEY `courseware_studentmodule_student_id_635d77aea1256de5_uniq` (`student_id`,`module_id`,`course_id`),
  KEY `courseware_studentmodule_42ff452e` (`student_id`),
  KEY `courseware_studentmodule_3216ff68` (`created`),
  KEY `courseware_studentmodule_6dff86b5` (`grade`),
  KEY `courseware_studentmodule_5436e97a` (`modified`),
  KEY `courseware_studentmodule_2d8768ff` (`module_type`),
  KEY `courseware_studentmodule_f53ed95e` (`module_id`),
  KEY `courseware_studentmodule_1923c03f` (`done`),
  KEY `courseware_studentmodule_ff48d8e5` (`course_id`),
  CONSTRAINT `student_id_refs_id_79ba2570` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentmodule`
--

LOCK TABLES `courseware_studentmodule` WRITE;
/*!40000 ALTER TABLE `courseware_studentmodule` DISABLE KEYS */;
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
  CONSTRAINT `student_module_id_refs_id_e48636f4` FOREIGN KEY (`student_module_id`) REFERENCES `courseware_studentmodule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentmodulehistory`
--

LOCK TABLES `courseware_studentmodulehistory` WRITE;
/*!40000 ALTER TABLE `courseware_studentmodulehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_studentmodulehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_subject`
--

DROP TABLE IF EXISTS `courseware_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_subject`
--

LOCK TABLES `courseware_subject` WRITE;
/*!40000 ALTER TABLE `courseware_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_subject` ENABLE KEYS */;
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
  UNIQUE KEY `courseware_xmodulestudentinfof_student_id_33f2f772c49db067_uniq` (`student_id`,`field_name`),
  KEY `courseware_xmodulestudentinfofield_7e1499` (`field_name`),
  KEY `courseware_xmodulestudentinfofield_42ff452e` (`student_id`),
  KEY `courseware_xmodulestudentinfofield_3216ff68` (`created`),
  KEY `courseware_xmodulestudentinfofield_5436e97a` (`modified`),
  CONSTRAINT `student_id_refs_id_bfcfbe68` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmodulestudentinfofield`
--

LOCK TABLES `courseware_xmodulestudentinfofield` WRITE;
/*!40000 ALTER TABLE `courseware_xmodulestudentinfofield` DISABLE KEYS */;
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
  UNIQUE KEY `courseware_xmodulestudentprefs_student_id_2a5d275498b7a407_uniq` (`student_id`,`module_type`,`field_name`),
  KEY `courseware_xmodulestudentprefsfield_7e1499` (`field_name`),
  KEY `courseware_xmodulestudentprefsfield_2d8768ff` (`module_type`),
  KEY `courseware_xmodulestudentprefsfield_42ff452e` (`student_id`),
  KEY `courseware_xmodulestudentprefsfield_3216ff68` (`created`),
  KEY `courseware_xmodulestudentprefsfield_5436e97a` (`modified`),
  CONSTRAINT `student_id_refs_id_d7b9940b` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `courseware_xmodulecontentfi_definition_id_50fa4fd570cf2f4a_uniq` (`usage_id`,`field_name`),
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
  UNIQUE KEY `credit_crediteligibility_username_936cb16677e83e_uniq` (`username`,`course_id`),
  KEY `credit_crediteligibility_f774835d` (`username`),
  KEY `credit_crediteligibility_ff48d8e5` (`course_id`),
  CONSTRAINT `course_id_refs_id_eede15d0` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
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
  UNIQUE KEY `credit_creditrequest_username_4f61c10bb0d67c01_uniq` (`username`,`course_id`,`provider_id`),
  KEY `credit_creditrequest_f774835d` (`username`),
  KEY `credit_creditrequest_ff48d8e5` (`course_id`),
  KEY `credit_creditrequest_d9e5df97` (`provider_id`),
  CONSTRAINT `course_id_refs_id_96abc610` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`),
  CONSTRAINT `provider_id_refs_id_df6afe06` FOREIGN KEY (`provider_id`) REFERENCES `credit_creditprovider` (`id`)
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
  UNIQUE KEY `credit_creditrequirement_namespace_33039c83b3e69b8_uniq` (`namespace`,`name`,`course_id`),
  KEY `credit_creditrequirement_ff48d8e5` (`course_id`),
  CONSTRAINT `course_id_refs_id_a417c522` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
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
  UNIQUE KEY `credit_creditrequirementstatus_username_67dcb69ebf779e3b_uniq` (`username`,`requirement_id`),
  KEY `credit_creditrequirementstatus_f774835d` (`username`),
  KEY `credit_creditrequirementstatus_99a85f32` (`requirement_id`),
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
  KEY `credit_historicalcreditrequest_f774835d` (`username`),
  KEY `credit_historicalcreditrequest_ff48d8e5` (`course_id`),
  KEY `credit_historicalcreditrequest_d9e5df97` (`provider_id`),
  KEY `credit_historicalcreditrequest_e1a0ea2a` (`history_user_id`),
  CONSTRAINT `course_id_refs_id_b034099e` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`),
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
  KEY `credit_historicalcreditrequirementstatus_f774835d` (`username`),
  KEY `credit_historicalcreditrequirementstatus_99a85f32` (`requirement_id`),
  KEY `credit_historicalcreditrequirementstatus_e1a0ea2a` (`history_user_id`),
  CONSTRAINT `history_user_id_refs_id_9342f9b4` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `requirement_id_refs_id_b49b13a7` FOREIGN KEY (`requirement_id`) REFERENCES `credit_creditrequirement` (`id`)
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
INSERT INTO `dark_lang_darklangconfig` VALUES (1,'2015-10-29 14:07:56',NULL,1,'');
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
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  UNIQUE KEY `django_comment_client_permi_permission_id_7a766da089425952_uniq` (`permission_id`,`role_id`),
  KEY `django_comment_client_permission_roles_1e014c8f` (`permission_id`),
  KEY `django_comment_client_permission_roles_bf07f040` (`role_id`),
  CONSTRAINT `permission_id_refs_name_b6302d27` FOREIGN KEY (`permission_id`) REFERENCES `django_comment_client_permission` (`name`),
  CONSTRAINT `role_id_refs_id_c1b5c854` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`)
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
  KEY `django_comment_client_role_ff48d8e5` (`course_id`)
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
  UNIQUE KEY `django_comment_client_role_users_role_id_78e483f531943614_uniq` (`role_id`,`user_id`),
  KEY `django_comment_client_role_users_bf07f040` (`role_id`),
  KEY `django_comment_client_role_users_fbfc09f1` (`user_id`),
  CONSTRAINT `role_id_refs_id_ab82c838` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`),
  CONSTRAINT `user_id_refs_id_441b79e7` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_role_users`
--

LOCK TABLES `django_comment_client_role_users` WRITE;
/*!40000 ALTER TABLE `django_comment_client_role_users` DISABLE KEYS */;
INSERT INTO `django_comment_client_role_users` VALUES (1,5,1),(2,5,2),(3,5,3),(4,5,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'task state','djcelery','taskmeta'),(8,'saved group result','djcelery','tasksetmeta'),(9,'interval','djcelery','intervalschedule'),(10,'crontab','djcelery','crontabschedule'),(11,'periodic tasks','djcelery','periodictasks'),(12,'periodic task','djcelery','periodictask'),(13,'worker','djcelery','workerstate'),(14,'task','djcelery','taskstate'),(15,'migration history','south','migrationhistory'),(16,'server circuit','circuit','servercircuit'),(17,'psychometric data','psychometrics','psychometricdata'),(18,'nonce','django_openid_auth','nonce'),(19,'association','django_openid_auth','association'),(20,'user open id','django_openid_auth','useropenid'),(21,'log entry','admin','logentry'),(22,'cors model','corsheaders','corsmodel'),(23,'student module','courseware','studentmodule'),(24,'student module history','courseware','studentmodulehistory'),(25,'x module user state summary field','courseware','xmoduleuserstatesummaryfield'),(26,'x module student prefs field','courseware','xmodulestudentprefsfield'),(27,'x module student info field','courseware','xmodulestudentinfofield'),(28,'offline computed grade','courseware','offlinecomputedgrade'),(29,'offline computed grade log','courseware','offlinecomputedgradelog'),(30,'student field override','courseware','studentfieldoverride'),(31,'x block disable config','xblock_django','xblockdisableconfig'),(32,'anonymous user id','student','anonymoususerid'),(33,'user standing','student','userstanding'),(34,'user profile','student','userprofile'),(35,'user signup source','student','usersignupsource'),(36,'user test group','student','usertestgroup'),(37,'registration','student','registration'),(38,'pending name change','student','pendingnamechange'),(39,'pending email change','student','pendingemailchange'),(40,'password history','student','passwordhistory'),(41,'login failures','student','loginfailures'),(42,'course enrollment','student','courseenrollment'),(43,'manual enrollment audit','student','manualenrollmentaudit'),(44,'course enrollment allowed','student','courseenrollmentallowed'),(45,'course access role','student','courseaccessrole'),(46,'dashboard configuration','student','dashboardconfiguration'),(47,'linked in add to profile configuration','student','linkedinaddtoprofileconfiguration'),(48,'entrance exam configuration','student','entranceexamconfiguration'),(49,'language proficiency','student','languageproficiency'),(50,'course enrollment attribute','student','courseenrollmentattribute'),(51,'tracking log','track','trackinglog'),(52,'rate limit configuration','util','ratelimitconfiguration'),(53,'certificate whitelist','certificates','certificatewhitelist'),(54,'generated certificate','certificates','generatedcertificate'),(55,'example certificate set','certificates','examplecertificateset'),(56,'example certificate','certificates','examplecertificate'),(57,'certificate generation course setting','certificates','certificategenerationcoursesetting'),(58,'certificate generation configuration','certificates','certificategenerationconfiguration'),(59,'certificate html view configuration','certificates','certificatehtmlviewconfiguration'),(60,'badge assertion','certificates','badgeassertion'),(61,'badge image configuration','certificates','badgeimageconfiguration'),(62,'instructor task','instructor_task','instructortask'),(63,'course software','licenses','coursesoftware'),(64,'user license','licenses','userlicense'),(65,'course user group','course_groups','courseusergroup'),(66,'course user group partition group','course_groups','courseusergrouppartitiongroup'),(67,'course cohorts settings','course_groups','coursecohortssettings'),(68,'course cohort','course_groups','coursecohort'),(69,'course email','bulk_email','courseemail'),(70,'optout','bulk_email','optout'),(71,'course email template','bulk_email','courseemailtemplate'),(72,'course authorization','bulk_email','courseauthorization'),(73,'branding info config','branding','brandinginfoconfig'),(74,'branding api config','branding','brandingapiconfig'),(75,'external auth map','external_auth','externalauthmap'),(76,'client','oauth2','client'),(77,'grant','oauth2','grant'),(78,'access token','oauth2','accesstoken'),(79,'refresh token','oauth2','refreshtoken'),(80,'trusted client','oauth2_provider','trustedclient'),(81,'article','wiki','article'),(82,'Article for object','wiki','articleforobject'),(83,'article revision','wiki','articlerevision'),(84,'URL path','wiki','urlpath'),(85,'article plugin','wiki','articleplugin'),(86,'reusable plugin','wiki','reusableplugin'),(87,'simple plugin','wiki','simpleplugin'),(88,'revision plugin','wiki','revisionplugin'),(89,'revision plugin revision','wiki','revisionpluginrevision'),(90,'article subscription','wiki','articlesubscription'),(91,'type','django_notify','notificationtype'),(92,'settings','django_notify','settings'),(93,'subscription','django_notify','subscription'),(94,'notification','django_notify','notification'),(95,'score','foldit','score'),(96,'puzzle complete','foldit','puzzlecomplete'),(97,'note','notes','note'),(98,'splash config','splash','splashconfig'),(99,'user preference','user_api','userpreference'),(100,'user course tag','user_api','usercoursetag'),(101,'user org tag','user_api','userorgtag'),(102,'course team','teams','courseteam'),(103,'course team membership','teams','courseteammembership'),(104,'order','shoppingcart','order'),(105,'order item','shoppingcart','orderitem'),(106,'invoice','shoppingcart','invoice'),(107,'invoice transaction','shoppingcart','invoicetransaction'),(108,'invoice item','shoppingcart','invoiceitem'),(109,'course registration code invoice item','shoppingcart','courseregistrationcodeinvoiceitem'),(110,'invoice history','shoppingcart','invoicehistory'),(111,'course registration code','shoppingcart','courseregistrationcode'),(112,'registration code redemption','shoppingcart','registrationcoderedemption'),(113,'coupon','shoppingcart','coupon'),(114,'coupon redemption','shoppingcart','couponredemption'),(115,'paid course registration','shoppingcart','paidcourseregistration'),(116,'course reg code item','shoppingcart','courseregcodeitem'),(117,'course reg code item annotation','shoppingcart','courseregcodeitemannotation'),(118,'paid course registration annotation','shoppingcart','paidcourseregistrationannotation'),(119,'certificate item','shoppingcart','certificateitem'),(120,'donation configuration','shoppingcart','donationconfiguration'),(121,'donation','shoppingcart','donation'),(122,'course mode','course_modes','coursemode'),(123,'course modes archive','course_modes','coursemodesarchive'),(124,'software secure photo verification','verify_student','softwaresecurephotoverification'),(125,'verification checkpoint','verify_student','verificationcheckpoint'),(126,'Verification Status','verify_student','verificationstatus'),(127,'in course reverification configuration','verify_student','incoursereverificationconfiguration'),(128,'skipped reverification','verify_student','skippedreverification'),(129,'dark lang config','dark_lang','darklangconfig'),(130,'embargoed course','embargo','embargoedcourse'),(131,'embargoed state','embargo','embargoedstate'),(132,'restricted course','embargo','restrictedcourse'),(133,'country','embargo','country'),(134,'country access rule','embargo','countryaccessrule'),(135,'course access rule history','embargo','courseaccessrulehistory'),(136,'ip filter','embargo','ipfilter'),(137,'course rerun state','course_action_state','coursererunstate'),(138,'mobile api config','mobile_api','mobileapiconfig'),(139,'survey form','survey','surveyform'),(140,'survey answer','survey','surveyanswer'),(141,'x block asides config','lms_xblock','xblockasidesconfig'),(142,'course overview','course_overviews','courseoverview'),(143,'course structure','course_structures','coursestructure'),(144,'x domain proxy configuration','cors_csrf','xdomainproxyconfiguration'),(145,'student item','submissions','studentitem'),(146,'submission','submissions','submission'),(147,'score','submissions','score'),(148,'score summary','submissions','scoresummary'),(149,'rubric','assessment','rubric'),(150,'criterion','assessment','criterion'),(151,'criterion option','assessment','criterionoption'),(152,'assessment','assessment','assessment'),(153,'assessment part','assessment','assessmentpart'),(154,'assessment feedback option','assessment','assessmentfeedbackoption'),(155,'assessment feedback','assessment','assessmentfeedback'),(156,'peer workflow','assessment','peerworkflow'),(157,'peer workflow item','assessment','peerworkflowitem'),(158,'training example','assessment','trainingexample'),(159,'student training workflow','assessment','studenttrainingworkflow'),(160,'student training workflow item','assessment','studenttrainingworkflowitem'),(161,'ai classifier set','assessment','aiclassifierset'),(162,'ai classifier','assessment','aiclassifier'),(163,'ai training workflow','assessment','aitrainingworkflow'),(164,'ai grading workflow','assessment','aigradingworkflow'),(165,'assessment workflow','workflow','assessmentworkflow'),(166,'assessment workflow step','workflow','assessmentworkflowstep'),(167,'assessment workflow cancellation','workflow','assessmentworkflowcancellation'),(168,'profile','edxval','profile'),(169,'video','edxval','video'),(170,'course video','edxval','coursevideo'),(171,'encoded video','edxval','encodedvideo'),(172,'subtitle','edxval','subtitle'),(173,'milestone','milestones','milestone'),(174,'milestone relationship type','milestones','milestonerelationshiptype'),(175,'course milestone','milestones','coursemilestone'),(176,'course content milestone','milestones','coursecontentmilestone'),(177,'user milestone','milestones','usermilestone'),(178,'credit provider','credit','creditprovider'),(179,'credit course','credit','creditcourse'),(180,'credit requirement','credit','creditrequirement'),(181,'historical credit requirement status','credit','historicalcreditrequirementstatus'),(182,'credit requirement status','credit','creditrequirementstatus'),(183,'credit eligibility','credit','crediteligibility'),(184,'historical credit request','credit','historicalcreditrequest'),(185,'credit request','credit','creditrequest'),(186,'video upload config','contentstore','videouploadconfig'),(187,'push notification config','contentstore','pushnotificationconfig'),(188,'course creator','course_creators','coursecreator'),(189,'studio config','xblock_config','studioconfig'),(190,'organization','courseware','organization'),(191,'subject','courseware','subject'),(192,'course_subject','courseware','course_subject'),(193,'mooc_state','student','mooc_state'),(194,'mooc_city','student','mooc_city'),(195,'mooc_person','student','mooc_person');
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
  KEY `django_openid_auth_useropenid_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_be7162f0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `django_session_c25c2c28` (`expire_date`)
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
  CONSTRAINT `crontab_id_refs_id_ebff5e74` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `interval_id_refs_id_f2054349` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
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
  KEY `djcelery_taskstate_f0ba6500` (`tstamp`),
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
  KEY `djcelery_workerstate_eb8ac7e4` (`last_heartbeat`)
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
  UNIQUE KEY `edxval_coursevideo_course_id_42cecee05cff2d8c_uniq` (`course_id`,`video_id`),
  KEY `edxval_coursevideo_fa26288c` (`video_id`),
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
  KEY `edxval_encodedvideo_fa26288c` (`video_id`),
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
  KEY `edxval_subtitle_fa26288c` (`video_id`),
  KEY `edxval_subtitle_306df28f` (`fmt`),
  KEY `edxval_subtitle_8a7ac9ab` (`language`),
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
  KEY `edxval_video_de3f5709` (`client_video_id`),
  KEY `edxval_video_c9ad71dd` (`status`)
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
  UNIQUE KEY `embargo_countryacces_restricted_course_id_6f340c36c633cb0a_uniq` (`restricted_course_id`,`country_id`),
  KEY `embargo_countryaccessrule_3cd064f4` (`restricted_course_id`),
  KEY `embargo_countryaccessrule_534dd89` (`country_id`),
  CONSTRAINT `country_id_refs_id_f679fa73` FOREIGN KEY (`country_id`) REFERENCES `embargo_country` (`id`),
  CONSTRAINT `restricted_course_id_refs_id_c792331c` FOREIGN KEY (`restricted_course_id`) REFERENCES `embargo_restrictedcourse` (`id`)
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
  KEY `embargo_courseaccessrulehistory_b4b47e7a` (`course_key`)
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
  CONSTRAINT `changed_by_id_refs_id_d0205d39` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `external_auth_externalauthmap_external_id_7f035ef8bc4d313e_uniq` (`external_id`,`external_domain`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `external_auth_externalauthmap_d5e787` (`external_id`),
  KEY `external_auth_externalauthmap_a570024c` (`external_domain`),
  KEY `external_auth_externalauthmap_a142061d` (`external_email`),
  KEY `external_auth_externalauthmap_c1a016f` (`external_name`),
  CONSTRAINT `user_id_refs_id_f8635f67` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `foldit_puzzlecomplete_user_id_4c63656af6674331_uniq` (`user_id`,`puzzle_id`,`puzzle_set`,`puzzle_subset`),
  KEY `foldit_puzzlecomplete_fbfc09f1` (`user_id`),
  KEY `foldit_puzzlecomplete_8027477e` (`unique_user_id`),
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
  KEY `foldit_score_fbfc09f1` (`user_id`),
  KEY `foldit_score_8027477e` (`unique_user_id`),
  KEY `foldit_score_3624c060` (`best_score`),
  KEY `foldit_score_b4627792` (`current_score`),
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
  KEY `instructor_task_instructortask_8ae638b4` (`task_type`),
  KEY `instructor_task_instructortask_ff48d8e5` (`course_id`),
  KEY `instructor_task_instructortask_cfc55170` (`task_key`),
  KEY `instructor_task_instructortask_c00fe455` (`task_id`),
  KEY `instructor_task_instructortask_731e67a4` (`task_state`),
  KEY `instructor_task_instructortask_b8ca8b9f` (`requester_id`),
  CONSTRAINT `requester_id_refs_id_a97278e6` FOREIGN KEY (`requester_id`) REFERENCES `auth_user` (`id`)
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
  KEY `licenses_userlicense_fbfc09f1` (`user_id`),
  CONSTRAINT `software_id_refs_id_f9e27be8` FOREIGN KEY (`software_id`) REFERENCES `licenses_coursesoftware` (`id`),
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
  UNIQUE KEY `milestones_coursecontentmilesto_course_id_68d1457cd52d6dff_uniq` (`course_id`,`content_id`,`milestone_id`),
  KEY `milestones_coursecontentmilestone_ff48d8e5` (`course_id`),
  KEY `milestones_coursecontentmilestone_cc8ff3c` (`content_id`),
  KEY `milestones_coursecontentmilestone_9cfa291f` (`milestone_id`),
  KEY `milestones_coursecontentmilestone_595c57ff` (`milestone_relationship_type_id`),
  CONSTRAINT `milestone_id_refs_id_d7fabedc` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`),
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
  UNIQUE KEY `milestones_coursemilestone_course_id_5a06e10579eab3b7_uniq` (`course_id`,`milestone_id`),
  KEY `milestones_coursemilestone_ff48d8e5` (`course_id`),
  KEY `milestones_coursemilestone_9cfa291f` (`milestone_id`),
  KEY `milestones_coursemilestone_595c57ff` (`milestone_relationship_type_id`),
  CONSTRAINT `milestone_id_refs_id_cd764354` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`),
  CONSTRAINT `milestone_relationship_type_id_refs_id_874a03b6` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`)
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
  UNIQUE KEY `milestones_milestone_namespace_460a2f6943016c0b_uniq` (`namespace`,`name`),
  KEY `milestones_milestone_eb040977` (`namespace`),
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
INSERT INTO `milestones_milestonerelationshiptype` VALUES (1,'2015-10-29 14:09:35','2015-10-29 14:09:35','fulfills','Autogenerated milestone relationship type \"fulfills\"',1),(2,'2015-10-29 14:09:35','2015-10-29 14:09:35','requires','Autogenerated milestone relationship type \"requires\"',1);
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
  UNIQUE KEY `milestones_usermilestone_user_id_10206aa452468351_uniq` (`user_id`,`milestone_id`),
  KEY `milestones_usermilestone_fbfc09f1` (`user_id`),
  KEY `milestones_usermilestone_9cfa291f` (`milestone_id`),
  CONSTRAINT `milestone_id_refs_id_af7fa460` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`)
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
  CONSTRAINT `changed_by_id_refs_id_97c2f4c8` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_api_mobileapiconfig`
--

LOCK TABLES `mobile_api_mobileapiconfig` WRITE;
/*!40000 ALTER TABLE `mobile_api_mobileapiconfig` DISABLE KEYS */;
INSERT INTO `mobile_api_mobileapiconfig` VALUES (1,'2015-10-29 14:08:07',NULL,0,'mobile_low,mobile_high,youtube');
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
  KEY `notes_note_fbfc09f1` (`user_id`),
  KEY `notes_note_ff48d8e5` (`course_id`),
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
  CONSTRAINT `subscription_id_refs_id_baf93d4f` FOREIGN KEY (`subscription_id`) REFERENCES `notify_subscription` (`id`)
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
  KEY `notify_notificationtype_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_f2478378` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
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
  KEY `notify_settings_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_9a2911e6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `notify_subscription_83326d99` (`settings_id`),
  KEY `notify_subscription_9955f091` (`notification_type_id`),
  CONSTRAINT `notification_type_id_refs_key_baa41a19` FOREIGN KEY (`notification_type_id`) REFERENCES `notify_notificationtype` (`key`),
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
  KEY `oauth2_accesstoken_fbfc09f1` (`user_id`),
  KEY `oauth2_accesstoken_4a4e8ffb` (`client_id`),
  KEY `oauth2_accesstoken_bfac9f99` (`token`),
  CONSTRAINT `client_id_refs_id_e566ebcc` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`),
  CONSTRAINT `user_id_refs_id_c740ddb9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `oauth2_client_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_c2e3e9a0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `oauth2_grant_fbfc09f1` (`user_id`),
  KEY `oauth2_grant_4a4e8ffb` (`client_id`),
  CONSTRAINT `client_id_refs_id_b2f66ded` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`),
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
  CONSTRAINT `client_id_refs_id_f6dfcacc` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`)
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
  KEY `oauth2_refreshtoken_fbfc09f1` (`user_id`),
  KEY `oauth2_refreshtoken_4a4e8ffb` (`client_id`),
  CONSTRAINT `access_token_id_refs_id_df7961b9` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_accesstoken` (`id`),
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
-- Table structure for table `reverification_midcoursereverificationwindow`
--

DROP TABLE IF EXISTS `reverification_midcoursereverificationwindow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reverification_midcoursereverificationwindow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reverification_midcoursereverificationwindow_ff48d8e5` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reverification_midcoursereverificationwindow`
--

LOCK TABLES `reverification_midcoursereverificationwindow` WRITE;
/*!40000 ALTER TABLE `reverification_midcoursereverificationwindow` DISABLE KEYS */;
/*!40000 ALTER TABLE `reverification_midcoursereverificationwindow` ENABLE KEYS */;
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
  KEY `shoppingcart_certificateitem_ff48d8e5` (`course_id`),
  KEY `shoppingcart_certificateitem_9e513f0b` (`course_enrollment_id`),
  KEY `shoppingcart_certificateitem_4160619e` (`mode`),
  CONSTRAINT `course_enrollment_id_refs_id_8048c435` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `orderitem_ptr_id_refs_id_d3ebc4d0` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
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
  KEY `shoppingcart_coupon_b5de30be` (`created_by_id`),
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
  KEY `shoppingcart_couponredemption_8337030b` (`order_id`),
  KEY `shoppingcart_couponredemption_fbfc09f1` (`user_id`),
  KEY `shoppingcart_couponredemption_c29b2e60` (`coupon_id`),
  CONSTRAINT `coupon_id_refs_id_c11a8022` FOREIGN KEY (`coupon_id`) REFERENCES `shoppingcart_coupon` (`id`),
  CONSTRAINT `order_id_refs_id_f5db1967` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
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
  KEY `shoppingcart_courseregcodeitem_ff48d8e5` (`course_id`),
  KEY `shoppingcart_courseregcodeitem_4160619e` (`mode`),
  CONSTRAINT `orderitem_ptr_id_refs_id_a466f07f` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
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
  UNIQUE KEY `shoppingcart_courseregistrationcode_code_6614bad3cae62199_uniq` (`code`),
  KEY `shoppingcart_courseregistrationcode_65da3d2c` (`code`),
  KEY `shoppingcart_courseregistrationcode_ff48d8e5` (`course_id`),
  KEY `shoppingcart_courseregistrationcode_b5de30be` (`created_by_id`),
  KEY `shoppingcart_courseregistrationcode_59f72b12` (`invoice_id`),
  KEY `shoppingcart_courseregistrationcode_8337030b` (`order_id`),
  KEY `shoppingcart_courseregistrationcode_80766641` (`invoice_item_id`),
  CONSTRAINT `created_by_id_refs_id_38397037` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `invoice_id_refs_id_995f0ae8` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`),
  CONSTRAINT `invoice_item_id_refs_invoiceitem_ptr_id_8a5558e6` FOREIGN KEY (`invoice_item_id`) REFERENCES `shoppingcart_courseregistrationcodeinvoiceitem` (`invoiceitem_ptr_id`),
  CONSTRAINT `order_id_refs_id_be36d837` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`)
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
  KEY `shoppingcart_courseregistrationcodeinvoiceitem_ff48d8e5` (`course_id`),
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
  KEY `shoppingcart_donation_ff48d8e5` (`course_id`),
  CONSTRAINT `orderitem_ptr_id_refs_id_b7138a4b` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
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
  CONSTRAINT `changed_by_id_refs_id_b4a26b7f` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `shoppingcart_invoice_ca9021a2` (`company_name`),
  KEY `shoppingcart_invoice_ff48d8e5` (`course_id`)
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
  KEY `shoppingcart_invoicetransaction_b5de30be` (`created_by_id`),
  KEY `shoppingcart_invoicetransaction_bcd6c6d2` (`last_modified_by_id`),
  CONSTRAINT `created_by_id_refs_id_7259d0bb` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `invoice_id_refs_id_8e5b62ec` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`),
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
  KEY `shoppingcart_order_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_e1195673` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `shoppingcart_orderitem_8337030b` (`order_id`),
  KEY `shoppingcart_orderitem_fbfc09f1` (`user_id`),
  KEY `shoppingcart_orderitem_c9ad71dd` (`status`),
  KEY `shoppingcart_orderitem_8457f26a` (`fulfilled_time`),
  KEY `shoppingcart_orderitem_416112c1` (`refund_requested_time`),
  CONSTRAINT `order_id_refs_id_7c77b3f0` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `user_id_refs_id_d92ae410` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `shoppingcart_paidcourseregistration_ff48d8e5` (`course_id`),
  KEY `shoppingcart_paidcourseregistration_4160619e` (`mode`),
  KEY `shoppingcart_paidcourseregistration_9e513f0b` (`course_enrollment_id`),
  CONSTRAINT `course_enrollment_id_refs_id_dc061be6` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `orderitem_ptr_id_refs_id_d8709d99` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
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
  KEY `shoppingcart_registrationcoderedemption_8337030b` (`order_id`),
  KEY `shoppingcart_registrationcoderedemption_d25b37dc` (`registration_code_id`),
  KEY `shoppingcart_registrationcoderedemption_e151467a` (`redeemed_by_id`),
  KEY `shoppingcart_registrationcoderedemption_9e513f0b` (`course_enrollment_id`),
  CONSTRAINT `course_enrollment_id_refs_id_c9486127` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'courseware','0001_initial','2015-10-29 14:02:59'),(2,'courseware','0002_add_indexes','2015-10-29 14:03:00'),(3,'courseware','0003_done_grade_cache','2015-10-29 14:03:03'),(4,'courseware','0004_add_field_studentmodule_course_id','2015-10-29 14:03:05'),(5,'courseware','0005_auto__add_offlinecomputedgrade__add_unique_offlinecomputedgrade_user_c','2015-10-29 14:03:07'),(6,'courseware','0006_create_student_module_history','2015-10-29 14:03:09'),(7,'courseware','0007_allow_null_version_in_history','2015-10-29 14:03:09'),(8,'courseware','0008_add_xmodule_storage','2015-10-29 14:03:16'),(9,'courseware','0009_add_field_default','2015-10-29 14:03:19'),(10,'courseware','0010_rename_xblock_field_content_to_user_state_summary','2015-10-29 14:03:19'),(11,'courseware','0011_add_model_StudentFieldOverride','2015-10-29 14:03:21'),(12,'courseware','0012_auto__del_unique_studentfieldoverride_course_id_location_student__add_','2015-10-29 14:03:21'),(13,'courseware','0013_auto__add_field_studentfieldoverride_created__add_field_studentfieldov','2015-10-29 14:03:23'),(14,'xblock_django','0001_initial','2015-10-29 14:03:24'),(15,'student','0001_initial','2015-10-29 14:03:25'),(16,'student','0002_text_to_varchar_and_indexes','2015-10-29 14:03:30'),(17,'student','0003_auto__add_usertestgroup','2015-10-29 14:03:32'),(18,'student','0004_add_email_index','2015-10-29 14:03:32'),(19,'student','0005_name_change','2015-10-29 14:03:33'),(20,'student','0006_expand_meta_field','2015-10-29 14:03:34'),(21,'student','0007_convert_to_utf8','2015-10-29 14:03:35'),(22,'student','0008__auto__add_courseregistration','2015-10-29 14:03:35'),(23,'student','0009_auto__del_courseregistration__add_courseenrollment','2015-10-29 14:03:35'),(24,'student','0010_auto__chg_field_courseenrollment_course_id','2015-10-29 14:03:36'),(25,'student','0011_auto__chg_field_courseenrollment_user__del_unique_courseenrollment_use','2015-10-29 14:03:36'),(26,'student','0012_auto__add_field_userprofile_gender__add_field_userprofile_date_of_birt','2015-10-29 14:03:40'),(27,'student','0013_auto__chg_field_userprofile_meta','2015-10-29 14:03:41'),(28,'student','0014_auto__del_courseenrollment','2015-10-29 14:03:41'),(29,'student','0015_auto__add_courseenrollment__add_unique_courseenrollment_user_course_id','2015-10-29 14:03:42'),(30,'student','0016_auto__add_field_courseenrollment_date__chg_field_userprofile_country','2015-10-29 14:03:44'),(31,'student','0017_rename_date_to_created','2015-10-29 14:03:44'),(32,'student','0018_auto','2015-10-29 14:03:44'),(33,'student','0019_create_approved_demographic_fields_fall_2012','2015-10-29 14:03:50'),(34,'student','0020_add_test_center_user','2015-10-29 14:03:53'),(35,'student','0021_remove_askbot','2015-10-29 14:03:53'),(36,'student','0022_auto__add_courseenrollmentallowed__add_unique_courseenrollmentallowed_','2015-10-29 14:03:55'),(37,'student','0023_add_test_center_registration','2015-10-29 14:04:06'),(38,'student','0024_add_allow_certificate','2015-10-29 14:04:07'),(39,'student','0025_auto__add_field_courseenrollmentallowed_auto_enroll','2015-10-29 14:04:08'),(40,'student','0026_auto__remove_index_student_testcenterregistration_accommodation_request','2015-10-29 14:04:08'),(41,'student','0027_add_active_flag_and_mode_to_courseware_enrollment','2015-10-29 14:04:10'),(42,'student','0028_auto__add_userstanding','2015-10-29 14:04:11'),(43,'student','0029_add_lookup_table_between_user_and_anonymous_student_id','2015-10-29 14:04:12'),(44,'student','0029_remove_pearson','2015-10-29 14:04:12'),(45,'student','0030_auto__chg_field_anonymoususerid_anonymous_user_id','2015-10-29 14:04:13'),(46,'student','0031_drop_student_anonymoususerid_temp_archive','2015-10-29 14:04:14'),(47,'student','0032_add_field_UserProfile_country_add_field_UserProfile_city','2015-10-29 14:04:15'),(48,'student','0032_auto__add_loginfailures','2015-10-29 14:04:16'),(49,'student','0033_auto__add_passwordhistory','2015-10-29 14:04:17'),(50,'student','0034_auto__add_courseaccessrole','2015-10-29 14:04:19'),(51,'student','0035_access_roles','2015-10-29 14:04:20'),(52,'student','0036_access_roles_orgless','2015-10-29 14:04:20'),(53,'student','0037_auto__add_courseregistrationcode','2015-10-29 14:04:22'),(54,'student','0038_auto__add_usersignupsource','2015-10-29 14:04:23'),(55,'student','0039_auto__del_courseregistrationcode','2015-10-29 14:04:24'),(56,'student','0040_auto__del_field_usersignupsource_user_id__add_field_usersignupsource_u','2015-10-29 14:04:25'),(57,'student','0041_add_dashboard_config','2015-10-29 14:04:26'),(58,'student','0042_grant_sales_admin_roles','2015-10-29 14:04:26'),(59,'student','0043_auto__add_linkedinaddtoprofileconfiguration','2015-10-29 14:04:27'),(60,'student','0044_linkedin_add_company_identifier','2015-10-29 14:04:28'),(61,'student','0045_add_trk_partner_to_linkedin_config','2015-10-29 14:04:28'),(62,'student','0046_auto__add_entranceexamconfiguration__add_unique_entranceexamconfigurat','2015-10-29 14:04:30'),(63,'student','0047_add_bio_field','2015-10-29 14:04:31'),(64,'student','0048_add_profile_image_version','2015-10-29 14:04:32'),(65,'student','0049_auto__add_languageproficiency__add_unique_languageproficiency_code_use','2015-10-29 14:04:33'),(66,'student','0050_auto__add_manualenrollmentaudit','2015-10-29 14:04:34'),(67,'student','0051_auto__add_courseenrollmentattribute','2015-10-29 14:04:35'),(68,'track','0001_initial','2015-10-29 14:04:37'),(69,'track','0002_auto__add_field_trackinglog_host__chg_field_trackinglog_event_type__ch','2015-10-29 14:04:39'),(70,'util','0001_initial','2015-10-29 14:04:40'),(71,'util','0002_default_rate_limit_config','2015-10-29 14:04:40'),(72,'certificates','0001_added_generatedcertificates','2015-10-29 14:04:41'),(73,'certificates','0002_auto__add_field_generatedcertificate_download_url','2015-10-29 14:04:42'),(74,'certificates','0003_auto__add_field_generatedcertificate_enabled','2015-10-29 14:04:42'),(75,'certificates','0004_auto__add_field_generatedcertificate_graded_certificate_id__add_field_','2015-10-29 14:04:44'),(76,'certificates','0005_auto__add_field_generatedcertificate_name','2015-10-29 14:04:45'),(77,'certificates','0006_auto__chg_field_generatedcertificate_certificate_id','2015-10-29 14:04:45'),(78,'certificates','0007_auto__add_revokedcertificate','2015-10-29 14:04:46'),(79,'certificates','0008_auto__del_revokedcertificate__del_field_generatedcertificate_name__add','2015-10-29 14:04:50'),(80,'certificates','0009_auto__del_field_generatedcertificate_graded_download_url__del_field_ge','2015-10-29 14:04:53'),(81,'certificates','0010_auto__del_field_generatedcertificate_enabled__add_field_generatedcerti','2015-10-29 14:04:54'),(82,'certificates','0011_auto__del_field_generatedcertificate_certificate_id__add_field_generat','2015-10-29 14:04:56'),(83,'certificates','0012_auto__add_field_generatedcertificate_name__add_field_generatedcertific','2015-10-29 14:04:58'),(84,'certificates','0013_auto__add_field_generatedcertificate_error_reason','2015-10-29 14:04:59'),(85,'certificates','0014_adding_whitelist','2015-10-29 14:05:00'),(86,'certificates','0015_adding_mode_for_verified_certs','2015-10-29 14:05:00'),(87,'certificates','0016_change_course_key_fields','2015-10-29 14:05:00'),(88,'certificates','0017_auto__add_certificategenerationconfiguration','2015-10-29 14:05:01'),(89,'certificates','0018_add_example_cert_models','2015-10-29 14:05:03'),(90,'certificates','0019_auto__add_certificatehtmlviewconfiguration','2015-10-29 14:05:04'),(91,'certificates','0020_certificatehtmlviewconfiguration_data','2015-10-29 14:05:05'),(92,'certificates','0021_auto__add_badgeassertion__add_unique_badgeassertion_course_id_user__ad','2015-10-29 14:05:06'),(93,'certificates','0022_default_modes','2015-10-29 14:05:06'),(94,'instructor_task','0001_initial','2015-10-29 14:05:09'),(95,'instructor_task','0002_add_subtask_field','2015-10-29 14:05:10'),(96,'licenses','0001_initial','2015-10-29 14:05:12'),(97,'course_groups','0001_initial','2015-10-29 14:05:14'),(98,'course_groups','0002_add_model_CourseUserGroupPartitionGroup','2015-10-29 14:05:15'),(99,'course_groups','0003_auto__add_coursecohort__add_coursecohortssettings','2015-10-29 14:05:16'),(100,'course_groups','0004_auto__del_field_coursecohortssettings_cohorted_discussions__add_field_','2015-10-29 14:05:16'),(101,'bulk_email','0001_initial','2015-10-29 14:05:18'),(102,'bulk_email','0002_change_field_names','2015-10-29 14:05:19'),(103,'bulk_email','0003_add_optout_user','2015-10-29 14:05:21'),(104,'bulk_email','0004_migrate_optout_user','2015-10-29 14:05:21'),(105,'bulk_email','0005_remove_optout_email','2015-10-29 14:05:21'),(106,'bulk_email','0006_add_course_email_template','2015-10-29 14:05:22'),(107,'bulk_email','0007_load_course_email_template','2015-10-29 14:05:22'),(108,'bulk_email','0008_add_course_authorizations','2015-10-29 14:05:22'),(109,'bulk_email','0009_force_unique_course_ids','2015-10-29 14:05:23'),(110,'bulk_email','0010_auto__chg_field_optout_course_id__add_field_courseemail_template_name_','2015-10-29 14:05:25'),(111,'branding','0001_initial','2015-10-29 14:05:26'),(112,'branding','0002_auto__add_brandingapiconfig','2015-10-29 14:05:27'),(113,'external_auth','0001_initial','2015-10-29 14:05:29'),(114,'oauth2','0001_initial','2015-10-29 14:05:34'),(115,'oauth2','0002_auto__chg_field_client_user','2015-10-29 14:05:35'),(116,'oauth2','0003_auto__add_field_client_name','2015-10-29 14:05:36'),(117,'oauth2','0004_auto__add_index_accesstoken_token','2015-10-29 14:05:36'),(118,'oauth2_provider','0001_initial','2015-10-29 14:05:37'),(119,'wiki','0001_initial','2015-10-29 14:05:49'),(120,'wiki','0002_auto__add_field_articleplugin_created','2015-10-29 14:05:50'),(121,'wiki','0003_auto__add_field_urlpath_article','2015-10-29 14:05:52'),(122,'wiki','0004_populate_urlpath__article','2015-10-29 14:05:52'),(123,'wiki','0005_auto__chg_field_urlpath_article','2015-10-29 14:05:53'),(124,'wiki','0006_auto__add_attachmentrevision__add_image__add_attachment','2015-10-29 14:05:56'),(125,'wiki','0007_auto__add_articlesubscription','2015-10-29 14:05:56'),(126,'wiki','0008_auto__add_simpleplugin__add_revisionpluginrevision__add_imagerevision_','2015-10-29 14:06:01'),(127,'wiki','0009_auto__add_field_imagerevision_width__add_field_imagerevision_height','2015-10-29 14:06:02'),(128,'wiki','0010_auto__chg_field_imagerevision_image','2015-10-29 14:06:03'),(129,'wiki','0011_auto__chg_field_imagerevision_width__chg_field_imagerevision_height','2015-10-29 14:06:04'),(130,'django_notify','0001_initial','2015-10-29 14:06:09'),(131,'notifications','0001_initial','2015-10-29 14:06:10'),(132,'foldit','0001_initial','2015-10-29 14:06:13'),(133,'django_comment_client','0001_initial','2015-10-29 14:06:17'),(134,'django_comment_common','0001_initial','2015-10-29 14:06:17'),(135,'notes','0001_initial','2015-10-29 14:06:19'),(136,'splash','0001_initial','2015-10-29 14:06:20'),(137,'splash','0002_auto__add_field_splashconfig_unaffected_url_paths','2015-10-29 14:06:21'),(138,'user_api','0001_initial','2015-10-29 14:06:22'),(139,'user_api','0002_auto__add_usercoursetags__add_unique_usercoursetags_user_course_id_key','2015-10-29 14:06:24'),(140,'user_api','0003_rename_usercoursetags','2015-10-29 14:06:24'),(141,'user_api','0004_auto__add_userorgtag__add_unique_userorgtag_user_org_key__chg_field_us','2015-10-29 14:06:26'),(142,'teams','0001_initial','2015-10-29 14:06:28'),(143,'shoppingcart','0001_initial','2015-10-29 14:06:33'),(144,'shoppingcart','0002_auto__add_field_paidcourseregistration_mode','2015-10-29 14:06:34'),(145,'shoppingcart','0003_auto__del_field_orderitem_line_cost','2015-10-29 14:06:34'),(146,'shoppingcart','0004_auto__add_field_orderitem_fulfilled_time','2015-10-29 14:06:35'),(147,'shoppingcart','0005_auto__add_paidcourseregistrationannotation__add_field_orderitem_report','2015-10-29 14:06:36'),(148,'shoppingcart','0006_auto__add_field_order_refunded_time__add_field_orderitem_refund_reques','2015-10-29 14:06:37'),(149,'shoppingcart','0007_auto__add_field_orderitem_service_fee','2015-10-29 14:06:39'),(150,'shoppingcart','0008_auto__add_coupons__add_couponredemption__chg_field_certificateitem_cou','2015-10-29 14:06:43'),(151,'shoppingcart','0009_auto__del_coupons__add_courseregistrationcode__add_coupon__chg_field_c','2015-10-29 14:06:48'),(152,'shoppingcart','0010_auto__add_registrationcoderedemption__del_field_courseregistrationcode','2015-10-29 14:06:51'),(153,'shoppingcart','0011_auto__add_invoice__add_field_courseregistrationcode_invoice','2015-10-29 14:06:53'),(154,'shoppingcart','0012_auto__del_field_courseregistrationcode_transaction_group_name__del_fie','2015-10-29 14:07:00'),(155,'shoppingcart','0013_auto__add_field_invoice_is_valid','2015-10-29 14:07:00'),(156,'shoppingcart','0014_auto__del_field_invoice_tax_id__add_field_invoice_address_line_1__add_','2015-10-29 14:07:06'),(157,'shoppingcart','0015_auto__del_field_invoice_purchase_order_number__del_field_invoice_compa','2015-10-29 14:07:10'),(158,'shoppingcart','0016_auto__del_field_invoice_company_email__del_field_invoice_company_refer','2015-10-29 14:07:12'),(159,'shoppingcart','0017_auto__add_field_courseregistrationcode_order__chg_field_registrationco','2015-10-29 14:07:14'),(160,'shoppingcart','0018_auto__add_donation','2015-10-29 14:07:15'),(161,'shoppingcart','0019_auto__add_donationconfiguration','2015-10-29 14:07:16'),(162,'shoppingcart','0020_auto__add_courseregcodeitem__add_courseregcodeitemannotation__add_fiel','2015-10-29 14:07:21'),(163,'shoppingcart','0021_auto__add_field_orderitem_created__add_field_orderitem_modified','2015-10-29 14:07:22'),(164,'shoppingcart','0022_auto__add_field_registrationcoderedemption_course_enrollment__add_fiel','2015-10-29 14:07:25'),(165,'shoppingcart','0023_auto__add_field_coupon_expiration_date','2015-10-29 14:07:26'),(166,'shoppingcart','0024_auto__add_field_courseregistrationcode_mode_slug','2015-10-29 14:07:26'),(167,'shoppingcart','0025_update_invoice_models','2015-10-29 14:07:32'),(168,'shoppingcart','0026_migrate_invoices','2015-10-29 14:07:32'),(169,'shoppingcart','0027_add_invoice_history','2015-10-29 14:07:34'),(170,'shoppingcart','0028_auto__add_field_courseregistrationcode_is_valid','2015-10-29 14:07:35'),(171,'course_modes','0001_initial','2015-10-29 14:07:36'),(172,'course_modes','0002_auto__add_field_coursemode_currency','2015-10-29 14:07:37'),(173,'course_modes','0003_auto__add_unique_coursemode_course_id_currency_mode_slug','2015-10-29 14:07:37'),(174,'course_modes','0004_auto__add_field_coursemode_expiration_date','2015-10-29 14:07:38'),(175,'course_modes','0005_auto__add_field_coursemode_expiration_datetime','2015-10-29 14:07:38'),(176,'course_modes','0006_expiration_date_to_datetime','2015-10-29 14:07:38'),(177,'course_modes','0007_add_description','2015-10-29 14:07:39'),(178,'course_modes','0007_auto__add_coursemodesarchive__chg_field_coursemode_course_id','2015-10-29 14:07:40'),(179,'course_modes','0008_auto__del_field_coursemodesarchive_description__add_field_coursemode_s','2015-10-29 14:07:40'),(180,'verify_student','0001_initial','2015-10-29 14:07:43'),(181,'verify_student','0002_auto__add_field_softwaresecurephotoverification_window','2015-10-29 14:07:44'),(182,'verify_student','0003_auto__add_field_softwaresecurephotoverification_display','2015-10-29 14:07:46'),(183,'verify_student','0004_auto__add_verificationcheckpoint__add_unique_verificationcheckpoint_co','2015-10-29 14:07:49'),(184,'verify_student','0005_auto__add_incoursereverificationconfiguration','2015-10-29 14:07:50'),(185,'verify_student','0006_auto__add_skippedreverification__add_unique_skippedreverification_user','2015-10-29 14:07:52'),(186,'verify_student','0007_auto__add_field_verificationstatus_location_id','2015-10-29 14:07:52'),(187,'verify_student','0008_auto__del_field_verificationcheckpoint_checkpoint_name__add_field_veri','2015-10-29 14:07:55'),(188,'verify_student','0009_auto__change_softwaresecurephotoverification_window_id_default_none','2015-10-29 14:07:55'),(189,'dark_lang','0001_initial','2015-10-29 14:07:56'),(190,'dark_lang','0002_enable_on_install','2015-10-29 14:07:56'),(191,'reverification','0001_initial','2015-10-29 14:07:57'),(192,'embargo','0001_initial','2015-10-29 14:07:59'),(193,'embargo','0002_add_country_access_models','2015-10-29 14:08:01'),(194,'embargo','0003_add_countries','2015-10-29 14:08:02'),(195,'embargo','0004_migrate_embargo_config','2015-10-29 14:08:02'),(196,'embargo','0005_add_courseaccessrulehistory','2015-10-29 14:08:02'),(197,'embargo','0006_auto__add_field_restrictedcourse_disable_access_check','2015-10-29 14:08:03'),(198,'course_action_state','0001_initial','2015-10-29 14:08:06'),(199,'course_action_state','0002_add_rerun_display_name','2015-10-29 14:08:07'),(200,'mobile_api','0001_initial','2015-10-29 14:08:08'),(201,'survey','0001_initial','2015-10-29 14:08:10'),(202,'lms_xblock','0001_initial','2015-10-29 14:08:11'),(203,'course_overviews','0001_initial','2015-10-29 14:08:12'),(204,'course_structures','0001_initial','2015-10-29 14:08:12'),(205,'cors_csrf','0001_initial','2015-10-29 14:08:14'),(206,'submissions','0001_initial','2015-10-29 14:08:19'),(207,'submissions','0002_auto__add_scoresummary','2015-10-29 14:08:20'),(208,'submissions','0003_auto__del_field_submission_answer__add_field_submission_raw_answer','2015-10-29 14:08:21'),(209,'submissions','0004_auto__add_field_score_reset','2015-10-29 14:08:22'),(210,'assessment','0001_initial','2015-10-29 14:08:34'),(211,'assessment','0002_auto__add_assessmentfeedbackoption__del_field_assessmentfeedback_feedb','2015-10-29 14:08:37'),(212,'assessment','0003_add_index_pw_course_item_student','2015-10-29 14:08:38'),(213,'assessment','0004_auto__add_field_peerworkflow_graded_count','2015-10-29 14:08:39'),(214,'assessment','0005_auto__del_field_peerworkflow_graded_count__add_field_peerworkflow_grad','2015-10-29 14:08:41'),(215,'assessment','0006_auto__add_field_assessmentpart_feedback','2015-10-29 14:08:42'),(216,'assessment','0007_auto__chg_field_assessmentpart_feedback','2015-10-29 14:08:42'),(217,'assessment','0008_student_training','2015-10-29 14:08:47'),(218,'assessment','0009_auto__add_unique_studenttrainingworkflowitem_order_num_workflow','2015-10-29 14:08:47'),(219,'assessment','0010_auto__add_unique_studenttrainingworkflow_submission_uuid','2015-10-29 14:08:47'),(220,'assessment','0011_ai_training','2015-10-29 14:08:53'),(221,'assessment','0012_move_algorithm_id_to_classifier_set','2015-10-29 14:08:59'),(222,'assessment','0013_auto__add_field_aigradingworkflow_essay_text','2015-10-29 14:09:00'),(223,'assessment','0014_auto__add_field_aitrainingworkflow_item_id__add_field_aitrainingworkfl','2015-10-29 14:09:02'),(224,'assessment','0015_auto__add_unique_aitrainingworkflow_uuid__add_unique_aigradingworkflow','2015-10-29 14:09:03'),(225,'assessment','0016_auto__add_field_aiclassifierset_course_id__add_field_aiclassifierset_i','2015-10-29 14:09:05'),(226,'assessment','0016_auto__add_field_rubric_structure_hash','2015-10-29 14:09:06'),(227,'assessment','0017_rubric_structure_hash','2015-10-29 14:09:06'),(228,'assessment','0018_auto__add_field_assessmentpart_criterion','2015-10-29 14:09:07'),(229,'assessment','0019_assessmentpart_criterion_field','2015-10-29 14:09:07'),(230,'assessment','0020_assessmentpart_criterion_not_null','2015-10-29 14:09:08'),(231,'assessment','0021_assessmentpart_option_nullable','2015-10-29 14:09:09'),(232,'assessment','0022__add_label_fields','2015-10-29 14:09:10'),(233,'assessment','0023_assign_criteria_and_option_labels','2015-10-29 14:09:10'),(234,'assessment','0024_auto__chg_field_assessmentpart_criterion','2015-10-29 14:09:11'),(235,'assessment','0025_auto__add_field_peerworkflow_cancelled_at','2015-10-29 14:09:12'),(236,'workflow','0001_initial','2015-10-29 14:09:14'),(237,'workflow','0002_auto__add_field_assessmentworkflow_course_id__add_field_assessmentwork','2015-10-29 14:09:16'),(238,'workflow','0003_auto__add_assessmentworkflowstep','2015-10-29 14:09:16'),(239,'workflow','0004_auto__add_assessmentworkflowcancellation','2015-10-29 14:09:18'),(240,'edxval','0001_initial','2015-10-29 14:09:23'),(241,'edxval','0002_default_profiles','2015-10-29 14:09:23'),(242,'edxval','0003_status_and_created_fields','2015-10-29 14:09:26'),(243,'edxval','0004_remove_profile_fields','2015-10-29 14:09:28'),(244,'milestones','0001_initial','2015-10-29 14:09:35'),(245,'milestones','0002_seed_relationship_types','2015-10-29 14:09:35'),(246,'credit','0001_initial','2015-10-29 14:09:41'),(247,'credit','0002_rename_credit_requirement_criteria_field','2015-10-29 14:09:42'),(248,'credit','0003_add_creditrequirementstatus_reason','2015-10-29 14:09:43'),(249,'credit','0004_auto__add_field_creditrequirement_display_name','2015-10-29 14:09:44'),(250,'credit','0005_auto__add_field_creditprovider_provider_url__add_field_creditprovider_','2015-10-29 14:09:47'),(251,'credit','0006_auto__add_creditrequest__add_unique_creditrequest_username_course_prov','2015-10-29 14:09:53'),(252,'credit','0007_auto__add_field_creditprovider_enable_integration__chg_field_creditpro','2015-10-29 14:09:54'),(253,'credit','0008_delete_credit_provider_timestamp','2015-10-29 14:09:56'),(254,'credit','0009_auto__del_field_crediteligibility_provider','2015-10-29 14:09:57'),(255,'credit','0010_add_creditrequirementstatus_history','2015-10-29 14:09:59'),(256,'credit','0011_auto__add_field_creditrequirement_order','2015-10-29 14:10:00'),(257,'credit','0012_remove_m2m_course_and_provider','2015-10-29 14:10:01'),(258,'credit','0013_add_provider_status_url','2015-10-29 14:10:02'),(259,'contentstore','0001_initial','2015-10-29 14:10:07'),(260,'contentstore','0002_auto__del_field_videouploadconfig_status_whitelist','2015-10-29 14:10:07'),(261,'contentstore','0003_auto__add_pushnotificationconfig','2015-10-29 14:10:08'),(262,'course_creators','0001_initial','2015-10-29 14:10:09'),(263,'xblock_config','0001_initial','2015-10-29 14:10:10'),(264,'courseware','0014_auto__add_subject__add_organization__add_course_subject','2015-11-24 07:30:58'),(265,'student','0052_auto__add_mooc_person__add_mooc_city__add_mooc_state','2015-11-24 07:31:01');
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
  CONSTRAINT `changed_by_id_refs_id_9125b21c` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_anonymoususerid_fbfc09f1` (`user_id`),
  KEY `student_anonymoususerid_ff48d8e5` (`course_id`),
  CONSTRAINT `user_id_refs_id_c38f7a2a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_anonymoususerid`
--

LOCK TABLES `student_anonymoususerid` WRITE;
/*!40000 ALTER TABLE `student_anonymoususerid` DISABLE KEYS */;
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
  UNIQUE KEY `student_courseaccessrole_user_id_3203176c4f474414_uniq` (`user_id`,`org`,`course_id`,`role`),
  KEY `student_courseaccessrole_fbfc09f1` (`user_id`),
  KEY `student_courseaccessrole_4f5f82e2` (`org`),
  KEY `student_courseaccessrole_ff48d8e5` (`course_id`),
  KEY `student_courseaccessrole_e0b082a1` (`role`),
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
  UNIQUE KEY `student_courseenrollment_user_id_2d2a572f07dd8e37_uniq` (`user_id`,`course_id`),
  KEY `student_courseenrollment_fbfc09f1` (`user_id`),
  KEY `student_courseenrollment_ff48d8e5` (`course_id`),
  KEY `student_courseenrollment_3216ff68` (`created`),
  CONSTRAINT `user_id_refs_id_ed37bc9d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollment`
--

LOCK TABLES `student_courseenrollment` WRITE;
/*!40000 ALTER TABLE `student_courseenrollment` DISABLE KEYS */;
INSERT INTO `student_courseenrollment` VALUES (1,1,'edX/DemoX/Demo_Course','2015-10-29 14:28:05',1,'honor'),(2,2,'edX/DemoX/Demo_Course','2015-10-29 14:28:08',1,'audit'),(3,3,'edX/DemoX/Demo_Course','2015-10-29 14:28:11',1,'verified'),(4,4,'edX/DemoX/Demo_Course','2015-10-29 14:28:14',1,'honor');
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
  UNIQUE KEY `student_courseenrollmentallowed_email_6f3eafd4a6c58591_uniq` (`email`,`course_id`),
  KEY `student_courseenrollmentallowed_3904588a` (`email`),
  KEY `student_courseenrollmentallowed_ff48d8e5` (`course_id`),
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
  CONSTRAINT `enrollment_id_refs_id_974619de` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
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
  CONSTRAINT `changed_by_id_refs_id_eec78c18` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `student_entranceexamconfiguration_user_id_714c2ef6a88504f0_uniq` (`user_id`,`course_id`),
  KEY `student_entranceexamconfiguration_fbfc09f1` (`user_id`),
  KEY `student_entranceexamconfiguration_ff48d8e5` (`course_id`),
  KEY `student_entranceexamconfiguration_3216ff68` (`created`),
  KEY `student_entranceexamconfiguration_8aac229` (`updated`),
  CONSTRAINT `user_id_refs_id_9c93dc16` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `student_languageproficiency_code_68e76171684c62e5_uniq` (`code`,`user_profile_id`),
  KEY `student_languageproficiency_634d39b9` (`user_profile_id`),
  CONSTRAINT `user_profile_id_refs_id_ba5aae00` FOREIGN KEY (`user_profile_id`) REFERENCES `auth_userprofile` (`id`)
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
  CONSTRAINT `changed_by_id_refs_id_9469646a` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_loginfailures_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_e6a71045` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_manualenrollmentaudit_a14a0576` (`enrolled_by_id`),
  KEY `student_manualenrollmentaudit_3dd381cb` (`enrolled_email`),
  CONSTRAINT `enrolled_by_id_refs_id_a8059256` FOREIGN KEY (`enrolled_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `enrollment_id_refs_id_a87a89ac` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
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
-- Table structure for table `student_mooc_city`
--

DROP TABLE IF EXISTS `student_mooc_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_mooc_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_mooc_city_b9608dc2` (`state_id`),
  CONSTRAINT `state_id_refs_id_75554b70` FOREIGN KEY (`state_id`) REFERENCES `student_mooc_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_mooc_city`
--

LOCK TABLES `student_mooc_city` WRITE;
/*!40000 ALTER TABLE `student_mooc_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_mooc_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_mooc_person`
--

DROP TABLE IF EXISTS `student_mooc_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_mooc_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `pincode` int(11) NOT NULL,
  `aadhar_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `student_mooc_person_b9608dc2` (`state_id`),
  KEY `student_mooc_person_586a73b5` (`city_id`),
  CONSTRAINT `city_id_refs_id_f3fd8437` FOREIGN KEY (`city_id`) REFERENCES `student_mooc_city` (`id`),
  CONSTRAINT `state_id_refs_id_79a8e574` FOREIGN KEY (`state_id`) REFERENCES `student_mooc_state` (`id`),
  CONSTRAINT `user_id_refs_id_f79013dd` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_mooc_person`
--

LOCK TABLES `student_mooc_person` WRITE;
/*!40000 ALTER TABLE `student_mooc_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_mooc_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_mooc_state`
--

DROP TABLE IF EXISTS `student_mooc_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_mooc_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_mooc_state`
--

LOCK TABLES `student_mooc_state` WRITE;
/*!40000 ALTER TABLE `student_mooc_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_mooc_state` ENABLE KEYS */;
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
  KEY `student_passwordhistory_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_ed0987da` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_pendingemailchange_856c86d7` (`new_email`),
  CONSTRAINT `user_id_refs_id_a525fa67` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  CONSTRAINT `user_id_refs_id_d9359b27` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_usersignupsource_e00a881a` (`site`),
  KEY `student_usersignupsource_fbfc09f1` (`user_id`),
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
  UNIQUE KEY `student_usertestgroup_us_usertestgroup_id_63c588e0372991b0_uniq` (`usertestgroup_id`,`user_id`),
  KEY `student_usertestgroup_users_44f27cdf` (`usertestgroup_id`),
  KEY `student_usertestgroup_users_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_8947584c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
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
  KEY `submissions_score_b3d6235a` (`submission_id`),
  KEY `submissions_score_3b1c9c31` (`created_at`),
  CONSTRAINT `student_item_id_refs_id_8cd97385` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`),
  CONSTRAINT `submission_id_refs_id_9e39cf2e` FOREIGN KEY (`submission_id`) REFERENCES `submissions_submission` (`id`)
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
  KEY `submissions_scoresummary_d65f9365` (`highest_id`),
  KEY `submissions_scoresummary_1efb24d9` (`latest_id`),
  CONSTRAINT `highest_id_refs_id_1bdc0a18` FOREIGN KEY (`highest_id`) REFERENCES `submissions_score` (`id`),
  CONSTRAINT `latest_id_refs_id_1bdc0a18` FOREIGN KEY (`latest_id`) REFERENCES `submissions_score` (`id`),
  CONSTRAINT `student_item_id_refs_id_bd51e768` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`)
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
  UNIQUE KEY `submissions_studentitem_course_id_6a6eccbdec6ffd0b_uniq` (`course_id`,`student_id`,`item_id`),
  KEY `submissions_studentitem_42ff452e` (`student_id`),
  KEY `submissions_studentitem_ff48d8e5` (`course_id`),
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
  KEY `survey_surveyanswer_fbfc09f1` (`user_id`),
  KEY `survey_surveyanswer_1d0aabf2` (`form_id`),
  KEY `survey_surveyanswer_7e1499` (`field_name`),
  CONSTRAINT `form_id_refs_id_f4c79f29` FOREIGN KEY (`form_id`) REFERENCES `survey_surveyform` (`id`),
  CONSTRAINT `user_id_refs_id_e0ad4b5e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_id` (`team_id`),
  KEY `teams_courseteam_ff48d8e5` (`course_id`),
  KEY `teams_courseteam_57732028` (`topic_id`)
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
  UNIQUE KEY `teams_courseteammembership_user_id_48efa8e8971947c3_uniq` (`user_id`,`team_id`),
  KEY `teams_courseteammembership_fbfc09f1` (`user_id`),
  KEY `teams_courseteammembership_fcf8ac47` (`team_id`),
  CONSTRAINT `team_id_refs_id_679497a3` FOREIGN KEY (`team_id`) REFERENCES `teams_courseteam` (`id`),
  CONSTRAINT `user_id_refs_id_abc442bf` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_api_usercoursetags_user_id_a734720a0483b08_uniq` (`user_id`,`course_id`,`key`),
  KEY `user_api_usercoursetags_fbfc09f1` (`user_id`),
  KEY `user_api_usercoursetags_45544485` (`key`),
  KEY `user_api_usercoursetags_ff48d8e5` (`course_id`),
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
  UNIQUE KEY `user_api_userorgtag_user_id_694f9e3322120c6f_uniq` (`user_id`,`org`,`key`),
  KEY `user_api_userorgtag_user_id_694f9e3322120c6f` (`user_id`,`org`,`key`),
  KEY `user_api_userorgtag_fbfc09f1` (`user_id`),
  KEY `user_api_userorgtag_45544485` (`key`),
  KEY `user_api_userorgtag_4f5f82e2` (`org`),
  CONSTRAINT `user_id_refs_id_e54b717f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_api_userpreference_user_id_4e4942d73f760072_uniq` (`user_id`,`key`),
  KEY `user_api_userpreference_fbfc09f1` (`user_id`),
  KEY `user_api_userpreference_45544485` (`key`),
  CONSTRAINT `user_id_refs_id_f3473b9e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userpreference`
--

LOCK TABLES `user_api_userpreference` WRITE;
/*!40000 ALTER TABLE `user_api_userpreference` DISABLE KEYS */;
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
INSERT INTO `util_ratelimitconfiguration` VALUES (1,'2015-10-29 14:04:40',NULL,1);
/*!40000 ALTER TABLE `util_ratelimitconfiguration` ENABLE KEYS */;
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
  CONSTRAINT `changed_by_id_refs_id_ab2dfc2a` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `verify_student_skippedreverificat_user_id_1e8af5a5e735aa1a_uniq` (`user_id`,`course_id`),
  KEY `verify_student_skippedreverification_fbfc09f1` (`user_id`),
  KEY `verify_student_skippedreverification_ff48d8e5` (`course_id`),
  KEY `verify_student_skippedreverification_a631e438` (`checkpoint_id`),
  CONSTRAINT `checkpoint_id_refs_id_de8541b1` FOREIGN KEY (`checkpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`),
  CONSTRAINT `user_id_refs_id_f26a5780` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `window_id` int(11) DEFAULT NULL,
  `display` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_softwaresecurephotoverification_fbfc09f1` (`user_id`),
  KEY `verify_student_softwaresecurephotoverification_8713c555` (`receipt_id`),
  KEY `verify_student_softwaresecurephotoverification_3b1c9c31` (`created_at`),
  KEY `verify_student_softwaresecurephotoverification_f84f7de6` (`updated_at`),
  KEY `verify_student_softwaresecurephotoverification_4452d192` (`submitted_at`),
  KEY `verify_student_softwaresecurephotoverification_b2c165b4` (`reviewing_user_id`),
  KEY `verify_student_softwaresecurephotoverification_7343ffda` (`window_id`),
  KEY `verify_student_softwaresecurephotoverification_35eebcb6` (`display`),
  CONSTRAINT `reviewing_user_id_refs_id_d6ea4207` FOREIGN KEY (`reviewing_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_id_refs_id_d6ea4207` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `window_id_refs_id_fce8f38a` FOREIGN KEY (`window_id`) REFERENCES `reverification_midcoursereverificationwindow` (`id`)
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
  UNIQUE KEY `verify_student_verificationchec_course_id_2c6a1f5c22b4cc19_uniq` (`course_id`,`checkpoint_location`),
  KEY `verify_student_verificationcheckpoint_ff48d8e5` (`course_id`)
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
  UNIQUE KEY `verify_student_v_verificationcheckpoint_id_1df07f66c1a9271_uniq` (`verificationcheckpoint_id`,`softwaresecurephotoverification_id`),
  KEY `verify_student_verificationcheckpoint_photo_verification_c30361a` (`verificationcheckpoint_id`),
  KEY `verify_student_verificationcheckpoint_photo_verification_fdc8dba` (`softwaresecurephotoverification_id`),
  CONSTRAINT `softwaresecurephotoverification_id_refs_id_5efb90e` FOREIGN KEY (`softwaresecurephotoverification_id`) REFERENCES `verify_student_softwaresecurephotoverification` (`id`),
  CONSTRAINT `verificationcheckpoint_id_refs_id_9a387f43` FOREIGN KEY (`verificationcheckpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`)
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
  KEY `verify_student_verificationstatus_a631e438` (`checkpoint_id`),
  KEY `verify_student_verificationstatus_fbfc09f1` (`user_id`),
  KEY `verify_student_verificationstatus_c9ad71dd` (`status`),
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
  KEY `wiki_article_bda51c3c` (`group_id`),
  CONSTRAINT `current_revision_id_refs_id_bafac304` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `group_id_refs_id_108bfee4` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `owner_id_refs_id_9e14b583` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `wiki_articleforobject_content_type_id_27c4cce189b3bcab_uniq` (`content_type_id`,`object_id`),
  KEY `wiki_articleforobject_30525a19` (`article_id`),
  KEY `wiki_articleforobject_e4470c6e` (`content_type_id`),
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
  CONSTRAINT `article_id_refs_id_92c648ca` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`)
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
  UNIQUE KEY `wiki_articlerevision_article_id_4b4e7910c8e7b2d0_uniq` (`article_id`,`revision_number`),
  KEY `wiki_articlerevision_fbfc09f1` (`user_id`),
  KEY `wiki_articlerevision_49bc38cc` (`previous_revision_id`),
  KEY `wiki_articlerevision_30525a19` (`article_id`),
  CONSTRAINT `article_id_refs_id_5c88570a` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `previous_revision_id_refs_id_a951e36b` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `user_id_refs_id_fbb26714` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  CONSTRAINT `articleplugin_ptr_id_refs_id_cbce00e3` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`),
  CONSTRAINT `subscription_ptr_id_refs_id_ae89f475` FOREIGN KEY (`subscription_ptr_id`) REFERENCES `notify_subscription` (`id`)
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
  KEY `wiki_attachmentrevision_fbfc09f1` (`user_id`),
  KEY `wiki_attachmentrevision_49bc38cc` (`previous_revision_id`),
  KEY `wiki_attachmentrevision_edee6011` (`attachment_id`),
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
  CONSTRAINT `revisionplugin_ptr_id_refs_articleplugin_ptr_id_fc42a0b1` FOREIGN KEY (`revisionplugin_ptr_id`) REFERENCES `wiki_revisionplugin` (`articleplugin_ptr_id`)
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
  UNIQUE KEY `wiki_reusableplugin_art_reusableplugin_id_6e34ac94afa8f9f2_uniq` (`reusableplugin_id`,`article_id`),
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
  CONSTRAINT `articleplugin_ptr_id_refs_id_cac31401` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`),
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
  KEY `wiki_revisionpluginrevision_fbfc09f1` (`user_id`),
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
  KEY `wiki_simpleplugin_b3dc49fe` (`article_revision_id`),
  CONSTRAINT `article_revision_id_refs_id_6df37b12` FOREIGN KEY (`article_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `articleplugin_ptr_id_refs_id_a25cbfd2` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`)
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
  UNIQUE KEY `wiki_urlpath_site_id_124f6aa7b2cc9b82_uniq` (`site_id`,`parent_id`,`slug`),
  KEY `wiki_urlpath_a951d5d6` (`slug`),
  KEY `wiki_urlpath_6223029` (`site_id`),
  KEY `wiki_urlpath_63f17a16` (`parent_id`),
  KEY `wiki_urlpath_42b06ff6` (`lft`),
  KEY `wiki_urlpath_91543e5a` (`rght`),
  KEY `wiki_urlpath_efd07f28` (`tree_id`),
  KEY `wiki_urlpath_2a8f42e8` (`level`),
  KEY `wiki_urlpath_30525a19` (`article_id`),
  CONSTRAINT `article_id_refs_id_971759c9` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `parent_id_refs_id_52d1e703` FOREIGN KEY (`parent_id`) REFERENCES `wiki_urlpath` (`id`),
  CONSTRAINT `site_id_refs_id_f4bbaaa2` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  KEY `workflow_assessmentworkflow_course_id_21b427c69fc666ad` (`course_id`,`item_id`,`status`),
  KEY `workflow_assessmentworkflow_ff48d8e5` (`course_id`),
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
  CONSTRAINT `workflow_id_refs_id_9b9e066a` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
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

-- Dump completed on 2015-11-28  9:48:19
