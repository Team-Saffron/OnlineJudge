-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: OnlineJudge
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `JudgeSystem_blogpost`
--

DROP TABLE IF EXISTS `JudgeSystem_blogpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JudgeSystem_blogpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `heading` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  `addedby_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `JudgeSystem_blogpost_4343ea3e` (`addedby_id`),
  CONSTRAINT `JudgeSy_addedby_id_e3b875c4_fk_JudgeSystem_judgeuser_user_ptr_id` FOREIGN KEY (`addedby_id`) REFERENCES `JudgeSystem_judgeuser` (`user_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JudgeSystem_blogpost`
--

LOCK TABLES `JudgeSystem_blogpost` WRITE;
/*!40000 ALTER TABLE `JudgeSystem_blogpost` DISABLE KEYS */;
INSERT INTO `JudgeSystem_blogpost` VALUES (1,'FAMILY - Family','','2016-04-22 20:29:42',1),(2,'INTERVAL - Intervals','','2016-04-22 20:29:44',1),(3,'RHOMBS - Rhombs','','2016-04-22 20:29:45',1),(4,'SERVERS - Servers','','2016-04-22 20:29:47',1),(5,'SOLIT - Solitaire','','2016-04-22 20:29:49',1),(6,'TTABLE - Timetable','','2016-04-22 20:29:50',1),(7,'STEVE - Voracious Steve','','2016-04-22 20:29:52',1),(8,'RENT - Rent your airplane and make money','','2016-04-22 20:29:56',1),(9,'SQDANCE - Square dance','','2016-04-22 20:30:02',1),(10,'HELPR2D2 - Help R2-D2!','','2016-04-22 20:30:04',1),(11,'HelloWorld','','2016-04-29 07:46:28',1);
/*!40000 ALTER TABLE `JudgeSystem_blogpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JudgeSystem_blogpost_tags`
--

DROP TABLE IF EXISTS `JudgeSystem_blogpost_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JudgeSystem_blogpost_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogpost_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `JudgeSystem_blogpost_tags_blogpost_id_4769b136_uniq` (`blogpost_id`,`tag_id`),
  KEY `JudgeSystem_blogpost_tags_tag_id_7621058f_fk_JudgeSystem_tag_id` (`tag_id`),
  CONSTRAINT `JudgeSystem_blogpost_tags_tag_id_7621058f_fk_JudgeSystem_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `JudgeSystem_tag` (`id`),
  CONSTRAINT `JudgeSystem_blog_blogpost_id_33f98a25_fk_JudgeSystem_blogpost_id` FOREIGN KEY (`blogpost_id`) REFERENCES `JudgeSystem_blogpost` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JudgeSystem_blogpost_tags`
--

LOCK TABLES `JudgeSystem_blogpost_tags` WRITE;
/*!40000 ALTER TABLE `JudgeSystem_blogpost_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `JudgeSystem_blogpost_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JudgeSystem_comment`
--

DROP TABLE IF EXISTS `JudgeSystem_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JudgeSystem_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  `addedby_id` int(11) NOT NULL,
  `blogpost_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `JudgeSystem_comment_4343ea3e` (`addedby_id`),
  KEY `JudgeSystem_comment_53a0aca2` (`blogpost_id`),
  CONSTRAINT `JudgeSystem_comm_blogpost_id_0411d243_fk_JudgeSystem_blogpost_id` FOREIGN KEY (`blogpost_id`) REFERENCES `JudgeSystem_blogpost` (`id`),
  CONSTRAINT `JudgeSy_addedby_id_62bdf8bf_fk_JudgeSystem_judgeuser_user_ptr_id` FOREIGN KEY (`addedby_id`) REFERENCES `JudgeSystem_judgeuser` (`user_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JudgeSystem_comment`
--

LOCK TABLES `JudgeSystem_comment` WRITE;
/*!40000 ALTER TABLE `JudgeSystem_comment` DISABLE KEYS */;
INSERT INTO `JudgeSystem_comment` VALUES (3,'Hey! Can you help me','2016-04-22 15:01:21',1,1);
/*!40000 ALTER TABLE `JudgeSystem_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JudgeSystem_contest`
--

DROP TABLE IF EXISTS `JudgeSystem_contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JudgeSystem_contest` (
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `contest_id` varchar(100) NOT NULL,
  `administrator_id` int(11) NOT NULL,
  PRIMARY KEY (`contest_id`),
  KEY `JudgeSystem_contest_a68d6894` (`administrator_id`),
  CONSTRAINT `J_administrator_id_dad8099f_fk_JudgeSystem_judgeuser_user_ptr_id` FOREIGN KEY (`administrator_id`) REFERENCES `JudgeSystem_judgeuser` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JudgeSystem_contest`
--

LOCK TABLES `JudgeSystem_contest` WRITE;
/*!40000 ALTER TABLE `JudgeSystem_contest` DISABLE KEYS */;
INSERT INTO `JudgeSystem_contest` VALUES ('2016-04-27 09:30:00','2016-05-30 09:30:00',0,'BYTES',1),('2016-04-21 13:46:48','2019-10-10 13:47:03',0,'Practice',1);
/*!40000 ALTER TABLE `JudgeSystem_contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JudgeSystem_contest_user_list`
--

DROP TABLE IF EXISTS `JudgeSystem_contest_user_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JudgeSystem_contest_user_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contest_id` varchar(100) NOT NULL,
  `judgeuser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `JudgeSystem_contest_user_list_contest_id_beb695c7_uniq` (`contest_id`,`judgeuser_id`),
  KEY `Judge_judgeuser_id_8a3b390d_fk_JudgeSystem_judgeuser_user_ptr_id` (`judgeuser_id`),
  CONSTRAINT `JudgeSyste_contest_id_62ff88bc_fk_JudgeSystem_contest_contest_id` FOREIGN KEY (`contest_id`) REFERENCES `JudgeSystem_contest` (`contest_id`),
  CONSTRAINT `Judge_judgeuser_id_8a3b390d_fk_JudgeSystem_judgeuser_user_ptr_id` FOREIGN KEY (`judgeuser_id`) REFERENCES `JudgeSystem_judgeuser` (`user_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JudgeSystem_contest_user_list`
--

LOCK TABLES `JudgeSystem_contest_user_list` WRITE;
/*!40000 ALTER TABLE `JudgeSystem_contest_user_list` DISABLE KEYS */;
INSERT INTO `JudgeSystem_contest_user_list` VALUES (3,'BYTES',1),(1,'Practice',1),(2,'Practice',3);
/*!40000 ALTER TABLE `JudgeSystem_contest_user_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JudgeSystem_judgeuser`
--

DROP TABLE IF EXISTS `JudgeSystem_judgeuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JudgeSystem_judgeuser` (
  `user_ptr_id` int(11) NOT NULL,
  `WA_Count` int(11) NOT NULL,
  `TLE_Count` int(11) NOT NULL,
  `AC_Count` int(11) NOT NULL,
  `RE_Count` int(11) NOT NULL,
  `CE_Count` int(11) NOT NULL,
  `contrib_pts` int(11) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  CONSTRAINT `JudgeSystem_judgeuser_user_ptr_id_87167c8a_fk_auth_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JudgeSystem_judgeuser`
--

LOCK TABLES `JudgeSystem_judgeuser` WRITE;
/*!40000 ALTER TABLE `JudgeSystem_judgeuser` DISABLE KEYS */;
INSERT INTO `JudgeSystem_judgeuser` VALUES (1,19,1,6,1,1,0),(3,1,1,1,1,1,0);
/*!40000 ALTER TABLE `JudgeSystem_judgeuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JudgeSystem_judgeuser_solution_list`
--

DROP TABLE IF EXISTS `JudgeSystem_judgeuser_solution_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JudgeSystem_judgeuser_solution_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judgeuser_id` int(11) NOT NULL,
  `solution_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `JudgeSystem_judgeuser_solution_list_judgeuser_id_66fb3e46_uniq` (`judgeuser_id`,`solution_id`),
  KEY `JudgeSystem_judg_solution_id_bc9d953f_fk_JudgeSystem_solution_id` (`solution_id`),
  CONSTRAINT `JudgeSystem_judg_solution_id_bc9d953f_fk_JudgeSystem_solution_id` FOREIGN KEY (`solution_id`) REFERENCES `JudgeSystem_solution` (`id`),
  CONSTRAINT `Judge_judgeuser_id_85577df7_fk_JudgeSystem_judgeuser_user_ptr_id` FOREIGN KEY (`judgeuser_id`) REFERENCES `JudgeSystem_judgeuser` (`user_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JudgeSystem_judgeuser_solution_list`
--

LOCK TABLES `JudgeSystem_judgeuser_solution_list` WRITE;
/*!40000 ALTER TABLE `JudgeSystem_judgeuser_solution_list` DISABLE KEYS */;
INSERT INTO `JudgeSystem_judgeuser_solution_list` VALUES (3,1,1),(4,1,2);
/*!40000 ALTER TABLE `JudgeSystem_judgeuser_solution_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JudgeSystem_problem`
--

DROP TABLE IF EXISTS `JudgeSystem_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JudgeSystem_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `p_id` varchar(10) NOT NULL,
  `statement` varchar(4000) NOT NULL,
  `sample_input` varchar(200) DEFAULT NULL,
  `sample_output` varchar(200) DEFAULT NULL,
  `comments_id` int(11) DEFAULT NULL,
  `contest_id` varchar(100) DEFAULT NULL,
  `setter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `JudgeSystem_problem_p_id_f8d95fa0_uniq` (`p_id`,`contest_id`),
  KEY `JudgeSystem_prob_comments_id_b112ac4c_fk_JudgeSystem_blogpost_id` (`comments_id`),
  KEY `JudgeSyste_contest_id_222da93d_fk_JudgeSystem_contest_contest_id` (`contest_id`),
  KEY `JudgeSys_setter_id_e0f3e854_fk_JudgeSystem_judgeuser_user_ptr_id` (`setter_id`),
  CONSTRAINT `JudgeSystem_prob_comments_id_b112ac4c_fk_JudgeSystem_blogpost_id` FOREIGN KEY (`comments_id`) REFERENCES `JudgeSystem_blogpost` (`id`),
  CONSTRAINT `JudgeSyste_contest_id_222da93d_fk_JudgeSystem_contest_contest_id` FOREIGN KEY (`contest_id`) REFERENCES `JudgeSystem_contest` (`contest_id`),
  CONSTRAINT `JudgeSys_setter_id_e0f3e854_fk_JudgeSystem_judgeuser_user_ptr_id` FOREIGN KEY (`setter_id`) REFERENCES `JudgeSystem_judgeuser` (`user_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JudgeSystem_problem`
--

LOCK TABLES `JudgeSystem_problem` WRITE;
/*!40000 ALTER TABLE `JudgeSystem_problem` DISABLE KEYS */;
INSERT INTO `JudgeSystem_problem` VALUES (1,'FAMILY - Family','FAMILY','<div id=\"problem-body\">\n<p>\r\n	We want to find out how much related are the members of a family of monsters. \r\n	Each monster has the same number of genes but the genes themselves may differ \r\n	from monster to monster. It would be nice to know how many genes any two given \r\n	monsters have in common. This is impossible, however, since the number of genes \r\n	is very large. Still, we do know the family tree (well, not actually a tree, \r\n	but you cannot really blame them, these are monsters, right?) and we do know \r\n	how the genes are inherited so we can estimate the number of common genes quite \r\n	well.\r\n</p>\n<p>\r\n	The inheritance rule is very simple: if a monster C is a child of monsters A \r\n	and B then each gene of C is identical to the corresponding gene of either A or \r\n	B, each with probability 50%. Every gene of every monster is inherited \r\n	independently.\r\n</p>\n<p>\r\n	Let us define the degree of relationship of monsters X and Y as the expected \r\n	number of common genes. For example consider a family consisting of two \r\n	completely unrelated (i.e. having no common genes) monsters A and B and their \r\n	two children C and D. How much are C and D related? Well, each of C\'s genes \r\n	comes either from A or from B, both with probability 50%. The same is true for \r\n	D. Thus, the probability of a given gene of C being the same as the \r\n	corresponding gene of D is 50%. Therefore the degree of relationship of C and D \r\n	(the expected number of common genes) is equal to 50% of all the genes. Note \r\n	that the answer would be different if A and B were related. For if A and B had \r\n	common genes, these would be necessarily inherited by both C and D.\r\n</p>\n<p>\r\nYour task is to write a program that, given a family graph and a list of pairs \r\nof monsters, computes the degree of relationship for each of these pairs.\r\n</p><p>\n</p><h3>Task</h3>\n<p>Write a program that:</p>\n<div align=\"justify\">\n<ul>\n<li>\r\n		reads the description of a family and a list of pairs of its members from the \r\n		standard input,\r\n		</li><li>\r\n		computes the degree of relationship (in percentages) for each pair on the list,\r\n		</li><li>\r\n			writes the result to the standard output.</li>\n</ul>\n</div>\n<h3>Input</h3>\n<p>\r\n	The input begins with the integer t, the number of test cases. Then t test \r\n	cases follow.\r\n</p>\n<p>\r\n	For each test case the first line of the input contains two integers n and k \r\n	separated by a single space. Integer n (2 \r\n</p><p>\r\n	Each of the next k lines contains three different integers a, b, c separated by \r\n	single spaces. The triple a, b, c means that the monster a is a child of \r\n	monsters b and c.\r\n</p>\n<p>\r\n	The next input line contains an integer m (1 2) - \r\n	the number of pairs of monsters on the list. Each of the next m lines contains \r\n	two integers separated by a single space - these are the numbers of two \r\n	monsters.\r\n</p>\n<p>\r\n	You may assume that no monster is its own ancestor. You should not make any \r\n	additional assumptions on the input data. In particular, you should not assume \r\n	that there exists any valid sex assignment.\r\n</p>\n<h3>Output</h3>\n<p>\r\n	For each test case the output consists of m lines. The i-th line corresponds to \r\n	the i-th pair on the list and should contain single number followed by the \r\n	percentage sign. The number should be the exact degree of relationship (in \r\n	percentages) of the monsters in the i-th pair. Unsignificant zeroes are not \r\n	allowed in the output (please note however that there must be at least one \r\n	digit before the period sign so for example the leading zero in number 0.1 is \r\n	significant and you cannot print it as .1). Confront the example output for the \r\n	details of the output format.\r\n</p>\n<h3>Example</h3>\n<pre><b><tt>Sample input:</tt></b>\r\n1\r\n7 4\r\n4 1 2\r\n5 2 3\r\n6 4 5\r\n7 5 6\r\n4\r\n1 2\r\n2 6\r\n7 5\r\n3 3\r\n\r\n<b><tt>Sample output:</tt></b>\r\n0%\r\n50%\r\n81.25%\r\n100%\r\n</pre>\n<b>Warning: large Input/Output data, be careful with certain languages</b>\n</div>',NULL,NULL,1,'Practice',1),(2,'INTERVAL - Intervals','INTERVAL','<div id=\"problem-body\">\n<p>\r\n	You are given n closed integer intervals [a<sub>i</sub>, b<sub>i</sub>] and n \r\n	integers c<sub>1</sub>, ..., c<sub>n</sub>.\r\n</p>\n<h3>Task</h3>\n<p>Write a program that:</p>\n<div align=\"justify\">\n<ul>\n<li>\r\n			reads the number of intervals, their endpoints and integers c<sub>1</sub>, ..., \r\n			c<sub>n</sub>\r\n		from the standard input,\r\n		</li><li>\r\n			computes the minimal size of a set Z of integers which has at least c<sub>i</sub>\r\n			common elements with interval [a<sub>i</sub>, b<sub>i</sub>], for each i = \r\n		1, 2, ..., n,\r\n		</li><li>\r\n			writes the answer to the standard output.</li>\n</ul>\n</div>\n<h3>Input</h3>\n<p>\r\n	The input begins with the integer t, the number of test cases. Then t test \r\n	cases follow.\r\n</p>\n<p>\r\n	For each test case the first line of the input contains an integer n (1 &lt;= n \r\n	&lt;= 50000) - the number of intervals. The following n lines describe the \r\n	intervals. Line (i+1) of the input contains three integers a<sub>i</sub>, \r\n	b<sub>i</sub> and c<sub>i</sub> separated by single spaces and such that 0 &lt; \r\n		= a<sub>i</sub> &lt; = b<sub>i</sub> &lt;= 50000 and 1 &lt; = c<sub>i</sub> &lt; \r\n		= b<sub>i</sub> -a<sub>i</sub> +1.\r\n</p>\n<h3>Output</h3>\n<p>\r\n	For each test case the output contains exactly one integer equal to the minimal \r\n	size of set Z sharing at least c<sub>i</sub> elements with interval [a<sub>i</sub>, \r\n	b<sub>i</sub>], for each i= 1, 2, ..., n.\r\n</p>\n<h3>Example</h3>\n<pre><b><tt>Sample input:</tt></b>\r\n1\r\n5\r\n3 7 3\r\n8 10 3\r\n6 8 1\r\n1 3 1\r\n10 11 1\r\n\r\n<b><tt>Sample output:</tt></b>\r\n6\r\n</pre>\n<b>Warning: enormous Input/Output data, be careful with certain languages</b>\n</div>',NULL,NULL,2,'Practice',1),(3,'RHOMBS - Rhombs','RHOMBS','<div id=\"problem-body\">\n<p>\r\n	An unbounded triangular grid is a plane covered by equilateral triangles:\r\n</p>\n<img alt=\"rhombs\" src=\"/content/adrian:rhomb1.png\"/>\n<p>\r\n	Two neighboring triangles in the grid form a rhomb. There are 3 types of such \r\n	rhombs:\r\n</p>\n<img alt=\"rhombs\" src=\"/content/adrian:rhomb2.png\"/>\n<p>\r\n	A grid polygon is a simple polygon which sides consist entirely of sides of \r\n	triangles in the grid. We say that a grid polygon is rhombastic if it can be \r\n	partitioned into internally disjoint rhombs of types A, B and C.\r\n</p>\n<p>\r\n	As an example let\'s consider the following grid hexagon:\r\n</p>\n<img alt=\"rhombs\" src=\"/content/adrian:rhomb3.png\"/>\n<p>\r\n	This hexagon can be partitioned into 4 rhombs of type A, 4 rhombs of type B and \r\n	4 rhombs of type C:\r\n</p>\n<img alt=\"rhombs\" src=\"/content/adrian:rhomb4.png\"/>\n<p>\r\n	For a given rhombastic grid polygon P compute the numbers of rhombs of types A, \r\n	B and C in some correct partition.\r\n</p>\n<h3>Task</h3>\n<p>Write a program that:</p>\n<div align=\"justify\">\n<ul>\n<li>\r\n		reads a description of a rhombastic grid polygon from the standard input,\r\n		</li><li>\r\n		computes the numbers of rhombs of types A, B and C in some correct partition of \r\n		the polygon,\r\n		</li><li>\r\n			writes the results to the standard output.</li>\n</ul>\n</div>\n<h3>Input</h3>\n<p>\r\n	The input begins with the integer t, the number of test cases. Then t test \r\n	cases follow.\r\n</p>\n<p>\r\n	For each test case the first line of the input contains an integer n (3 &lt;= n \r\n	&lt;= 50000) - the number of sides of a rhombastic grid polygon. Each of the \r\n	next n lines contains a description of one side of the polygon. The sides are \r\n	given one by one in the clockwise order. No two consecutive sides of the \r\n	polygon lie on the same straight line. The description of a side consists of \r\n	two integers d and k. Integer d says what is the direction of the side \r\n	according to the following figure:\r\n</p>\n<img alt=\"rhombs\" src=\"/content/adrian:rhomb5.png\"/>\n<p>\r\n	Integer k is the length of the polygon side measured in the number of sides of \r\n	grid triangles. Sum of all numbers k is not larger than 100000.\r\n</p>\n<h3>Output</h3>\n<p>\r\n	For each test case the first and only line of the output contains three \r\n	integers separated by single spaces denoting the number of rhombs of type A, B \r\n	and C respectively, in some partition of the input polygon.\r\n</p>\n<h3>Example</h3>\n<pre><b><tt>Sample input:</tt></b>\r\n1\r\n6 \r\n1 2 \r\n2 2 \r\n3 2 \r\n4 2 \r\n5 2 \r\n6 2 \r\n\r\n<b><tt>Sample output:</tt></b>\r\n4 4 4\r\n</pre>\n</div>',NULL,NULL,3,'Practice',1),(4,'SERVERS - Servers','SERVERS','<div id=\"problem-body\">\n<p>\r\n	The Kingdom of Byteland decided to develop a large computer network of servers \r\n	offering various services.\r\n</p>\n<p>\r\n	The network is built of n servers connected by bidirectional wires. Two servers \r\n	can be directly connected by at most one wire. Each server can be directly \r\n	connected to at most 10 other servers and every two servers are connected with \r\n	some path in the network. Each wire has a fixed positive data transmission time \r\n	measured in milliseconds. The distance (in milliseconds) D(V, W) between two \r\n	servers V and W is defined as the length of the shortest (transmission \r\n	time-wise) path connecting V and W in the network. For convenience we let D(V, \r\n	V) = 0 for all V.\r\n</p>\n<p>\r\n	Some servers offer more services than others. Therefore each server V is marked \r\n	with a natural number r(V), called a rank. The bigger the rank the more \r\n	powerful a server is.\r\n</p>\n<p>\r\n	At each server, data about nearby servers should be stored. However, not all \r\n	servers are interesting. The data about distant servers with low ranks do not \r\n	have to be stored. More specifically, a server W is interesting for a server V \r\n	if for every server U such that D(V, U) \r\n</p><p>\r\n	For example, all servers of the maximal rank are interesting to all servers. If \r\n	a server V has the maximal rank, then exactly the servers of the maximal rank \r\n	are interesting for V . Let B(V) denote the set of servers interesting for a \r\n	server V.\r\n</p>\n<p>\r\n	We want to compute the total amount of data about servers that need to be \r\n	stored in the network being the total sum of sizes of all sets B(V). The \r\n	Kingdom of Byteland wanted the data to be quite small so it built the network \r\n	in such a way that this sum does not exceed 30*n.\r\n</p>\n<h3>Task</h3>\n<p>Write a program that:</p>\n<div align=\"justify\">\n<ul>\n<li>\r\n		reads the description of a server network from the standard input,\r\n		</li><li>\r\n		computes the total amount of data about servers that need to be stored in the \r\n		network,\r\n		</li><li>\r\n			writes the result to the standard output.</li>\n</ul>\n</div>\n<h3>Input</h3>\n<p>\r\n	The input begins with the integer z, the number of test cases. Then z test \r\n	cases follow.\r\n</p>\n<p>\r\n	For each test case, in the first line there are two natural numbers n, m, where \r\n	n is the number of servers in the network (1 \r\n</p><p>\r\n	In the next n lines the ranks of the servers are given. Line i contains one \r\n	integer r<sub>i</sub> (1 i \r\n</p><p>\r\n	In the following m lines the wires are described. Each wire is described by \r\n	three numbers a, b, t (1  b), where a and b are numbers of the servers connected by the \r\n	wire and t is the transmission time of the wire in milliseconds.\r\n</p>\n<h3>Output</h3>\n<p>\r\n	For each test case the output consists of a single integer equal to the total \r\n	amount of data about servers that need to be stored in the network.\r\n</p>\n<h3>Example</h3>\n<pre><b><tt>Sample input:</tt></b>\r\n1\r\n4 3\r\n2\r\n3\r\n1\r\n1\r\n1 4 30\r\n2 3 20\r\n3 4 20\r\n\r\n<b><tt>Sample output:</tt></b>\r\n9</pre>\n<p>\r\n	(because B(1) = {1, 2}, B(2) = {2}, B(3) = {2, 3}, B(4) = {1, 2, 3, 4})\r\n</p>\n<b>Warning: large Input/Output data, be careful with certain languages</b>\n</div>',NULL,NULL,4,'Practice',1),(5,'SOLIT - Solitaire','SOLIT','<div id=\"problem-body\">\n<p>\r\n	Solitaire is a game played on an 8x8 chessboard. The rows and columns of the \r\n	chessboard are numbered from 1 to 8, from the top to the bottom and from left \r\n	to right respectively.\r\n</p>\n<p>\r\n	There are four identical pieces on the board. In one move it is allowed to:\r\n</p>\n<div align=\"justify\">\n<ul>\n<li>\r\n		move a piece to an empty neighboring field (up, down, left or right),\r\n		</li><li>\r\n			jump over one neighboring piece to an empty field (up, down, left or right).</li>\n</ul>\n</div>\n<img alt=\"possible moves in solitaire\" src=\"/content/adrian:solitaire.png\"/>\n<p>\r\n	There are 4 moves allowed for each piece in the configuration shown above. As \r\n	an example let\'s consider a piece placed in the row 4, column 4. It can be \r\n	moved one row up, two rows down, one column left or two columns right.\r\n</p>\n<h3>Task</h3>\n<p>Write a program that:</p>\n<div align=\"justify\">\n<ul>\n<li>\r\n		reads two chessboard configurations from the standard input,\r\n		</li><li>\r\n		verifies whether the second one is reachable from the first one in at most 8 \r\n		moves,\r\n		</li><li>\r\n			writes the result to the standard output.</li>\n</ul>\n</div>\n<h3>Input</h3>\n<p>\r\n	The input begins with the integer t, the number of test cases. Then t test \r\n	cases follow.\r\n</p>\n<p>\r\n	For each test case, each of two input lines contains 8 integers a<sub>1</sub>, \r\n	a<sub>2</sub>, ..., a<sub>8</sub> separated by single spaces and describes one \r\n	configuration of pieces on the chessboard. Integers a<sub>2j-1</sub> and a<sub>2j</sub>\r\n	(1 &lt;= j &lt;= 4) describe the position of one piece - the row number and the \r\n	column number respectively.\r\n</p>\n<h3>Output</h3>\n<p>\r\n	For each test case the output should contain one word for each test case - \r\n	`YES\' if a configuration described in the second input line is reachable from \r\n	the configuration described in the first input line in at most 8 moves, or one \r\n	word `NO\' otherwise.\r\n</p>\n<h3>Example</h3>\n<pre><b><tt>Sample input:</tt></b>\r\n1\r\n4 4 4 5 5 4 6 5\r\n2 4 3 3 3 6 4 6\r\n\r\n<b><tt>Sample output:</tt></b>\r\nYES\r\n</pre>\n</div>',NULL,NULL,5,'Practice',1),(6,'TTABLE - Timetable','TTABLE','<div id=\"problem-body\">\n<p>\r\n	You are the owner of a railway system between n cities, numbered by integers \r\n	from 1 to n. Each train travels from the start station to the end station \r\n	according to a very specific timetable (always on time), not stopping anywhere \r\n	between. On each station a departure timetable is available. Unfortunately each \r\n	timetable contains only direct connections. A passenger that wants to travel \r\n	from city p to city q is not limited to direct connections however - he or she \r\n	can change trains. Each change takes zero time, but a passenger cannot change \r\n	from one train to the other if it departs before the first one arrives. People \r\n	would like to have a timetable of all optimal connections. A connection \r\n	departing from city p at A o\'clock and arriving in city q at B o\'clock is \r\n	called optimal if there is no connection that begins in p not sooner than at A, \r\n	ends in q not later than at B, and has strictly shorter travel time than the considered connection. We are only interested in connections that \r\n	can be completed during same day.</p>\n<h3>Task</h3>\n<p>Write a program that:</p>\n<div align=\"justify\">\n<ul>\n<li>\r\n		reads the number n and departure timetable for each of n cities from the \r\n		standard input,\r\n		</li><li>\r\n		creates a timetable of optimal connections from city 1 to city n,\r\n		</li><li>\r\n			writes the answer to the standard output.</li>\n</ul>\n</div>\n<h3>Input</h3>\n<p>\r\n	The input begins with the integer t, the number of test cases. Then t test \r\n	cases follow.\r\n</p>\n<p>\r\n	For each test case the first line of the input contains an integer n (2 \r\n</p><p>\r\n	The first line of the timetable description contains only one integer m. Each \r\n	of the following m lines corresponds to one position in the timetable and \r\n	contains: departure time A, arrival time B (A \r\n</p><h3>Output</h3>\n<p>\r\n	For each test case the first line of the output contains an integer r - the \r\n	number of positions in the timetable being the solution. Each of the following \r\n	r lines contains a departure time A and an arrival time B separated by single \r\n	space. The time format should be like in the input and positions in the \r\n	timetable should be ordered increasingly according to the departure times. If \r\n	there is more then one optimal connection with the same departure and arrival \r\n	time, your program should output just one.\r\n</p>\n<h3>Example</h3>\n<pre><b><tt>Sample input:</tt></b>\r\n1\r\n3\r\n3\r\n09:00 15:00 3\r\n10:00 12:00 2\r\n11:00 20:00 3\r\n2\r\n11:30 13:00 3\r\n12:30 14:00 3\r\n0\r\n\r\n<b><tt>Sample output:</tt></b>\r\n2\r\n10:00 14:00\r\n11:00 20:00\r\n</pre>\n<b>Warning: enormous Input/Output data, be careful with certain languages</b>\n</div>',NULL,NULL,6,'Practice',1),(7,'STEVE - Voracious Steve','STEVE','<div id=\"problem-body\">\n<p>\r\n	Steve and Digit bought a box containing a number of donuts. In order to divide \r\n	them between themselves they play a special game that they created. The players \r\n	alternately take a certain, positive number of donuts from the box, but no more \r\n	than some fixed integer. Each player\'s donuts are gathered on the player\'s \r\n	side. The player that empties the box eats his donuts while the other one puts \r\n	his donuts back into the box and the game continues with the \"loser\" player \r\n	starting. The game goes on until all the donuts are eaten. The goal of the game \r\n	is to eat the most donuts. How many donuts can Steve, who starts the game, \r\n	count on, assuming the best strategy for both players?\r\n</p>\n<h3>Task</h3>\n<p>Write a program that:</p>\n<div align=\"justify\">\n<ul>\n<li>\r\n		reads the parameters of the game from the standard input,\r\n		</li><li>\r\n		computes the number of donuts Steve can count on,\r\n		</li><li>\r\n			writes the result to the standard output.</li>\n</ul>\n</div>\n<h3>Input</h3>\n<p>\r\n	The input begins with the integer t, the number of test cases. Then t test \r\n	cases follow.\r\n</p>\n<p>\r\n	For each test case the first and only line of the input contains exactly two \r\n	integers n and m separated by a single space, 1 &lt;= m &lt;= n &lt;= 100 - the \r\n	parameters of the game, where n is the number of donuts in the box at the \r\n	beginning of the game and m is the upper limit on the number of donuts to be \r\n	taken by one player in one move.\r\n</p>\n<h3>Output</h3>\n<p>\r\n	For each test case the output contains exactly one integer equal to the number \r\n	of donuts Steve can count on.\r\n</p>\n<h3>Example</h3>\n<pre><b><tt>Sample input:</tt></b>\r\n1\r\n5 2 \r\n\r\n<b><tt>Sample output:</tt></b>\r\n3\r\n</pre>\n</div>',NULL,NULL,7,'Practice',1),(8,'RENT - Rent your airplane and make money','RENT','<div id=\"problem-body\">\n<p>\r\n\"ABEAS Corp.\" is a very small company that owns a single airplane. The\r\ncustomers of ABEAS Corp are large airline companies which rent the\r\nairplane to accommodate occasional overcapacity.</p>\n<p>Customers send renting orders that consist of a time interval and a\r\nprice that the customer is ready to pay for renting the airplane during\r\nthe given time period.\r\nOrders of all the customers are known in advance. Of course, not all\r\norders can be accommodated and some orders have to be declined. Eugene\r\nLAWLER, the Chief Scientific Officer of ABEAS Corp would like to\r\nmaximize the profit of the company.</p>\n<p>You are requested to compute an optimal solution.\r\n</p>\n<h4>Small Example</h4>\n<p>\r\nConsider for instance the case where the company has 4 orders:</p>\n<ul>\n<li>Order 1 (start time 0, duration 5, price 10)</li>\n<li>Order 2 (start time 3, duration 7, price 8)</li>\n<li>Order 3 (start time 5, duration 9, price 7)</li>\n<li>Order 4 (start time 6, duration 9, price 8)</li>\n</ul>\n<p>\r\nThe optimal solution consists in declining Order 2 and 3 and the gain\r\nis 10+8 = 18.<br/>\r\nNote that the solution made of Order 1 and 3 is feasible (the airplane\r\nis rented with no interruption from time 0 to time 14) but non-optimal.\r\n</p>\n<h3>Input</h3>\n<p>\r\nThe first line of the input contains a number T â‰¤ 30 that indicates the number of test cases to follow. The first line of each test case contains the number of orders n (n â‰¤ 10000). In the following n lines the orders are given. Each order is described by 3 integer values: The start time of the order st (0 â‰¤ st &lt; 1000000), the duration d of the order (0 &lt; d &lt; 1000000), and the price p (0 &lt; p &lt; 100000) the customer is ready to pay for this order.\r\n</p>\n<h3>Output</h3>\n<p align=\"justify\">\r\nYou are required to compute an optimal solution. For each test case your program has to write the total price paid by the airlines.\r\n</p>\n<h3>Example</h3>\n<pre><b>Input:</b>\r\n1\r\n4\r\n0 5 10\r\n3 7 14\r\n5 9 7\r\n6 9 8\r\n<b>Output:</b>\r\n18\r\n</pre>\n<b>Warning: large Input/Output data, be careful with certain languages</b>\n</div>',NULL,NULL,8,'Practice',1),(9,'SQDANCE - Square dance','SQDANCE','<div id=\"problem-body\">\n<p align=\"justify\">\r\nYou are hired by french NSA to break the RSA code used on the Pink\r\nCard. The easiest way to do that is to factor the public modulus and\r\nyou have found the fastest algorithm to do that, except that you have\r\nto solve a subproblem that can be modeled in the following way.\r\n<br/>\r\nLet <img align=\"bottom\" alt=\"$ cal P$\" border=\"0\" height=\"15\" src=\"/content/ak15:SQDANCE1.png\" width=\"16\"/><!-- MATH\r\n$= {p_1,p_2,...,p_n}$\r\n-->\n<img align=\"middle\" alt=\"$ = {p_1,p_2,...,p_n}$\" border=\"0\" height=\"32\" src=\"/content/ak15:SQDANCE2.png\" width=\"118\"/><!-- MATH\r\n$S = {s_1,s_2,...,s_u}$\r\n-->be\r\na set of prime numbers. If <img align=\"middle\" alt=\"$ S = {s_1,s_2,...,s_u}$\" border=\"0\" height=\"32\" src=\"/content/ak15:SQDANCE3.png\" width=\"131\"/><!-- MATH\r\n$T = {t_1,...,t_v}$\r\n-->\r\nand <img align=\"middle\" alt=\"$ T = {t_1,...,t_v}$\" border=\"0\" height=\"32\" src=\"/content/ak15:SQDANCE4.png\" width=\"106\"/> are formed with elements\r\nof <img align=\"bottom\" alt=\"$ cal P$\" border=\"0\" height=\"15\" src=\"/content/ak15:SQDANCE1.png\" width=\"16\"/>, then S*T will denote the quantity\r\n<!-- MATH\r\nbegin{displaymath}\r\ns_1*s_2*cdot cdot cdot *s_u*t_1*t_2*cdot cdot cdot *t_v.\r\nend{displaymath}\r\n-->\n</p>\n<img align=\"middle\" alt=\"$displaystyle s_1*s_2*cdot cdot cdot *s_u*t_1*t_2*cdot cdot cdot *t_v.$\" border=\"0\" height=\"29\" src=\"/content/ak15:SQDANCE5.png\" width=\"238\"/>\n<p>\r\nWe call relation a set of two primes p,q, where p and q are distinct\r\nelements of <img align=\"bottom\" alt=\"$ cal P$\" border=\"0\" height=\"15\" src=\"/content/ak15:SQDANCE1.png\" width=\"16\"/><!-- MATH\r\n$S_i = {p_i,q_i}$\r\n-->.\r\nYou dispose of a collection of R\r\nrelations <img align=\"middle\" alt=\"$ S_i = {p_i,q_i}$\" border=\"0\" height=\"32\" src=\"/content/ak15:SQDANCE6.png\" width=\"89\"/><!-- MATH\r\n$S_{i_1}, S_{i_2}, ..., S_{i_k}$\r\n-->\r\nand you are interested in finding\r\nsequences of these, <img align=\"middle\" alt=\"$ S_{i_1}, S_{i_2}, ..., S_{i_k}$\" border=\"0\" height=\"30\" src=\"/content/ak15:SQDANCE7.png\" width=\"103\"/>\r\nsuch that\r\n<!-- MATH\r\nbegin{displaymath}\r\nS_{i_1}*S_{i_2}*cdot cdot cdot *S_{i_k}\r\nend{displaymath}\r\n-->\n</p>\n<img align=\"middle\" alt=\"$displaystyle S_{i_1}*S_{i_2}*cdot cdot cdot *S_{i_k}$\" border=\"0\" height=\"30\" src=\"/content/ak15:SQDANCE8.png\" width=\"134\"/>\n<p>\r\nis a perfect square.\r\n</p><p>\r\nThe way you look for these squares is the following. The ultimate goal\r\nis to count squares that appear in the process. Relations arrive one at\r\na time. You maintain a collection <img align=\"bottom\" alt=\"$ cal C$\" border=\"0\" height=\"14\" src=\"/content/ak15:SQDANCE9.png\" width=\"13\"/> of relations\r\nthat do not contain any square subproduct. This is easy: at first, <img align=\"bottom\" alt=\"$ cal C$\" border=\"0\" height=\"14\" src=\"/content/ak15:SQDANCE9.png\" width=\"13\"/> is empty. Then a relation arrives and <img align=\"bottom\" alt=\"$ cal C$\" border=\"0\" height=\"14\" src=\"/content/ak15:SQDANCE9.png\" width=\"13\"/>\r\nbegins to grow.\r\nSuppose a new relation <img align=\"middle\" alt=\"$ {p,q}$\" border=\"0\" height=\"32\" src=\"/content/ak15:SQDANCE10.png\" width=\"43\"/> arrives. If no square\r\nappears when adding <img align=\"middle\" alt=\"$ {p,q}$\" border=\"0\" height=\"32\" src=\"/content/ak15:SQDANCE10.png\" width=\"43\"/> to <img align=\"bottom\" alt=\"$ cal C$\" border=\"0\" height=\"14\" src=\"/content/ak15:SQDANCE9.png\" width=\"13\"/>,\r\nthen <img align=\"middle\" alt=\"$ {p,q}$\" border=\"0\" height=\"32\" src=\"/content/ak15:SQDANCE10.png\" width=\"43\"/> is added to the collection.\r\nOtherwise, a square is about to appear, we increase the number of\r\nsquares, but we do not store this relation, hence <img align=\"bottom\" alt=\"$ cal C$\" border=\"0\" height=\"14\" src=\"/content/ak15:SQDANCE9.png\" width=\"13\"/>\r\nkeeps the desired property.\r\n<br/>\n<!-- MATH\r\n$S_1 = {2,3}$\r\n-->Let us consider an example. First\r\narrives <img align=\"middle\" alt=\"$ S_1 = {2,3}$\" border=\"0\" height=\"32\" src=\"/content/ak15:SQDANCE11.png\" width=\"81\"/> and we put it in <img align=\"bottom\" alt=\"$ cal C$\" border=\"0\" height=\"14\" src=\"/content/ak15:SQDANCE9',NULL,NULL,9,'Practice',1),(10,'HELPR2D2 - Help R2-D2!','HELPR2D2','<div id=\"problem-body\">\n<p align=\"justify\">\r\nIn Episode III of Star Wars (whose alleged title is \"How I became Vader\"), R2-D2 (Artoo-Detoo) is again confronted to a tedious work.\r\nHe is responsible for the loading of the republic transport starships in the fastest way. Imagine a huge space area where n starships are parked.\r\nEach starship has a capacity of K cubic femtoparsec. Containers C<sub>i</sub> arrive one at a time with some volume v<sub>i</sub> (expressed in cubic femtoparsec).\r\nR2-D2 wants to minimize the number of starships used for a given sequence of containers.<br/>\r\nSmart as he is, R2-D2 knows for sure that the problem is a hard one, even with the force being around.\r\nHere is the heuristics he selected to solve his problem. Start with all starships ready to load, and numbered S<sub>0</sub>,S<sub>1</sub>,etc.\r\nWhen a container C<sub>j</sub> arrives, select the starship of minimal index i that can contain C<sub>j</sub> and put it in S<sub>i</sub>.\r\nIn some sense, this heuristic minimizes the move of the container arriving before its loading.<br/>\r\nAt the end of the n arrivals, R2-D2 counts the number s of starships used and he measures the total waste w of the sequence.\r\nFor i=0..s-1, the waste in starship i is given by the unused volume.<br/>\r\nYour task is to simulate the algorithm of R2-D2.\r\n</p>\n<h3>Input</h3>\n<p align=\"justify\">\r\nThe first line of the input contains a number T â‰¤ 10 that indicates the number of test cases to follow.\r\nEach test case begins with K on a line (K â‰¤ 1000), followed by the number of containers in the sequence, n, on the second line (1 â‰¤ n â‰¤ 1000000).\r\nThere are two possible formats for the remaining lines. If it contains one integer, then this is the next v<sub>i</sub>. If it begins with the character b\r\n(for block), it is followed by 2 integers r and v. This means that the r next containers arriving have volume v.\r\n</p>\n<h3>Output</h3>\n<p>\r\nYour program must output the number s of starships used, followed by a blank, followed by the total waste w.<br/>\r\nYou can assume, that at most 100000 starships are needed, and R2-D2 has to change the starships in which the next container is loaded at most 100000 times.\r\n</p>\n<h3>Example</h3>\n<pre><b>Input:</b>\r\n2\r\n100\r\n3\r\n50\r\n25\r\n70\r\n100\r\n4\r\n50\r\nb 2 40\r\n20\r\n<b>Output:</b>\r\n2 55\r\n2 50\r\n</pre>\n</div>',NULL,NULL,10,'Practice',1),(11,'Print \"Hello! World\"','HelloWorld','Just Print \"Hello! World\" without \" \"','','Hello! World',11,'Practice',1);
/*!40000 ALTER TABLE `JudgeSystem_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JudgeSystem_solution`
--

DROP TABLE IF EXISTS `JudgeSystem_solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JudgeSystem_solution` (
  `code` varchar(1000) NOT NULL,
  `penalty` int(11) NOT NULL,
  `solved` tinyint(1) NOT NULL,
  `submission_time` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verdict` varchar(100) NOT NULL,
  `problem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `JudgeSystem_soluti_problem_id_2283f426_fk_JudgeSystem_problem_id` (`problem_id`),
  CONSTRAINT `JudgeSystem_soluti_problem_id_2283f426_fk_JudgeSystem_problem_id` FOREIGN KEY (`problem_id`) REFERENCES `JudgeSystem_problem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JudgeSystem_solution`
--

LOCK TABLES `JudgeSystem_solution` WRITE;
/*!40000 ALTER TABLE `JudgeSystem_solution` DISABLE KEYS */;
INSERT INTO `JudgeSystem_solution` VALUES ('#include<iostream>\r\nusing namespace std;\r\nint main()\r\n{\r\n    cout<<\"Hello\\n\";\r\n	return 0;\r\n}\r\n                ',14,0,'2016-04-29 07:44:20',1,'Wrong Answer',1),('#include<iostream>\r\nusing namespace std;\r\nint main()\r\n{\r\n    cout<<\"Hello! World\\n\";\r\n	return 0;\r\n}\r\n                ',0,1,'2016-04-29 07:53:43',2,'Success',11);
/*!40000 ALTER TABLE `JudgeSystem_solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JudgeSystem_tag`
--

DROP TABLE IF EXISTS `JudgeSystem_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JudgeSystem_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JudgeSystem_tag`
--

LOCK TABLES `JudgeSystem_tag` WRITE;
/*!40000 ALTER TABLE `JudgeSystem_tag` DISABLE KEYS */;
INSERT INTO `JudgeSystem_tag` VALUES (1,'Test'),(2,'Blog'),(3,'Forum');
/*!40000 ALTER TABLE `JudgeSystem_tag` ENABLE KEYS */;
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_judgeuser'),(2,'Can change user',1,'change_judgeuser'),(3,'Can delete user',1,'delete_judgeuser'),(4,'Can add problem',2,'add_problem'),(5,'Can change problem',2,'change_problem'),(6,'Can delete problem',2,'delete_problem'),(7,'Can add solution',3,'add_solution'),(8,'Can change solution',3,'change_solution'),(9,'Can delete solution',3,'delete_solution'),(10,'Can add contest',4,'add_contest'),(11,'Can change contest',4,'change_contest'),(12,'Can delete contest',4,'delete_contest'),(13,'Can add comment',5,'add_comment'),(14,'Can change comment',5,'change_comment'),(15,'Can delete comment',5,'delete_comment'),(16,'Can add blog post',6,'add_blogpost'),(17,'Can change blog post',6,'change_blogpost'),(18,'Can delete blog post',6,'delete_blogpost'),(19,'Can add tag',7,'add_tag'),(20,'Can change tag',7,'change_tag'),(21,'Can delete tag',7,'delete_tag'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add permission',9,'add_permission'),(26,'Can change permission',9,'change_permission'),(27,'Can delete permission',9,'delete_permission'),(28,'Can add group',10,'add_group'),(29,'Can change group',10,'change_group'),(30,'Can delete group',10,'delete_group'),(31,'Can add user',11,'add_user'),(32,'Can change user',11,'change_user'),(33,'Can delete user',11,'delete_user'),(34,'Can add content type',12,'add_contenttype'),(35,'Can change content type',12,'change_contenttype'),(36,'Can delete content type',12,'delete_contenttype'),(37,'Can add session',13,'add_session'),(38,'Can change session',13,'change_session'),(39,'Can delete session',13,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$n2WRdiBow4m4$mvbAOmfDhKtq/2AU8KNbBK6nWasshKt4MatSS4/3RUw=','2016-04-29 07:20:23',0,'kaspers','Abhishek','Gupta','abhishekgupta.dtu@gmail.com',0,1,'2016-04-21 13:44:53'),(2,'pbkdf2_sha256$24000$NX5Z6aiaIU5L$6DfAVAt+h5g3xVGWZ+AsksonkIs0JJ1ljkXFgefHK80=','2016-04-28 06:17:49',1,'admin','','','abhishekgupta.dtu@gmail.com',1,1,'2016-04-21 13:46:06'),(3,'pbkdf2_sha256$24000$9kO1ZMNnm5A2$bx+Jf9zB1jaMejS4TV2Tlcthmlpe1BAz0QcukXefACo=',NULL,0,'akas','d','asd','xgsad',0,1,'2016-04-27 06:17:13');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,1,8),(2,3,8);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-04-21 13:47:24','Practice','Practice',1,'Added.',4,2),(2,'2016-04-22 13:49:14','1','Practice/FAMILY',3,'',3,2),(3,'2016-04-22 13:49:54','42','FLBRKLIN - Flat broken lines',3,'',6,2),(4,'2016-04-22 13:49:54','41','LITELANG - The lightest language',3,'',6,2),(5,'2016-04-22 13:49:54','40','CHASE1 - Chase',3,'',6,2),(6,'2016-04-22 13:49:54','39','ATMS - Automatic Teller Machines',3,'',6,2),(7,'2016-04-22 13:49:54','38','ASCIRC - Assembler circuits',3,'',6,2),(8,'2016-04-22 13:49:54','37','WINDOW1 - Window',3,'',6,2),(9,'2016-04-22 13:49:54','36','WORDEQ - Word equations',3,'',6,2),(10,'2016-04-22 13:49:54','35','ROADNET - Road net',3,'',6,2),(11,'2016-04-22 13:49:54','34','ABWORDS - AB-words',3,'',6,2),(12,'2016-04-22 13:49:54','33','SUM1SEQ - Sum of one-sequence',3,'',6,2),(13,'2016-04-22 13:49:54','32','POLY1 - Polygon',3,'',6,2),(14,'2016-04-22 13:49:54','31','PAINTTMP - Paint templates',3,'',6,2),(15,'2016-04-22 13:49:54','30','PALSEC - Choosing a Palindromic Sequence',3,'',6,2),(16,'2016-04-22 13:49:54','29','ROCK - Sweet and Sour Rock',3,'',6,2),(17,'2016-04-22 13:49:54','28','SCALES - Balancing the Stone',3,'',6,2),(18,'2016-04-22 13:49:54','27','COURIER - The Courier',3,'',6,2),(19,'2016-04-22 13:49:54','26','PLONK - Where to Drink the Plonk?',3,'',6,2),(20,'2016-04-22 13:49:54','25','FSHEEP - Fencing in the Sheep',3,'',6,2),(21,'2016-04-22 13:49:54','24','MLAND - Land for Motorways',3,'',6,2),(22,'2016-04-22 13:49:54','23','GLUE - Johnny and the Glue',3,'',6,2),(23,'2016-04-22 13:49:55','22','LONER - The Loner',3,'',6,2),(24,'2016-04-22 13:49:55','21','MAZE - The Long and Narrow Maze',3,'',6,2),(25,'2016-04-22 13:49:55','20','POSTERS - Election Posters',3,'',6,2),(26,'2016-04-22 13:49:55','19','PARTIT - Partition',3,'',6,2),(27,'2016-04-22 13:49:55','18','TRANS - Transformation',3,'',6,2),(28,'2016-04-22 13:49:55','17','HELPR2D2 - Help R2-D2!',3,'',6,2),(29,'2016-04-22 13:49:55','16','SQDANCE - Square dance',3,'',6,2),(30,'2016-04-22 13:49:55','15','RENT - Rent your airplane and make money',3,'',6,2),(31,'2016-04-22 13:49:55','14','STEVE - Voracious Steve',3,'',6,2),(32,'2016-04-22 13:49:55','13','TTABLE - Timetable',3,'',6,2),(33,'2016-04-22 13:49:55','12','SOLIT - Solitaire',3,'',6,2),(34,'2016-04-22 13:49:55','11','SERVERS - Servers',3,'',6,2),(35,'2016-04-22 13:49:55','10','RHOMBS - Rhombs',3,'',6,2),(36,'2016-04-22 13:49:55','9','INTERVAL - Intervals',3,'',6,2),(37,'2016-04-22 13:49:55','8','FAMILY - Family',3,'',6,2),(38,'2016-04-22 13:49:55','7','FAMILY - Family',3,'',6,2),(39,'2016-04-22 13:49:55','6','FAMILY - Family',3,'',6,2),(40,'2016-04-22 13:49:55','5','FAMILY - Family',3,'',6,2),(41,'2016-04-22 13:49:55','4','FAMILY - Family',3,'',6,2),(42,'2016-04-22 13:49:55','3','FAMILY - Family',3,'',6,2),(43,'2016-04-22 13:49:55','2','FAMILY - Family',3,'',6,2),(44,'2016-04-22 13:49:55','1','TestBlog',3,'',6,2),(45,'2016-04-22 14:46:33','1','Practice/FAMILY',3,'',3,2),(46,'2016-04-22 14:46:47','29','Practice/WORDEQ',3,'',2,2),(47,'2016-04-22 14:46:47','28','Practice/ROADNET',3,'',2,2),(48,'2016-04-22 14:46:47','27','Practice/ABWORDS',3,'',2,2),(49,'2016-04-22 14:46:47','26','Practice/SUM1SEQ',3,'',2,2),(50,'2016-04-22 14:46:47','25','Practice/POLY1',3,'',2,2),(51,'2016-04-22 14:46:47','24','Practice/PAINTTMP',3,'',2,2),(52,'2016-04-22 14:46:47','23','Practice/PALSEC',3,'',2,2),(53,'2016-04-22 14:46:47','22','Practice/ROCK',3,'',2,2),(54,'2016-04-22 14:46:47','21','Practice/SCALES',3,'',2,2),(55,'2016-04-22 14:46:47','20','Practice/COURIER',3,'',2,2),(56,'2016-04-22 14:46:47','19','Practice/PLONK',3,'',2,2),(57,'2016-04-22 14:46:47','18','Practice/FSHEEP',3,'',2,2),(58,'2016-04-22 14:46:47','17','Practice/MLAND',3,'',2,2),(59,'2016-04-22 14:46:47','16','Practice/GLUE',3,'',2,2),(60,'2016-04-22 14:46:47','15','Practice/LONER',3,'',2,2),(61,'2016-04-22 14:46:48','14','Practice/MAZE',3,'',2,2),(62,'2016-04-22 14:46:48','13','Practice/POSTERS',3,'',2,2),(63,'2016-04-22 14:46:48','12','Practice/PARTIT',3,'',2,2),(64,'2016-04-22 14:46:48','11','Practice/TRANS',3,'',2,2),(65,'2016-04-22 14:46:48','10','Practice/HELPR2D2',3,'',2,2),(66,'2016-04-22 14:46:48','9','Practice/SQDANCE',3,'',2,2),(67,'2016-04-22 14:46:48','8','Practice/RENT',3,'',2,2),(68,'2016-04-22 14:46:48','7','Practice/STEVE',3,'',2,2),(69,'2016-04-22 14:46:48','6','Practice/TTABLE',3,'',2,2),(70,'2016-04-22 14:46:48','5','Practice/SOLIT',3,'',2,2),(71,'2016-04-22 14:46:48','4','Practice/SERVERS',3,'',2,2),(72,'2016-04-22 14:46:48','3','Practice/RHOMBS',3,'',2,2),(73,'2016-04-22 14:46:48','2','Practice/INTERVAL',3,'',2,2),(74,'2016-04-22 14:46:48','1','Practice/FAMILY',3,'',2,2),(75,'2016-04-22 14:46:58','29','WORDEQ - Word equations',3,'',6,2),(76,'2016-04-22 14:46:58','28','ROADNET - Road net',3,'',6,2),(77,'2016-04-22 14:46:58','27','ABWORDS - AB-words',3,'',6,2),(78,'2016-04-22 14:46:58','26','SUM1SEQ - Sum of one-sequence',3,'',6,2),(79,'2016-04-22 14:46:58','25','POLY1 - Polygon',3,'',6,2),(80,'2016-04-22 14:46:58','24','PAINTTMP - Paint templates',3,'',6,2),(81,'2016-04-22 14:46:58','23','PALSEC - Choosing a Palindromic Sequence',3,'',6,2),(82,'2016-04-22 14:46:58','22','ROCK - Sweet and Sour Rock',3,'',6,2),(83,'2016-04-22 14:46:58','21','SCALES - Balancing the Stone',3,'',6,2),(84,'2016-04-22 14:46:58','20','COURIER - The Courier',3,'',6,2),(85,'2016-04-22 14:46:58','19','PLONK - Where to Drink the Plonk?',3,'',6,2),(86,'2016-04-22 14:46:58','18','FSHEEP - Fencing in the Sheep',3,'',6,2),(87,'2016-04-22 14:46:58','17','MLAND - Land for Motorways',3,'',6,2),(88,'2016-04-22 14:46:58','16','GLUE - Johnny and the Glue',3,'',6,2),(89,'2016-04-22 14:46:59','15','LONER - The Loner',3,'',6,2),(90,'2016-04-22 14:46:59','14','MAZE - The Long and Narrow Maze',3,'',6,2),(91,'2016-04-22 14:46:59','13','POSTERS - Election Posters',3,'',6,2),(92,'2016-04-22 14:46:59','12','PARTIT - Partition',3,'',6,2),(93,'2016-04-22 14:46:59','11','TRANS - Transformation',3,'',6,2),(94,'2016-04-22 14:46:59','10','HELPR2D2 - Help R2-D2!',3,'',6,2),(95,'2016-04-22 14:46:59','9','SQDANCE - Square dance',3,'',6,2),(96,'2016-04-22 14:46:59','8','RENT - Rent your airplane and make money',3,'',6,2),(97,'2016-04-22 14:46:59','7','STEVE - Voracious Steve',3,'',6,2),(98,'2016-04-22 14:46:59','6','TTABLE - Timetable',3,'',6,2),(99,'2016-04-22 14:46:59','5','SOLIT - Solitaire',3,'',6,2),(100,'2016-04-22 14:46:59','4','SERVERS - Servers',3,'',6,2),(101,'2016-04-22 14:46:59','3','RHOMBS - Rhombs',3,'',6,2),(102,'2016-04-22 14:46:59','2','INTERVAL - Intervals',3,'',6,2),(103,'2016-04-22 14:46:59','1','FAMILY - Family',3,'',6,2),(104,'2016-04-22 14:52:29','15','Practice/LONER',3,'',2,2),(105,'2016-04-22 14:52:29','14','Practice/MAZE',3,'',2,2),(106,'2016-04-22 14:52:30','13','Practice/POSTERS',3,'',2,2),(107,'2016-04-22 14:52:30','12','Practice/PARTIT',3,'',2,2),(108,'2016-04-22 14:52:30','11','Practice/TRANS',3,'',2,2),(109,'2016-04-22 14:52:30','10','Practice/HELPR2D2',3,'',2,2),(110,'2016-04-22 14:52:30','9','Practice/SQDANCE',3,'',2,2),(111,'2016-04-22 14:52:30','8','Practice/RENT',3,'',2,2),(112,'2016-04-22 14:52:30','7','Practice/STEVE',3,'',2,2),(113,'2016-04-22 14:52:30','6','Practice/TTABLE',3,'',2,2),(114,'2016-04-22 14:52:30','5','Practice/SOLIT',3,'',2,2),(115,'2016-04-22 14:52:30','4','Practice/SERVERS',3,'',2,2),(116,'2016-04-22 14:52:30','3','Practice/RHOMBS',3,'',2,2),(117,'2016-04-22 14:52:30','2','Practice/INTERVAL',3,'',2,2),(118,'2016-04-22 14:52:30','1','Practice/FAMILY',3,'',2,2),(119,'2016-04-22 14:52:44','21','LONER - The Loner',3,'',6,2),(120,'2016-04-22 14:52:44','20','MAZE - The Long and Narrow Maze',3,'',6,2),(121,'2016-04-22 14:52:45','19','POSTERS - Election Posters',3,'',6,2),(122,'2016-04-22 14:52:45','18','PARTIT - Partition',3,'',6,2),(123,'2016-04-22 14:52:45','17','TRANS - Transformation',3,'',6,2),(124,'2016-04-22 14:52:45','16','HELPR2D2 - Help R2-D2!',3,'',6,2),(125,'2016-04-22 14:52:45','15','SQDANCE - Square dance',3,'',6,2),(126,'2016-04-22 14:52:45','14','RENT - Rent your airplane and make money',3,'',6,2),(127,'2016-04-22 14:52:45','13','STEVE - Voracious Steve',3,'',6,2),(128,'2016-04-22 14:52:45','12','TTABLE - Timetable',3,'',6,2),(129,'2016-04-22 14:52:45','11','SOLIT - Solitaire',3,'',6,2),(130,'2016-04-22 14:52:45','10','SERVERS - Servers',3,'',6,2),(131,'2016-04-22 14:52:45','9','RHOMBS - Rhombs',3,'',6,2),(132,'2016-04-22 14:52:45','8','INTERVAL - Intervals',3,'',6,2),(133,'2016-04-22 14:52:45','7','FAMILY - Family',3,'',6,2),(134,'2016-04-22 14:52:45','6','SOLIT - Solitaire',3,'',6,2),(135,'2016-04-22 14:52:45','5','SERVERS - Servers',3,'',6,2),(136,'2016-04-22 14:52:45','4','RHOMBS - Rhombs',3,'',6,2),(137,'2016-04-22 14:52:45','3','INTERVAL - Intervals',3,'',6,2),(138,'2016-04-22 14:52:45','2','FAMILY - Family',3,'',6,2),(139,'2016-04-22 14:52:45','1','FAMILY - Family',3,'',6,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'admin','logentry'),(10,'auth','group'),(9,'auth','permission'),(11,'auth','user'),(12,'contenttypes','contenttype'),(6,'JudgeSystem','blogpost'),(5,'JudgeSystem','comment'),(4,'JudgeSystem','contest'),(1,'JudgeSystem','judgeuser'),(2,'JudgeSystem','problem'),(3,'JudgeSystem','solution'),(7,'JudgeSystem','tag'),(13,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-04-21 13:43:02'),(2,'contenttypes','0002_remove_content_type_name','2016-04-21 13:43:02'),(3,'auth','0001_initial','2016-04-21 13:43:05'),(4,'auth','0002_alter_permission_name_max_length','2016-04-21 13:43:05'),(5,'auth','0003_alter_user_email_max_length','2016-04-21 13:43:05'),(6,'auth','0004_alter_user_username_opts','2016-04-21 13:43:05'),(7,'auth','0005_alter_user_last_login_null','2016-04-21 13:43:05'),(8,'auth','0006_require_contenttypes_0002','2016-04-21 13:43:06'),(9,'auth','0007_alter_validators_add_error_messages','2016-04-21 13:43:06'),(10,'JudgeSystem','0001_initial','2016-04-21 13:43:12'),(11,'admin','0001_initial','2016-04-21 13:43:13'),(12,'admin','0002_logentry_remove_auto_add','2016-04-21 13:43:13'),(13,'sessions','0001_initial','2016-04-21 13:43:13'),(14,'JudgeSystem','0002_auto_20160422_1910','2016-04-22 13:41:02'),(15,'JudgeSystem','0003_auto_20160422_2024','2016-04-22 14:54:52');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('kx0wuv7muswekzh7n6x21ieb45l0jrit','NTIyZGJiN2MxYjg4YmJhOTVkYTVjMTk3N2Q3NGFlNTkxZDcyOWVjMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI5OTQ0MTk3YWRjNDU5YjNmNTc2ZDRhYmNiYjdhZDliZDk4N2MzYzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-13 07:20:23');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-29 14:43:39
