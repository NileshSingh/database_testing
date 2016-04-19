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
  CONSTRAINT `criterion_id_refs_id_4439dd5` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterionoption` (`id`),
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
  `label` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `assessment_criterion_27cb9807` (`rubric_id`),
  CONSTRAINT `rubric_id_refs_id_d0b0c3c` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criterion`
--

LOCK TABLES `assessment_criterion` WRITE;
/*!40000 ALTER TABLE `assessment_criterion` DISABLE KEYS */;
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
  `label` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `assessment_criterionoption_5c9b8f1c` (`criterion_id`),
  CONSTRAINT `criterion_id_refs_id_2d9badce` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criterionoption`
--

LOCK TABLES `assessment_criterionoption` WRITE;
/*!40000 ALTER TABLE `assessment_criterionoption` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  KEY `assessment_peerworkflow_42ff452e` (`student_id`),
  KEY `assessment_peerworkflow_67b70d25` (`item_id`),
  KEY `assessment_peerworkflow_b7271b` (`course_id`),
  KEY `assessment_peerworkflow_3b1c9c31` (`created_at`),
  KEY `assessment_peerworkflow_5d02c50a` (`completed_at`),
  KEY `assessment_peerworkflow_course_id_35649cf3` (`course_id`,`item_id`,`student_id`),
  KEY `assessment_peerworkflow_2329decf` (`grading_completed_at`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_rubric`
--

LOCK TABLES `assessment_rubric` WRITE;
/*!40000 ALTER TABLE `assessment_rubric` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add task state',7,'add_taskmeta'),(20,'Can change task state',7,'change_taskmeta'),(21,'Can delete task state',7,'delete_taskmeta'),(22,'Can add saved group result',8,'add_tasksetmeta'),(23,'Can change saved group result',8,'change_tasksetmeta'),(24,'Can delete saved group result',8,'delete_tasksetmeta'),(25,'Can add interval',9,'add_intervalschedule'),(26,'Can change interval',9,'change_intervalschedule'),(27,'Can delete interval',9,'delete_intervalschedule'),(28,'Can add crontab',10,'add_crontabschedule'),(29,'Can change crontab',10,'change_crontabschedule'),(30,'Can delete crontab',10,'delete_crontabschedule'),(31,'Can add periodic tasks',11,'add_periodictasks'),(32,'Can change periodic tasks',11,'change_periodictasks'),(33,'Can delete periodic tasks',11,'delete_periodictasks'),(34,'Can add periodic task',12,'add_periodictask'),(35,'Can change periodic task',12,'change_periodictask'),(36,'Can delete periodic task',12,'delete_periodictask'),(37,'Can add worker',13,'add_workerstate'),(38,'Can change worker',13,'change_workerstate'),(39,'Can delete worker',13,'delete_workerstate'),(40,'Can add task',14,'add_taskstate'),(41,'Can change task',14,'change_taskstate'),(42,'Can delete task',14,'delete_taskstate'),(43,'Can add migration history',15,'add_migrationhistory'),(44,'Can change migration history',15,'change_migrationhistory'),(45,'Can delete migration history',15,'delete_migrationhistory'),(46,'Can add server circuit',16,'add_servercircuit'),(47,'Can change server circuit',16,'change_servercircuit'),(48,'Can delete server circuit',16,'delete_servercircuit'),(49,'Can add psychometric data',17,'add_psychometricdata'),(50,'Can change psychometric data',17,'change_psychometricdata'),(51,'Can delete psychometric data',17,'delete_psychometricdata'),(52,'Can add nonce',18,'add_nonce'),(53,'Can change nonce',18,'change_nonce'),(54,'Can delete nonce',18,'delete_nonce'),(55,'Can add association',19,'add_association'),(56,'Can change association',19,'change_association'),(57,'Can delete association',19,'delete_association'),(58,'Can add user open id',20,'add_useropenid'),(59,'Can change user open id',20,'change_useropenid'),(60,'Can delete user open id',20,'delete_useropenid'),(61,'Can add log entry',21,'add_logentry'),(62,'Can change log entry',21,'change_logentry'),(63,'Can delete log entry',21,'delete_logentry'),(64,'Can add organization',22,'add_organization'),(65,'Can change organization',22,'change_organization'),(66,'Can delete organization',22,'delete_organization'),(67,'Can add subject',23,'add_subject'),(68,'Can change subject',23,'change_subject'),(69,'Can delete subject',23,'delete_subject'),(70,'Can add course_subject',24,'add_course_subject'),(71,'Can change course_subject',24,'change_course_subject'),(72,'Can delete course_subject',24,'delete_course_subject'),(73,'Can add student module',25,'add_studentmodule'),(74,'Can change student module',25,'change_studentmodule'),(75,'Can delete student module',25,'delete_studentmodule'),(76,'Can add student module history',26,'add_studentmodulehistory'),(77,'Can change student module history',26,'change_studentmodulehistory'),(78,'Can delete student module history',26,'delete_studentmodulehistory'),(79,'Can add x module user state summary field',27,'add_xmoduleuserstatesummaryfield'),(80,'Can change x module user state summary field',27,'change_xmoduleuserstatesummaryfield'),(81,'Can delete x module user state summary field',27,'delete_xmoduleuserstatesummaryfield'),(82,'Can add x module student prefs field',28,'add_xmodulestudentprefsfield'),(83,'Can change x module student prefs field',28,'change_xmodulestudentprefsfield'),(84,'Can delete x module student prefs field',28,'delete_xmodulestudentprefsfield'),(85,'Can add x module student info field',29,'add_xmodulestudentinfofield'),(86,'Can change x module student info field',29,'change_xmodulestudentinfofield'),(87,'Can delete x module student info field',29,'delete_xmodulestudentinfofield'),(88,'Can add offline computed grade',30,'add_offlinecomputedgrade'),(89,'Can change offline computed grade',30,'change_offlinecomputedgrade'),(90,'Can delete offline computed grade',30,'delete_offlinecomputedgrade'),(91,'Can add offline computed grade log',31,'add_offlinecomputedgradelog'),(92,'Can change offline computed grade log',31,'change_offlinecomputedgradelog'),(93,'Can delete offline computed grade log',31,'delete_offlinecomputedgradelog'),(94,'Can add anonymous user id',32,'add_anonymoususerid'),(95,'Can change anonymous user id',32,'change_anonymoususerid'),(96,'Can delete anonymous user id',32,'delete_anonymoususerid'),(97,'Can add user standing',33,'add_userstanding'),(98,'Can change user standing',33,'change_userstanding'),(99,'Can delete user standing',33,'delete_userstanding'),(100,'Can add user profile',34,'add_userprofile'),(101,'Can change user profile',34,'change_userprofile'),(102,'Can delete user profile',34,'delete_userprofile'),(103,'Can add user signup source',35,'add_usersignupsource'),(104,'Can change user signup source',35,'change_usersignupsource'),(105,'Can delete user signup source',35,'delete_usersignupsource'),(106,'Can add user test group',36,'add_usertestgroup'),(107,'Can change user test group',36,'change_usertestgroup'),(108,'Can delete user test group',36,'delete_usertestgroup'),(109,'Can add registration',37,'add_registration'),(110,'Can change registration',37,'change_registration'),(111,'Can delete registration',37,'delete_registration'),(112,'Can add pending name change',38,'add_pendingnamechange'),(113,'Can change pending name change',38,'change_pendingnamechange'),(114,'Can delete pending name change',38,'delete_pendingnamechange'),(115,'Can add pending email change',39,'add_pendingemailchange'),(116,'Can change pending email change',39,'change_pendingemailchange'),(117,'Can delete pending email change',39,'delete_pendingemailchange'),(118,'Can add password history',40,'add_passwordhistory'),(119,'Can change password history',40,'change_passwordhistory'),(120,'Can delete password history',40,'delete_passwordhistory'),(121,'Can add login failures',41,'add_loginfailures'),(122,'Can change login failures',41,'change_loginfailures'),(123,'Can delete login failures',41,'delete_loginfailures'),(124,'Can add course enrollment',42,'add_courseenrollment'),(125,'Can change course enrollment',42,'change_courseenrollment'),(126,'Can delete course enrollment',42,'delete_courseenrollment'),(127,'Can add course enrollment allowed',43,'add_courseenrollmentallowed'),(128,'Can change course enrollment allowed',43,'change_courseenrollmentallowed'),(129,'Can delete course enrollment allowed',43,'delete_courseenrollmentallowed'),(130,'Can add course access role',44,'add_courseaccessrole'),(131,'Can change course access role',44,'change_courseaccessrole'),(132,'Can delete course access role',44,'delete_courseaccessrole'),(133,'Can add dashboard configuration',45,'add_dashboardconfiguration'),(134,'Can change dashboard configuration',45,'change_dashboardconfiguration'),(135,'Can delete dashboard configuration',45,'delete_dashboardconfiguration'),(136,'Can add mooc_state',46,'add_mooc_state'),(137,'Can change mooc_state',46,'change_mooc_state'),(138,'Can delete mooc_state',46,'delete_mooc_state'),(139,'Can add mooc_city',47,'add_mooc_city'),(140,'Can change mooc_city',47,'change_mooc_city'),(141,'Can delete mooc_city',47,'delete_mooc_city'),(142,'Can add mooc_person',48,'add_mooc_person'),(143,'Can change mooc_person',48,'change_mooc_person'),(144,'Can delete mooc_person',48,'delete_mooc_person'),(145,'Can add tracking log',49,'add_trackinglog'),(146,'Can change tracking log',49,'change_trackinglog'),(147,'Can delete tracking log',49,'delete_trackinglog'),(148,'Can add certificate whitelist',50,'add_certificatewhitelist'),(149,'Can change certificate whitelist',50,'change_certificatewhitelist'),(150,'Can delete certificate whitelist',50,'delete_certificatewhitelist'),(151,'Can add generated certificate',51,'add_generatedcertificate'),(152,'Can change generated certificate',51,'change_generatedcertificate'),(153,'Can delete generated certificate',51,'delete_generatedcertificate'),(154,'Can add instructor task',52,'add_instructortask'),(155,'Can change instructor task',52,'change_instructortask'),(156,'Can delete instructor task',52,'delete_instructortask'),(157,'Can add course software',53,'add_coursesoftware'),(158,'Can change course software',53,'change_coursesoftware'),(159,'Can delete course software',53,'delete_coursesoftware'),(160,'Can add user license',54,'add_userlicense'),(161,'Can change user license',54,'change_userlicense'),(162,'Can delete user license',54,'delete_userlicense'),(163,'Can add course user group',55,'add_courseusergroup'),(164,'Can change course user group',55,'change_courseusergroup'),(165,'Can delete course user group',55,'delete_courseusergroup'),(166,'Can add course user group partition group',56,'add_courseusergrouppartitiongroup'),(167,'Can change course user group partition group',56,'change_courseusergrouppartitiongroup'),(168,'Can delete course user group partition group',56,'delete_courseusergrouppartitiongroup'),(169,'Can add course email',57,'add_courseemail'),(170,'Can change course email',57,'change_courseemail'),(171,'Can delete course email',57,'delete_courseemail'),(172,'Can add optout',58,'add_optout'),(173,'Can change optout',58,'change_optout'),(174,'Can delete optout',58,'delete_optout'),(175,'Can add course email template',59,'add_courseemailtemplate'),(176,'Can change course email template',59,'change_courseemailtemplate'),(177,'Can delete course email template',59,'delete_courseemailtemplate'),(178,'Can add course authorization',60,'add_courseauthorization'),(179,'Can change course authorization',60,'change_courseauthorization'),(180,'Can delete course authorization',60,'delete_courseauthorization'),(181,'Can add external auth map',61,'add_externalauthmap'),(182,'Can change external auth map',61,'change_externalauthmap'),(183,'Can delete external auth map',61,'delete_externalauthmap'),(184,'Can add client',62,'add_client'),(185,'Can change client',62,'change_client'),(186,'Can delete client',62,'delete_client'),(187,'Can add grant',63,'add_grant'),(188,'Can change grant',63,'change_grant'),(189,'Can delete grant',63,'delete_grant'),(190,'Can add access token',64,'add_accesstoken'),(191,'Can change access token',64,'change_accesstoken'),(192,'Can delete access token',64,'delete_accesstoken'),(193,'Can add refresh token',65,'add_refreshtoken'),(194,'Can change refresh token',65,'change_refreshtoken'),(195,'Can delete refresh token',65,'delete_refreshtoken'),(196,'Can add trusted client',66,'add_trustedclient'),(197,'Can change trusted client',66,'change_trustedclient'),(198,'Can delete trusted client',66,'delete_trustedclient'),(199,'Can add article',67,'add_article'),(200,'Can change article',67,'change_article'),(201,'Can delete article',67,'delete_article'),(202,'Can edit all articles and lock/unlock/restore',67,'moderate'),(203,'Can change ownership of any article',67,'assign'),(204,'Can assign permissions to other users',67,'grant'),(205,'Can add Article for object',68,'add_articleforobject'),(206,'Can change Article for object',68,'change_articleforobject'),(207,'Can delete Article for object',68,'delete_articleforobject'),(208,'Can add article revision',69,'add_articlerevision'),(209,'Can change article revision',69,'change_articlerevision'),(210,'Can delete article revision',69,'delete_articlerevision'),(211,'Can add URL path',70,'add_urlpath'),(212,'Can change URL path',70,'change_urlpath'),(213,'Can delete URL path',70,'delete_urlpath'),(214,'Can add article plugin',71,'add_articleplugin'),(215,'Can change article plugin',71,'change_articleplugin'),(216,'Can delete article plugin',71,'delete_articleplugin'),(217,'Can add reusable plugin',72,'add_reusableplugin'),(218,'Can change reusable plugin',72,'change_reusableplugin'),(219,'Can delete reusable plugin',72,'delete_reusableplugin'),(220,'Can add simple plugin',73,'add_simpleplugin'),(221,'Can change simple plugin',73,'change_simpleplugin'),(222,'Can delete simple plugin',73,'delete_simpleplugin'),(223,'Can add revision plugin',74,'add_revisionplugin'),(224,'Can change revision plugin',74,'change_revisionplugin'),(225,'Can delete revision plugin',74,'delete_revisionplugin'),(226,'Can add revision plugin revision',75,'add_revisionpluginrevision'),(227,'Can change revision plugin revision',75,'change_revisionpluginrevision'),(228,'Can delete revision plugin revision',75,'delete_revisionpluginrevision'),(229,'Can add article subscription',76,'add_articlesubscription'),(230,'Can change article subscription',76,'change_articlesubscription'),(231,'Can delete article subscription',76,'delete_articlesubscription'),(232,'Can add type',77,'add_notificationtype'),(233,'Can change type',77,'change_notificationtype'),(234,'Can delete type',77,'delete_notificationtype'),(235,'Can add settings',78,'add_settings'),(236,'Can change settings',78,'change_settings'),(237,'Can delete settings',78,'delete_settings'),(238,'Can add subscription',79,'add_subscription'),(239,'Can change subscription',79,'change_subscription'),(240,'Can delete subscription',79,'delete_subscription'),(241,'Can add notification',80,'add_notification'),(242,'Can change notification',80,'change_notification'),(243,'Can delete notification',80,'delete_notification'),(244,'Can add score',81,'add_score'),(245,'Can change score',81,'change_score'),(246,'Can delete score',81,'delete_score'),(247,'Can add puzzle complete',82,'add_puzzlecomplete'),(248,'Can change puzzle complete',82,'change_puzzlecomplete'),(249,'Can delete puzzle complete',82,'delete_puzzlecomplete'),(250,'Can add note',83,'add_note'),(251,'Can change note',83,'change_note'),(252,'Can delete note',83,'delete_note'),(253,'Can add splash config',84,'add_splashconfig'),(254,'Can change splash config',84,'change_splashconfig'),(255,'Can delete splash config',84,'delete_splashconfig'),(256,'Can add user preference',85,'add_userpreference'),(257,'Can change user preference',85,'change_userpreference'),(258,'Can delete user preference',85,'delete_userpreference'),(259,'Can add user course tag',86,'add_usercoursetag'),(260,'Can change user course tag',86,'change_usercoursetag'),(261,'Can delete user course tag',86,'delete_usercoursetag'),(262,'Can add user org tag',87,'add_userorgtag'),(263,'Can change user org tag',87,'change_userorgtag'),(264,'Can delete user org tag',87,'delete_userorgtag'),(265,'Can add order',88,'add_order'),(266,'Can change order',88,'change_order'),(267,'Can delete order',88,'delete_order'),(268,'Can add order item',89,'add_orderitem'),(269,'Can change order item',89,'change_orderitem'),(270,'Can delete order item',89,'delete_orderitem'),(271,'Can add invoice',90,'add_invoice'),(272,'Can change invoice',90,'change_invoice'),(273,'Can delete invoice',90,'delete_invoice'),(274,'Can add course registration code',91,'add_courseregistrationcode'),(275,'Can change course registration code',91,'change_courseregistrationcode'),(276,'Can delete course registration code',91,'delete_courseregistrationcode'),(277,'Can add registration code redemption',92,'add_registrationcoderedemption'),(278,'Can change registration code redemption',92,'change_registrationcoderedemption'),(279,'Can delete registration code redemption',92,'delete_registrationcoderedemption'),(280,'Can add coupon',93,'add_coupon'),(281,'Can change coupon',93,'change_coupon'),(282,'Can delete coupon',93,'delete_coupon'),(283,'Can add coupon redemption',94,'add_couponredemption'),(284,'Can change coupon redemption',94,'change_couponredemption'),(285,'Can delete coupon redemption',94,'delete_couponredemption'),(286,'Can add paid course registration',95,'add_paidcourseregistration'),(287,'Can change paid course registration',95,'change_paidcourseregistration'),(288,'Can delete paid course registration',95,'delete_paidcourseregistration'),(289,'Can add course reg code item',96,'add_courseregcodeitem'),(290,'Can change course reg code item',96,'change_courseregcodeitem'),(291,'Can delete course reg code item',96,'delete_courseregcodeitem'),(292,'Can add course reg code item annotation',97,'add_courseregcodeitemannotation'),(293,'Can change course reg code item annotation',97,'change_courseregcodeitemannotation'),(294,'Can delete course reg code item annotation',97,'delete_courseregcodeitemannotation'),(295,'Can add paid course registration annotation',98,'add_paidcourseregistrationannotation'),(296,'Can change paid course registration annotation',98,'change_paidcourseregistrationannotation'),(297,'Can delete paid course registration annotation',98,'delete_paidcourseregistrationannotation'),(298,'Can add certificate item',99,'add_certificateitem'),(299,'Can change certificate item',99,'change_certificateitem'),(300,'Can delete certificate item',99,'delete_certificateitem'),(301,'Can add donation configuration',100,'add_donationconfiguration'),(302,'Can change donation configuration',100,'change_donationconfiguration'),(303,'Can delete donation configuration',100,'delete_donationconfiguration'),(304,'Can add donation',101,'add_donation'),(305,'Can change donation',101,'change_donation'),(306,'Can delete donation',101,'delete_donation'),(307,'Can add course mode',102,'add_coursemode'),(308,'Can change course mode',102,'change_coursemode'),(309,'Can delete course mode',102,'delete_coursemode'),(310,'Can add course modes archive',103,'add_coursemodesarchive'),(311,'Can change course modes archive',103,'change_coursemodesarchive'),(312,'Can delete course modes archive',103,'delete_coursemodesarchive'),(313,'Can add software secure photo verification',104,'add_softwaresecurephotoverification'),(314,'Can change software secure photo verification',104,'change_softwaresecurephotoverification'),(315,'Can delete software secure photo verification',104,'delete_softwaresecurephotoverification'),(316,'Can add dark lang config',105,'add_darklangconfig'),(317,'Can change dark lang config',105,'change_darklangconfig'),(318,'Can delete dark lang config',105,'delete_darklangconfig'),(319,'Can add midcourse reverification window',106,'add_midcoursereverificationwindow'),(320,'Can change midcourse reverification window',106,'change_midcoursereverificationwindow'),(321,'Can delete midcourse reverification window',106,'delete_midcoursereverificationwindow'),(322,'Can add embargoed course',107,'add_embargoedcourse'),(323,'Can change embargoed course',107,'change_embargoedcourse'),(324,'Can delete embargoed course',107,'delete_embargoedcourse'),(325,'Can add embargoed state',108,'add_embargoedstate'),(326,'Can change embargoed state',108,'change_embargoedstate'),(327,'Can delete embargoed state',108,'delete_embargoedstate'),(328,'Can add ip filter',109,'add_ipfilter'),(329,'Can change ip filter',109,'change_ipfilter'),(330,'Can delete ip filter',109,'delete_ipfilter'),(331,'Can add course rerun state',110,'add_coursererunstate'),(332,'Can change course rerun state',110,'change_coursererunstate'),(333,'Can delete course rerun state',110,'delete_coursererunstate'),(334,'Can add survey form',111,'add_surveyform'),(335,'Can change survey form',111,'change_surveyform'),(336,'Can delete survey form',111,'delete_surveyform'),(337,'Can add survey answer',112,'add_surveyanswer'),(338,'Can change survey answer',112,'change_surveyanswer'),(339,'Can delete survey answer',112,'delete_surveyanswer'),(340,'Can add x block asides config',113,'add_xblockasidesconfig'),(341,'Can change x block asides config',113,'change_xblockasidesconfig'),(342,'Can delete x block asides config',113,'delete_xblockasidesconfig'),(343,'Can add linked in',114,'add_linkedin'),(344,'Can change linked in',114,'change_linkedin'),(345,'Can delete linked in',114,'delete_linkedin'),(346,'Can add student item',115,'add_studentitem'),(347,'Can change student item',115,'change_studentitem'),(348,'Can delete student item',115,'delete_studentitem'),(349,'Can add submission',116,'add_submission'),(350,'Can change submission',116,'change_submission'),(351,'Can delete submission',116,'delete_submission'),(352,'Can add score',117,'add_score'),(353,'Can change score',117,'change_score'),(354,'Can delete score',117,'delete_score'),(355,'Can add score summary',118,'add_scoresummary'),(356,'Can change score summary',118,'change_scoresummary'),(357,'Can delete score summary',118,'delete_scoresummary'),(358,'Can add rubric',119,'add_rubric'),(359,'Can change rubric',119,'change_rubric'),(360,'Can delete rubric',119,'delete_rubric'),(361,'Can add criterion',120,'add_criterion'),(362,'Can change criterion',120,'change_criterion'),(363,'Can delete criterion',120,'delete_criterion'),(364,'Can add criterion option',121,'add_criterionoption'),(365,'Can change criterion option',121,'change_criterionoption'),(366,'Can delete criterion option',121,'delete_criterionoption'),(367,'Can add assessment',122,'add_assessment'),(368,'Can change assessment',122,'change_assessment'),(369,'Can delete assessment',122,'delete_assessment'),(370,'Can add assessment part',123,'add_assessmentpart'),(371,'Can change assessment part',123,'change_assessmentpart'),(372,'Can delete assessment part',123,'delete_assessmentpart'),(373,'Can add assessment feedback option',124,'add_assessmentfeedbackoption'),(374,'Can change assessment feedback option',124,'change_assessmentfeedbackoption'),(375,'Can delete assessment feedback option',124,'delete_assessmentfeedbackoption'),(376,'Can add assessment feedback',125,'add_assessmentfeedback'),(377,'Can change assessment feedback',125,'change_assessmentfeedback'),(378,'Can delete assessment feedback',125,'delete_assessmentfeedback'),(379,'Can add peer workflow',126,'add_peerworkflow'),(380,'Can change peer workflow',126,'change_peerworkflow'),(381,'Can delete peer workflow',126,'delete_peerworkflow'),(382,'Can add peer workflow item',127,'add_peerworkflowitem'),(383,'Can change peer workflow item',127,'change_peerworkflowitem'),(384,'Can delete peer workflow item',127,'delete_peerworkflowitem'),(385,'Can add training example',128,'add_trainingexample'),(386,'Can change training example',128,'change_trainingexample'),(387,'Can delete training example',128,'delete_trainingexample'),(388,'Can add student training workflow',129,'add_studenttrainingworkflow'),(389,'Can change student training workflow',129,'change_studenttrainingworkflow'),(390,'Can delete student training workflow',129,'delete_studenttrainingworkflow'),(391,'Can add student training workflow item',130,'add_studenttrainingworkflowitem'),(392,'Can change student training workflow item',130,'change_studenttrainingworkflowitem'),(393,'Can delete student training workflow item',130,'delete_studenttrainingworkflowitem'),(394,'Can add ai classifier set',131,'add_aiclassifierset'),(395,'Can change ai classifier set',131,'change_aiclassifierset'),(396,'Can delete ai classifier set',131,'delete_aiclassifierset'),(397,'Can add ai classifier',132,'add_aiclassifier'),(398,'Can change ai classifier',132,'change_aiclassifier'),(399,'Can delete ai classifier',132,'delete_aiclassifier'),(400,'Can add ai training workflow',133,'add_aitrainingworkflow'),(401,'Can change ai training workflow',133,'change_aitrainingworkflow'),(402,'Can delete ai training workflow',133,'delete_aitrainingworkflow'),(403,'Can add ai grading workflow',134,'add_aigradingworkflow'),(404,'Can change ai grading workflow',134,'change_aigradingworkflow'),(405,'Can delete ai grading workflow',134,'delete_aigradingworkflow'),(406,'Can add assessment workflow',135,'add_assessmentworkflow'),(407,'Can change assessment workflow',135,'change_assessmentworkflow'),(408,'Can delete assessment workflow',135,'delete_assessmentworkflow'),(409,'Can add assessment workflow step',136,'add_assessmentworkflowstep'),(410,'Can change assessment workflow step',136,'change_assessmentworkflowstep'),(411,'Can delete assessment workflow step',136,'delete_assessmentworkflowstep'),(412,'Can add profile',137,'add_profile'),(413,'Can change profile',137,'change_profile'),(414,'Can delete profile',137,'delete_profile'),(415,'Can add video',138,'add_video'),(416,'Can change video',138,'change_video'),(417,'Can delete video',138,'delete_video'),(418,'Can add course video',139,'add_coursevideo'),(419,'Can change course video',139,'change_coursevideo'),(420,'Can delete course video',139,'delete_coursevideo'),(421,'Can add encoded video',140,'add_encodedvideo'),(422,'Can change encoded video',140,'change_encodedvideo'),(423,'Can delete encoded video',140,'delete_encodedvideo'),(424,'Can add subtitle',141,'add_subtitle'),(425,'Can change subtitle',141,'change_subtitle'),(426,'Can delete subtitle',141,'delete_subtitle'),(427,'Can add course creator',142,'add_coursecreator'),(428,'Can change course creator',142,'change_coursecreator'),(429,'Can delete course creator',142,'delete_coursecreator');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_registration`
--

LOCK TABLES `auth_registration` WRITE;
/*!40000 ALTER TABLE `auth_registration` DISABLE KEYS */;
INSERT INTO `auth_registration` VALUES (2,3,'6d9d644e0757427fa282465b71a48255'),(5,7,'6cb0f3a3755548b1a055028ddcd3f6f1'),(6,8,'a28273c444804880acbccd2f10e66d12'),(7,9,'f2e1f6a0927147b1bc3acb0401c8e872'),(8,11,'516e4d828bc9413e9137aea7d046dc79'),(9,12,'fa8c49ed3f884dabb23af02ffa2d0033');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','admin@example.com','pbkdf2_sha256$10000$GscNFiRHqGj5$KrR8ZXjOz0YnrSZ4jjBYnFADaxI3GlNrqn9QG7xN4Ug=',1,1,1,'2015-11-17 14:45:03','2015-10-20 15:46:50'),(3,'nileshSingh','','','raj88.007@gmail.com','pbkdf2_sha256$10000$3OVvLFjvpkqH$JPuwORVYeLQTMu/gBV1wYT+m4NQsHOr+CXp9PRCU6K4=',1,1,1,'2015-11-18 22:11:23','2015-10-21 15:12:40'),(7,'vivek008','','','raj88_007@yahoo.co.in','pbkdf2_sha256$10000$zBpZ9Fc46Hj2$uQMTDsdlUYD9djXXgYYUC/M6jdNvfA8h41o5UnlRi6U=',1,1,0,'2015-11-17 14:47:13','2015-11-17 14:47:13'),(8,'vivek006','','','nileshs@cse.iitb.ac.in','pbkdf2_sha256$10000$RFU8YNB1dd1q$wtft60VbPaf9T9f4YgQi4kWdP6PKo1+J5JELB//9NKo=',1,1,0,'2015-11-17 14:48:40','2015-11-17 14:48:39'),(9,'vivek005','','','saurabhv@cse.iitb.ac.in','pbkdf2_sha256$10000$qJrR0kxgbNHo$7L2TAPDZTbtRcG1HvvklARH3rb8pSRngax9aO3sh8+k=',1,1,0,'2015-11-17 14:50:37','2015-11-17 14:50:37'),(11,'vivek004','','','abc@gmail.com','pbkdf2_sha256$10000$3ge3hYFtWLHf$eHqV/b54Vx29+Gsgqj/yrwYa9ddtcXQcg8HRbnMFLIk=',1,1,0,'2015-11-17 14:56:52','2015-11-17 14:56:51'),(12,'vivek003','','','shinde.d@gmail.com','pbkdf2_sha256$10000$gPl2cVHERcTT$FX9neVOIQKkiGhI7BLb3undZHqTMVI04TRKJbQdVPHE=',1,1,0,'2015-11-17 14:59:14','2015-11-17 14:59:14');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `auth_userprofile_52094d6e` (`name`),
  KEY `auth_userprofile_75853655` (`language`),
  KEY `auth_userprofile_4ab6ab22` (`location`),
  KEY `auth_userprofile_35c2d6e` (`gender`),
  KEY `auth_userprofile_d85587` (`year_of_birth`),
  KEY `auth_userprofile_551e365c` (`level_of_education`),
  CONSTRAINT `user_id_refs_id_628b4c11` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_userprofile`
--

LOCK TABLES `auth_userprofile` WRITE;
/*!40000 ALTER TABLE `auth_userprofile` DISABLE KEYS */;
INSERT INTO `auth_userprofile` VALUES (2,3,'Nilesh','','','','course.xml','m','',1997,'m','',1,'','18'),(5,7,'vivek123','','','','course.xml','m','rasghdrshgfmgh,mgj,mhj,h,h,,,\r\nfnjdfygjdfmnjdfmjgfmdmg\r\nmnghfmndfmndmgm',1984,'m','mghmghfmghmghmgmgfmg\r\ndgfjmndfmnjghfmghmghm\r\nghmghmghfmghmgj,hk,.,.hfj,,jfjukjsfhdtshdrtsbdbd',1,'','3174'),(6,8,'nileshs','','','','course.xml','m','rasghdrshgfmgh,mgj,mhj,h,h,,,\r\nfnjdfygjdfmnjdfmjgfmdmg\r\nmnghfmndfmndmgm',1984,'m','mghmghfmghmghmgmgfmg\r\ndgfjmndfmnjghfmghmghm\r\nghmghmghfmghmgj,hk,.,.hfj,,jfjukjsfhdtshdrtsbdbd',1,'','3174'),(7,9,'saurabhv','','','','course.xml','m','rasghdrshgfmgh,mgj,mhj,h,h,,,\r\nfnjdfygjdfmnjdfmjgfmdmg\r\nmnghfmndfmndmgm',1984,'m','mghmghfmghmghmgmgfmg\r\ndgfjmndfmnjghfmghmghm\r\nghmghmghfmghmgj,hk,.,.hfj,,jfjukjsfhdtshdrtsbdbd',1,'','3174'),(8,11,'abc','','','','course.xml','m','rasghdrshgfmgh,mgj,mhj,h,h,,,\r\nfnjdfygjdfmnjdfmjgfmdmg\r\nmnghfmndfmndmgm',1984,'m','mghmghfmghmghmgmgfmg\r\ndgfjmndfmnjghfmghmghm\r\nghmghmghfmghmgj,hk,.,.hfj,,jfjukjsfhdtshdrtsbdbd',1,'','3174'),(9,12,'deepaks','','','','course.xml','m','rasghdrshgfmgh,mgj,mhj,h,h,,,\r\nfnjdfygjdfmnjdfmjgfmdmg\r\nmnghfmndfmndmgm',1984,'m','mghmghfmghmghmgmgfmg\r\ndgfjmndfmnjghfmghmghm\r\nghmghmghfmghmgj,hk,.,.hfj,,jfjukjsfhdtshdrtsbdbd',1,'','3174');
/*!40000 ALTER TABLE `auth_userprofile` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatewhitelist`
--

LOCK TABLES `certificates_certificatewhitelist` WRITE;
/*!40000 ALTER TABLE `certificates_certificatewhitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificatewhitelist` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuit_servercircuit`
--

LOCK TABLES `circuit_servercircuit` WRITE;
/*!40000 ALTER TABLE `circuit_servercircuit` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuit_servercircuit` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `courseware_offlinecomputedgrade_user_id_926078f_uniq` (`user_id`,`course_id`),
  KEY `courseware_offlinecomputedgrade_403f60f` (`user_id`),
  KEY `courseware_offlinecomputedgrade_b7271b` (`course_id`),
  KEY `courseware_offlinecomputedgrade_3216ff68` (`created`),
  KEY `courseware_offlinecomputedgrade_8aac229` (`updated`),
  CONSTRAINT `user_id_refs_id_38cf339d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_organization`
--

LOCK TABLES `courseware_organization` WRITE;
/*!40000 ALTER TABLE `courseware_organization` DISABLE KEYS */;
INSERT INTO `courseware_organization` VALUES (1,'IITBombayX','Indian Institute of Technology Bombay','Maharashtra','Mumbai','www.iitb.ac.in','\r\nIITBombayX\r\n\r\nIIT Bombay, established in 1958, has emerged as a leading Institute in India. It is globally recognized for its quality education and strong research programs. Admissions are made through national competitive entrance examinations, considered to be the toughest in India. Its residential campus is home to over 8000 students, 500 faculty members, 14 departments, 6 centres, and 3 inter-disciplinary programs.\r\n\r\nThe research program in Education Technology attempts to evolve the most effective learning-teaching processes. The Centre for Distance Engineering Education Program (C-DEEP), handles much of the outreach activities. Several national mission projects are handled by the Institute. Training is offered to teachers on a large scale – up to 10,000 teachers at a time - using a unique blended mode. Other activities include: creation of web/video courses, spoken tutorials, educational animations, design and development of educational robots, educational content and applications on low-cost Aakash tablets, learning environments in the field of design, and FOSSEE.','/static/images/IITBombay-logo.png','/static/images/IITBombay-header.jpg','kalpanak@it.iitb.ac.in','kalpanak@it.iitb.ac.in','kalpanak@it.iitb.ac.in'),(2,'NVAforIA','National Virtual\nAcademy for Indian Agriculture','Telangana','\nPatancheru 502324','www.oneagriculture.org','The National Virtual Academy\n(NVAforIA) for Indian agriculture promotes Massive Open Online Courses for\nagricultural professionals in India.  It is a regional initiative of “One\n\nAgriculture – One Science: A Global Education Consortium (\n\nwww.oneagriculture.org)”. The main aim of this national virtual academy is\n\nto attract youth to agriculture education by addressing the current\nchallenges of state agricultural universities - outdated curriculum, access\nto good quality faculty and re-orienting agricultural education - as per\nthe needs of the national and international agriculture sectors.\n<br><br>The online courses available through NVAforIA can be offered in\nstate agricultural universities through flipped classroom approach and to\nall other interested agricultural professionals directly through the\nacademy’s online platform together with IIT Bombay. The initiative brings\n\nstrategic coalition of national and international partners led by ICRISAT,\nto execute various activities of the virtual\nacademy.','/static/images/NVAforIA_Logo_200x101.png','/static/images/NVAforIA_MainBanner_960x195.jpg','\nG.Dileepkumar@cgiar.org','G.Dileepkumar@cgiar.org','G.Dileepkumar@cgiar.org\n');
/*!40000 ALTER TABLE `courseware_organization` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentmodule`
--

LOCK TABLES `courseware_studentmodule` WRITE;
/*!40000 ALTER TABLE `courseware_studentmodule` DISABLE KEYS */;
INSERT INTO `courseware_studentmodule` VALUES (1,'course','i4x://IITBombayX/AND101/course/2015_A1',3,'{\"position\": 3}',NULL,'2015-11-04 16:19:54','2015-11-18 22:12:33',NULL,'na','IITBombayX/AND101/2015_A1'),(2,'chapter','i4x://IITBombayX/AND101/chapter/ff2390b024ce470ebb4960677d9d67fc',3,'{\"position\": 2}',NULL,'2015-11-04 16:19:54','2015-11-18 22:11:56',NULL,'na','IITBombayX/AND101/2015_A1'),(3,'problem','i4x://IITBombayX/AND101/problem/6f718fd04a5948618bebe084adc65b24',3,'{\"correct_map\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"msg\": \"\", \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:11:53Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": [\"choice_1\"]}}',0,'2015-11-04 16:19:54','2015-11-18 22:11:54',1,'na','IITBombayX/AND101/2015_A1'),(4,'problem','i4x://IITBombayX/AND101/problem/4206f12ac0d841ab8b97a2828812cfd9',3,'{\"correct_map\": {\"i4x-IITBombayX-AND101-problem-4206f12ac0d841ab8b97a2828812cfd9_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"npoints\": null, \"msg\": \"\", \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-AND101-problem-4206f12ac0d841ab8b97a2828812cfd9_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:11:46Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-AND101-problem-4206f12ac0d841ab8b97a2828812cfd9_2_1\": [\"choice_0\", \"choice_2\", \"choice_3\"]}}',1,'2015-11-04 16:19:54','2015-11-18 22:11:46',1,'na','IITBombayX/AND101/2015_A1'),(5,'sequential','i4x://IITBombayX/AND101/sequential/c92c5cfddd7c4d6fa4342d63dc9fc8c7',3,'{\"position\": 2}',NULL,'2015-11-04 16:19:54','2015-11-18 22:11:33',NULL,'na','IITBombayX/AND101/2015_A1'),(6,'video','i4x://IITBombayX/AND101/video/ea95eaa2ee524c6ea39a81d93e216e30',3,'{\"saved_video_position\": \"00:00:00\"}',NULL,'2015-11-04 16:20:05','2015-11-04 16:20:05',NULL,'na','IITBombayX/AND101/2015_A1'),(7,'chapter','i4x://IITBombayX/AND101/chapter/fd775b5a4ec94251af9517f218aebc84',3,'{\"position\": 2}',NULL,'2015-11-04 16:20:14','2015-11-18 22:12:12',NULL,'na','IITBombayX/AND101/2015_A1'),(8,'sequential','i4x://IITBombayX/AND101/sequential/d1827e2d7c344e0eb3578a80f97fd2c9',3,'{\"position\": 1}',NULL,'2015-11-04 16:20:14','2015-11-04 16:20:14',NULL,'na','IITBombayX/AND101/2015_A1'),(9,'chapter','i4x://IITBombayX/AND101/chapter/67d12c30f9cd4a4890122655b2dbf95f',3,'{\"position\": 2}',NULL,'2015-11-04 17:28:21','2015-11-18 22:12:42',NULL,'na','IITBombayX/AND101/2015_A1'),(10,'sequential','i4x://IITBombayX/AND101/sequential/d61ed74d346f4c9ba13e5203f365e7d0',3,'{\"position\": 2}',NULL,'2015-11-04 17:28:21','2015-11-18 22:12:37',NULL,'na','IITBombayX/AND101/2015_A1'),(11,'course','i4x://IITBombayX/T101/course/2015_TS1',3,'{\"position\": 1}',NULL,'2015-11-18 18:48:32','2015-11-18 18:48:32',NULL,'na','IITBombayX/T101/2015_TS1'),(12,'chapter','i4x://IITBombayX/T101/chapter/c12a7497510b4a7693ff9866273baa19',3,'{\"position\": 2}',NULL,'2015-11-18 18:48:32','2015-11-18 22:10:52',NULL,'na','IITBombayX/T101/2015_TS1'),(13,'problem','i4x://IITBombayX/T101/problem/4e5f09397884427881a9af87260622ba',3,'{\"correct_map\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"msg\": \"\", \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:10:46Z\", \"attempts\": 2, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": [\"choice_0\"]}}',1,'2015-11-18 18:48:33','2015-11-18 22:10:46',1,'na','IITBombayX/T101/2015_TS1'),(14,'sequential','i4x://IITBombayX/T101/sequential/26f0b122c333496d96ef7f0fedb332dc',3,'{\"position\": 1}',NULL,'2015-11-18 18:48:33','2015-11-18 18:48:33',NULL,'na','IITBombayX/T101/2015_TS1'),(15,'problem','i4x://IITBombayX/T101/problem/165835688bd44d308678a93d5c09bd29',3,'{\"correct_map\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"msg\": \"\", \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:10:59Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": \"choice_beatles\"}}',0,'2015-11-18 18:49:42','2015-11-18 22:11:00',1,'na','IITBombayX/T101/2015_TS1'),(16,'sequential','i4x://IITBombayX/T101/sequential/5daaa007ffcf4644ad5e2c80c01987b9',3,'{\"position\": 1}',NULL,'2015-11-18 22:10:22','2015-11-18 22:10:22',NULL,'na','IITBombayX/T101/2015_TS1'),(17,'sequential','i4x://IITBombayX/AND101/sequential/57052688b8c14f31b15d47cb11c89172',3,'{\"position\": 1}',NULL,'2015-11-18 22:11:57','2015-11-18 22:11:57',NULL,'na','IITBombayX/AND101/2015_A1'),(18,'sequential','i4x://IITBombayX/AND101/sequential/f1602382aa1f424cb80276f426316d06',3,'{\"position\": 1}',NULL,'2015-11-18 22:12:12','2015-11-18 22:12:12',NULL,'na','IITBombayX/AND101/2015_A1'),(19,'problem','i4x://IITBombayX/AND101/problem/4646d3b129804f5aaefc16c7cabca037',3,'{\"correct_map\": {\"i4x-IITBombayX-AND101-problem-4646d3b129804f5aaefc16c7cabca037_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"npoints\": null, \"msg\": \"\", \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-AND101-problem-4646d3b129804f5aaefc16c7cabca037_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:12:40Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-AND101-problem-4646d3b129804f5aaefc16c7cabca037_2_1\": [\"choice_2\"]}}',0,'2015-11-18 22:12:33','2015-11-18 22:12:40',1,'na','IITBombayX/AND101/2015_A1'),(20,'sequential','i4x://IITBombayX/AND101/sequential/fa41f6217f4846da9e8ec83a1f07ad22',3,'{\"position\": 1}',NULL,'2015-11-18 22:12:42','2015-11-18 22:12:42',NULL,'na','IITBombayX/AND101/2015_A1');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentmodulehistory`
--

LOCK TABLES `courseware_studentmodulehistory` WRITE;
/*!40000 ALTER TABLE `courseware_studentmodulehistory` DISABLE KEYS */;
INSERT INTO `courseware_studentmodulehistory` VALUES (1,3,NULL,'2015-11-04 16:19:54','{}',NULL,NULL),(2,3,NULL,'2015-11-04 16:19:54','{\"seed\": 1, \"input_state\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": {}}}',NULL,NULL),(3,4,NULL,'2015-11-04 16:19:54','{}',NULL,NULL),(4,4,NULL,'2015-11-04 16:19:54','{\"seed\": 1, \"input_state\": {\"i4x-IITBombayX-AND101-problem-4206f12ac0d841ab8b97a2828812cfd9_2_1\": {}}}',NULL,NULL),(5,13,NULL,'2015-11-18 18:48:33','{}',NULL,NULL),(6,13,NULL,'2015-11-18 18:48:33','{\"seed\": 1, \"input_state\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {}}}',NULL,NULL),(7,15,NULL,'2015-11-18 18:49:42','{}',NULL,NULL),(8,15,NULL,'2015-11-18 18:49:42','{\"seed\": 1, \"input_state\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": {}}}',NULL,NULL),(9,13,NULL,'2015-11-18 22:10:39','{\"seed\": 1, \"input_state\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {}}}',1,1),(10,13,NULL,'2015-11-18 22:10:39','{\"correct_map\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"msg\": \"\", \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:10:39Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": [\"choice_0\"]}}',1,1),(11,13,NULL,'2015-11-18 22:10:40','{\"correct_map\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"npoints\": null, \"msg\": \"\", \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:10:39Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": [\"choice_0\"]}}',1,1),(12,13,NULL,'2015-11-18 22:10:46','{\"correct_map\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"npoints\": null, \"msg\": \"\", \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:10:39Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": [\"choice_0\"]}}',1,1),(13,13,NULL,'2015-11-18 22:10:46','{\"correct_map\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"msg\": \"\", \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:10:46Z\", \"attempts\": 2, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-T101-problem-4e5f09397884427881a9af87260622ba_2_1\": [\"choice_0\"]}}',1,1),(14,15,NULL,'2015-11-18 22:10:59','{\"seed\": 1, \"input_state\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": {}}}',0,1),(15,15,NULL,'2015-11-18 22:10:59','{\"correct_map\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"msg\": \"\", \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:10:59Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": \"choice_beatles\"}}',0,1),(16,15,NULL,'2015-11-18 22:11:00','{\"correct_map\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"msg\": \"\", \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:10:59Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-T101-problem-165835688bd44d308678a93d5c09bd29_2_1\": \"choice_beatles\"}}',0,1),(17,4,NULL,'2015-11-18 22:11:44','{\"correct_map\": {}, \"seed\": 1, \"done\": null, \"input_state\": {\"i4x-IITBombayX-AND101-problem-4206f12ac0d841ab8b97a2828812cfd9_2_1\": {}}, \"student_answers\": {}}',NULL,NULL),(18,4,NULL,'2015-11-18 22:11:46','{\"correct_map\": {}, \"seed\": 1, \"done\": null, \"input_state\": {\"i4x-IITBombayX-AND101-problem-4206f12ac0d841ab8b97a2828812cfd9_2_1\": {}}, \"student_answers\": {}}',1,1),(19,4,NULL,'2015-11-18 22:11:46','{\"correct_map\": {\"i4x-IITBombayX-AND101-problem-4206f12ac0d841ab8b97a2828812cfd9_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"correct\", \"npoints\": null, \"msg\": \"\", \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-AND101-problem-4206f12ac0d841ab8b97a2828812cfd9_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:11:46Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-AND101-problem-4206f12ac0d841ab8b97a2828812cfd9_2_1\": [\"choice_0\", \"choice_2\", \"choice_3\"]}}',1,1),(20,3,NULL,'2015-11-18 22:11:53','{\"seed\": 1, \"input_state\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": {}}}',0,1),(21,3,NULL,'2015-11-18 22:11:53','{\"correct_map\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"msg\": \"\", \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:11:53Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": [\"choice_1\"]}}',0,1),(22,3,NULL,'2015-11-18 22:11:54','{\"correct_map\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"msg\": \"\", \"npoints\": null, \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:11:53Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-AND101-problem-6f718fd04a5948618bebe084adc65b24_2_1\": [\"choice_1\"]}}',0,1),(23,19,NULL,'2015-11-18 22:12:33','{}',NULL,NULL),(24,19,NULL,'2015-11-18 22:12:33','{\"seed\": 1, \"input_state\": {\"i4x-IITBombayX-AND101-problem-4646d3b129804f5aaefc16c7cabca037_2_1\": {}}}',NULL,NULL),(25,19,NULL,'2015-11-18 22:12:39','{\"correct_map\": {}, \"seed\": 1, \"done\": null, \"input_state\": {\"i4x-IITBombayX-AND101-problem-4646d3b129804f5aaefc16c7cabca037_2_1\": {}}, \"student_answers\": {}}',NULL,NULL),(26,19,NULL,'2015-11-18 22:12:40','{\"correct_map\": {}, \"seed\": 1, \"done\": null, \"input_state\": {\"i4x-IITBombayX-AND101-problem-4646d3b129804f5aaefc16c7cabca037_2_1\": {}}, \"student_answers\": {}}',0,1),(27,19,NULL,'2015-11-18 22:12:40','{\"correct_map\": {\"i4x-IITBombayX-AND101-problem-4646d3b129804f5aaefc16c7cabca037_2_1\": {\"hint\": \"\", \"hintmode\": null, \"correctness\": \"incorrect\", \"npoints\": null, \"msg\": \"\", \"queuestate\": null}}, \"input_state\": {\"i4x-IITBombayX-AND101-problem-4646d3b129804f5aaefc16c7cabca037_2_1\": {}}, \"last_submission_time\": \"2015-11-18T22:12:40Z\", \"attempts\": 1, \"seed\": 1, \"done\": true, \"student_answers\": {\"i4x-IITBombayX-AND101-problem-4646d3b129804f5aaefc16c7cabca037_2_1\": [\"choice_2\"]}}',0,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `courseware_xmodulestudentinfofield_student_id_3b624f99_uniq` (`student_id`,`field_name`),
  KEY `courseware_xmodulestudentinfofield_7e1499` (`field_name`),
  KEY `courseware_xmodulestudentinfofield_42ff452e` (`student_id`),
  KEY `courseware_xmodulestudentinfofield_3216ff68` (`created`),
  KEY `courseware_xmodulestudentinfofield_5436e97a` (`modified`),
  CONSTRAINT `student_id_refs_id_40304198` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmodulestudentinfofield`
--

LOCK TABLES `courseware_xmodulestudentinfofield` WRITE;
/*!40000 ALTER TABLE `courseware_xmodulestudentinfofield` DISABLE KEYS */;
INSERT INTO `courseware_xmodulestudentinfofield` VALUES (1,'youtube_is_available','true',3,'2015-11-04 16:19:57','2015-11-18 22:12:45');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmoduleuserstatesummaryfield`
--

LOCK TABLES `courseware_xmoduleuserstatesummaryfield` WRITE;
/*!40000 ALTER TABLE `courseware_xmoduleuserstatesummaryfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_xmoduleuserstatesummaryfield` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dark_lang_darklangconfig`
--

LOCK TABLES `dark_lang_darklangconfig` WRITE;
/*!40000 ALTER TABLE `dark_lang_darklangconfig` DISABLE KEYS */;
INSERT INTO `dark_lang_darklangconfig` VALUES (1,'2015-10-20 15:51:23',NULL,1,''),(2,'2015-10-20 17:51:32',1,1,'en,hi');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-10-20 17:51:32',1,105,'2','DarkLangConfig object',1,''),(2,'2015-10-21 16:27:31',1,3,'3','nileshSingh',2,'Changed password and is_active.'),(3,'2015-10-21 16:27:43',1,3,'2','deepaksh',2,'Changed password and is_active.'),(4,'2015-10-21 17:14:59',1,3,'2','deepaksh',2,'Changed password, is_staff and is_superuser.'),(5,'2015-10-21 17:15:10',1,3,'3','nileshSingh',2,'Changed password, is_staff and is_superuser.'),(6,'2015-10-29 12:12:36',1,3,'4','vivek008',2,'Changed password and is_active.'),(7,'2015-10-29 12:14:09',1,3,'4','vivek008',3,''),(8,'2015-10-29 12:22:17',1,3,'6','vivek008',3,''),(9,'2015-11-17 14:54:12',1,3,'2','deepaksh',3,''),(10,'2015-11-17 15:20:58',1,3,'12','vivek003',2,'Changed password and is_active.'),(11,'2015-11-17 15:21:03',1,3,'11','vivek004',2,'Changed password and is_active.'),(12,'2015-11-17 15:21:09',1,3,'9','vivek005',2,'Changed password and is_active.'),(13,'2015-11-17 15:21:18',1,3,'8','vivek006',2,'Changed password and is_active.'),(14,'2015-11-17 15:21:29',1,3,'7','vivek008',2,'Changed password and is_active.'),(15,'2015-11-17 15:21:45',1,3,'12','vivek003',2,'Changed password and is_staff.'),(16,'2015-11-17 15:21:49',1,3,'11','vivek004',2,'Changed password.'),(17,'2015-11-17 15:21:55',1,3,'9','vivek005',2,'Changed password and is_staff.'),(18,'2015-11-17 15:22:03',1,3,'11','vivek004',2,'Changed password and is_staff.'),(19,'2015-11-17 15:22:10',1,3,'8','vivek006',2,'Changed password and is_staff.'),(20,'2015-11-17 15:22:16',1,3,'7','vivek008',2,'Changed password and is_staff.');
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
INSERT INTO `django_comment_client_permission_roles` VALUES (47,'create_comment',1),(29,'create_comment',2),(30,'create_comment',3),(11,'create_comment',4),(110,'create_comment',5),(92,'create_comment',6),(93,'create_comment',7),(74,'create_comment',8),(48,'create_sub_comment',1),(24,'create_sub_comment',2),(31,'create_sub_comment',3),(6,'create_sub_comment',4),(111,'create_sub_comment',5),(87,'create_sub_comment',6),(94,'create_sub_comment',7),(69,'create_sub_comment',8),(49,'create_thread',1),(26,'create_thread',2),(32,'create_thread',3),(8,'create_thread',4),(112,'create_thread',5),(89,'create_thread',6),(95,'create_thread',7),(71,'create_thread',8),(50,'delete_comment',1),(16,'delete_comment',2),(33,'delete_comment',3),(113,'delete_comment',5),(79,'delete_comment',6),(96,'delete_comment',7),(51,'delete_thread',1),(13,'delete_thread',2),(34,'delete_thread',3),(114,'delete_thread',5),(76,'delete_thread',6),(97,'delete_thread',7),(52,'edit_content',1),(12,'edit_content',2),(35,'edit_content',3),(115,'edit_content',5),(75,'edit_content',6),(98,'edit_content',7),(53,'endorse_comment',1),(15,'endorse_comment',2),(36,'endorse_comment',3),(116,'endorse_comment',5),(78,'endorse_comment',6),(99,'endorse_comment',7),(54,'follow_commentable',1),(27,'follow_commentable',2),(37,'follow_commentable',3),(9,'follow_commentable',4),(117,'follow_commentable',5),(90,'follow_commentable',6),(100,'follow_commentable',7),(72,'follow_commentable',8),(55,'follow_thread',1),(21,'follow_thread',2),(38,'follow_thread',3),(3,'follow_thread',4),(118,'follow_thread',5),(84,'follow_thread',6),(101,'follow_thread',7),(66,'follow_thread',8),(18,'manage_moderator',1),(81,'manage_moderator',5),(56,'openclose_thread',1),(14,'openclose_thread',2),(39,'openclose_thread',3),(119,'openclose_thread',5),(77,'openclose_thread',6),(102,'openclose_thread',7),(57,'see_all_cohorts',1),(17,'see_all_cohorts',2),(40,'see_all_cohorts',3),(120,'see_all_cohorts',5),(80,'see_all_cohorts',6),(103,'see_all_cohorts',7),(58,'unfollow_commentable',1),(28,'unfollow_commentable',2),(41,'unfollow_commentable',3),(10,'unfollow_commentable',4),(121,'unfollow_commentable',5),(91,'unfollow_commentable',6),(104,'unfollow_commentable',7),(73,'unfollow_commentable',8),(59,'unfollow_thread',1),(22,'unfollow_thread',2),(42,'unfollow_thread',3),(4,'unfollow_thread',4),(122,'unfollow_thread',5),(85,'unfollow_thread',6),(105,'unfollow_thread',7),(67,'unfollow_thread',8),(60,'unvote',1),(25,'unvote',2),(43,'unvote',3),(7,'unvote',4),(123,'unvote',5),(88,'unvote',6),(106,'unvote',7),(70,'unvote',8),(61,'update_comment',1),(23,'update_comment',2),(44,'update_comment',3),(5,'update_comment',4),(124,'update_comment',5),(86,'update_comment',6),(107,'update_comment',7),(68,'update_comment',8),(62,'update_thread',1),(20,'update_thread',2),(45,'update_thread',3),(2,'update_thread',4),(125,'update_thread',5),(83,'update_thread',6),(108,'update_thread',7),(65,'update_thread',8),(63,'vote',1),(19,'vote',2),(46,'vote',3),(1,'vote',4),(126,'vote',5),(82,'vote',6),(109,'vote',7),(64,'vote',8);
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
INSERT INTO `django_comment_client_role` VALUES (1,'Administrator','IITBombayX/AND101/2015_A1'),(2,'Moderator','IITBombayX/AND101/2015_A1'),(3,'Community TA','IITBombayX/AND101/2015_A1'),(4,'Student','IITBombayX/AND101/2015_A1'),(5,'Administrator','IITBombayX/T101/2015_TS1'),(6,'Moderator','IITBombayX/T101/2015_TS1'),(7,'Community TA','IITBombayX/T101/2015_TS1'),(8,'Student','IITBombayX/T101/2015_TS1');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_role_users`
--

LOCK TABLES `django_comment_client_role_users` WRITE;
/*!40000 ALTER TABLE `django_comment_client_role_users` DISABLE KEYS */;
INSERT INTO `django_comment_client_role_users` VALUES (1,4,3),(2,8,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'task state','djcelery','taskmeta'),(8,'saved group result','djcelery','tasksetmeta'),(9,'interval','djcelery','intervalschedule'),(10,'crontab','djcelery','crontabschedule'),(11,'periodic tasks','djcelery','periodictasks'),(12,'periodic task','djcelery','periodictask'),(13,'worker','djcelery','workerstate'),(14,'task','djcelery','taskstate'),(15,'migration history','south','migrationhistory'),(16,'server circuit','circuit','servercircuit'),(17,'psychometric data','psychometrics','psychometricdata'),(18,'nonce','django_openid_auth','nonce'),(19,'association','django_openid_auth','association'),(20,'user open id','django_openid_auth','useropenid'),(21,'log entry','admin','logentry'),(22,'organization','courseware','organization'),(23,'subject','courseware','subject'),(24,'course_subject','courseware','course_subject'),(25,'student module','courseware','studentmodule'),(26,'student module history','courseware','studentmodulehistory'),(27,'x module user state summary field','courseware','xmoduleuserstatesummaryfield'),(28,'x module student prefs field','courseware','xmodulestudentprefsfield'),(29,'x module student info field','courseware','xmodulestudentinfofield'),(30,'offline computed grade','courseware','offlinecomputedgrade'),(31,'offline computed grade log','courseware','offlinecomputedgradelog'),(32,'anonymous user id','student','anonymoususerid'),(33,'user standing','student','userstanding'),(34,'user profile','student','userprofile'),(35,'user signup source','student','usersignupsource'),(36,'user test group','student','usertestgroup'),(37,'registration','student','registration'),(38,'pending name change','student','pendingnamechange'),(39,'pending email change','student','pendingemailchange'),(40,'password history','student','passwordhistory'),(41,'login failures','student','loginfailures'),(42,'course enrollment','student','courseenrollment'),(43,'course enrollment allowed','student','courseenrollmentallowed'),(44,'course access role','student','courseaccessrole'),(45,'dashboard configuration','student','dashboardconfiguration'),(46,'mooc_state','student','mooc_state'),(47,'mooc_city','student','mooc_city'),(48,'mooc_person','student','mooc_person'),(49,'tracking log','track','trackinglog'),(50,'certificate whitelist','certificates','certificatewhitelist'),(51,'generated certificate','certificates','generatedcertificate'),(52,'instructor task','instructor_task','instructortask'),(53,'course software','licenses','coursesoftware'),(54,'user license','licenses','userlicense'),(55,'course user group','course_groups','courseusergroup'),(56,'course user group partition group','course_groups','courseusergrouppartitiongroup'),(57,'course email','bulk_email','courseemail'),(58,'optout','bulk_email','optout'),(59,'course email template','bulk_email','courseemailtemplate'),(60,'course authorization','bulk_email','courseauthorization'),(61,'external auth map','external_auth','externalauthmap'),(62,'client','oauth2','client'),(63,'grant','oauth2','grant'),(64,'access token','oauth2','accesstoken'),(65,'refresh token','oauth2','refreshtoken'),(66,'trusted client','oauth2_provider','trustedclient'),(67,'article','wiki','article'),(68,'Article for object','wiki','articleforobject'),(69,'article revision','wiki','articlerevision'),(70,'URL path','wiki','urlpath'),(71,'article plugin','wiki','articleplugin'),(72,'reusable plugin','wiki','reusableplugin'),(73,'simple plugin','wiki','simpleplugin'),(74,'revision plugin','wiki','revisionplugin'),(75,'revision plugin revision','wiki','revisionpluginrevision'),(76,'article subscription','wiki','articlesubscription'),(77,'type','django_notify','notificationtype'),(78,'settings','django_notify','settings'),(79,'subscription','django_notify','subscription'),(80,'notification','django_notify','notification'),(81,'score','foldit','score'),(82,'puzzle complete','foldit','puzzlecomplete'),(83,'note','notes','note'),(84,'splash config','splash','splashconfig'),(85,'user preference','user_api','userpreference'),(86,'user course tag','user_api','usercoursetag'),(87,'user org tag','user_api','userorgtag'),(88,'order','shoppingcart','order'),(89,'order item','shoppingcart','orderitem'),(90,'invoice','shoppingcart','invoice'),(91,'course registration code','shoppingcart','courseregistrationcode'),(92,'registration code redemption','shoppingcart','registrationcoderedemption'),(93,'coupon','shoppingcart','coupon'),(94,'coupon redemption','shoppingcart','couponredemption'),(95,'paid course registration','shoppingcart','paidcourseregistration'),(96,'course reg code item','shoppingcart','courseregcodeitem'),(97,'course reg code item annotation','shoppingcart','courseregcodeitemannotation'),(98,'paid course registration annotation','shoppingcart','paidcourseregistrationannotation'),(99,'certificate item','shoppingcart','certificateitem'),(100,'donation configuration','shoppingcart','donationconfiguration'),(101,'donation','shoppingcart','donation'),(102,'course mode','course_modes','coursemode'),(103,'course modes archive','course_modes','coursemodesarchive'),(104,'software secure photo verification','verify_student','softwaresecurephotoverification'),(105,'dark lang config','dark_lang','darklangconfig'),(106,'midcourse reverification window','reverification','midcoursereverificationwindow'),(107,'embargoed course','embargo','embargoedcourse'),(108,'embargoed state','embargo','embargoedstate'),(109,'ip filter','embargo','ipfilter'),(110,'course rerun state','course_action_state','coursererunstate'),(111,'survey form','survey','surveyform'),(112,'survey answer','survey','surveyanswer'),(113,'x block asides config','lms_xblock','xblockasidesconfig'),(114,'linked in','linkedin','linkedin'),(115,'student item','submissions','studentitem'),(116,'submission','submissions','submission'),(117,'score','submissions','score'),(118,'score summary','submissions','scoresummary'),(119,'rubric','assessment','rubric'),(120,'criterion','assessment','criterion'),(121,'criterion option','assessment','criterionoption'),(122,'assessment','assessment','assessment'),(123,'assessment part','assessment','assessmentpart'),(124,'assessment feedback option','assessment','assessmentfeedbackoption'),(125,'assessment feedback','assessment','assessmentfeedback'),(126,'peer workflow','assessment','peerworkflow'),(127,'peer workflow item','assessment','peerworkflowitem'),(128,'training example','assessment','trainingexample'),(129,'student training workflow','assessment','studenttrainingworkflow'),(130,'student training workflow item','assessment','studenttrainingworkflowitem'),(131,'ai classifier set','assessment','aiclassifierset'),(132,'ai classifier','assessment','aiclassifier'),(133,'ai training workflow','assessment','aitrainingworkflow'),(134,'ai grading workflow','assessment','aigradingworkflow'),(135,'assessment workflow','workflow','assessmentworkflow'),(136,'assessment workflow step','workflow','assessmentworkflowstep'),(137,'profile','edxval','profile'),(138,'video','edxval','video'),(139,'course video','edxval','coursevideo'),(140,'encoded video','edxval','encodedvideo'),(141,'subtitle','edxval','subtitle'),(142,'course creator','course_creators','coursecreator');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `extension` varchar(10) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_task_instructortask`
--

LOCK TABLES `instructor_task_instructortask` WRITE;
/*!40000 ALTER TABLE `instructor_task_instructortask` DISABLE KEYS */;
INSERT INTO `instructor_task_instructortask` VALUES (1,'profile_info_csv','IITBombayX/T101/2015_TS1','','{\"features\": [\"id\", \"username\", \"name\", \"email\", \"language\", \"location\", \"year_of_birth\", \"gender\", \"level_of_education\", \"mailing_address\", \"goals\"]}','ced1efc2-88f5-4d85-a40a-8341f34dd48c','SUCCESS','{\"skipped\": 0, \"succeeded\": 1, \"attempted\": 1, \"action_name\": \"generated\", \"failed\": 0, \"step\": \"Uploading CSV\", \"duration_ms\": 10, \"total\": 1}',3,'2015-11-18 18:50:58','2015-11-18 18:50:58',''),(2,'grade_course','IITBombayX/T101/2015_TS1','','{}','79b320ae-4572-4989-b423-708ad0409735','SUCCESS','{\"skipped\": 0, \"succeeded\": 1, \"attempted\": 1, \"action_name\": \"graded\", \"failed\": 0, \"step\": \"Uploading CSVs\", \"duration_ms\": 240, \"total\": 1}',3,'2015-11-18 18:51:22','2015-11-18 18:51:23',''),(3,'grade_course','IITBombayX/T101/2015_TS1','','{}','b3f92f56-d9d3-47c6-aad6-e1bebb7f4368','SUCCESS','{\"skipped\": 0, \"succeeded\": 1, \"attempted\": 1, \"action_name\": \"graded\", \"failed\": 0, \"step\": \"Uploading CSVs\", \"duration_ms\": 242, \"total\": 1}',3,'2015-11-18 18:52:06','2015-11-18 18:52:06',''),(4,'profile_info_csv','IITBombayX/AND101/2015_A1','','{\"features\": [\"id\", \"username\", \"name\", \"email\", \"language\", \"location\", \"year_of_birth\", \"gender\", \"level_of_education\", \"mailing_address\", \"goals\"]}','9f110e24-5ffa-4b03-98b0-2d3ac1556414','SUCCESS','{\"skipped\": 0, \"succeeded\": 1, \"attempted\": 1, \"action_name\": \"generated\", \"failed\": 0, \"step\": \"Uploading CSV\", \"duration_ms\": 5, \"total\": 1}',3,'2015-11-18 22:13:14','2015-11-18 22:13:15',''),(5,'grade_course','IITBombayX/AND101/2015_A1','','{}','050d6b06-7509-435f-bbe2-1c7708c6e7f9','SUCCESS','{\"skipped\": 0, \"succeeded\": 1, \"attempted\": 1, \"action_name\": \"graded\", \"failed\": 0, \"step\": \"Uploading CSVs\", \"duration_ms\": 94, \"total\": 1}',3,'2015-11-18 22:13:50','2015-11-18 22:13:50','');
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
-- Table structure for table `linkedin_linkedin`
--

DROP TABLE IF EXISTS `linkedin_linkedin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linkedin_linkedin` (
  `user_id` int(11) NOT NULL,
  `has_linkedin_account` tinyint(1) DEFAULT NULL,
  `emailed_courses` longtext NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_id_refs_id_72e31bb2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linkedin_linkedin`
--

LOCK TABLES `linkedin_linkedin` WRITE;
/*!40000 ALTER TABLE `linkedin_linkedin` DISABLE KEYS */;
/*!40000 ALTER TABLE `linkedin_linkedin` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `reverification_midcoursereverificationwindow_b7271b` (`course_id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `shoppingcart_courseregistrationcode_code_3519de67_uniq` (`code`),
  KEY `shoppingcart_courseregistrationcode_65da3d2c` (`code`),
  KEY `shoppingcart_courseregistrationcode_b7271b` (`course_id`),
  KEY `shoppingcart_courseregistrationcode_4a21cf42` (`created_by_id`),
  KEY `shoppingcart_courseregistrationcode_59f72b12` (`invoice_id`),
  KEY `shoppingcart_courseregistrationcode_7cc8fcf5` (`order_id`),
  CONSTRAINT `created_by_id_refs_id_38397037` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `invoice_id_refs_id_66a0f518` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`),
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
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_paidcourseregistration_b7271b` (`course_id`),
  KEY `shoppingcart_paidcourseregistration_4160619e` (`mode`),
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
  PRIMARY KEY (`id`),
  KEY `shoppingcart_registrationcoderedemption_7cc8fcf5` (`order_id`),
  KEY `shoppingcart_registrationcoderedemption_2da4c824` (`registration_code_id`),
  KEY `shoppingcart_registrationcoderedemption_1eaeb986` (`redeemed_by_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'courseware','0001_initial','2015-10-20 15:47:00'),(2,'courseware','0002_add_indexes','2015-10-20 15:47:01'),(3,'courseware','0003_done_grade_cache','2015-10-20 15:47:03'),(4,'courseware','0004_add_field_studentmodule_course_id','2015-10-20 15:47:05'),(5,'courseware','0005_auto__add_offlinecomputedgrade__add_unique_offlinecomputedgrade_user_c','2015-10-20 15:47:07'),(6,'courseware','0006_create_student_module_history','2015-10-20 15:47:09'),(7,'courseware','0007_allow_null_version_in_history','2015-10-20 15:47:10'),(8,'courseware','0008_add_xmodule_storage','2015-10-20 15:47:16'),(9,'courseware','0009_add_field_default','2015-10-20 15:47:19'),(10,'courseware','0010_rename_xblock_field_content_to_user_state_summary','2015-10-20 15:47:20'),(11,'courseware','0011_auto__add_subject__add_course_subject__add_organization__chg_field_off','2015-10-20 15:47:21'),(12,'student','0001_initial','2015-10-20 15:47:23'),(13,'student','0002_text_to_varchar_and_indexes','2015-10-20 15:47:28'),(14,'student','0003_auto__add_usertestgroup','2015-10-20 15:47:30'),(15,'student','0004_add_email_index','2015-10-20 15:47:30'),(16,'student','0005_name_change','2015-10-20 15:47:32'),(17,'student','0006_expand_meta_field','2015-10-20 15:47:33'),(18,'student','0007_convert_to_utf8','2015-10-20 15:47:35'),(19,'student','0008__auto__add_courseregistration','2015-10-20 15:47:35'),(20,'student','0009_auto__del_courseregistration__add_courseenrollment','2015-10-20 15:47:36'),(21,'student','0010_auto__chg_field_courseenrollment_course_id','2015-10-20 15:47:37'),(22,'student','0011_auto__chg_field_courseenrollment_user__del_unique_courseenrollment_use','2015-10-20 15:47:37'),(23,'student','0012_auto__add_field_userprofile_gender__add_field_userprofile_date_of_birt','2015-10-20 15:47:41'),(24,'student','0013_auto__chg_field_userprofile_meta','2015-10-20 15:47:41'),(25,'student','0014_auto__del_courseenrollment','2015-10-20 15:47:41'),(26,'student','0015_auto__add_courseenrollment__add_unique_courseenrollment_user_course_id','2015-10-20 15:47:43'),(27,'student','0016_auto__add_field_courseenrollment_date__chg_field_userprofile_country','2015-10-20 15:47:44'),(28,'student','0017_rename_date_to_created','2015-10-20 15:47:44'),(29,'student','0018_auto','2015-10-20 15:47:45'),(30,'student','0019_create_approved_demographic_fields_fall_2012','2015-10-20 15:47:50'),(31,'student','0020_add_test_center_user','2015-10-20 15:47:54'),(32,'student','0021_remove_askbot','2015-10-20 15:47:54'),(33,'student','0022_auto__add_courseenrollmentallowed__add_unique_courseenrollmentallowed_','2015-10-20 15:47:56'),(34,'student','0023_add_test_center_registration','2015-10-20 15:48:07'),(35,'student','0024_add_allow_certificate','2015-10-20 15:48:08'),(36,'student','0025_auto__add_field_courseenrollmentallowed_auto_enroll','2015-10-20 15:48:09'),(37,'student','0026_auto__remove_index_student_testcenterregistration_accommodation_request','2015-10-20 15:48:09'),(38,'student','0027_add_active_flag_and_mode_to_courseware_enrollment','2015-10-20 15:48:11'),(39,'student','0028_auto__add_userstanding','2015-10-20 15:48:12'),(40,'student','0029_add_lookup_table_between_user_and_anonymous_student_id','2015-10-20 15:48:13'),(41,'student','0029_remove_pearson','2015-10-20 15:48:13'),(42,'student','0030_auto__chg_field_anonymoususerid_anonymous_user_id','2015-10-20 15:48:14'),(43,'student','0031_drop_student_anonymoususerid_temp_archive','2015-10-20 15:48:14'),(44,'student','0032_add_field_UserProfile_country_add_field_UserProfile_city','2015-10-20 15:48:16'),(45,'student','0032_auto__add_loginfailures','2015-10-20 15:48:17'),(46,'student','0033_auto__add_passwordhistory','2015-10-20 15:48:18'),(47,'student','0034_auto__add_courseaccessrole','2015-10-20 15:48:20'),(48,'student','0035_access_roles','2015-10-20 15:48:20'),(49,'student','0036_access_roles_orgless','2015-10-20 15:48:20'),(50,'student','0037_auto__add_courseregistrationcode','2015-10-20 15:48:23'),(51,'student','0038_auto__add_usersignupsource','2015-10-20 15:48:24'),(52,'student','0039_auto__del_courseregistrationcode','2015-10-20 15:48:24'),(53,'student','0040_auto__del_field_usersignupsource_user_id__add_field_usersignupsource_u','2015-10-20 15:48:26'),(54,'student','0041_add_dashboard_config','2015-10-20 15:48:27'),(55,'student','0042_auto__add_mooc_city__add_mooc_state__add_mooc_person','2015-10-20 15:48:29'),(56,'track','0001_initial','2015-10-20 15:48:31'),(57,'track','0002_auto__add_field_trackinglog_host__chg_field_trackinglog_event_type__ch','2015-10-20 15:48:33'),(58,'certificates','0001_added_generatedcertificates','2015-10-20 15:48:34'),(59,'certificates','0002_auto__add_field_generatedcertificate_download_url','2015-10-20 15:48:35'),(60,'certificates','0003_auto__add_field_generatedcertificate_enabled','2015-10-20 15:48:36'),(61,'certificates','0004_auto__add_field_generatedcertificate_graded_certificate_id__add_field_','2015-10-20 15:48:37'),(62,'certificates','0005_auto__add_field_generatedcertificate_name','2015-10-20 15:48:38'),(63,'certificates','0006_auto__chg_field_generatedcertificate_certificate_id','2015-10-20 15:48:39'),(64,'certificates','0007_auto__add_revokedcertificate','2015-10-20 15:48:40'),(65,'certificates','0008_auto__del_revokedcertificate__del_field_generatedcertificate_name__add','2015-10-20 15:48:45'),(66,'certificates','0009_auto__del_field_generatedcertificate_graded_download_url__del_field_ge','2015-10-20 15:48:47'),(67,'certificates','0010_auto__del_field_generatedcertificate_enabled__add_field_generatedcerti','2015-10-20 15:48:48'),(68,'certificates','0011_auto__del_field_generatedcertificate_certificate_id__add_field_generat','2015-10-20 15:48:50'),(69,'certificates','0012_auto__add_field_generatedcertificate_name__add_field_generatedcertific','2015-10-20 15:48:52'),(70,'certificates','0013_auto__add_field_generatedcertificate_error_reason','2015-10-20 15:48:53'),(71,'certificates','0014_adding_whitelist','2015-10-20 15:48:54'),(72,'certificates','0015_adding_mode_for_verified_certs','2015-10-20 15:48:55'),(73,'instructor_task','0001_initial','2015-10-20 15:48:57'),(74,'instructor_task','0002_add_subtask_field','2015-10-20 15:48:58'),(75,'licenses','0001_initial','2015-10-20 15:49:00'),(76,'course_groups','0001_initial','2015-10-20 15:49:03'),(77,'course_groups','0002_add_model_CourseUserGroupPartitionGroup','2015-10-20 15:49:03'),(78,'bulk_email','0001_initial','2015-10-20 15:49:06'),(79,'bulk_email','0002_change_field_names','2015-10-20 15:49:07'),(80,'bulk_email','0003_add_optout_user','2015-10-20 15:49:09'),(81,'bulk_email','0004_migrate_optout_user','2015-10-20 15:49:09'),(82,'bulk_email','0005_remove_optout_email','2015-10-20 15:49:09'),(83,'bulk_email','0006_add_course_email_template','2015-10-20 15:49:10'),(84,'bulk_email','0007_load_course_email_template','2015-10-20 15:49:10'),(85,'bulk_email','0008_add_course_authorizations','2015-10-20 15:49:10'),(86,'bulk_email','0009_force_unique_course_ids','2015-10-20 15:49:11'),(87,'bulk_email','0010_auto__chg_field_optout_course_id__add_field_courseemail_template_name_','2015-10-20 15:49:13'),(88,'external_auth','0001_initial','2015-10-20 15:49:15'),(89,'oauth2','0001_initial','2015-10-20 15:49:21'),(90,'oauth2','0002_auto__chg_field_client_user','2015-10-20 15:49:22'),(91,'oauth2','0003_auto__add_field_client_name','2015-10-20 15:49:22'),(92,'oauth2','0004_auto__add_index_accesstoken_token','2015-10-20 15:49:22'),(93,'oauth2_provider','0001_initial','2015-10-20 15:49:24'),(94,'wiki','0001_initial','2015-10-20 15:49:36'),(95,'wiki','0002_auto__add_field_articleplugin_created','2015-10-20 15:49:37'),(96,'wiki','0003_auto__add_field_urlpath_article','2015-10-20 15:49:38'),(97,'wiki','0004_populate_urlpath__article','2015-10-20 15:49:38'),(98,'wiki','0005_auto__chg_field_urlpath_article','2015-10-20 15:49:40'),(99,'wiki','0006_auto__add_attachmentrevision__add_image__add_attachment','2015-10-20 15:49:42'),(100,'wiki','0007_auto__add_articlesubscription','2015-10-20 15:49:43'),(101,'wiki','0008_auto__add_simpleplugin__add_revisionpluginrevision__add_imagerevision_','2015-10-20 15:49:49'),(102,'wiki','0009_auto__add_field_imagerevision_width__add_field_imagerevision_height','2015-10-20 15:49:50'),(103,'wiki','0010_auto__chg_field_imagerevision_image','2015-10-20 15:49:51'),(104,'wiki','0011_auto__chg_field_imagerevision_width__chg_field_imagerevision_height','2015-10-20 15:49:52'),(105,'django_notify','0001_initial','2015-10-20 15:49:56'),(106,'notifications','0001_initial','2015-10-20 15:49:57'),(107,'foldit','0001_initial','2015-10-20 15:50:01'),(108,'django_comment_client','0001_initial','2015-10-20 15:50:05'),(109,'django_comment_common','0001_initial','2015-10-20 15:50:05'),(110,'notes','0001_initial','2015-10-20 15:50:08'),(111,'splash','0001_initial','2015-10-20 15:50:09'),(112,'splash','0002_auto__add_field_splashconfig_unaffected_url_paths','2015-10-20 15:50:09'),(113,'user_api','0001_initial','2015-10-20 15:50:11'),(114,'user_api','0002_auto__add_usercoursetags__add_unique_usercoursetags_user_course_id_key','2015-10-20 15:50:12'),(115,'user_api','0003_rename_usercoursetags','2015-10-20 15:50:12'),(116,'user_api','0004_auto__add_userorgtag__add_unique_userorgtag_user_org_key__chg_field_us','2015-10-20 15:50:14'),(117,'shoppingcart','0001_initial','2015-10-20 15:50:19'),(118,'shoppingcart','0002_auto__add_field_paidcourseregistration_mode','2015-10-20 15:50:20'),(119,'shoppingcart','0003_auto__del_field_orderitem_line_cost','2015-10-20 15:50:20'),(120,'shoppingcart','0004_auto__add_field_orderitem_fulfilled_time','2015-10-20 15:50:21'),(121,'shoppingcart','0005_auto__add_paidcourseregistrationannotation__add_field_orderitem_report','2015-10-20 15:50:22'),(122,'shoppingcart','0006_auto__add_field_order_refunded_time__add_field_orderitem_refund_reques','2015-10-20 15:50:23'),(123,'shoppingcart','0007_auto__add_field_orderitem_service_fee','2015-10-20 15:50:25'),(124,'shoppingcart','0008_auto__add_coupons__add_couponredemption__chg_field_certificateitem_cou','2015-10-20 15:50:29'),(125,'shoppingcart','0009_auto__del_coupons__add_courseregistrationcode__add_coupon__chg_field_c','2015-10-20 15:50:34'),(126,'shoppingcart','0010_auto__add_registrationcoderedemption__del_field_courseregistrationcode','2015-10-20 15:50:38'),(127,'shoppingcart','0011_auto__add_invoice__add_field_courseregistrationcode_invoice','2015-10-20 15:50:40'),(128,'shoppingcart','0012_auto__del_field_courseregistrationcode_transaction_group_name__del_fie','2015-10-20 15:50:47'),(129,'shoppingcart','0013_auto__add_field_invoice_is_valid','2015-10-20 15:50:47'),(130,'shoppingcart','0014_auto__del_field_invoice_tax_id__add_field_invoice_address_line_1__add_','2015-10-20 15:50:53'),(131,'shoppingcart','0015_auto__del_field_invoice_purchase_order_number__del_field_invoice_compa','2015-10-20 15:50:58'),(132,'shoppingcart','0016_auto__del_field_invoice_company_email__del_field_invoice_company_refer','2015-10-20 15:51:00'),(133,'shoppingcart','0017_auto__add_field_courseregistrationcode_order__chg_field_registrationco','2015-10-20 15:51:02'),(134,'shoppingcart','0018_auto__add_donation','2015-10-20 15:51:03'),(135,'shoppingcart','0019_auto__add_donationconfiguration','2015-10-20 15:51:04'),(136,'shoppingcart','0020_auto__add_courseregcodeitem__add_courseregcodeitemannotation__add_fiel','2015-10-20 15:51:10'),(137,'shoppingcart','0021_auto__add_field_orderitem_created__add_field_orderitem_modified','2015-10-20 15:51:11'),(138,'course_modes','0001_initial','2015-10-20 15:51:13'),(139,'course_modes','0002_auto__add_field_coursemode_currency','2015-10-20 15:51:14'),(140,'course_modes','0003_auto__add_unique_coursemode_course_id_currency_mode_slug','2015-10-20 15:51:14'),(141,'course_modes','0004_auto__add_field_coursemode_expiration_date','2015-10-20 15:51:14'),(142,'course_modes','0005_auto__add_field_coursemode_expiration_datetime','2015-10-20 15:51:15'),(143,'course_modes','0006_expiration_date_to_datetime','2015-10-20 15:51:15'),(144,'course_modes','0007_add_description','2015-10-20 15:51:16'),(145,'course_modes','0007_auto__add_coursemodesarchive__chg_field_coursemode_course_id','2015-10-20 15:51:17'),(146,'verify_student','0001_initial','2015-10-20 15:51:19'),(147,'verify_student','0002_auto__add_field_softwaresecurephotoverification_window','2015-10-20 15:51:21'),(148,'verify_student','0003_auto__add_field_softwaresecurephotoverification_display','2015-10-20 15:51:22'),(149,'dark_lang','0001_initial','2015-10-20 15:51:23'),(150,'dark_lang','0002_enable_on_install','2015-10-20 15:51:23'),(151,'reverification','0001_initial','2015-10-20 15:51:24'),(152,'embargo','0001_initial','2015-10-20 15:51:27'),(153,'course_action_state','0001_initial','2015-10-20 15:51:30'),(154,'course_action_state','0002_add_rerun_display_name','2015-10-20 15:51:31'),(155,'survey','0001_initial','2015-10-20 15:51:33'),(156,'lms_xblock','0001_initial','2015-10-20 15:51:34'),(157,'linkedin','0001_initial','2015-10-20 15:51:35'),(158,'submissions','0001_initial','2015-10-20 15:51:40'),(159,'submissions','0002_auto__add_scoresummary','2015-10-20 15:51:42'),(160,'submissions','0003_auto__del_field_submission_answer__add_field_submission_raw_answer','2015-10-20 15:51:43'),(161,'submissions','0004_auto__add_field_score_reset','2015-10-20 15:51:44'),(162,'assessment','0001_initial','2015-10-20 15:51:56'),(163,'assessment','0002_auto__add_assessmentfeedbackoption__del_field_assessmentfeedback_feedb','2015-10-20 15:51:59'),(164,'assessment','0003_add_index_pw_course_item_student','2015-10-20 15:51:59'),(165,'assessment','0004_auto__add_field_peerworkflow_graded_count','2015-10-20 15:52:01'),(166,'assessment','0005_auto__del_field_peerworkflow_graded_count__add_field_peerworkflow_grad','2015-10-20 15:52:03'),(167,'assessment','0006_auto__add_field_assessmentpart_feedback','2015-10-20 15:52:03'),(168,'assessment','0007_auto__chg_field_assessmentpart_feedback','2015-10-20 15:52:03'),(169,'assessment','0008_student_training','2015-10-20 15:52:09'),(170,'assessment','0009_auto__add_unique_studenttrainingworkflowitem_order_num_workflow','2015-10-20 15:52:09'),(171,'assessment','0010_auto__add_unique_studenttrainingworkflow_submission_uuid','2015-10-20 15:52:09'),(172,'assessment','0011_ai_training','2015-10-20 15:52:16'),(173,'assessment','0012_move_algorithm_id_to_classifier_set','2015-10-20 15:52:21'),(174,'assessment','0013_auto__add_field_aigradingworkflow_essay_text','2015-10-20 15:52:22'),(175,'assessment','0014_auto__add_field_aitrainingworkflow_item_id__add_field_aitrainingworkfl','2015-10-20 15:52:24'),(176,'assessment','0015_auto__add_unique_aitrainingworkflow_uuid__add_unique_aigradingworkflow','2015-10-20 15:52:25'),(177,'assessment','0016_auto__add_field_aiclassifierset_course_id__add_field_aiclassifierset_i','2015-10-20 15:52:27'),(178,'assessment','0016_auto__add_field_rubric_structure_hash','2015-10-20 15:52:28'),(179,'assessment','0017_rubric_structure_hash','2015-10-20 15:52:28'),(180,'assessment','0018_auto__add_field_assessmentpart_criterion','2015-10-20 15:52:29'),(181,'assessment','0019_assessmentpart_criterion_field','2015-10-20 15:52:29'),(182,'assessment','0020_assessmentpart_criterion_not_null','2015-10-20 15:52:30'),(183,'assessment','0021_assessmentpart_option_nullable','2015-10-20 15:52:31'),(184,'assessment','0022__add_label_fields','2015-10-20 15:52:32'),(185,'assessment','0023_assign_criteria_and_option_labels','2015-10-20 15:52:32'),(186,'workflow','0001_initial','2015-10-20 15:52:34'),(187,'workflow','0002_auto__add_field_assessmentworkflow_course_id__add_field_assessmentwork','2015-10-20 15:52:36'),(188,'workflow','0003_auto__add_assessmentworkflowstep','2015-10-20 15:52:37'),(189,'edxval','0001_initial','2015-10-20 15:52:43'),(190,'edxval','0002_default_profiles','2015-10-20 15:52:43'),(191,'edxval','0003_status_and_created_fields','2015-10-20 15:52:46'),(192,'course_creators','0001_initial','2015-10-20 15:54:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_anonymoususerid`
--

LOCK TABLES `student_anonymoususerid` WRITE;
/*!40000 ALTER TABLE `student_anonymoususerid` DISABLE KEYS */;
INSERT INTO `student_anonymoususerid` VALUES (1,3,'eccbc87e4b5ce2fe28308fd9f2a7baf3',''),(2,3,'34ed89d9ea0bc4d6222b5a3d25bd0a82','IITBombayX/T101/2015_TS1'),(3,3,'e50bc8f8c88971d72f668ae220cb66e1','IITBombayX/AND101/2015_A1');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseaccessrole`
--

LOCK TABLES `student_courseaccessrole` WRITE;
/*!40000 ALTER TABLE `student_courseaccessrole` DISABLE KEYS */;
INSERT INTO `student_courseaccessrole` VALUES (1,3,'IITBombayX','IITBombayX/AND101/2015_A1','instructor'),(2,3,'IITBombayX','IITBombayX/AND101/2015_A1','staff'),(3,3,'IITBombayX','IITBombayX/T101/2015_TS1','instructor'),(4,3,'IITBombayX','IITBombayX/T101/2015_TS1','staff');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollment`
--

LOCK TABLES `student_courseenrollment` WRITE;
/*!40000 ALTER TABLE `student_courseenrollment` DISABLE KEYS */;
INSERT INTO `student_courseenrollment` VALUES (1,3,'IITBombayX/AND101/2015_A1','2015-11-04 16:01:37',1,'honor'),(2,3,'IITBombayX/T101/2015_TS1','2015-11-04 18:36:49',1,'honor');
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
  KEY `student_mooc_city_469f723e` (`state_id`),
  CONSTRAINT `state_id_refs_id_75554b70` FOREIGN KEY (`state_id`) REFERENCES `student_mooc_state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_mooc_city`
--

LOCK TABLES `student_mooc_city` WRITE;
/*!40000 ALTER TABLE `student_mooc_city` DISABLE KEYS */;
INSERT INTO `student_mooc_city` VALUES (1,'CarNicobar',1),(2,'Pahalgaon',1),(3,'PortBlair',1),(4,'Adilabad',36),(5,'Amalapuram',2),(6,'Anantapur',2),(7,'East Godavari',2),(8,'Bhimavaram',2),(9,'Bollaram',36),(10,'Chittoor',2),(11,'Cuddapah',2),(12,'Dibrugarh',2),(13,'EastGodavari',2),(14,'Eluru',2),(15,'Gollanguda',2),(16,'Gudlavalleru',2),(17,'Guntur',2),(18,'Hindupur',2),(19,'Hyderabad',36),(20,'Kakinada',2),(21,'Kandukur',2),(22,'KarimNagar',36),(23,'Kavali',2),(24,'Khammam',36),(25,'Kothagudem',36),(26,'Krishna',2),(27,'Kurnool',2),(28,'Machilipatnam',2),(29,'MahabubNagar',36),(30,'Mandal',2),(31,'Mandanapalle',2),(32,'Markapur',2),(33,'Medak',36),(34,'MedchalMandal',36),(35,'Miryalguda',36),(36,'Miyapur',36),(37,'Moinabad',36),(38,'Muthangi',36),(39,'Nalgonda',36),(40,'Narsapur',2),(41,'Nellore',2),(42,'Nizamabad',36),(43,'Nuzvid',2),(44,'Ongole',2),(45,'Palwancha',2),(46,'Parvathipuram',2),(47,'Peddapuram',2),(48,'Perambalur',2),(49,'Prakasam',2),(50,'Pregnapur',36),(51,'Rajam',2),(52,'Rajampet',2),(53,'Rajahmundry',2),(54,'Ramagundam',36),(55,'Ranga Reddy',36),(56,'Secunderabad',36),(57,'Srikakulam',2),(58,'SriKalahasti',2),(59,'Suryapet',36),(60,'Tadapalli',2),(61,'Tadepallgudem',2),(62,'Tanuku',2),(63,'Tirupati',2),(64,'Vijayawada',2),(65,'Vikrabad',36),(66,'Visakhapatnam',2),(67,'Vizianagaram',2),(68,'Warangal',36),(69,'WestGodavari',2),(70,'Changlang',3),(71,'DibangValley',3),(72,'Itanagar',3),(73,'KurungKumey',3),(74,'Lilabari',3),(75,'Lohit',3),(76,'Papumpare',3),(77,'Pasighat',3),(78,'Tawang',3),(79,'Tezu',3),(80,'Tirap',3),(81,'Barpeta',4),(82,'Bongaigaon',4),(83,'Cachar',4),(84,'Darrang',4),(85,'Dhemaji',4),(86,'Dhubri',4),(87,'Dibrugarh',4),(88,'Golaghat',4),(89,'Golapara',4),(90,'Guwahati',4),(91,'Hailakandi',4),(92,'Jorhat',4),(93,'Kamrup',4),(94,'KarbiAnglong',4),(95,'Karimganj',4),(96,'Kokrajhar',4),(97,'Lakhipur',4),(98,'Marigaon',4),(99,'Mohanbari',4),(100,'Nagaon',4),(101,'Rupsi',4),(102,'Silchar',4),(103,'Sivasagar',4),(104,'Tezpur',4),(105,'Tinsukia',4),(106,'Araria',5),(107,'Aurangabad',5),(108,'Banka',5),(109,'Begusarai',5),(110,'Bhagalpur',5),(111,'Bhojpur',5),(112,'Buxar',5),(113,'Darbhanga',5),(114,'EastChamparan',5),(115,'Gaya',5),(116,'Gopalganj',5),(117,'Jamui',5),(118,'Jehanabad',5),(119,'Kaimur',5),(120,'Katihar',5),(121,'Khagaria',5),(122,'Kishanganj',5),(123,'Lakhisarai',5),(124,'Madhepura',5),(125,'Madhubani',5),(126,'Motihari',5),(127,'Munger',5),(128,'Muzaffarpur',5),(129,'Nalanda',5),(130,'Nawada',5),(131,'Patna',5),(132,'Purnia',5),(133,'Rohtas',5),(134,'Saharsa',5),(135,'Samastipur',5),(136,'Saran',5),(137,'Sheikhpura',5),(138,'Sheohar',5),(139,'Sitamarhi',5),(140,'Siwan',5),(141,'Supaul',5),(142,'Vaishali',5),(143,'WestChamparan',5),(144,'Chandigarh',6),(145,'Bastar',7),(146,'Bhilai',7),(147,'Bilaspur',7),(148,'Dantewada',7),(149,'Dhamtari',7),(150,'Durg',7),(151,'Jagdalpur',7),(152,'Janjgir-Champa',7),(153,'Jashpur',7),(154,'Kanker',7),(155,'Kawardha',7),(156,'Korba',7),(157,'Koriya',7),(158,'Mahasamund',7),(159,'Raigarh',7),(160,'Raipur',7),(161,'Rajnandgaon',7),(162,'Surguja',7),(163,'Dadra and Nagar Haveli',8),(164,'Daman',9),(165,'Diu',9),(166,'NewDelhi',10),(167,'Arpora',11),(168,'Bicholim',11),(169,'Farmagudi',11),(170,'GoaDabolim',11),(171,'Mardol',11),(172,'Margao',11),(173,'Panaji',11),(174,'Ponda',11),(175,'Ahmedabad',12),(176,'Amreli',12),(177,'Anand',12),(178,'BanasKantha',12),(179,'Bardoli',12),(180,'Baroda',12),(181,'Bharuch',12),(182,'Bhavnagar',12),(183,'Bhuj',12),(184,'Dohad',12),(185,'Gandhinagar',12),(186,'Jamnagar',12),(187,'Junagadh',12),(188,'Kheda',12),(189,'Kutch',12),(190,'Mehsana',12),(191,'Modasa',12),(192,'Morbi',12),(193,'Nadiad',12),(194,'Narmada',12),(195,'Navsari',12),(196,'PanchMahals',12),(197,'Patan',12),(198,'Porbandar',12),(199,'Rajkot',12),(200,'SabarKantha',12),(201,'Surat',12),(202,'Surendranagar',12),(203,'Vadodara',12),(204,'Valsad',12),(205,'Virda',12),(206,'V.Vidyanagar',12),(207,'WadhwanCity',12),(208,'Ambala',13),(209,'Bahadurgarh',13),(210,'Bhiwani',13),(211,'Faridabad',13),(212,'Fatehabad',13),(213,'Gurgaon',13),(214,'Hisar',13),(215,'Jaqadhari',13),(216,'Jhajjar',13),(217,'Jind',13),(218,'Kaithal',13),(219,'Karnal',13),(220,'Kurukshetra',13),(221,'Mahendragarh',13),(222,'Panchkula',13),(223,'Panipat',13),(224,'Rewari',13),(225,'Rohtak',13),(226,'Sirsa',13),(227,'Sohna',13),(228,'Sonipat',13),(229,'Yamunanagar',13),(230,'Baddi',14),(231,'Bilaspur',14),(232,'Chamba',14),(233,'Hamirpur',14),(234,'Kangra',14),(235,'Kinnaur',14),(236,'Kullu',14),(237,'Lahaul and Spiti',14),(238,'Mandi',14),(239,'Shimla',14),(240,'Sirmour',14),(241,'Solan',14),(242,'Una',14),(243,'Anantnag',15),(244,'Baramulla',15),(245,'Badgam',15),(246,'Doda',15),(247,'HajratBal',15),(248,'Jammu',15),(249,'Kargil',15),(250,'Kathua',15),(251,'KhotBhalwal',15),(252,'Kupwara',15),(253,'Leh',15),(254,'MiranSahib',15),(255,'Pattan-Kashmir',15),(256,'Poonch',15),(257,'Pulwama',15),(258,'Rajouri',15),(259,'Srinagar',15),(260,'Udhampur',15),(261,'Bokaro',16),(262,'Chatra',16),(263,'Deoghar',16),(264,'Dhanbad',16),(265,'Dumka',16),(266,'EastSinghbhum',16),(267,'Garhwa',16),(268,'Giridih',16),(269,'Godda',16),(270,'Hatia',16),(271,'Hazaribag',16),(272,'Jamshedpur',16),(273,'Jamtara',16),(274,'Koderma',16),(275,'Latehar',16),(276,'Lohardaga',16),(277,'Pakaur',16),(278,'Palamu',16),(279,'Ranchi',16),(280,'Sahibganj',16),(281,'Seraikela',16),(282,'Simdega',16),(283,'Sindri',16),(284,'Tatisilwai',16),(285,'WestSinghbhum',16),(286,'Bagalkot',17),(287,'Bangalore',17),(288,'Bantwal',17),(289,'Belgaum',17),(290,'Bellary',17),(291,'Bhatkal',17),(292,'Bidar',17),(293,'Bijapur',17),(294,'Chikmagalur',17),(295,'Chitradurga',17),(296,'Davangere',17),(297,'Deralakatte',17),(298,'Devanahalli',17),(299,'Dharwad',17),(300,'Gadag',17),(301,'Gulagunjikoppa',17),(302,'Gulbarga',17),(303,'Harapanahalli',17),(304,'Hassan',17),(305,'Hospet',17),(306,'Hubli',17),(307,'Humnabad',17),(308,'Karwar',17),(309,'Kodagu',17),(310,'Kolar',17),(311,'Mandya',17),(312,'Mangalore',17),(313,'Manipal',17),(314,'Mysore',17),(315,'Nidasoshi',17),(316,'Nitte',17),(317,'Puttur',17),(318,'Raichur',17),(319,'Ramanagaram',17),(320,'Ranebennur',17),(321,'Shimoga',17),(322,'Sullia',17),(323,'Surathkal',17),(324,'Tiptur',17),(325,'Tumkur',17),(326,'Udupi',17),(327,'Yelahanka',17),(328,'Adoor',18),(329,'Alappuzha',18),(330,'Aluva',18),(331,'Angalmaly',18),(332,'Chalakkudi',18),(333,'Chengannur',18),(334,'Cherthala',18),(335,'Ernakulam',18),(336,'Harippad',18),(337,'Idukki',18),(338,'Irinjalakkuda',18),(339,'Kalpetta',18),(340,'Kanhangad',18),(341,'Kanjirappally',18),(342,'Kannur',18),(343,'Ahmednagar',21),(344,'Kayamkulam',18),(345,'Koilandy',18),(346,'Kollam',18),(347,'Kothamangalam',18),(348,'Kottayam',18),(349,'Kozhikode',18),(350,'Kuttippuram',18),(351,'Malappuram',18),(352,'Mananthavady',18),(353,'Manjeri',18),(354,'Mannarkad',18),(355,'Mavelikkara',18),(356,'Munnar',18),(357,'Muvattupuzha',18),(358,'Neyyattinkara',18),(359,'Palai',18),(360,'Palakkad',18),(361,'Pathamuttom',18),(362,'Pathanamthitta',18),(363,'Payyanur',18),(364,'Perintalamanna',18),(365,'Ponnani',18),(366,'Ranni',18),(367,'Sreekrishnapuram',18),(368,'SulthanBathery',18),(369,'Taliparamba',18),(370,'Tanur',18),(371,'Thalassery',18),(372,'Thiruvalla',18),(373,'Thiruvananthapuram',18),(374,'Thrissur',18),(375,'Tirur',18),(376,'Vaikom',18),(377,'Valanchery',18),(378,'Vatakara',18),(379,'Velloor',18),(380,'AgattiIsland',19),(381,'Kavarathi',19),(382,'Anuppur',20),(383,'Ashok Nagar',20),(384,'Balaghat',20),(385,'Barwani',20),(386,'Betul',20),(387,'Bhanpura',20),(388,'Bhind',20),(389,'Bhopal',20),(390,'Burhanpur',20),(391,'Chhatarpur',20),(392,'Chhindwara',20),(393,'Damoh',20),(394,'Datia',20),(395,'Dewas',20),(396,'Dhar',20),(397,'Dindori',20),(398,'Guna',20),(399,'Gwalior',20),(400,'Harda',20),(401,'Hoshangabad',20),(402,'Indore',20),(403,'Jabalpur',20),(404,'Jaora',20),(405,'Jhabua',20),(406,'Katni',20),(407,'Khandwa',20),(408,'Khargone',20),(409,'Mandla',20),(410,'Mandasur',20),(411,'Morena',20),(412,'Narsinghpur',20),(413,'Neemuch',20),(414,'Nowgong',20),(415,'Panna',20),(416,'Raisen',20),(417,'Rajgarh',20),(418,'Rathara',20),(419,'Ratlam',20),(420,'Rewa',20),(421,'Sagar',20),(422,'Satna',20),(423,'Sehore',20),(424,'Seoni',20),(425,'Shahdol',20),(426,'Shajapur',20),(427,'Sheopur',20),(428,'Shivpuri',20),(429,'Sidhi',20),(430,'Tikamgarh',20),(431,'Ujjain',20),(432,'Umaria',20),(433,'Vidisha',20),(434,'Ahmednagar',21),(435,'Akola',21),(436,'Amravati',21),(437,'Aurangabad',21),(438,'Badnera',21),(439,'Baramati',21),(440,'Beed',21),(441,'Bhandara',21),(442,'Bhusaval',21),(443,'Buldhana',21),(444,'Chandrapur',21),(445,'Chikhili',21),(446,'Chincoli',21),(447,'Dhule',21),(448,'Gadchiroli',21),(449,'Gondia',21),(450,'Hingoli',21),(451,'Jalgaon',21),(452,'Jalna',21),(453,'Karad',21),(454,'Karjat',21),(455,'Khalapur',21),(456,'Kolhapur',21),(457,'Kopargaon',21),(458,'Latur',21),(459,'Lonavala',21),(460,'Lonere',21),(461,'Loni',21),(462,'Mumbai',21),(463,'Nagaon',21),(464,'Nagpur',21),(465,'Nanded',21),(466,'Nandurbar',21),(467,'Nashik',21),(468,'Nilanga',21),(469,'Osmanabad',21),(470,'Pandharpur',21),(471,'Parbhani',21),(472,'Pune',21),(473,'Pusad',21),(474,'Raigad',21),(475,'Ratnagiri',21),(476,'Sangli',21),(477,'Satara',21),(478,'Shegaon',21),(479,'Shirpur',21),(480,'Sindhudurg',21),(481,'Solapur',21),(482,'Thane',21),(483,'Warananagar',21),(484,'Wardha',21),(485,'Washim',21),(486,'Yavatmal',21),(487,'Bishenpur',22),(488,'Chandel',22),(489,'Churachandpur',22),(490,'Imphal',22),(491,'Senapati',22),(492,'Tamenglong',22),(493,'Thoubal',22),(494,'Ukhrul',22),(495,'Shillong',23),(496,'Aizawl',24),(497,'Champhai',24),(498,'Kolasib',24),(499,'Lawngtlai',24),(500,'Lunglei',24),(501,'Mamit',24),(502,'Saiha',24),(503,'Serchhip',24),(504,'Dimapur',25),(505,'Kohima',25),(506,'Mokokchung',25),(507,'Mon',25),(508,'Phek',25),(509,'Tuensang',25),(510,'Wokha',25),(511,'Zunheboto',25),(512,'Anugul',26),(513,'Ankushpur',26),(514,'Balangir',26),(515,'Balasore',26),(516,'Baleshwar',26),(517,'Bargarh',26),(518,'Berhampore',26),(519,'Bhadrak',26),(520,'Bhubaneshwar',26),(521,'Boudh',26),(522,'Burla',26),(523,'Cuttack',26),(524,'Debagarh',26),(525,'Dhenkanal',26),(526,'Gajapati',26),(527,'Ganjam',26),(528,'Jagatsinghapur',26),(529,'Jajapur',26),(530,'Jharsuguda',26),(531,'Kalahandi',26),(532,'Kandhamal',26),(533,'Kapurthala',26),(534,'Kendrapara',26),(535,'Kendujhar',26),(536,'Keonjhargarh',26),(537,'Khandagiri',26),(538,'Khordha',26),(539,'Korapur',26),(540,'Koraput',26),(541,'Malkangiri',26),(542,'Mayurbhanj',26),(543,'Nabarangapur',26),(544,'Nayagarh',26),(545,'Nuapada',26),(546,'Phulnakhara',26),(547,'Puri',26),(548,'Rayagada',26),(549,'Rourkela',26),(550,'Sambalpur',26),(551,'Sonapur',26),(552,'Sundergarh',26),(553,'Talcher',26),(554,'Ushara',26),(555,'Kanakalapet',27),(556,'Karaikal',27),(557,'Kirumambakkam',27),(558,'Madagandipet',27),(559,'Mahe',27),(560,'Pondicherry',27),(561,'Tiruvettakudi',27),(562,'Yanam',27),(563,'Amritsar',28),(564,'Bathinda',28),(565,'Bhutta',28),(566,'Chandigarh',28),(567,'DeraBassi',28),(568,'Faridkot',28),(569,'FatehgarhSahib',28),(570,'Ferozpur',28),(571,'Gurdaspur',28),(572,'Hoshiarpur',28),(573,'HushiarNagar',28),(574,'Jalandhar',28),(575,'Kapurthala',28),(576,'LalruMandi',28),(577,'Longowal',28),(578,'Ludhiana',28),(579,'Malout',28),(580,'Mansa',28),(581,'Moga',28),(582,'Mohali',28),(583,'Muktsar',28),(584,'Nawanshahar',28),(585,'Padhiana',28),(586,'Pathankot',28),(587,'Patiala',28),(588,'Phagwara',28),(589,'Ropar',28),(590,'Rupnagar',28),(591,'Sahib',28),(592,'Sangrur',28),(593,'Shahar',28),(594,'Ajmer',29),(595,'Akelgarh',29),(596,'Alwar',29),(597,'Banswara',29),(598,'Baran',29),(599,'Barmer',29),(600,'Bharatpur',29),(601,'Bhilwara',29),(602,'Bikaner',29),(603,'Bundi',29),(604,'Chittorgarh',29),(605,'Churu',29),(606,'Dausa',29),(607,'Dholpur',29),(608,'Dungarpur',29),(609,'Ganganagar',29),(610,'Hanumangarh',29),(611,'Jaipur',29),(612,'Jaisalmer',29),(613,'Jalor',29),(614,'Jhalawar',29),(615,'Jhunjunu',29),(616,'Jodhpur',29),(617,'Karauli',29),(618,'Khetri',29),(619,'Kota',29),(620,'Lakshmangarh',29),(621,'Nagaur',29),(622,'Pali',29),(623,'Pilani',29),(624,'Rajsamand',29),(625,'Sawai Madhopur',29),(626,'Sikar',29),(627,'Sirohi',29),(628,'Sriganganagar',29),(629,'Tonk',29),(630,'Udaipur',29),(631,'Gangtok',30),(632,'Andipatti',31),(633,'Annamalainagar',31),(634,'Avadi',31),(635,'Bagayam',31),(636,'BKomarapalayam',31),(637,'Chembarambakam',31),(638,'Chengal',31),(639,'Chennai',31),(640,'Chidambaram',31),(641,'Chengalpattu',31),(642,'Coimbatore',31),(643,'Cuddalore',31),(644,'Dharmapuri',31),(645,'Dindigul',31),(646,'Erode',31),(647,'Hosur',31),(648,'Kadayanallur',31),(649,'Kalapatti',31),(650,'Kamaraj',31),(651,'Kanchipuram',31),(652,'Kanyakumari',31),(653,'Karaikudi',31),(654,'Karapakkam',31),(655,'Karur',31),(656,'Kattabomman',31),(657,'Kelambakkam',31),(658,'Komarapalayam',31),(659,'Krishnagiri',31),(660,'Kumbakkonam',31),(661,'Madurai',31),(662,'Manapparai',31),(663,'Melmaruvathur',31),(664,'Muthuramalingam',31),(665,'Nagapattinam',31),(666,'Nagarcoil',31),(667,'Namakkal',31),(668,'Nilgiris',31),(669,'NorthArcot',31),(670,'Ootacamund',31),(671,'Palani',31),(672,'Palayamkottai',31),(673,'Peambalur',31),(674,'Perambalur',31),(675,'Periyar',31),(676,'Perundurai',31),(677,'Pollachi',31),(678,'Poonamallee',31),(679,'Pudukkottai',31),(680,'Puttur',31),(681,'Ramnathapuram',31),(682,'Salem',31),(683,'Sholinganallur',31),(684,'Sivaganga',31),(685,'Sivakasi',31),(686,'Thanjavur',31),(687,'Theni',31),(688,'Thirukkazhikundram',31),(689,'Thirumalalsamudram',31),(690,'Thirupachur',31),(691,'Thiruvallur',31),(692,'Thiruvannamalai',31),(693,'Thiruvarur',31),(694,'Tholudur',31),(695,'Thoothukudi',31),(696,'Tiruchendur',31),(697,'Tiruchengode',31),(698,'Tiruchirappalli',31),(699,'Tirunelveli',31),(700,'Tirupattur',31),(701,'Tiruvannamalai',31),(702,'Tiruvarur',31),(703,'Tiruvallur',31),(704,'Trimmasamudram',31),(705,'Tuticorin',31),(706,'Vadakkangulam',31),(707,'Vadamavandal',31),(708,'Vadugapalayam',31),(709,'Vallalur',31),(710,'Vandavasi',31),(711,'Vaniyambadi',31),(712,'Vellore',31),(713,'Veppampattu',31),(714,'Villupuram',31),(715,'Virudhanagar',31),(716,'Agartala',32),(717,'Dhalai',32),(718,'Kailashahar',32),(719,'Kamalpur',32),(720,'Almora',33),(721,'Bageshwar',33),(722,'Chamoli',33),(723,'Champawat',33),(724,'Dehradun',33),(725,'Garhwal',33),(726,'Haridwar',33),(727,'Nainital',33),(728,'Pantnagar',33),(729,'Pauri Garhwal',33),(730,'Pithoragarh',33),(731,'Roorkee',33),(732,'Rudraprayag',33),(733,'Srinagar',33),(734,'Tehri Garhwal',33),(735,'Udham Singh Nagar',33),(736,'Uttarkashi',33),(737,'Agra',34),(738,'Aligarh',34),(739,'Allahabad',34),(740,'Ambedkar Nagar',34),(741,'Auraiya',34),(742,'Azamgrah',34),(743,'Baghpat',34),(744,'Bahraich',34),(745,'Ballia',34),(746,'Balrampur',34),(747,'Banda',34),(748,'Barabanki',34),(749,'Bareilly',34),(750,'Basti',34),(751,'Bhadohi',34),(752,'Bijnore',34),(753,'Budaun',34),(754,'Bulandshahar',34),(755,'Chandauli',34),(756,'Chitrakoot',34),(757,'Deoria',34),(758,'Etah',34),(759,'Etawah',34),(760,'Faizabad',34),(761,'Farukhabad',34),(762,'Fatehpur',34),(763,'Firozabad',34),(764,'Gautam Buddha Nagar',34),(765,'G.B.Nagar',34),(766,'Ghaziabad',34),(767,'Ghazipur',34),(768,'Gonda',34),(769,'Gorakhpur',34),(770,'Hamirpur',34),(771,'Hardoi',34),(772,'Hathras',34),(773,'Jaunpur',34),(774,'Jhansi',34),(775,'Jyotiba Phule Nagar',34),(776,'Kalyanpur',34),(777,'Kannauj',34),(778,'Kanpur',34),(779,'Kaushambi',34),(780,'Kheri',34),(781,'Kushinagar',34),(782,'Lalitpur',34),(783,'Lucknow',34),(784,'Maharajganj',34),(785,'Mahoba',34),(786,'Mainpuri',34),(787,'Mathura',34),(788,'Mau',34),(789,'Meerut',34),(790,'Mirzapur',34),(791,'Modinagar',34),(792,'Moradabad',34),(793,'Muzaffarnagar',34),(794,'Naini',34),(795,'Noida',34),(796,'Pilibhit',34),(797,'Pratapgarh',34),(798,'RaeBareli',34),(799,'Rampur',34),(800,'Saharanpur',34),(801,'Sant Kabir Nagar',34),(802,'Sant Ravidas Nagar',34),(803,'Shahjahanpur',34),(804,'Shrawasti',34),(805,'Siddharthnagar',34),(806,'Sitapur',34),(807,'Sonbhadra',34),(808,'Sultanpur',34),(809,'Unnao',34),(810,'Varanasi',34),(811,'Amirai',35),(812,'Asansol',35),(813,'Bankura',35),(814,'Bardhaman',35),(815,'Birbhum',35),(816,'Burdwan',35),(817,'Cooch Behar',35),(818,'Darjiling',35),(819,'Durgapur',35),(820,'Garia',35),(821,'Hooghly',35),(822,'Howrah',35),(823,'Jalpaiguri',35),(824,'Kalyani',35),(825,'Kharagpur',35),(826,'Kolkata',35),(827,'Maldah',35),(828,'Mecheda',35),(829,'Midnapore',35),(830,'Murshidabad',35),(831,'Nadia',35),(832,'North 24 Parganas',35),(833,'North Dinajpur',35),(834,'Puruliya',35),(835,'Serampore',35),(836,'Shantiniketan',35),(837,'Sonarpur',35),(838,'South 24 Parganas',35),(839,'South Dinajpur',35),(840,'Navi Mumbai',21),(841,'Ujire',17),(842,'Achanta',2),(843,'Addanki',2),(844,'Adivarampet',2),(845,'Adoni',2),(846,'Agadur',2),(847,'Agnoor',2),(848,'Ainapur',2),(849,'Ajjada',2),(850,'Anakapalle',2),(851,'Asifabad',36),(852,'Balkonda',36),(853,'Balusupadu',36),(854,'Bandankal',2),(855,'Banswada',36),(856,'Bardipur',2),(857,'Bhadrachalam',36),(858,'Bhainsa',36),(859,'Bhongir',36),(860,'Bodhan',36),(861,'Chembakur',2),(862,'Chirala',2),(884,'Dammapeta',2),(885,'Dangeru',2),(886,'Dharmavaram',2),(887,'Domakonda',2),(888,'Dommeru',2),(889,'Ekambara kuppam',2),(890,'Gadwal',36),(891,'Gooty',2),(892,'Gudivada',2),(893,'Gudur',2),(894,'Gundmal',2),(895,'Gundugolanu',2),(896,'Gundupapala',2),(897,'Guntakal',2),(898,'Husnabad',36),(899,'Huzurnagar',36),(900,'Ibrahimpatnam',36),(901,'Ichapuram',2),(902,'Jagtial',36),(903,'Jangaon',36),(904,'Kadiri',2),(905,'Kallur',2),(906,'Kamareddy',36),(907,'Kanuru',2),(909,'Koratla',36),(910,'Kovvur',2),(911,'Kuppam',2),(912,'Lingotam',2),(913,'Macherla',2),(914,'Malkajgiri',36),(915,'Mangalagiri',2),(917,'Nagari',2),(918,'Nandyal',2),(919,'Narayanpet',2),(920,'Narsipatnam',2),(921,'Nidadavole',2),(922,'Nirmal',36),(930,'Pedana',2),(931,'Ponnur',2),(932,'Proddatur',2),(933,'Puttur',2),(934,'Rajendranagar',36),(935,'Rayadurg',2),(936,'Repalle',2),(937,'Sangareddy',36),(938,'Sarapaka',2),(939,'Sattenapalle',36),(940,'Siddipet',36),(941,'Sirsilla',2),(942,'Sompeta',2),(943,'Suryaraopeta',2),(944,'Tandur',36),(945,'Tenali',2),(946,'Tirumala',2),(947,'Vepagunta',2),(948,'Wanaparthi',36),(949,'Yeditha',2),(950,'Yellandu',36),(951,'Yemmiganur',2),(952,'Yerraguntla',2),(953,'Zahirabad',36),(954,'Along',3),(955,'Basar',3),(956,'Bomdila',3),(957,'Daporijo',3),(958,'Jairampur',3),(959,'Khonsa',3),(960,'Namsai',3),(961,'Roing',3),(962,'Seppa',3),(963,'Yingkiong',3),(964,'Ziro',3),(965,'Abhayapuri',4),(966,'Amguri',4),(967,'Badarpur',4),(968,'Barpathar',4),(969,'Basugaon',4),(970,'Bijni',4),(971,'Bokajan',4),(972,'Bokakhat',4),(973,'Chabua',4),(974,'Chapar',4),(975,'Dergaon',4),(976,'Dharapur',4),(977,'Dhekiajuli',4),(978,'Dhing',4),(979,'Digboi',4),(980,'Diphu',4),(981,'Gohpur',4),(982,'Haflong',4),(983,'Hajo',4),(984,'Hamren',4),(985,'Hojai',4),(986,'Howli',4),(987,'Howraghat',4),(988,'Kalaigaon',4),(990,'Lala',4),(991,'Lanka',4),(992,'Lumding',4),(993,'Mahur',4),(994,'Maibong',4),(995,'Mangaldoi',4),(996,'Mankachar',4),(997,'Margherita',4),(998,'Mariani',4),(999,'Moranhat',4),(1000,'Nalbari',4),(1001,'Namrup',4),(1002,'Narayanpur',4),(1003,'Nazira',4),(1004,'North Guwahati',4),(1005,'North Lakhimpur',4),(1006,'Palasbari',4),(1007,'Pathsala',4),(1008,'Rangapara',4),(1009,'Rangia',4),(1010,'Sapatgram',4),(1011,'Sarthebari',4),(1012,'Sarupathar',4),(1013,'Sibsagar',4),(1014,'Silapathar',4),(1015,'Sonari',4),(1016,'Tangla',4),(1017,'Tihu',4),(1018,'Udalguri',4),(1019,'Abgila',5),(1020,'Adapur',5),(1021,'Afzalpur',5),(1022,'Ahirawan',5),(1023,'Ahmadpur Harna',5),(1024,'Akbarpur',5),(1025,'Amarpur',5),(1026,'Amawan',5),(1027,'Areraj',5),(1028,'Arrah',5),(1029,'Asarganj',5),(1030,'Bagaha',5),(1031,'Bahadurganj',5),(1032,'Bahadurpur',5),(1033,'Baikunthpur',5),(1034,'Bakhtiarpur',5),(1035,'Barahiya',5),(1036,'Barh',5),(1037,'Behea',5),(1038,'Belsand',5),(1039,'Betia',5),(1040,'Bettiah',5),(1041,'Bhabua',5),(1042,'Bhagwanpur',5),(1043,'Biharsharif',5),(1044,'Bikramganj',5),(1045,'Birpur',5),(1046,'Bodh Gaya',5),(1047,'Chanpatia',5),(1048,'Chapra',5),(1049,'Colgong',5),(1050,'Daudnagar',5),(1051,'Dhaka',5),(1052,'Dighalbank',5),(1053,'Dighwara',5),(1054,'Durgawati',5),(1055,'Forbesganj',5),(1056,'Ghoghardiha',5),(1057,'Ghoshi',5),(1058,'Gidhaur',5),(1059,'Hajipur',5),(1061,'Hilsa',5),(1062,'Islampur',5),(1063,'Jagdishpur',5),(1064,'Jahanabad',5),(1065,'Jainagar',5),(1066,'Jamalpur',5),(1067,'Jhajha',5),(1068,'Jhanjharpur',5),(1069,'Jogbani',5),(1070,'Kanti',5),(1071,'Karpi',5),(1072,'Kasba',5),(1073,'Khagaul',5),(1074,'Khusrupur',5),(1075,'Koath',5),(1076,'Koilwar',5),(1077,'Lakhisarai',5),(1078,'Lalganj',5),(1079,'Maharajganj',5),(1080,'Mairwa',5),(1081,'Makhdumpur',5),(1082,'Maner',5),(1083,'Manihari',5),(1084,'Masaurhi',5),(1085,'Mirganj',5),(1086,'Mohiuddinagar',5),(1087,'Motipur',5),(1088,'Murliganj',5),(1089,'Nabinagar',5),(1090,'Narkatiaganj',5),(1091,'Nirmali',5),(1092,'Rafiganj',5),(1093,'Rajgir',5),(1094,'Revelganj',5),(1095,'Sasara',5),(1096,'Sherghati',5),(1097,'Silao',5),(1098,'Sonepur',5),(1099,'Sugauli',5),(1100,'Sultanganj',5),(1101,'Tekari',5),(1102,'Warisaliganj',5),(1103,'Akaltara',7),(1104,'Ambikapur',7),(1105,'Arang',7),(1106,'Baikunthpur',7),(1107,'Baloda',7),(1108,'Bhanpuri',7),(1109,'Bhatapara',7),(1110,'Bhatgaon',7),(1111,'Bilha',7),(1112,'Birgaon',7),(1113,'Champa',7),(1114,'Dongargaon',7),(1115,'Geedam',7),(1116,'Gharghoda',7),(1117,'Katghora',7),(1118,'Khairagarh',7),(1119,'Kharod',7),(1120,'Kharsia',7),(1121,'Kirandul',7),(1122,'Kondagaon',7),(1123,'Kurud',7),(1124,'Manendragarh',7),(1125,'Mungeli',7),(1126,'Patan',7),(1127,'Pendra',7),(1128,'Ratanpur',7),(1129,'Sakti',7),(1130,'Saraipali',7),(1131,'Sarangarh',7),(1132,'Simga',7),(1133,'Surajpur',7),(1134,'Takhatpur',7),(1135,'Silvasa',8),(1136,'Aldana',11),(1137,'Aquem',11),(1138,'Calangute',11),(1139,'Canacona',11),(1140,'Candolim',11),(1141,'Chicalim',11),(1142,'Colvale',11),(1143,'Cuncolim',11),(1144,'Goa Velha',11),(1145,'Navelim',11),(1146,'Pale',11),(1147,'Pernem',11),(1148,'Quepem',11),(1149,'Queula',11),(1150,'Saligao',11),(1151,'Sanquelim',11),(1152,'Siolim',11),(1153,'Valpoi',11),(1154,'Abrama',12),(1155,'Adalaj',12),(1156,'Ambaji',12),(1157,'Andada',12),(1158,'Anjar',12),(1159,'Atul',12),(1160,'Bantwa',12),(1161,'Bavla',12),(1162,'Bhachau',12),(1163,'Bhanvad',12),(1164,'Bhayavadar',12),(1165,'Bodeli',12),(1166,'Boriavi',12),(1167,'Borsad',12),(1168,'Botad',12),(1169,'Chaklasi',12),(1170,'Chalala',12),(1171,'Chalthan',12),(1172,'Chanasma',12),(1173,'Chhaya',12),(1174,'Chhota Udaipur',12),(1175,'Chikhli',12),(1176,'Chorvad',12),(1177,'Dabhoi',12),(1178,'Dahegam',12),(1179,'Dakor',12),(1180,'Damnagar',12),(1181,'Devsar',12),(1182,'Dhandhuka',12),(1183,'Dhanera',12),(1184,'Dharampur',12),(1185,'Dhola',12),(1186,'Dholka',12),(1187,'Dhrangadhra',12),(1188,'Dhrol',12),(1189,'Digvijaygram',12),(1190,'Dwarka',12),(1191,'Gandevi',12),(1193,'Godhra',12),(1194,'Gondal',12),(1195,'Halol',12),(1196,'Harij',12),(1197,'Himatnagar',12),(1198,'Idar',12),(1199,'Jafrabad',12),(1200,'Jalalpore',12),(1201,'Jam Jodhpur',12),(1202,'Jasdan',12),(1203,'Kadi',12),(1204,'Kadodara',12),(1205,'Kalavad',12),(1206,'Kalol',12),(1207,'Kanodar',12),(1208,'Karamsad',12),(1209,'Keshod',12),(1210,'Khambhalia',12),(1211,'Khambhat',12),(1212,'Kharaghoda',12),(1213,'Khedbrahma',12),(1214,'Kheralu',12),(1215,'Kutiyana',12),(1216,'Lathi',12),(1217,'Limbdi',12),(1218,'Lunawada',12),(1219,'Mahudha',12),(1220,'Mahuva',12),(1221,'Malpur',12),(1222,'Manavadar',12),(1223,'Mandvi',12),(1224,'Mangrol',12),(1225,'Meghraj',12),(1226,'Mithapur',12),(1227,'Mundra',12),(1228,'Nandej',12),(1229,'Ode',12),(1230,'Paddhari',12),(1231,'Padra',12),(1232,'Palanpur',12),(1233,'Palej',12),(1234,'Palitana',12),(1235,'Petlad',12),(1236,'Prantij',12),(1237,'Radhanpur',12),(1238,'Rajpipla',12),(1239,'Rajula',12),(1240,'Ramol',12),(1241,'Ranavav',12),(1242,'Ranip',12),(1243,'Ranoli',12),(1244,'Sachin',12),(1245,'Salaya',12),(1246,'Sanand',12),(1247,'Santrampur',12),(1248,'Savarkundla',12),(1249,'Sayan',12),(1250,'Sidhpur',12),(1251,'Sihor',12),(1252,'Songadh',12),(1253,'Talaja',12),(1254,'Talod',12),(1255,'Tapi',12),(1256,'Thangadh',12),(1257,'Tharad',12),(1258,'The Dangs',12),(1259,'Umreth',12),(1260,'Una',12),(1261,'Unjha',12),(1262,'Upleta',12),(1263,'Vadia',12),(1264,'Vapi',12),(1265,'Vartej',12),(1266,'Vastral',12),(1267,'Vejalpur',12),(1268,'Veraval',12),(1269,'Vijapur',12),(1270,'Viramgam',12),(1271,'Visavadar',12),(1272,'Visnagar',12),(1273,'Vyara',12),(1274,'Wankaner',12),(1275,'Assandh',13),(1276,'Barwala',13),(1277,'Bawal',13),(1278,'Bawani Khera',13),(1279,'Beri',13),(1280,'Bilaspur',13),(1281,'Charkhi Dadri',13),(1282,'Chhachhrauli',13),(1283,'Dharuhera',13),(1284,'Ellenabad',13),(1285,'Ferozepur Jhirka',13),(1286,'Ganaur',13),(1287,'Gharaunda',13),(1288,'Gohana',13),(1289,'Hansi',13),(1290,'Hassanpur',13),(1291,'Hathin',13),(1292,'Hisar',13),(1293,'Jakhal Mandi',13),(1294,'Julana',13),(1295,'Kalanaur',13),(1296,'Kalka',13),(1297,'Kanina',13),(1298,'Ladwa',13),(1299,'Loharu',13),(1301,'Mandi Dabwali',13),(1302,'Mustafabad',13),(1303,'Naraingarh',13),(1304,'Narnaul',13),(1305,'Narnaund',13),(1306,'Narwana',13),(1307,'Nilokheri',13),(1308,'Nuh',13),(1309,'Palwal',13),(1310,'Pataudi',13),(1311,'Pehowa',13),(1312,'Pinjore',13),(1313,'Pundri',13),(1314,'Radaur',13),(1315,'Raipur Rani',13),(1316,'Rania',13),(1317,'Safidon',13),(1318,'Samalkha',13),(1319,'Tohana',13),(1320,'Tosham',13),(1321,'Uchana',13),(1322,'Arki',14),(1323,'Bakloh',14),(1324,'Banjar',14),(1325,'Bhota',14),(1326,'Bhuntar',14),(1327,'Dagshai',14),(1328,'Daulatpur',14),(1329,'Dharamasala',14),(1330,'Gagret',14),(1331,'Ghumarwin',14),(1332,'Jubbal',14),(1333,'Jutogh',14),(1334,'Kasauli',14),(1335,'Keylong',14),(1336,'Nadaun',14),(1337,'Nagrota Bagwan',14),(1338,'Nahan',14),(1339,'Nalagarh',14),(1340,'Narkanda',14),(1341,'Nurpur',14),(1342,'Palampur',14),(1343,'Paonta Sahib',14),(1344,'Parwanoo',14),(1345,'Rajgarh',14),(1346,'Rampur',14),(1347,'Reckong Peo',14),(1348,'Rohru',14),(1349,'Santokhgarh',14),(1350,'Sarkaghat',14),(1351,'Theog',14),(1352,'Arki',15),(1353,'Bakloh',15),(1354,'Banjar',15),(1355,'Bhota',15),(1356,'Bhuntar',15),(1357,'Dagshai',15),(1358,'Daulatpur',15),(1359,'Dharamasala',15),(1360,'Gagret',15),(1361,'Ghumarwin',15),(1362,'Jubbal',15),(1363,'Jutogh',15),(1364,'Kasauli',15),(1365,'Keylong',15),(1366,'Nadaun',15),(1367,'Nagrota Bagwan',15),(1368,'Nahan',15),(1369,'Nalagarh',15),(1370,'Narkanda',15),(1371,'Nurpur',15),(1372,'Palampur',15),(1373,'Paonta Sahib',15),(1374,'Parwanoo',15),(1375,'Rajgarh',15),(1376,'Rampur',15),(1377,'Reckong Peo',15),(1378,'Rohru',15),(1379,'Santokhgarh',15),(1380,'Sarkaghat',15),(1381,'Achabal',15),(1382,'Arnia',15),(1383,'Awantipora',15),(1384,'Bandipora',15),(1385,'Banihal',15),(1386,'Bari Brahmana',15),(1387,'Batote',15),(1388,'Beerwah',15),(1389,'Bijbehara',15),(1390,'Budgam',15),(1391,'Chenani',15),(1392,'Ganderbal',15),(1393,'Gulmarg',15),(1394,'Hajan',15),(1395,'Handwara',15),(1396,'Jourian',15),(1397,'Kashmir',15),(1398,'Katra',15),(1399,'Khour',15),(1400,'Khrew',15),(1401,'Kishtwar',15),(1402,'Kud',15),(1403,'Kulgam',15),(1404,'Kunzer',15),(1405,'Magam',15),(1406,'Pahalgam',15),(1407,'Parole',15),(1408,'Pattan',15),(1410,'Ramban',15),(1411,'Ranbirsinghpora',15),(1412,'Reasi',15),(1413,'Samba',15),(1414,'Sopore',15),(1415,'Sumbal',15),(1416,'Sunderbani',15),(1417,'Tral',15),(1418,'Uri',15),(1419,'Vijay Pur',15),(1420,'Adityapur',16),(1421,'Bermo',16),(1422,'Bundu',16),(1423,'Chakradharpur',16),(1424,'Chandil',16),(1425,'Chandrapura',16),(1426,'Chas',16),(1427,'Chiria',16),(1428,'Chirkunda',16),(1429,'Ghatshila',16),(1430,'Gobindpur',16),(1431,'Gomoh',16),(1432,'Gua',16),(1433,'Gumla',16),(1434,'Jamadoba',16),(1435,'Jaridih Bazar',16),(1436,'Jasidih',16),(1437,'Jharia',16),(1438,'Jhinkpani',16),(1439,'Jhumri Tilaiya',16),(1440,'Jugsalai',16),(1441,'Kandra',16),(1442,'Kanke',16),(1443,'Kedla',16),(1444,'Khunti',16),(1445,'Kuju',16),(1447,'Madhupur',16),(1448,'Malkera',16),(1449,'Mango',16),(1450,'Mihijam',16),(1451,'Mugma',16),(1452,'Noamundi',16),(1453,'Paschimi Singhbhum',16),(1454,'Patratu',16),(1455,'Rajmahal',16),(1456,'Sijua',16),(1457,'Sini',16),(1458,'Sirka',16),(1459,'Tisra',16),(1460,'Topa',16),(1461,'Topchanchi',16),(1462,'Adyar',17),(1463,'Afzalpur',17),(1464,'Aland',17),(1465,'Alnavar',17),(1466,'Alur',17),(1467,'Anekal',17),(1468,'Ankola',17),(1469,'Annigeri',17),(1470,'Arkalgud',17),(1471,'Arsikere',17),(1472,'Athni',17),(1473,'Aurad',17),(1474,'Badami',17),(1475,'Bagepalli',17),(1476,'Bajpe',17),(1479,'Bangarapet',17),(1480,'Bannur',17),(1481,'Basavakalyan',17),(1482,'Basavana Bagevadi',17),(1483,'Belur',17),(1484,'Bhadravati',17),(1485,'Bhalki',17),(1486,'Bilgi',17),(1487,'Bommanahalli',17),(1488,'Byadgi',17),(1489,'Byatarayanapura',17),(1490,'Challakere',17),(1491,'Chamarajanagar',17),(1492,'Channagiri',17),(1494,'Channarayapatna',17),(1495,'Chiknayakanhalli',17),(1496,'Chikodi',17),(1497,'Chincholi',17),(1498,'Chintamani',17),(1499,'Chitapur',17),(1500,'Dakshina Kannada',17),(1501,'Dandeli',17),(1502,'Dasarahalli',17),(1503,'Devadurga',17),(1504,'Dharwar',17),(1505,'Dod Ballapur',17),(1506,'Gangawati',17),(1507,'Gauribidanur',17),(1508,'Gokak',17),(1509,'Gonikoppal',17),(1510,'Gubbi',17),(1511,'Gundlupet',17),(1512,'Hadagalli',17),(1513,'Hagaribommanahalli',17),(1514,'Haliyal',17),(1515,'Hangal',17),(1516,'Harihar',17),(1517,'Haveri',17),(1518,'Hebbalu',17),(1519,'Heggadadevankote',17),(1520,'Hirekerur',17),(1521,'Hiriyur',17),(1522,'Holalkere',17),(1523,'Hole Narsipur',17),(1524,'Honavar',17),(1525,'Honnali',17),(1526,'Hosadurga',17),(1527,'Hosanagara',17),(1528,'Hoskote',17),(1530,'Hukeri',17),(1531,'Hungund',17),(1532,'Hunsur',17),(1533,'Indi',17),(1534,'Jagalur',17),(1535,'Jamkhandi',17),(1536,'Jevargi',17),(1537,'Jog Falls',17),(1538,'Kadur',17),(1539,'Kalghatgi',17),(1540,'Kampli',17),(1541,'Kanakapura',17),(1542,'Kannur',17),(1543,'Kengeri',17),(1544,'Kerur',17),(1545,'Khanapur',17),(1546,'Kodigenahalli',17),(1547,'Koduru',17),(1548,'Kollegal',17),(1549,'Konnur',17),(1550,'Koppa',17),(1551,'Koppal',17),(1552,'Koratagere',17),(1553,'Kotturu',17),(1554,'Krishnarajanagara',17),(1555,'Krishnarajasagara',17),(1556,'Krishnarajpet',17),(1557,'Kudchi',17),(1558,'Kudligi',17),(1559,'Kudremukh',17),(1560,'Kumta',17),(1561,'Kundgol',17),(1562,'Kunigal',17),(1563,'Kushalnagar',17),(1564,'Kushtagi',17),(1565,'Lakshmeshwar',17),(1566,'Lingsugur',17),(1567,'Londa',17),(1568,'Maddur',17),(1569,'Madhugiri',17),(1570,'Madikeri',17),(1571,'Magadi',17),(1572,'Mahadevapura',17),(1573,'Malavalli',17),(1574,'Malur',17),(1575,'Manvi',17),(1576,'Muddebihal',17),(1577,'Mudgal',17),(1578,'Mudhol',17),(1579,'Mudigere',17),(1580,'Mulbagal',17),(1581,'Mulgund',17),(1582,'Mulki',17),(1583,'Mundargi',17),(1584,'Mundgod',17),(1585,'Nagamangala',17),(1586,'Nanjangud',17),(1587,'Narasimharajapura',17),(1588,'Naregal',17),(1589,'Navalgund',17),(1590,'Nipani',17),(1591,'Pandavapura',17),(1592,'Pavagada',17),(1593,'Piriyapatna',17),(1594,'Pudu',17),(1595,'Ramdurg',17),(1596,'Ron',17),(1597,'Sagar',17),(1598,'Sakleshpur',17),(1599,'Saligram',17),(1600,'Sandur',17),(1601,'Sankeshwar',17),(1602,'Savanur',17),(1603,'Sedam',17),(1604,'Shahabad',17),(1605,'Shahpur',17),(1606,'Shaktinagar',17),(1607,'Shiggaon',17),(1608,'Shikarpur',17),(1609,'Shirhatti',17),(1610,'Shorapur',17),(1611,'Siddapur',17),(1612,'Sidlaghatta',17),(1613,'Sindgi',17),(1614,'Sindhnur',17),(1615,'Sira',17),(1616,'Sirsi',17),(1617,'Siruguppa',17),(1618,'Somvarpet',17),(1619,'Sorab',17),(1620,'Sringeri',17),(1621,'Srinivaspur',17),(1622,'Supa',17),(1623,'Tarikere',17),(1624,'Tekkalakota',17),(1625,'Terdal',17),(1626,'Thumbe',17),(1627,'Tirthahalli',17),(1628,'Tirumakudal Narsipur',17),(1629,'Turuvekere',17),(1630,'Ullal',17),(1631,'Venkatapura',17),(1632,'Vijayapura',17),(1633,'Virajpet',17),(1634,'Wadi',17),(1635,'Yadgir',17),(1636,'Yelandur',17),(1637,'Yelbarga',17),(1638,'Yellapur',17),(1639,'Konnur',18),(1640,'Koppa',18),(1641,'Koppal',18),(1642,'Koratagere',18),(1643,'Kotturu',18),(1644,'Krishnarajanagara',18),(1645,'Krishnarajasagara',18),(1646,'Krishnarajpet',18),(1647,'Kudchi',18),(1648,'Kudligi',18),(1649,'Kudremukh',18),(1650,'Kumta',18),(1651,'Kundgol',18),(1652,'Kunigal',18),(1653,'Kushalnagar',18),(1654,'Kushtagi',18),(1655,'Lakshmeshwar',18),(1656,'Lingsugur',18),(1657,'Londa',18),(1658,'Maddur',18),(1659,'Madhugiri',18),(1660,'Madikeri',18),(1661,'Magadi',18),(1662,'Mahadevapura',18),(1663,'Malavalli',18),(1664,'Malur',18),(1665,'Manvi',18),(1666,'Muddebihal',18),(1667,'Mudgal',18),(1668,'Mudhol',18),(1669,'Mudigere',18),(1670,'Mulbagal',18),(1671,'Mulgund',18),(1672,'Mulki',18),(1673,'Mundargi',18),(1674,'Mundgod',18),(1675,'Nagamangala',18),(1676,'Nanjangud',18),(1677,'Narasimharajapura',18),(1678,'Naregal',18),(1679,'Navalgund',18),(1680,'Nipani',18),(1681,'Pandavapura',18),(1682,'Pavagada',18),(1683,'Piriyapatna',18),(1684,'Pudu',18),(1685,'Ramdurg',18),(1686,'Ron',18),(1687,'Sagar',18),(1688,'Sakleshpur',18),(1689,'Saligram',18),(1690,'Sandur',18),(1691,'Sankeshwar',18),(1692,'Savanur',18),(1693,'Sedam',18),(1694,'Shahabad',18),(1695,'Shahpur',18),(1696,'Shaktinagar',18),(1697,'Shiggaon',18),(1698,'Shikarpur',18),(1699,'Shirhatti',18),(1700,'Shorapur',18),(1701,'Siddapur',18),(1702,'Sidlaghatta',18),(1703,'Sindgi',18),(1704,'Sindhnur',18),(1705,'Sira',18),(1706,'Sirsi',18),(1707,'Siruguppa',18),(1708,'Somvarpet',18),(1709,'Sorab',18),(1710,'Sringeri',18),(1711,'Srinivaspur',18),(1712,'Supa',18),(1713,'Tarikere',18),(1714,'Tekkalakota',18),(1715,'Terdal',18),(1716,'Thumbe',18),(1717,'Tirthahalli',18),(1718,'Tirumakudal Narsipur',18),(1719,'Turuvekere',18),(1720,'Ullal',18),(1721,'Venkatapura',18),(1722,'Vijayapura',18),(1723,'Virajpet',18),(1724,'Wadi',18),(1725,'Yadgir',18),(1726,'Yelandur',18),(1727,'Yelbarga',18),(1728,'Yellapur',18),(1729,'Alleppey',18),(1730,'Arookutty',18),(1731,'Aroor',18),(1732,'Attingal',18),(1733,'Azhikode South',18),(1734,'Beypore',18),(1735,'Brahmakulam',18),(1736,'Cannanore (Kannur)',18),(1737,'Changanassery',18),(1738,'Chavakkad',18),(1739,'Chendamangalam',18),(1740,'Chengamanad',18),(1741,'Cheranallur',18),(1742,'Chirakkal',18),(1743,'Chirayinkeezhu',18),(1744,'Devikulam',18),(1745,'Dharmadom',18),(1746,'Edathala',18),(1747,'Eranholi',18),(1748,'Ernad',18),(1749,'Hosdurg',18),(1750,'Kadachira',18),(1751,'Kadambur',18),(1752,'Kalliasseri',18),(1753,'Kanayannur',18),(1754,'Kanhirode',18),(1755,'Kannadiparamba',18),(1756,'Karthikappally',18),(1758,'Kochi',18),(1759,'Kodungallur',18),(1760,'Kottarakkara',18),(1761,'Kozhenchery',18),(1762,'Kudlu',18),(1763,'Kunnamkulam',18),(1764,'Kunnathunad',18),(1765,'Mallappally',18),(1766,'Manjeshwar',18),(1767,'Maradu',18),(1768,'Mavoor',18),(1769,'Meenachil',18),(1770,'Methala',18),(1771,'Muhamma',18),(1772,'Mukundapuram',18),(1773,'Mulavukad',18),(1774,'Munderi',18),(1776,'Nadathara',18),(1777,'Nedumangad',18),(1778,'Nilambur',18),(1779,'Olavanna',18),(1780,'Ottappalam',18),(1781,'Palayad',18),(1782,'Palghat',18),(1783,'Paluvai',18),(1784,'Pappinisseri',18),(1785,'Pathiriyad',18),(1786,'Peringathur',18),(1787,'Perumbaikad',18),(1788,'Perumbavoor',18),(1789,'Pottore',18),(1790,'Punalur',18),(1791,'Puranattukara',18),(1792,'Quilandy',18),(1793,'Ramanattukara',18),(1794,'Thaikkad',18),(1795,'Thiruvankulam',18),(1796,'Thodupuzha',18),(1797,'Thottada',18),(1798,'Tirurangadi',18),(1799,'Trivandrum',18),(1800,'Udma',18),(1801,'Udumbanchola',18),(1803,'Valapattanam',18),(1804,'Vallachira',18),(1805,'Varam',18),(1806,'Varkala',18),(1807,'Vythiri',18),(1808,'Wayanad',18),(1809,'Lakshdweep',19),(1810,'Ajaigarh',20),(1811,'Akoda',20),(1812,'Alirajpur',20),(1813,'Amanganj',20),(1814,'Amarwara',20),(1815,'Ambah',20),(1816,'Amla',20),(1817,'Badnawar',20),(1818,'Bagh',20),(1819,'Bagli',20),(1820,'Baihar',20),(1821,'Baikunthpur',20),(1822,'Bansatar Kheda',20),(1823,'Barela',20),(1824,'Barhi',20),(1825,'Betma',20),(1826,'Bhander',20),(1827,'Bharveli',20),(1828,'Bhedaghat',20),(1829,'Bhitarwar',20),(1830,'Biaora',20),(1831,'Boda',20),(1832,'Buxwaha',20),(1833,'Chandla',20),(1834,'Chichli',20),(1835,'Daboh',20),(1836,'Dabra',20),(1837,'Depalpur',20),(1838,'Dhamnod',20),(1839,'Dharampuri',20),(1840,'Gadarwara',20),(1841,'Gairatganj',20),(1842,'Gohad',20),(1843,'Gormi',20),(1844,'Govindgarh',20),(1845,'Gurh',20),(1846,'Harpalpur',20),(1847,'Harsud',20),(1848,'Hatta',20),(1849,'Hindoria',20),(1850,'Itarsi',20),(1851,'Jobat',20),(1852,'Joura',20),(1853,'Kannod',20),(1854,'Kareli',20),(1855,'Karnawad',20),(1856,'Katangi',20),(1857,'Khategaon',20),(1858,'Khetia',20),(1859,'Kukshi',20),(1860,'Lahar',20),(1861,'Laundi',20),(1862,'Maharajpur',20),(1863,'Majholi',20),(1864,'Manasa',20),(1865,'Manawar',20),(1866,'Mandideep',20),(1867,'Mandleshwar',20),(1868,'Mangawan',20),(1869,'Manpur',20),(1870,'Mau',20),(1871,'Mauganj',20),(1872,'Meghnagar',20),(1873,'Mehgaon',20),(1874,'Mihona',20),(1875,'Mohgaon',20),(1876,'Multai',20),(1877,'Mundi',20),(1878,'Mungaoli',20),(1879,'Namli',20),(1880,'Narayangarh',20),(1881,'Narsinghgarh',20),(1882,'Nepanagar',20),(1883,'Pachmarhi Cantt',20),(1884,'Pachore',20),(1885,'Pandhana',20),(1886,'Pansemal',20),(1887,'Patan',20),(1888,'Patharia',20),(1889,'Porsa',20),(1890,'Raigarh',20),(1891,'Rajnagar',20),(1892,'Rajpur',20),(1893,'Ranapur',20),(1894,'Ratangarh',20),(1895,'Sabalgarh',20),(1896,'Sailana',20),(1897,'Sanchi',20),(1898,'Sarangpur',20),(1899,'Sardarpur',20),(1900,'Sarni',20),(1901,'Satwas',20),(1902,'Sausar',20),(1903,'Sawer',20),(1905,'Sendhwa',20),(1906,'Seoni Malwa',20),(1907,'Shahpura',20),(1908,'Sihora',20),(1909,'Sohagpur',20),(1910,'Sultanpur',20),(1911,'Tal',20),(1912,'Tekanpur',20),(1913,'Thandla',20),(1914,'Tirodi',20),(1915,'Udaipura',20),(1916,'Ukwa',20),(1917,'Ajra',21),(1918,'Akkalkot',21),(1919,'Akot',21),(1920,'Alibag',21),(1921,'Amalner',21),(1922,'Ambad',21),(1923,'Ambegaon',21),(1924,'Ambejogai',21),(1925,'Anjangaon',21),(1926,'Arvi',21),(1927,'Ashti',21),(1928,'Badlapur',21),(1929,'Balapur',21),(1930,'Ballarpur',21),(1931,'Barshi',21),(1932,'Basmath',21),(1933,'Bhadravati',21),(1934,'Bhagur',21),(1935,'Bhiwandi',21),(1936,'Bhokardan',21),(1937,'Bhor',21),(1938,'Budhgaon',21),(1939,'Chakan',21),(1940,'Chalisgaon',21),(1941,'Chamorshi',21),(1942,'Chandvad',21),(1943,'Chikhaldara',21),(1944,'Chinchani',21),(1945,'Chopda',21),(1946,'Dahanu',21),(1947,'Darwha',21),(1948,'Daund',21),(1949,'Deolali',21),(1950,'Deoli',21),(1951,'Deoni',21),(1952,'Desaiganj (Vadasa)',21),(1953,'Dhamangaon Railway',21),(1954,'Dharangaon',21),(1955,'Dharmabad',21),(1956,'Digras',21),(1957,'Dudhani',21),(1958,'Erandol',21),(1959,'Faizpur',21),(1960,'Gangakhed',21),(1961,'Gangapur',21),(1962,'Ghansawangi',21),(1963,'Gokhivare',21),(1964,'Goregaon',21),(1965,'Guhagar',21),(1966,'Hadgaon',21),(1967,'Hinganghat',21),(1968,'Ichalkaranji',21),(1969,'Igatpuri',21),(1970,'Indapur',21),(1971,'Jamkhed',21),(1972,'Jawhar',21),(1973,'Jaysingpur',21),(1974,'Jejuri',21),(1975,'Jintur',21),(1976,'Junnar',21),(1977,'Kagal',21),(1978,'Kalamb',21),(1979,'Kalwan',21),(1980,'Kankavli',21),(1981,'Kannad',21),(1982,'Karanja',21),(1983,'Karmala',21),(1984,'Katol',21),(1985,'Khapa',21),(1986,'Khed',21),(1987,'Kherdi',21),(1988,'Khopoli',21),(1989,'Khuldabad',21),(1990,'Kinwat',21),(1991,'Kodoli',21),(1992,'Kudal',21),(1993,'Kundalwadi',21),(1994,'Kurundvad',21),(1995,'Lanja',21),(1996,'Lasalgaon',21),(1997,'Loha',21),(1998,'Lonar',21),(1999,'Mahabaleshwar',21),(2000,'Mahad',21),(2001,'Maindargi',21),(2002,'Malegaon',21),(2003,'Malkapur',21),(2004,'Malshiras',21),(2005,'Manchar',21),(2006,'Manmad',21),(2007,'Manor',21),(2008,'Mansar',21),(2009,'Manwath',21),(2010,'Matheran',21),(2011,'Mhasla',21),(2012,'Miraj',21),(2013,'Mohpa',21),(2014,'Morshi',21),(2015,'Mowad',21),(2016,'Mukhed',21),(2017,'Mul',21),(2018,'Murbad',21),(2019,'Murgud',21),(2020,'Murud',21),(2021,'Nagothana',21),(2022,'Naldurg',21),(2023,'Nandgaon',21),(2024,'Nandura',21),(2026,'Neral',21),(2027,'Oras',21),(2028,'Ozar',21),(2029,'Pachora',21),(2030,'Padagha',21),(2031,'Paithan',21),(2032,'Pali',21),(2033,'Panhala',21),(2034,'Paranda',21),(2035,'Parola',21),(2036,'Partur',21),(2037,'Patan',21),(2038,'Pathardi',21),(2039,'Pathri',21),(2040,'Patur',21),(2041,'Pen',21),(2042,'Phaltan',21),(2043,'Pimpri Chinchwad',21),(2044,'Poladpur',21),(2045,'Pulgaon',21),(2046,'Purna',21),(2047,'Rahimatpur',21),(2048,'Rahuri',21),(2049,'Rajapur',21),(2050,'Rajur',21),(2051,'Ramtek',21),(2052,'Raver',21),(2053,'Risod',21),(2054,'Sailu',21),(2055,'Sangamner',21),(2056,'Sangole',21),(2057,'Sasti',21),(2058,'Satana',21),(2059,'Savda',21),(2060,'Savner',21),(2061,'Shahade',21),(2062,'Shahapur',21),(2063,'Shirdi',21),(2064,'Shirur',21),(2065,'Shivajinagar',21),(2066,'Sholapur',21),(2067,'Shrivardhan',21),(2068,'Sillod',21),(2069,'Sindi',21),(2070,'Sindkhed Raja',21),(2071,'Sinnar',21),(2072,'Sonpeth',21),(2073,'Surgana',21),(2074,'Talode',21),(2075,'Tarapur',21),(2076,'Tasgaon',21),(2077,'Telhara',21),(2078,'Tirora',21),(2079,'Trimbak',21),(2080,'Tuljapur',21),(2081,'Tumsar',21),(2082,'Udgir',21),(2083,'Ulhasnagar',21),(2084,'Umred',21),(2085,'Uran',21),(2086,'Uran Islampur',21),(2087,'Vada',21),(2088,'Vadgaon',21),(2089,'Vaijapur',21),(2090,'Vengurla',21),(2091,'Virar',21),(2092,'Wadi',21),(2093,'Wai',21),(2094,'Wani',21),(2095,'Warud',21),(2097,'Jiribam',22),(2098,'Mayang Imphal',22),(2099,'Moirang',22),(2100,'Moreh',22),(2101,'Nambol',22),(2102,'Sugnu',22),(2103,'Jiribam',23),(2104,'Mayang Imphal',23),(2105,'Moirang',23),(2106,'Moreh',23),(2107,'Nambol',23),(2108,'Sugnu',23),(2109,'Baghmara',23),(2110,'Cherrapunjee',23),(2111,'Jaiaw',23),(2112,'Jowai',23),(2113,'MadanRitting',23),(2114,'Nongpoh',23),(2115,'Nongstoin',23),(2116,'Nongthymmai',23),(2117,'Resubelpara',23),(2118,'Tura',23),(2119,'Williamnagar',23),(2120,'Darlawn',24),(2121,'Hnahthial',24),(2122,'Khawzawl',24),(2123,'Lungleh',24),(2124,'Lungsen',24),(2125,'Sairang',24),(2126,'Saitual',24),(2127,'Vairengte',24),(2128,'Chumukhedima',25),(2129,'Chukitong',25),(2130,'Anandapur',26),(2131,'Athmallik',26),(2133,'Balimela',26),(2134,'Balugaon',26),(2135,'Banki',26),(2136,'Barbil',26),(2137,'Baripara',26),(2138,'Basudebpur',26),(2139,'Behrampur',26),(2140,'Bhawanipatna',26),(2141,'Bhuban',26),(2142,'Bolangir',26),(2143,'Buguda',26),(2144,'Champua',26),(2145,'Chatrapur',26),(2146,'Damanjodi',26),(2147,'Digapahandi',26),(2148,'Ganjam',26),(2149,'Gopalpur',26),(2150,'Gudari',26),(2151,'Gunupur',26),(2152,'Hinjilicut',26),(2153,'Hirakud',26),(2154,'Jalda',26),(2155,'Jaleswar',26),(2156,'Jatani',26),(2157,'Jhumpura',26),(2158,'Joda',26),(2159,'Junagarh',26),(2160,'Kantabanji',26),(2161,'Kantilo',26),(2162,'Karanjia',26),(2163,'Kesinga',26),(2164,'Khariar',26),(2165,'Khurda',26),(2166,'Kodala',26),(2167,'Konark',26),(2168,'Kotpad',26),(2169,'Mukhiguda',26),(2170,'Nuapatna',26),(2171,'Padmapur',26),(2172,'Panikoii',26),(2173,'Panposh',26),(2174,'Parlakhemundi',26),(2175,'Patnagarh',26),(2176,'Pattamundai',26),(2177,'Phulbani',26),(2178,'Purusottampur',26),(2179,'Rairangpur',26),(2180,'Rambha',26),(2181,'Remuna',26),(2182,'Soro',26),(2183,'Tensa',26),(2184,'Udala',26),(2185,'Abohar',28),(2186,'Ahmedgarh',28),(2187,'Ajnala',28),(2188,'Akalgarh',28),(2189,'Alawalpur',28),(2190,'Amloh',28),(2191,'Anandpur Sahib',28),(2192,'Badhni Kalan',28),(2193,'Banga',28),(2194,'Bariwala',28),(2195,'Barnala',28),(2196,'Batala',28),(2197,'Begowal',28),(2198,'Bhadaur',28),(2199,'Bhawanigarh',28),(2200,'Bhikhi',28),(2201,'Bhikhiwind',28),(2202,'Budhlada',28),(2203,'Cheema',28),(2204,'Dera Baba Nanak',28),(2205,'Dhanaula',28),(2206,'Dharamkot',28),(2207,'Dhariwal',28),(2208,'Dhilwan',28),(2209,'Dhuri',28),(2210,'Dina Nagar',28),(2211,'Dirba',28),(2213,'Fatehgarh Churian',28),(2214,'Ghagga',28),(2215,'Ghanaur',28),(2216,'Gidderbaha',28),(2217,'Goraya',28),(2218,'Hariana',28),(2219,'Jaitu',28),(2220,'Jalalabad',28),(2221,'Jandiala',28),(2222,'Kalanaur',28),(2223,'Kartarpur',28),(2224,'Kharar',28),(2225,'Khem Karan',28),(2226,'Kurali',28),(2227,'Lehragaga',28),(2228,'Machhiwara',28),(2229,'Mahilpur',28),(2230,'Majitha',28),(2231,'Makhu',28),(2232,'Malerkotla',28),(2233,'Morinda',28),(2234,'Mukerian',28),(2235,'Nabha',28),(2236,'Nakodar',28),(2237,'Nangal',28),(2238,'Patti',28),(2239,'Payal',28),(2240,'Phillaur',28),(2241,'Qadian',28),(2242,'Rahon',28),(2243,'Raikot',28),(2244,'Rajpura',28),(2245,'Raman',28),(2246,'Rampura Phul',28),(2247,'Samana',28),(2248,'Samrala',28),(2249,'Sanaur',28),(2250,'Sangat',28),(2251,'Sardulgarh',28),(2252,'Shahkot',28),(2253,'Sri Hargobindpur',28),(2254,'Sujanpur',28),(2255,'Sultanpur Lodhi',28),(2256,'Sunam',28),(2257,'Talwandi Bhai',28),(2258,'Zira',28),(2259,'Aklera',29),(2260,'Anupgarh',29),(2261,'Asind',29),(2262,'Bagru',29),(2263,'Bakani',29),(2264,'Bali',29),(2265,'Balotra',29),(2266,'Bandikui',29),(2267,'Bari Sadri',29),(2268,'Bayana',29),(2269,'Beawar',29),(2270,'Begun',29),(2271,'Bhawani Mandi',29),(2272,'Bhinder',29),(2273,'Bhusawar',29),(2274,'Bidasar',29),(2275,'Bilara',29),(2276,'Bissau',29),(2277,'Chaksu',29),(2278,'Chechat',29),(2279,'Chhabra',29),(2280,'Chhapar',29),(2281,'Chhoti Sadri',29),(2282,'Chirawa',29),(2283,'Chomu',29),(2284,'Deeg',29),(2285,'Deoli',29),(2286,'Dhariawad',29),(2287,'Didwana',29),(2288,'Gajsinghpur',29),(2289,'Galiakot',29),(2290,'Gulabpura',29),(2291,'Hindaun',29),(2292,'Jahazpur',29),(2293,'Jobner',29),(2294,'Kaman',29),(2295,'Kapasan',29),(2296,'Karanpur',29),(2297,'Kekri',29),(2298,'Keshoraipatan',29),(2299,'Khairthal',29),(2300,'Khandela',29),(2301,'Kherli',29),(2302,'Kishangarh',29),(2303,'Kishangarh Renwal',29),(2304,'Kotputli',29),(2305,'Kuchera',29),(2306,'Kumher',29),(2307,'Kushalgarh',29),(2308,'Lakheri',29),(2309,'Lalsot',29),(2310,'Losal',29),(2311,'Mahu Kalan',29),(2312,'Mahwa',29),(2313,'Makrana',29),(2314,'Malpura',29),(2315,'Mandalgarh',29),(2316,'Mandawa',29),(2317,'Manohar Thana',29),(2318,'Merta City',29),(2319,'Mukandgarh',29),(2320,'Nadbai',29),(2321,'Nasirabad',29),(2322,'Nathdwara',29),(2323,'Nawalgarh',29),(2324,'Nimbahera',29),(2325,'Nohar',29),(2326,'Nokha',29),(2327,'Padampur',29),(2328,'Parbatsar',29),(2329,'Phalodi',29),(2330,'Pilibanga',29),(2331,'Pindwara',29),(2332,'Pirawa',29),(2333,'Pokaran',29),(2334,'Pushkar',29),(2335,'Raisinghnagar',29),(2336,'Rajakhera',29),(2337,'Rajaldesar',29),(2338,'Ramganj Mandi',29),(2339,'Rani',29),(2340,'Ratangarh',29),(2341,'Ratannagar',29),(2342,'Sadri',29),(2343,'Sadulshahar',29),(2344,'Sagwara',29),(2345,'Salumbar',29),(2346,'Sanchore',29),(2347,'Sangod',29),(2348,'Sardarshahar',29),(2349,'Sarwar',29),(2350,'Shahpura',29),(2351,'Sheoganj',29),(2354,'Sri Madhopur',29),(2355,'Sujangarh',29),(2356,'Suket',29),(2357,'Sumerpur',29),(2358,'Surajgarh',29),(2359,'Suratgarh',29),(2360,'Swaimadhopur',29),(2361,'Taranagar',29),(2362,'Tijara',29),(2363,'Udaipurwati',29),(2364,'Uniara',29),(2365,'Viratnagar',29),(2366,'Weir',29),(2367,'Talwandi Bhai',30),(2368,'Chisopani',30),(2369,'Gyalshing',30),(2370,'Mangan',30),(2371,'Namchi',30),(2372,'Nayabazar',30),(2373,'Rangpo',30),(2374,'Singtam',30),(2375,'Abiramam',31),(2376,'Acharapakkam',31),(2377,'Alandur',31),(2378,'Alanganallur',31),(2379,'Alangayam',31),(2380,'Alangudi',31),(2381,'Alangulam',31),(2382,'Alapakkam',31),(2383,'Ambasamudram',31),(2384,'Ambur',31),(2385,'Ammavarikuppam',31),(2386,'Ammoor',31),(2387,'Anaiyur',31),(2388,'Anakaputhur',31),(2389,'Annavasal',31),(2390,'Anthiyur',31),(2391,'Arakandanallur',31),(2392,'Aravakurichi',31),(2393,'Arimalam',31),(2394,'Ariyalur',31),(2395,'Ariyur',31),(2396,'Arumbavur',31),(2397,'Arumuganeri',31),(2398,'Athani',31),(2399,'Athanur',31),(2400,'Attayampatti',31),(2401,'Attur',31),(2402,'Avanashi',31),(2403,'Avaniapuram',31),(2404,'Ayakudi',31),(2405,'Ayyalur',31),(2406,'Ayyampalayam',31),(2407,'Ayyampettai',31),(2408,'Balasamudram',31),(2409,'Batlagundu',31),(2410,'Bhavanisagar',31),(2411,'Bhuvanagiri',31),(2412,'Chengam',31),(2414,'Chennasamudram',31),(2415,'Chennimalai',31),(2416,'Chettipalayam',31),(2417,'Chinnalapatti',31),(2418,'Chinnamanur',31),(2419,'Chinnasalem',31),(2420,'Chitlapakkam',31),(2421,'Desur',31),(2422,'Devadanapatti',31),(2423,'Devarshola',31),(2424,'Dusi',31),(2425,'Elathur',31),(2426,'Elayirampannai',31),(2427,'Eral',31),(2428,'Ganapathipuram',31),(2429,'Gangaikondan',31),(2430,'Gangavalli',31),(2431,'Gingee',31),(2432,'Harur',31),(2433,'Highways',31),(2434,'Ilanji',31),(2435,'Irugur',31),(2436,'Jagathala',31),(2437,'Jambai',31),(2438,'Kadambur',31),(2439,'Kadathur',31),(2440,'Kalambur',31),(2441,'Kalappanaickenpatti',31),(2442,'Kalavai',31),(2443,'Kallakudi',31),(2444,'Kalugumalai',31),(2445,'Kamayagoundanpatti',31),(2446,'Kambainallur',31),(2447,'Kanadukathan',31),(2448,'Kanam',31),(2449,'Kandanur',31),(2450,'Kangayampalayam',31),(2451,'Kaniyur',31),(2452,'Kanjikoil',31),(2453,'Kannamangalam',31),(2454,'Kannampalayam',31),(2455,'Kannankurichi',31),(2456,'Kannivadi',31),(2457,'Karamadai',31),(2458,'Karuppur',31),(2459,'Katpadi',31),(2460,'Kattumannarkoil',31),(2461,'Keeramangalam',31),(2462,'Killiyur',31),(2463,'Kilpennathur',31),(2464,'Kilvelur',31),(2465,'Kinathukadavu',31),(2466,'Kodaikanal',31),(2467,'Kodavasal',31),(2468,'Kodumudi',31),(2469,'Kolathupalayam',31),(2470,'Kolathur',31),(2471,'Komaralingam',31),(2472,'Kombai',31),(2473,'Konavattam',31),(2474,'Kondalampatti',31),(2475,'Konganapuram',31),(2476,'Koradacheri',31),(2477,'Kotagiri',31),(2478,'Kottaiyur',31),(2479,'Kottakuppam',31),(2480,'Kottaram',31),(2481,'Kottur',31),(2482,'Kovilpalayam',31),(2483,'Kovilpatti',31),(2484,'Krishnarayapuram',31),(2485,'Kulasekarapuram',31),(2486,'Kuniyamuthur',31),(2487,'Kurinjipadi',31),(2488,'Kurudampalayam',31),(2489,'Kurumbalur',31),(2490,'Labbaikudikadu',31),(2491,'Lalgudi',31),(2492,'Lalpet',31),(2493,'Madathukulam',31),(2494,'Madukkarai',31),(2495,'Madukkur',31),(2496,'Maduravoyal',31),(2497,'Mallasamudram',31),(2498,'Mamallapuram',31),(2499,'Manachanallur',31),(2500,'Manali',31),(2501,'Manalmedu',31),(2502,'Manalurpet',31),(2503,'Manavalakurichi',31),(2504,'Mandapam',31),(2505,'Mangadu',31),(2506,'Mangalam',31),(2507,'Maraimalainagar',31),(2508,'Marandahalli',31),(2509,'Marudur',31),(2510,'Mecheri',31),(2511,'Melagaram',31),(2512,'Melattur',31),(2513,'Mettupalayam',31),(2514,'Mettur',31),(2515,'Minjur',31),(2516,'Modakurichi',31),(2517,'Mohanur',31),(2518,'Mudukulathur',31),(2519,'Mukkudal',31),(2520,'Mulanur',31),(2521,'Muthur',31),(2522,'Naduvattam',31),(2523,'Nallur',31),(2524,'Nambiyur',31),(2525,'Nangavalli',31),(2526,'Nanguneri',31),(2527,'Nannilam',31),(2528,'Naranapuram',31),(2529,'Narasingapuram',31),(2530,'Nasiyanur',31),(2531,'Nattarasankottai',31),(2532,'Nellikuppam',31),(2533,'Nerkuppai',31),(2534,'Neyveli',31),(2535,'Oddanchatram',31),(2536,'Olagadam',31),(2537,'Omalur',31),(2538,'Othakadai',31),(2539,'Othakalmandapam',31),(2540,'Pacode',31),(2541,'Padaiveedu',31),(2542,'Padianallur',31),(2543,'Padmanabhapuram',31),(2544,'Palavakkam',31),(2545,'Palayam',31),(2546,'Palladam',31),(2547,'Pallapatti',31),(2548,'Pallathur',31),(2549,'Pallikonda',31),(2550,'Pallipattu',31),(2551,'Pammal',31),(2552,'Panagudi',31),(2553,'Panapakkam',31),(2554,'Pannaikadu',31),(2555,'Pannaipuram',31),(2556,'Panruti',31),(2557,'Pappireddipatti',31),(2558,'Paramathi',31),(2559,'Parangipettai',31),(2560,'Paravai',31),(2561,'Pasur',31),(2562,'Pennadam',31),(2563,'Pennagaram',31),(2564,'Pennathur',31),(2565,'Peraiyur',31),(2566,'Peralam',31),(2567,'Periyakulam',31),(2568,'Perungudi',31),(2569,'Perungulam',31),(2570,'Perur',31),(2571,'Polichalur',31),(2572,'Polur',31),(2573,'Ponneri',31),(2574,'Poolambadi',31),(2575,'Poolampatti',31),(2576,'Porur',31),(2577,'Pudupalayam',31),(2578,'Pudupatti',31),(2579,'Puthalam',31),(2580,'Puvalur',31),(2581,'Rajapalayam',31),(2582,'Ramapuram',31),(2583,'Rameswaram',31),(2584,'Rasipuram',31),(2585,'Samathur',31),(2586,'Sankarapuram',31),(2587,'Sattur',31),(2588,'Sayalgudi',31),(2589,'Seithur',31),(2590,'Sembakkam',31),(2591,'Sevugampatti',31),(2592,'Shenbakkam',31),(2593,'Sholur',31),(2594,'Singampuneri',31),(2595,'Sirumugai',31),(2596,'Sithayankottai',31),(2597,'Sivagiri',31),(2598,'Srimushnam',31),(2599,'Sriperumbudur',31),(2600,'Suchindram',31),(2601,'Sundarapandiam',31),(2602,'Surampatti',31),(2603,'Surandai',31),(2604,'Tambaram',31),(2605,'Thamaraikulam',31),(2606,'Thammampatti',31),(2607,'Tharamangalam',31),(2608,'Thenthiruperai',31),(2609,'Thorapadi',31),(2610,'Thuthipattu',31),(2611,'Timiri',31),(2613,'Tirupur',31),(2614,'Tiruttani',31),(2615,'Tiruverkadu',31),(2616,'Tiruvottiyur',31),(2617,'Uppidamangalam',31),(2618,'Uthagamandalam',31),(2619,'Uthamapalayam',31),(2620,'Uthiramerur',31),(2621,'Vadamadurai',31),(2622,'Vadipatti',31),(2623,'Vadugapatti',31),(2624,'Vallam',31),(2625,'Valparai',31),(2626,'Vandalur',31),(2627,'Vasudevanallur',31),(2628,'Vedasandur',31),(2629,'Veerapandi',31),(2630,'Vellakoil',31),(2631,'Vellalur',31),(2632,'Velur',31),(2633,'Veppathur',31),(2634,'Vettaikaranpudur',31),(2635,'Vettavalam',31),(2636,'Vikramasingapuram',31),(2637,'Vikravandi',31),(2638,'Vilapakkam',31),(2639,'Vilathikulam',31),(2640,'Villukuri',31),(2641,'Viswanatham',31),(2642,'Walajabad',31),(2643,'Walajapet',31),(2644,'Wellington',31),(2645,'Amarpur',32),(2646,'Badarghat',32),(2647,'Beloniya',32),(2648,'Dharma Nagar',32),(2649,'Jogendranagar',32),(2650,'Kanchanpur',32),(2651,'Khowai',32),(2652,'Kumarghat',32),(2653,'Kunjaban',32),(2654,'Ranirbazar',32),(2655,'Sabroom',32),(2656,'Teliamura',32),(2657,'Ambassa',32),(2658,'Udaipur',32),(2659,'Adheriya Khal',33),(2660,'Adibadri',33),(2661,'Agustmuni',33),(2662,'Badrinath',33),(2663,'Bhimtal',33),(2664,'Bhirgukhal',33),(2665,'Bhowali',33),(2666,'Bughani',33),(2667,'Chakisain',33),(2668,'Chakrata',33),(2669,'Chelusain',33),(2670,'Chipalghat',33),(2671,'Dehal Chauri',33),(2672,'Dev Rajkhal',33),(2673,'Devidhura',33),(2674,'Devprayag',33),(2675,'Dharasoo',33),(2676,'Didihat',33),(2677,'Dineshpur',33),(2678,'Doiwala',33),(2679,'Dugadd',33),(2680,'Dukharkhal',33),(2681,'Dwarahat',33),(2682,'Dwarikhal',33),(2683,'Ekeshwar',33),(2684,'Gadarpur',33),(2685,'Gairsain',33),(2686,'Gauchar',33),(2687,'Gokulnagar',33),(2688,'Gopeshwar',33),(2689,'Guptakashi',33),(2690,'Gwaldam',33),(2691,'Haldwani',33),(2692,'Herbertpur',33),(2693,'Jakhani',33),(2694,'Jaspur',33),(2695,'Joshimath',33),(2696,'Kaladhungi',33),(2697,'Kalagarh',33),(2698,'Kaljikhal',33),(2699,'Kanda Khal',33),(2700,'Kanskhet',33),(2701,'Karan Prayag',33),(2702,'Kashipur',33),(2703,'Kausani',33),(2704,'Khatima',33),(2705,'Khirshn',33),(2706,'Kichha',33),(2707,'Kotdwar',33),(2708,'Kotdwara',33),(2709,'Lansdowne',33),(2710,'Lohaghat',33),(2711,'Maithana',33),(2712,'Mawadhar',33),(2713,'Munsiari',33),(2714,'Mussoorie',33),(2715,'Nainidada',33),(2716,'Naithana',33),(2717,'Nand Prayag',33),(2718,'Naugaon Khal',33),(2719,'Okhimath',33),(2720,'Pabua',33),(2721,'Paidul',33),(2722,'Parsundakhal',33),(2723,'Pattisain',33),(2724,'Paukhal',33),(2725,'Pipalkoti',33),(2726,'Porhra',33),(2727,'Raipur',33),(2728,'Raiwala',33),(2729,'Ram Nagar',33),(2730,'Ramgarh',33),(2731,'Rikhani Khal',33),(2732,'Rishikesh',33),(2733,'Rithakhal',33),(2734,'Rudrapur',33),(2735,'Satpuri',33),(2736,'Sillogl',33),(2737,'Sittarganj',33),(2738,'Toli',33),(2739,'Topowan',33),(2740,'Vedikhal',33),(2741,'Vikas Nagar',33),(2742,'Afzalgarh',34),(2743,'Ahraura',34),(2744,'Ailum',34),(2745,'Akbarpur',34),(2746,'Aliganj',34),(2747,'Amanpur',34),(2748,'Ambehta',34),(2749,'Amethi',34),(2750,'Amila',34),(2751,'Amilo',34),(2752,'Aminagar Sarai',34),(2753,'Amraudha',34),(2754,'Amroha',34),(2755,'Antu',34),(2756,'Anupshahr',34),(2757,'Aonla',34),(2758,'Armapur Estate',34),(2759,'Atrauli',34),(2760,'Atraulia',34),(2761,'Aurangabad',34),(2762,'Awagarh',34),(2763,'Ayodhya',34),(2764,'Baberu',34),(2765,'Babina',34),(2766,'Babrala',34),(2767,'Babugarh',34),(2768,'Bachhrawan',34),(2769,'Badaun',34),(2770,'Bah',34),(2771,'Bahadurganj',34),(2772,'Baheri',34),(2773,'Bahjoi',34),(2774,'Bajna',34),(2775,'Bakewar',34),(2776,'Baldeo',34),(2777,'Bangarmau',34),(2778,'Banki',34),(2779,'Bansdih',34),(2780,'Bansgaon',34),(2781,'Bansi',34),(2783,'Baragaon',34),(2784,'Baraut',34),(2785,'Barhalganj',34),(2786,'Barkhera',34),(2787,'Barsana',34),(2788,'Beniganj',34),(2789,'Bewar',34),(2790,'Bhagwant Nagar',34),(2791,'Bharatganj',34),(2792,'Bharthana',34),(2793,'Bharwari',34),(2794,'Bhinga',34),(2795,'Bhogaon',34),(2796,'Bidhuna',34),(2797,'Bijnor',34),(2798,'Bikapur',34),(2799,'Bilari',34),(2800,'Bilaspur',34),(2801,'Bilgram',34),(2802,'Bilsanda',34),(2803,'Bilsi',34),(2804,'Bindki',34),(2805,'Bisalpur',34),(2806,'Bisauli',34),(2807,'Biswan',34),(2808,'Bithoor',34),(2809,'Budhana',34),(2810,'Bugrasi',34),(2811,'Chail',34),(2812,'Chakia',34),(2813,'Chandausi',34),(2814,'Chandpur',34),(2815,'Chhaprauli',34),(2816,'Chhibramau',34),(2817,'Chopan',34),(2818,'Chunar',34),(2819,'Colonelganj',34),(2820,'Dadri',34),(2821,'Dalmau',34),(2822,'Dankaur',34),(2823,'Dataganj',34),(2824,'Daurala',34),(2825,'Dayalbagh',34),(2826,'Deoband',34),(2827,'Dewa',34),(2828,'Dhampur',34),(2829,'Dibai',34),(2830,'Dostpur',34),(2831,'Dudhi',34),(2832,'Ekdil',34),(2833,'Erich',34),(2835,'Faridpur',34),(2836,'Fatehabad',34),(2837,'Fatehgarh',34),(2838,'Fatehpur Sikri',34),(2839,'Gajraula',34),(2840,'Gangaghat',34),(2841,'Gangapur',34),(2842,'Gangoh',34),(2843,'Garautha',34),(2844,'Gauri Bazar',34),(2845,'Gausganj',34),(2846,'Ghatampur',34),(2847,'Ghorawal',34),(2848,'Ghosi',34),(2849,'Gokul',34),(2850,'Gola Bazar',34),(2851,'Gopamau',34),(2852,'Gopiganj',34),(2853,'Gunnaur',34),(2854,'Gursahaiganj',34),(2855,'Gursarai',34),(2856,'Gyanpur',34),(2857,'Haidergarh',34),(2858,'Haldaur',34),(2859,'Handia',34),(2860,'Hapur',34),(2861,'Harduaganj',34),(2862,'Hariharpur',34),(2863,'Harraiya',34),(2864,'Hasanpur',34),(2865,'Hasayan',34),(2866,'Hastinapur',34),(2867,'Hata',34),(2868,'Iglas',34),(2869,'Ikauna',34),(2870,'Jahangirabad',34),(2871,'Jahangirpur',34),(2872,'Jais',34),(2873,'Jalalabad',34),(2874,'Jalalpur',34),(2875,'Jalaun',34),(2876,'Jarwal',34),(2877,'Jasrana',34),(2878,'Jaswantnagar',34),(2879,'Jewar',34),(2880,'Jhalu',34),(2881,'Jhinjhak',34),(2882,'Jhinjhana',34),(2883,'Jhusi',34),(2884,'Joya',34),(2885,'Kadipur',34),(2886,'Kairana',34),(2887,'Kakrala',34),(2888,'Kalpi',34),(2889,'Kamalganj',34),(2890,'Kanth',34),(2891,'Karari',34),(2892,'Karhal',34),(2893,'Kasganj',34),(2894,'Katra',34),(2895,'Kauriaganj',34),(2896,'Khadda',34),(2897,'Khaga',34),(2898,'Khair',34),(2899,'Khairabad',34),(2900,'Khalilabad',34),(2901,'Khamaria',34),(2902,'Khanpur',34),(2903,'Kharela',34),(2904,'Khatauli',34),(2905,'Khudaganj',34),(2906,'Khurja',34),(2907,'Khutar',34),(2908,'Kiratpur',34),(2909,'Kishni',34),(2910,'Konch',34),(2911,'Kopaganj',34),(2912,'Kunda',34),(2913,'Kundarki',34),(2914,'Kuraoli',34),(2915,'Kurara',34),(2916,'Kushinagar',34),(2917,'Kusmara',34),(2918,'Laharpur',34),(2919,'Lakhna',34),(2920,'Lalganj',34),(2921,'Lar',34),(2922,'Loni',34),(2923,'Madhoganj',34),(2924,'Madhogarh',34),(2925,'Maghar',34),(2926,'Mahaban',34),(2928,'Maholi',34),(2929,'Mailani',34),(2930,'Majhauli Raj',34),(2931,'Malihabad',34),(2932,'Mallawan',34),(2933,'Mandawar',34),(2934,'Manikpur',34),(2935,'Marehra',34),(2936,'Mariahu',34),(2937,'Mauranipur',34),(2938,'Maurawan',34),(2939,'Mawana',34),(2940,'Mehdawal',34),(2941,'Mehnagar',34),(2942,'Mirganj',34),(2943,'Mohammadabad',34),(2944,'Mohammadi',34),(2945,'Mohan',34),(2946,'Mohiuddinpur',34),(2947,'Moth',34),(2948,'Mubarakpur',34),(2949,'Muradnagar',34),(2950,'Mursan',34),(2951,'Musafirkhana',34),(2952,'Nadigaon',34),(2953,'Nagina',34),(2954,'Nagram',34),(2955,'Nai Bazar',34),(2956,'Najibabad',34),(2957,'Nakur',34),(2958,'Nanauta',34),(2959,'Nanpara',34),(2960,'Naraini',34),(2961,'Narauli',34),(2962,'Nawabganj',34),(2963,'Nichlaul',34),(2964,'Nizamabad',34),(2965,'Obra',34),(2966,'Orai',34),(2967,'Pachperwa',34),(2968,'Padrauna',34),(2969,'Pahasu',34),(2970,'Pali',34),(2971,'Patti',34),(2972,'Phulpur',34),(2973,'Pihani',34),(2974,'Pilkhana',34),(2975,'Pilkhuwa',34),(2976,'Pinahat',34),(2977,'Pratapgarh City',34),(2978,'Pukhrayan',34),(2979,'Puranpur',34),(2980,'Purwa',34),(2981,'Radhakund',34),(2982,'Raibareilly',34),(2983,'Rajapur',34),(2984,'Ramkola',34),(2985,'Ramnagar',34),(2986,'Rampura',34),(2987,'Ranipur',34),(2988,'Rasra',34),(2989,'Rasulabad',34),(2990,'Raya',34),(2991,'Reoti',34),(2992,'Rudrapur',34),(2993,'Rura',34),(2994,'Sadabad',34),(2995,'Sadat',34),(2996,'Safipur',34),(2997,'Sahanpur',34),(2998,'Sahaspur',34),(2999,'Sahaswan',34),(3000,'Sahatwar',34),(3001,'Sahawar',34),(3002,'Sahjanwa',34),(3003,'Saidpur',34),(3004,'Salempur',34),(3005,'Salon',34),(3006,'Sambhal',34),(3007,'Samthar',34),(3008,'Sandi',34),(3009,'Sandila',34),(3010,'Sarai Mir',34),(3011,'Sasni',34),(3012,'Satrikh',34),(3013,'Saurikh',34),(3014,'Seohara',34),(3015,'Shahabad',34),(3016,'Shahganj',34),(3017,'Shahi',34),(3018,'Shahpur',34),(3019,'Shamli',34),(3020,'Shankargarh',34),(3021,'Shergarh',34),(3022,'Sherkot',34),(3023,'Shikarpur',34),(3024,'Shikohabad',34),(3025,'Sikanderpur',34),(3026,'Sikandra',34),(3027,'Sikandrabad',34),(3028,'Sirathu',34),(3029,'Sirsaganj',34),(3030,'Sirsi',34),(3031,'Sisauli',34),(3032,'Suar',34),(3034,'Suriyawan',34),(3035,'Talbehat',34),(3036,'Talgram',34),(3037,'Tanda',34),(3038,'Tetri Bazar',34),(3039,'Thakurdwara',34),(3040,'Thana Bhawan',34),(3041,'Tilhar',34),(3042,'Tindwari',34),(3043,'Tulsipur',34),(3044,'Tundla',34),(3045,'Ujhani',34),(3046,'Ujhari',34),(3047,'Umri',34),(3048,'Un',34),(3049,'Usawan',34),(3050,'Usehat',34),(3051,'Utraula',34),(3052,'Wazirganj',34),(3053,'Zaidpur',34),(3054,'Zamania',34),(3055,'Adheriya Khal',35),(3056,'Adra',35),(3057,'Aiho',35),(3058,'Alipore',35),(3059,'Alipurduar',35),(3060,'Amtala',35),(3061,'Aurangabad',35),(3062,'Baduria',35),(3063,'Bagnan',35),(3064,'Bahula',35),(3065,'Balichak',35),(3066,'Ballavpur',35),(3067,'Bally',35),(3068,'Balurghat',35),(3069,'Bansberia',35),(3070,'Baranagar',35),(3071,'Barasat',35),(3072,'Barast',35),(3073,'Begampur',35),(3074,'Beliatore',35),(3075,'Berhampore',35),(3076,'Bhadreswar',35),(3077,'Bidhan Nagar',35),(3078,'Birlapur',35),(3079,'Bishnupur',35),(3080,'Bolpur',35),(3081,'Bowali',35),(3082,'Budge Budge',35),(3083,'Canning - II',35),(3084,'Chakdaha',35),(3085,'Champdani',35),(3086,'Chinsurah',35),(3087,'Chittaranjan',35),(3088,'Dainhat',35),(3089,'Debipur',35),(3090,'Dhakuria',35),(3091,'Dhandadihi',35),(3092,'Dhatrigram',35),(3093,'Dhulian',35),(3094,'Dinhata',35),(3095,'Domjur',35),(3096,'Dubrajpur',35),(3097,'Egra',35),(3098,'English Bazar',35),(3099,'Falakata',35),(3100,'Gairkata',35),(3101,'Gangarampur',35),(3102,'Ghatal',35),(3103,'Ghorsala',35),(3104,'Goaljan',35),(3105,'Gobardanga',35),(3106,'Gopinathpur',35),(3107,'Haldia',35),(3108,'Haldibari',35),(3109,'Halisahar',35),(3110,'Haripur',35),(3111,'Islampur',35),(3112,'Jangipur',35),(3113,'Jhalda',35),(3114,'Kalimpong',35),(3115,'Kalna',35),(3116,'Kamarhati',35),(3117,'Kanaipur',35),(3118,'Kanchrapara',35),(3119,'Karimpur',35),(3120,'Kasba',35),(3121,'Kendua',35),(3122,'Kharar',35),(3123,'Koch Bihar',35),(3124,'Kolaghat',35),(3125,'Konnagar',35),(3126,'Krishnagar',35),(3127,'Krishnapur',35),(3128,'Kulti',35),(3129,'Kurseong',35),(3130,'Madanpur',35),(3131,'Maslandapur',35),(3132,'Mathabhanga',35),(3133,'Medinipur',35),(3134,'Mekliganj',35),(3135,'Memari',35),(3136,'Mirik',35),(3137,'Nabagram',35),(3138,'Naihati',35),(3139,'Nasra',35),(3140,'Natibpur',35),(3141,'Panchla',35),(3142,'Pandua',35),(3143,'Panihati',35),(3144,'Panuhat',35),(3145,'Raghunathpur',35),(3146,'Raiganj',35),(3147,'Raigung',35),(3148,'Rajarhat Gopalpur',35),(3149,'Ramchandrapur',35),(3150,'Ramjibanpur',35),(3151,'Ramnagar',35),(3152,'Rishra',35),(3153,'Sahapur',35),(3154,'Sainthia',35),(3155,'Sankrail',35),(3156,'Santipur',35),(3157,'Santoshpur',35),(3158,'Sarenga',35),(3159,'Simla',35),(3160,'Singur',35),(3161,'Sonamukhi',35),(3162,'Suri',35),(3163,'Taherpur',35),(3164,'Taki',35),(3165,'Titagarh',35),(3166,'Ukhra',35),(3167,'Uluberia',35),(3168,'West Dinajpur',35),(3169,'Chikkaballapur',17),(3170,'Kasaragod',18),(3171,'24 Parganas',35),(3173,'24 Parganas',35),(3174,'Mumbai',3);
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
  KEY `student_mooc_person_469f723e` (`state_id`),
  KEY `student_mooc_person_586a73b5` (`city_id`),
  CONSTRAINT `city_id_refs_id_c027bc9` FOREIGN KEY (`city_id`) REFERENCES `student_mooc_city` (`id`),
  CONSTRAINT `state_id_refs_id_79a8e574` FOREIGN KEY (`state_id`) REFERENCES `student_mooc_state` (`id`),
  CONSTRAINT `user_id_refs_id_86fec23` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_mooc_person`
--

LOCK TABLES `student_mooc_person` WRITE;
/*!40000 ALTER TABLE `student_mooc_person` DISABLE KEYS */;
INSERT INTO `student_mooc_person` VALUES (2,3,2,18,400076,NULL),(5,7,3,3174,453453,354634646346),(6,8,3,3174,453453,354634646346),(7,9,3,3174,453453,354634646346),(8,11,3,3174,453453,354634646346),(9,12,3,3174,453453,354634646346);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_mooc_state`
--

LOCK TABLES `student_mooc_state` WRITE;
/*!40000 ALTER TABLE `student_mooc_state` DISABLE KEYS */;
INSERT INTO `student_mooc_state` VALUES (1,'Andaman and Nicobar islands'),(2,'Andhra Pradesh'),(3,'Arunachal Pradesh'),(4,'Assam'),(5,'Bihar'),(6,'Chandigarh'),(7,'Chattisgarh'),(8,'Dadra and Nagar Haveli'),(9,'Daman and Diu'),(10,'Delhi'),(11,'Goa'),(12,'Gujarat'),(13,'Haryana'),(14,'Himachal Pradesh'),(15,'Jammu and Kashmir'),(16,'Jharkhand'),(17,'Karnataka'),(18,'Kerala'),(19,'Lakshadweep'),(20,'Madhya Pradesh'),(21,'Maharashtra'),(22,'Manipur'),(23,'Meghalaya'),(24,'Mizoram'),(25,'Nagaland'),(26,'Orissa'),(27,'Pondicherry'),(28,'Punjab'),(29,'Rajasthan'),(30,'Sikkim'),(31,'Tamil Nadu'),(36,'Telangana'),(32,'Tripura'),(34,'Uttar Pradesh'),(33,'Uttarakhand'),(35,'West Bengal');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userpreference`
--

LOCK TABLES `user_api_userpreference` WRITE;
/*!40000 ALTER TABLE `user_api_userpreference` DISABLE KEYS */;
INSERT INTO `user_api_userpreference` VALUES (2,3,'pref-lang','en'),(5,7,'pref-lang','en'),(6,8,'pref-lang','en'),(7,9,'pref-lang','en'),(8,11,'pref-lang','en'),(9,12,'pref-lang','en');
/*!40000 ALTER TABLE `user_api_userpreference` ENABLE KEYS */;
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
  `window_id` int(11),
  `display` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_softwaresecurephotoverification_403f60f` (`user_id`),
  KEY `verify_student_softwaresecurephotoverification_78ec3aab` (`receipt_id`),
  KEY `verify_student_softwaresecurephotoverification_3b1c9c31` (`created_at`),
  KEY `verify_student_softwaresecurephotoverification_7b0821a` (`updated_at`),
  KEY `verify_student_softwaresecurephotoverification_4452d192` (`submitted_at`),
  KEY `verify_student_softwaresecurephotoverification_4d3e9a4c` (`reviewing_user_id`),
  KEY `verify_student_softwaresecurephotoverification_7343ffda` (`window_id`),
  KEY `verify_student_softwaresecurephotoverification_35eebcb6` (`display`),
  CONSTRAINT `reviewing_user_id_refs_id_2915bdf9` FOREIGN KEY (`reviewing_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_id_refs_id_2915bdf9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `window_id_refs_id_3170c76` FOREIGN KEY (`window_id`) REFERENCES `reverification_midcoursereverificationwindow` (`id`)
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
  `article_id` int(11) NOT NULL DEFAULT '1',
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-19 20:27:37
