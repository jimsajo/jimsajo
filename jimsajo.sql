-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: jimsajo
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `aContent` text NOT NULL,
  `mNum` int NOT NULL,
  `iNum` int NOT NULL,
  `aTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aNum` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aNum`),
  KEY `mNum` (`mNum`),
  KEY `iNum` (`iNum`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`mNum`) REFERENCES `member` (`mNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`iNum`) REFERENCES `inquiry` (`iNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES ('행사중입니다',19,100,'2025-05-21 17:19:30',29);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bNum` int NOT NULL AUTO_INCREMENT COMMENT '공지사항 번호',
  `bTitle` varchar(50) NOT NULL COMMENT '제목',
  `bContent` text NOT NULL COMMENT '내용',
  `bTime` date NOT NULL,
  `bCnt` int NOT NULL DEFAULT '0' COMMENT '조회수',
  `bImage` varchar(255) DEFAULT NULL COMMENT '첨부 이미지 경로',
  `mNum` int NOT NULL COMMENT '작성자 회원 번호',
  PRIMARY KEY (`bNum`),
  KEY `mNum` (`mNum`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`mNum`) REFERENCES `member` (`mNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='공지사항 게시판';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (8,'공지 사항입니다','<figure class=\"image\"><img src=\"/assets/img/package/fcca3bf5-7b19-4d45-9b2d-075fce9de048.jpg\"></figure><p>나도 눕고싶당당</p>','2025-05-21',8,NULL,19);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `cNum` int NOT NULL AUTO_INCREMENT,
  `cContent` text NOT NULL,
  `cCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mNum` int NOT NULL,
  `rNum` int NOT NULL,
  `parentCNum` int DEFAULT '0',
  PRIMARY KEY (`cNum`),
  KEY `mNum` (`mNum`),
  KEY `rNum` (`rNum`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`mNum`) REFERENCES `member` (`mNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`rNum`) REFERENCES `review` (`rNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (15,'좋아용','2025-05-21 17:18:30',20,13,0),(16,'감사합니다','2025-05-21 17:20:09',19,13,15);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `good` (
  `rNum` int NOT NULL,
  `mNum` int NOT NULL,
  PRIMARY KEY (`rNum`,`mNum`),
  KEY `mNum` (`mNum`),
  CONSTRAINT `good_ibfk_1` FOREIGN KEY (`rNum`) REFERENCES `review` (`rNum`) ON DELETE CASCADE,
  CONSTRAINT `good_ibfk_2` FOREIGN KEY (`mNum`) REFERENCES `member` (`mNum`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES (12,20),(13,20);
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry` (
  `iNum` int NOT NULL AUTO_INCREMENT COMMENT '문의 번호',
  `iTitle` varchar(50) NOT NULL COMMENT '문의 제목',
  `iType` varchar(30) NOT NULL COMMENT '문의 종류',
  `iContent` text NOT NULL COMMENT '문의 내용',
  `iTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성 시간',
  `iImage` varchar(255) DEFAULT NULL COMMENT '첨부 이미지',
  `mNum` int NOT NULL COMMENT '작성자 아이디',
  PRIMARY KEY (`iNum`),
  KEY `mNum` (`mNum`),
  CONSTRAINT `inquiry_ibfk_1` FOREIGN KEY (`mNum`) REFERENCES `member` (`mNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='1대1문의';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
INSERT INTO `inquiry` VALUES (100,'답좀해주세요','결재가1원인데 맞나요?','왜이리싸요?','2025-05-21 17:19:01',NULL,20);
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `mNum` int NOT NULL AUTO_INCREMENT COMMENT '회원 번호',
  `mId` varchar(20) NOT NULL COMMENT '아이디',
  `mPasswd` varchar(100) DEFAULT NULL,
  `mName` varchar(10) NOT NULL COMMENT '이름',
  `mGender` varchar(10) DEFAULT NULL,
  `mTel` varchar(20) DEFAULT NULL,
  `mBirth` date DEFAULT NULL,
  `mcreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입일자',
  `mRole` enum('user','admin') NOT NULL DEFAULT 'user' COMMENT '역할',
  `socialType` varchar(20) DEFAULT NULL,
  `socialid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mNum`),
  UNIQUE KEY `mId` (`mId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='회원';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (19,'admin','{bcrypt}$2a$10$/qRsJnw1mqOoitvG/AcaMe6BeTXXOAkSzO6N2mFy.r/E7tLiHlap.','관리자',NULL,NULL,NULL,'2025-05-21 16:26:22','admin',NULL,NULL),(20,'12345678','{bcrypt}$2a$10$RVlq.5t8ZxfeyX9Fx/LfeOI2LOYdY0aEiSZhQQQBP5hM1gdWONsXm','김장환','M','0109435424','2025-05-08','2025-05-21 17:12:23','user',NULL,NULL),(21,'qwer1234','{bcrypt}$2a$10$4uSpR6D/R6glZ67fviUMCuj24o//ueeNKFpvNVlds4gmPqHalxac2','김장환','M','00011111111','2025-05-07','2025-05-21 17:31:41','user',NULL,NULL),(22,'dlrkdwls1205','{bcrypt}$2a$10$aNlU2.xo2/zEC3oe300sSeQGUKViZGthiUp3d7YgLQ3Mlds2cG1kC','이강진','M','01031608676','1998-12-05','2025-05-22 09:06:23','user',NULL,NULL),(23,'wkdghks32','{bcrypt}$2a$10$OtAQjIBtEM8qQONGxq0ZvOzAmREVV/o7nVCMTQ0i6MYtuudk9ZyOm','김장환','M','01094354524','1997-08-26','2025-05-22 09:08:21','user',NULL,NULL),(24,'olleh0902','{bcrypt}$2a$10$hIr.YboQPvSw40nlxigXEeMqnyynEYj4zlIybP7D2CM5tgcnfCl5i','김현석','M','01030372435','1992-09-02','2025-05-22 09:09:09','user',NULL,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `oNum` int NOT NULL AUTO_INCREMENT,
  `oDate` date NOT NULL,
  `oStart` date NOT NULL,
  `oReturn` date NOT NULL,
  `oPrice` int NOT NULL,
  `oPeople` int NOT NULL,
  `mNum` int NOT NULL,
  `pNum` int NOT NULL,
  PRIMARY KEY (`oNum`),
  KEY `mNum` (`mNum`),
  KEY `pNum` (`pNum`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`mNum`) REFERENCES `member` (`mNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`pNum`) REFERENCES `package` (`pNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (9,'2025-05-21','2025-05-21','2025-05-24',1,1,20,173),(10,'2025-05-21','2025-05-21','2025-05-24',1,1,20,174),(11,'2025-05-21','2025-05-21','2025-05-24',1,1,20,174),(12,'2025-05-21','2025-05-22','2025-05-31',1,1,20,185);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `pNum` int NOT NULL AUTO_INCREMENT COMMENT '여행상품 번호',
  `pName` varchar(100) NOT NULL COMMENT '상품명',
  `pCountry` varchar(20) NOT NULL COMMENT '여행 국가',
  `pDescription` text NOT NULL COMMENT '상품 설명',
  `pCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '상품 등록일',
  `pPrice` int NOT NULL DEFAULT '0',
  `pImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pNum`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='여행상품';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (170,'베트남 추천 패키지','Vietnam','<figure class=\"image\"><img src=\"/assets/img/package/12d9744d-cee1-45f1-85c7-25f2ead77e02.jpg\"></figure>','2025-05-21 16:29:29',1,'5bc737fa-3c9d-4f97-a834-7a9a3b7055d5_jimsajo_logo3.png'),(171,'부산출발 [제주항공 ]다낭 관광&휴양 다낭/후에/바나산/호이안 관광 3박4일','Vietnam','<figure class=\"image\"><img src=\"/assets/img/package/263b2d1b-6160-4549-9534-1c623d39598c.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/aa767210-5a86-40aa-882e-0ec9d10d7d5f.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/c877e646-626b-493c-b7e9-07d9d761e699.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/269ac12f-608f-472f-bf1a-269d132b9152.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/2164fd78-29bc-4882-bdd1-6901b3849924.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/6df82617-aa2e-4e9d-816c-14d28d223193.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/d922256a-784a-43a4-b972-0baab2af91b0.webp\"></figure><p><br>※ 취소약관</p><p>■ 여행출발일 30일전까지 통보시 : 계약금 환불</p><p>■ 여행출발일 29-20일전까지 통보시 : 여행경비의 10% 배상</p><p>■ 여행출발일 19-8일전까지 통보시 : 여행경비의 50% 배상</p><p>■ 여행출발일 07- 당일 통보시 : 여행경비 100% 배상</p><p>(항공발권 또는 호텔(리조트) 파이널 확약후는 발권 취소챠지 및 호텔취소챠지가 별도 발생됩니다)</p><p>&nbsp;</p>','2025-05-21 16:32:07',1,'1b3aaa39-e1e1-43d3-8c32-0df9db72cb9c_베트남 썸네일.webp'),(172,'부산출발 [BX/LJ] 스팟특가!! 다낭 3박5일 바나산 호이안','Vietnam','<figure class=\"image\"><img src=\"/assets/img/package/224db281-1882-4d3c-a4bd-9290d5a98c96.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/e66d80b2-7a28-4cd3-9ce0-eb30609b28c8.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/130de115-7443-469b-8a92-09699c802e6e.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/411ee6c0-c8a2-40a9-aa91-0a767a28d107.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/f0c217a7-857d-4c1f-b5a6-5c6cf4b2b2d1.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/7fd7b392-e6bb-4cf9-9d74-cfdd77e5e7cf.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/54b822e9-7360-4be0-801e-1d458d785f93.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/baddbd67-c4eb-487f-b3f5-c80445da4757.webp\"></figure>','2025-05-21 16:33:08',1,'0686d6b1-e718-4d21-9469-7e81a1620f1e_v3.png'),(173,'부산출발 나트랑 달랏 취항 특가 3박5일 베트남항공','Vietnam','<figure class=\"image\"><img src=\"/assets/img/package/83992ce2-687c-49cb-860b-afec54c6b880.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/b00d5801-6436-4c63-9d9e-9e21aaed1a29.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/96518af3-0c35-4c3c-b37b-2b160e27adeb.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/8c6f442a-5596-4194-8a02-2154588bbcb1.webp\"></figure><p>&nbsp;</p><figure class=\"image\"><img src=\"/assets/img/package/4cf2e55e-1025-49d0-bdf1-41105b88b32c.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/ff67a8ba-145e-4f14-9f18-af67e2527c8b.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/c1358d0f-8583-4a54-88c1-c27ae97ae221.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/9ccccb3f-0d33-4704-85f7-51a5c3765710.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/89294f23-906c-499d-86dc-70bd4f696dd6.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/daa3f3cd-8e05-4d98-add7-c4f4bf15c133.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/015cab24-7768-4934-9f8d-937e818a96db.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/e7623323-7d22-448b-805d-fa72364c2c86.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/7c57797b-36f6-4c57-8aac-a95749b9f192.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/70d44817-ed06-40de-8ddd-a122621f1b22.webp\"></figure>','2025-05-21 16:49:32',1,'f839972d-adf2-42af-a416-e450e094e937_v3.png'),(174,'태국 패키지 여행','Thailand','<figure class=\"image\"><img src=\"/assets/img/package/3d36b1a2-724c-4a42-b1ea-9cdcc9584468.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/f3e3c893-8535-42a5-96c1-3330edc0e401.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/5d7e04b7-207c-4a70-9007-7a945f783981.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/5756d626-a0a3-439c-ad8c-ffa9a9836b08.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/31b86c30-8683-475f-971f-5c592f016558.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/15cc798b-5a8a-4a2c-9b21-4caad0be0c79.jpg\"></figure><p>&nbsp;</p><figure class=\"image\"><img src=\"/assets/img/package/bf777785-495f-426f-afc7-3472e3135fda.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/e54154db-a631-4b93-9da4-a83f2f49f2d7.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/1a497e3f-1b41-4684-9d84-cb61a7343047.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/42f5a169-f90a-483e-b90a-d34147729b0c.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/f13058f4-5366-4162-a562-d13816e5e573.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/5063ba06-690d-4cfb-9069-a7c573e1c71c.jpg\"></figure><p>&nbsp;</p><figure class=\"image\"><img src=\"/assets/img/package/c97cc50c-a625-4aae-b18c-ac9c48ab2cb8.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/77d1da70-720f-47f5-bcfe-0be8194f5532.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/8ad67229-3453-4406-8e80-5f836d814a64.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/3df6858e-4f46-49a0-b4a6-ea8e586d12c5.webp\"></figure><p>&nbsp;</p><figure class=\"image\"><img src=\"/assets/img/package/17806379-d80f-4f28-9bb1-e7c269e86f2c.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/39d67d3a-d800-49f9-88f6-3571b9d9414d.webp\"></figure>','2025-05-21 16:50:09',1,'10fd430c-b5fa-4eea-a3d0-5aed494135ef_방콕 파타야 핵심 패키지.png'),(176,'치앙마이 패키지 여행','Thailand','<p>&nbsp;</p><figure class=\"image\"><img src=\"/assets/img/package/ba165d02-d628-4482-b023-8b3403f777c2.jpg\"></figure><p>&nbsp;</p><figure class=\"image\"><img src=\"/assets/img/package/e28ab6db-c36d-4047-a53b-5624462b541b.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/cfd7b1c5-d51b-44aa-bf17-91bd9edd9d8d.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/0b2dd523-c4a5-4626-bedb-e87e46713b16.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/74e0ca5f-1fe7-467f-8c21-eecb7b207971.jpg\"></figure>','2025-05-21 16:36:45',1,'3795c633-3459-4e12-9d77-e26c4fa88a6a_images (1).jpg'),(177,'[베스트셀러/W트립] 코타키나발루 5일, 수트라하버 노쇼핑 호핑+반딧불+17시체크아웃','Malaysia','<figure class=\"image\"><img src=\"/assets/img/package/9261d2c2-fb90-4eb7-a782-33bad954b392.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/4bccf96a-3d59-47ae-98fc-277d91f62dc7.jpg\"></figure>','2025-05-21 16:37:54',1,'63aa88a9-8566-4d27-96bc-6723c9c9879a_m19.jpg'),(178,'[4명이상 출발확정] 쿠알라룸푸르/말라카/겐팅 5일 #5성급호텔 #전일관광 #꽉찬일정 #유네스코세계문화유산 #반딧불이','Malaysia','<figure class=\"image\"><img src=\"/assets/img/package/0a6a5080-c07c-4ded-b752-03f8ac966665.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/a2c6031c-1e59-4f30-9ba2-c8aa9a0ad561.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/67dd2021-7a9c-4a88-898f-58572f097c4c.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/536eefbe-848e-4e59-b3a0-e675e2ab3013.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/1bfe240d-bf3b-4544-a68d-550bc083ef59.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/1c36c9df-6d27-4011-a938-f3ac1bf4202c.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/e3666a67-3a0c-4ceb-b6e4-e27eb04ebe2d.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/bdab8047-b481-462a-ae10-0b3ad45ce246.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/0c480360-5719-41a6-803a-01bdb5d299b3.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/49000ee7-85df-4acb-8dea-827533eac669.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/421d63e7-b92b-4077-a63f-bbb29dd49056.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/aa0df7da-7773-4bf8-a69f-abdee733319e.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/8a1b6aa3-9771-428b-82ee-6feb88e8c21f.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/ca17f31c-6aca-4f8b-928c-22534a470796.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/540e0001-f332-4a88-955e-f06891d1a2dc.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/444b2bc5-5f5d-4c93-8146-172e581ab359.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/9c17b131-a295-4fd8-bb14-e8de0d252356.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/a0fa0362-235d-4057-8074-d8b81097d167.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/84454500-d4fb-4c22-9823-e07193038a61.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/c306f8e3-ee3a-4e45-8713-ce5f15976b9b.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/aebaf159-ef75-48b5-a637-7c638e9ac842.jpg\"></figure>','2025-05-21 16:39:17',1,'bbb008c8-e68b-4a7e-8906-030ed8c515c2_썸네일.jpg'),(179,'[베스트셀러] 코타키나발루 5일, 4성급 밍가든VS판보르네오, 호핑+자유일정 포함','Malaysia','<figure class=\"image\"><img src=\"/assets/img/package/28c0d5ff-b6cf-4cd4-8ec1-9d9fe7e03acc.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/4ff1352b-c046-4269-804f-c6daf1913b64.jpg\"></figure><p>취소규정<br>취소수수료 적용 기준: 특별약관</p><p>- 여행개시 30일 전까지 통보 시 : 계약금 환급 (위약금 없이 계약 취소)</p><p>- 여행개시 29일 전까지 통보 시 : 여행요금의 10% 배상</p><p>- 여행개시 21일 전까지 통보 시 : 여행요금의 30% 배상</p><p>- 여행개시 14일 전까지 통보 시 : 여행요금의 50% 배상</p><p>- 여행개시 &nbsp;9일 전까지 통보 시 : 여행요금의 80% 배상</p><p>- 여행 8일전~당일 통보시 : 여행요금의 100% 배상</p><p>※ 단, 항공권 및 일부 교통 수단의 승차권은 여행개시 전 미리 발권될 수 있습니다. 사전 발권된 항공권 및 일부 교통 수단의 승차권에 대한 수수료는 위 여행 취소수수료에 포함되지 않으며, 위 여행 취소수수료와 별도로 부과됩니다.</p><p>자세히 보기를 통해 전체 취소수수료 적용 기준을 반드시 확인 부탁드립니다.</p><p>&nbsp;</p><p>■ 본 여행상품은 항공 또는 선박의 좌석, 숙박 객실의 일부 또는 전부, 기타 본 여행상품을 구성하는 각 개별 상품을 여행사가 미리 확보하고 이미 비용을 선납한 상품입니다. 따라서 취소 시에는 특별약관이 국외여행표준약관에 우선 적용됩니다.</p><p>■ 본 여행상품에 대한 취소수수료는 공정거래위원회에서 고시하는 소비자분쟁해결기준보다 높은 취소수수료가 부과됩니다.</p><p>■ 항공권은 취소 뿐 아니라 예약 변경 또는 재발행(한글명 또는 영문명 변경 등 사유 포함)의 경우에도 수수료가 부과됩니다. 이 경우 수수료는 여행 취소수수료에 포함되지 아니하며, 여행 취소수수료 부과 여부와 관계없이 별도 부과됩니다. 관련 사항은, 본 취소규정의 [항공권 규정 및 좌석안내] 부분의 세부내용을 반드시 확인하여 주시기 바랍니다.</p><p>■ 현지 교통 수단(지역간 항공, 열차, 선박 이동 등)이 포함된 상품의 경우 예약 즉시 승차권 발권이 이루어질 수 있습니다. 이 경우 &nbsp;여행 취소수수료 부과 여부와 관계없이 교통 수단에 대한 비용 100%가 별도 부과됩니다.</p><p>■ 당사의 귀책사유로 여행이 취소되는 경우에도 위 여행 취소수수료 비율을 적용하여 고객에게 배상하며, 이 경우 항공권 및 본 여행상품을 구성하는 각 개별 상품에 대한 수수료는 당사가 전부 부담합니다.</p><p>&nbsp;</p><p>■ 본 여행상품은 청약에 대한 승인의 의사표시로써 예약금을 지불한 시점부터 계약이 성립되며, 계약해제 요청 시에는 귀책사유에 따라 취소수수료가 부과됩니다.</p><p>&nbsp;</p><p>[항공권 규정 및 좌석안내]</p><p>■ 항공권에 관한 사항은 항공사 규정이 본 취소규정에 우선하여 적용됩니다. 이에 따라 항공권은 발권 이후 취소하거나 재발행하는 경우, 본 취소규정에 따르는 여행 취소수수료와 관계없이 항공사 규정에 따라 수수료와 당사의 대행 수수료가 별도로 부과됩니다.</p><p>&nbsp;</p><p>[에어아시아 항공]<br>에어아시아 항공은 항공운임을 선납 하여 판매하는 항공사이므로 예약 확정 후 취소 시 약관과 별도로 이중 부과됩니다. &nbsp;</p><p>예약 확정 후 취소하는 경우<br>&nbsp;- 항공권 취소수수료: 100,000원 별도 부과&nbsp;<br>항공권 발권 후 취소하는 경우<br>&nbsp;- 항공권 취소수수료: 발권 후 환불 불가</p><p>[진에어/제주항공/티웨이항공]</p><p>항공권 발권 후 출발 하루 전까지 취소하는 경우</p><p>&nbsp;- 항공권 취소수수료: 100,000원</p><p>&nbsp;- 항공권 대행수수료: 20,000원</p><p>출발 당일 취소 또는 탑승하지 않는 경우</p><p>&nbsp;- 항공권 취소수수료: 100,000원</p><p>&nbsp;- 항공권 대행수수료: 20,000원</p><p>&nbsp;- 예약부도수수료: 120,000원</p><p>&nbsp;</p><p>[아시아나항공]</p><p>- 발권 후 예약 변경이나 재발행(영문변경)으로 인하여 발생되는 비용은 항공사 규정에 따릅니다.</p><p>- 항공권 발권 이후에는 위 수수료 외에 항공권 취소 패널티가 별도로 부과됩니다.</p><p>&nbsp;※ 단체항공권으로 최소 출발인원 미달될 경우 전액 환불 불가</p><p>&nbsp;※ 최소 출발 인원 충족되는 경우 항공권 발권 ~ 출발 2시간 전까지 취소하는 경우 : 200,000원</p><p>&nbsp;※ 출발 2시간 전 ~ 탑승 시까지 취소하는 경우 또는 탑승하지 않는 경우 예약부도수수료(No-Show Penalty) 120,000원 추가 발생</p><p>&nbsp;</p><p>■ 항공권 발권 후 예약 변경이나 재발행(한글 또는 영문 변경 포함)으로 인하여 발생되는 비용은 항공사 규정에 따릅니다.</p><p>- 비용의 면제 조건 : 사고 증명서, 국가적 질병으로 인한 위험시 등 항공사에서 인정하는 사유서 첨부시 면제됩니다.</p><p>■ 항공권 취소 및 환불 가능기간</p><p>- 항공권 발권 후 익일부터 항공사 규정에 의해 소정의 수수료 제외 후 취소 및 환불 가능합니다.</p><p>- 전세기 및 일부 특가 항공권은 발권 전인 경우라도 예약 확정 시부터 항공권 비용의 100% 취소수수료가 부과됩니다.</p><p>&nbsp;</p><p>[숙박 취소수수료 적용기준]</p><p>- 본 상품은 호텔 및 리조트 객실에 대한 부분을 전액 선납하기 때문에, 위 수수료 외에 객실 취소 수수료가 별도로 부과됩니다.</p><p>- 숙소 확약(Final Check) 이후에는 취소/변경이 불가하므로, 취소/변경 시 100% 패널티가 발생되며, 이에 동의하지 않을 경우 예약이 불가합니다.</p><p>- 취소나 환불 분쟁 시에는 현지 호텔의 규정을 우선적으로 따릅니다.</p><p>- 호텔 룸타입(트윈룸, 더블룸) 및 프로모션 등의 경우는 현지 사정에 따라 체크인 시 변경될 수 있습니다.</p><p>&nbsp;</p><p>■ 취소는 업무시간 내 접수 시 확인 및 적용이 가능합니다. 업무시간 외 접수한 경우에는 익일(영업일이 아닌 경우 다음 영업일)에 접수한 것으로 간주됩니다. 업무시간은 월요일~금요일 09:00~18:00 이며, 주말 및 공휴일 그리고 주중 09:00~18:00 외 시간은 업무시간에 해당되지 않습니다. (예. 토/일/월요일 출발상품은 금요일 업무 종료 전까지 취소 하셔야 합니다.)</p><p>&nbsp;</p><p>■ 고객은 계약 취소와 관련하여 취소수수료(여행사 인건비 포함) 부과 내역에 관한 구체적 증빙과 설명을 여행사에 요구할 수 있으며, 여행사는 관련 설명과 증빙을 제시하고 취소수수료 규정과 차액이 있는 경우 환급합니다. (단, 항공사 및 숙박업체 등의 증빙을 여행사가 확보하는 시점까지 고객에게 증빙 제공을 유예할 수 있습니다.)</p><p>&nbsp;</p><p>■ 최소 출발인원이 미충족되어 여행출발이 불가한 경우에는 국외여행표준약관 제17조에 따라 여행사는 여행출발 7일 전까지 여행계약을 해제하고 고객님께 통보하여 드립니다.</p><p>- 여행 개시 7일 전까지 계약 해제 통지 : 계약금 환급</p><p>- 여행 개시 1일 전까지 계약 해제 통지 : 여행요금의 30% 배상</p><p>- 여행 출발 당일 계약 해제 통지 : 여행요금의 50% 배상</p>','2025-05-21 16:40:09',1,'998255e4-940c-416e-bba3-57f0f513e59e_썸네일.jpg'),(180,'[부산출발] 코타키나발루 3박5일/ 4박6일 호핑+시티나이트','Malaysia','<figure class=\"image\"><img src=\"/assets/img/package/88204d41-e49b-4fca-8b5f-411eb02cbddb.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/5ac5aae9-b2f5-4fa1-beaa-9594c73b03aa.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/9afe0c96-0404-48b9-8f7d-7a28ac08056a.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/ba691703-14f3-4d5d-a47b-31966bf76642.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/e333c8d3-21e3-429c-9278-cb40bb2a36d1.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/debba9f7-3197-46be-a52a-6ded8430d9f1.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/7c6b77b9-ec71-4409-a5aa-13b0e56f05fe.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/55bf3781-f1ef-4498-a2ae-d7472a24de72.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/15bd3d34-9c22-472a-b4de-d2d17bb2a1b0.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/be72eb8d-46da-4c56-98c1-252e079dfa99.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/f9480d8c-57ff-4a8a-abd8-4f8fe0ade28e.webp\"></figure>','2025-05-21 16:40:38',1,'56fef256-ad37-4266-93e4-9c8ccc2dfc09_코타키나발루 썸네일.png'),(181,'[발리홀릭] 발리 6일, 그랜드 미라지 올인클루시브 럭셔리 휴양','Indonesia','<figure class=\"image\"><img src=\"/assets/img/package/aae47493-2eac-41a0-ae3f-1b40cf80ceef.jpg\"></figure>','2025-05-21 16:41:34',1,'accf1c9c-5811-4fc4-9c71-db7acf5f8d75_썸네일.jpg'),(182,'[발리 자유여행] 인기 리조트 추천+왕복픽업+체크아웃투어 포함 6일','Indonesia','<figure class=\"image\"><img src=\"/assets/img/package/b6ef30c9-f9a0-42bc-86dd-08b119634ee8.jpg\"></figure>','2025-05-21 16:42:20',1,'964f19b4-0455-4391-8755-d8a4e696a880_썸네일2.jpg'),(183,'발리패키지 여행','Indonesia','<figure class=\"image\"><img src=\"/assets/img/package/4b9cb1c4-e5d6-44e3-8f4c-ec7408eeea3b.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/d5a19720-236b-4819-abad-8346e903d8e5.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/29a5de82-1e8b-4251-9e7a-cc1f6c0506af.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/fc2b505b-d149-4e92-883b-2e4fc7f50c0d.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/600e2449-9504-45be-89c8-829fe6a81737.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/0b258ace-0ab4-4c4c-bec6-d0282bd6a6e4.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/8447c90d-e704-4cba-acb4-a4ed3b0a0658.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/329051e2-be28-471d-8fdd-41fc763c015d.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/053038b9-e332-4e03-ad16-ced9b44d3fc6.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/6365f544-e57a-400e-b756-e172c2f7c2c0.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/6ad2d1dd-5e76-424a-b0d9-c6133de5ed19.jpg\"></figure><figure class=\"image\"><img src=\"/assets/img/package/2a79e4ff-08cf-459f-b0d7-520006f27c99.jpg\"></figure>','2025-05-21 16:44:18',1,'a7c4b907-c2b3-4bfd-8af0-2f3f053d0d85_92d8c4f0f75aa.png'),(184,'부산출발 발리 직항 울루와뚜 꾸따 우붓 3박5일 4박6일 에어부산','Indonesia','<figure class=\"image\"><img src=\"/assets/img/package/0cb3602f-3a4d-4981-ab0f-244be34a35ec.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/01d5eb62-ca53-4876-9c32-d1a2aad55a19.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/9bc0360d-2546-450a-8d80-0a6fb48e1b5a.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/682ef2d8-ce53-4f1c-875a-053fe158798e.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/238a1700-b914-4168-8a9c-43fa26d3876c.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/f4a1be6d-bd4e-49f3-9f80-22933b0da012.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/4751da36-9910-4673-82e3-024c8f632c50.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/c95ddb7c-7870-48a0-9bd3-1fcd36ff950c.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/0b77f845-a1dd-4bbc-bacc-e3186e00e3a9.webp\"></figure>','2025-05-21 16:44:57',1,'b422acc2-0581-48ed-9fd1-3dd1c31d262e_indo1썸네일.png'),(185,'부산출발 세부 패키지 알테라/솔레아/제이파크 리조트 3박5일 여행 제주항공','Philippines','<figure class=\"image\"><img src=\"/assets/img/package/aaf0d6b4-f715-476d-af6e-1b04d647bb22.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/34a63486-ce44-4b18-b06a-7907110388d5.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/c95109ef-da34-49be-89af-556996b503a6.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/0056fae5-b3c9-430c-94ca-a1d0970c43d6.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/cf5614fc-c27b-4cfb-a146-56b8c64cae7d.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/7330265e-de8b-45bc-95a5-4e35b02055ee.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/cc5baece-a802-49a1-b960-811e89fb4cbf.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/485fd241-89bb-40c2-8e6e-f9cca08d0e61.webp\"></figure><figure class=\"image\"><img src=\"/assets/img/package/a7dbf397-8037-4771-96b9-88d8d92cfd3b.webp\"></figure>','2025-05-21 16:45:40',1,'54705139-c694-443f-9f75-f6589bced1e8_필리핀패키지썸네일1.png'),(186,'[선착순특가][보홀 / 라메디 디럭스룸] 발리카삭호핑투어+돌핀왓칭 3박5일','Philippines','<figure class=\"image\"><img src=\"/assets/img/package/7c2278f5-9192-48ee-bb21-a7dd72101fa6.webp\"></figure>','2025-05-21 16:46:22',1,'9496e0bf-07fa-4588-ae36-96f6eee93b5d_77a8e7ac1f6fd.jpg'),(187,'보홀, 5일, 24년 NEW 가성비 리조트+자유일정+시내관광 포함 슬림패키지','Philippines','<figure class=\"image\"><img src=\"/assets/img/package/fa32f9c9-acaf-4c6e-9320-e39469003628.jpg\"></figure>','2025-05-21 16:46:50',1,'b4afaa06-e3d6-41f7-b446-d2f75154742f_252e574fa3012.jpg'),(188,'[베스트셀러]세부5일,부산출발,가성비최고,솔레아리조트,전신마사지-소아성장마사지,호핑선택','Philippines','<figure class=\"image\"><img src=\"/assets/img/package/88ac3a96-b293-4197-b0e4-90048f28c53f.jpg\"></figure><p>취소규정<br>■ 특별약관 적용</p><p>- 본 여행상품은 청약에 대한 승인의 의사표시로써 예약금을 지불한 시점부터 계약이 성립되며, 계약해제 요청 시에는 귀책사유에 따라 취소수수료가 부과됩니다.</p><p>- 취소수수료는 공정거래위원회에서 고시하는 소비자분쟁해결기준과 다른 별도의 특별약관 규정에 의거하여 적용됩니다.</p><p>특별약관을 적용하는 경우, 공정거래위원회에서 제시하는 소비자분쟁해결기준보다 높은 취소수수료가 부과될 수 있으니, 세부기준을 반드시 확인하여 주시기 바랍니다.</p><p>- 취소는 업무시간 내 접수 시 확인 및 적용이 가능합니다. 업무시간 외 접수한 경우에는 익일(영업일이 아닌 경우 다음 영업일)에 접수한 것으로 간주됩니다.</p><p>업무시간은 월요일~금요일 09:00~18:00 이며, 주말 및 공휴일, 그 외 시간은 업무시간에 해당되지 않습니다.</p><p>(예. 토/일/월요일 출발상품은 금요일 업무 종료 전까지 취소하여야 합니다.)</p><p>&nbsp;</p><p>■ 본 상품은 항공기 ADM (항공기 좌석의 일부 또는 전부를 미리 확보하기 위해 여행사가 선 매입한 항공권)에 기초한 상품으로, &nbsp;고객 취소의 경우 여행사에서 선납부한 DEPOSIT(보증금) 비용이 소요되어 국외여행표준약관(소비자분쟁해결기준)과 다른 별도의 특별약관을 적용하고 있습니다.</p><p>- 여행개시 30일 전까지 ( ~ 30) 통보 시 : 계약금 환급 (위약금 없이 계약 취소)</p><p>- 여행개시 22일 전까지 (29 ~ 22) 통보 시 : 여행요금의 30% 배상</p><p>- 여행개시 15일 전까지 (21 ~ 15) 통보 시 : 여행요금의 60% 배상</p><p>- 여행개시 &nbsp;8일 전까지 (14 &nbsp;~ 8) 통보 시 : 여행요금의 80% 배상</p><p>- 여행개시 &nbsp;7일 전부터 당일 (7 ~ 당일) 통보 시 : 여행요금의 100% 배상</p><p>&nbsp;</p><p>&nbsp;</p><p>■ [진에어/제주항공] 취소수수료 적용 기준</p><p>- 발권 후 예약 변경이나 재발행(영문변경)으로 인하여 발생되는 비용은 항공사 규정에 따릅니다.</p><p>- 항공권 발권 이후에는 위 수수료 외에 항공권 취소 패널티가 별도로 부과됩니다.</p><p>&nbsp;※ 항공권 발권 ~ 출발 하루 전까지 취소하는 경우 : 140,000원</p><p>&nbsp;※ 출발 당일 ~ 탑승 시까지 취소하는 경우 또는 탑승하지 않는 경우 : 위 140,000원 + 예약부도수수료(No-Show Penalty) 200,000원 = 340,000원</p><p>&nbsp;</p><p>&nbsp;</p><p>▶항공사의 사정으로 인한 출도착 시간 지연 및 운송/화물서비스 문제가 발생될 경우, 항공사측의 과실이므로 항공사 측의 공지 및 보상규정으로 처리 됩니다.</p><p>&nbsp;</p><p>■ [숙박] 취소수수료 적용 기준</p><p>- 본 상품은 호텔 및 리조트 객실에 대한 부분을 전액 선납하기 때문에, 위 수수료 외에 객실 취소 수수료가 별도로 부과됩니다.</p><p>- 숙소 확약(Final Check) 이후에는 취소/변경이 불가하므로, 취소/변경 시 100% 패널티가 발생되며, 이에 동의하지 않을 경우 예약이 불가합니다.</p><p>- 취소나 환불 분쟁 시에는 현지 호텔의 규정을 우선적으로 따릅니다.</p><p>- 호텔 룸타입(트윈룸, 더블룸) 및 프로모션 등의 경우는 현지 사정에 따라 체크인 시 변경될 수 있습니다.</p><p>&nbsp;</p><p>■ [중간 항공, 현지 교통수단, 이용권, 비자 등] 취소수수료 적용 기준</p><p>- 상품 특성상 예약 후 발생되는 중간 항공, 현지 교통수단, 현지 이용권, 비자 발권수수료 등은 환불이 불가합니다.</p><p>&nbsp;</p><p>■ [취소수수료 면제]</p><p>&nbsp;- 고객은 계약 취소와 관련하여 취소수수료(여행사 인건비 포함) 부과 내역에 관한 구체적 증빙과 설명을 여행사에 요구할 수 있으며, 여행사는 관련 설명과 증빙을 제시하고 취소수수료 규정과 차액이 있는 경우 환급합니다.</p><p>※ 단, 항공사 및 숙박업체 등의 증빙을 여행사가 확보하는 시점까지 고객에게 증빙 제공을 유예할 수 있습니다.)</p><p>- 취소수수료의 합이 총 여행경비의 10%를 초과하지 않는 경우 증빙을 제시하지 않습니다</p><p>- 여행 출발일 이전 상해, 질병, 입원, 사망 등으로 여행을 취소하는 경우 [진단서] 증빙에 근거하여 검토 및 협의를 통해 환불할 수 있으며, 출발일 기준 7일 이내에 증빙서류를 제출하여야 합니다.</p><p>&nbsp;※ 단, 전세항공 및 전세객실 예약의 경우 발생하는 취소수수료는 지불하 셔야하며 고객은 이와 관련된 증빙서류를 요구 할 수 있고, 여행사는 관련 설명과 증빙을 제시하고 차액이 있는 경우 환급합니다. (항공사규정에 따라 환불규정은 달라질 수 있습니다.)</p><p>&nbsp;</p>','2025-05-21 16:47:31',1,'ef8b1494-c155-45b1-a227-bec9d822dbec_ddadff85ff65b.jpg');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `mNum` int NOT NULL,
  `pNum` int NOT NULL,
  `oNum` int NOT NULL,
  `imp_uid` varchar(100) NOT NULL,
  `merchant_uid` varchar(100) NOT NULL,
  `pay_method` varchar(50) NOT NULL,
  `pay_amount` int NOT NULL,
  `pay_status` varchar(50) NOT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `imp_uid` (`imp_uid`),
  KEY `mNum` (`mNum`),
  KEY `pNum` (`pNum`),
  KEY `oNum` (`oNum`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`mNum`) REFERENCES `member` (`mNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`pNum`) REFERENCES `package` (`pNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`oNum`) REFERENCES `orders` (`oNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (8,20,173,9,'imp_971200808123','order_1747815199828','trans',1,'paid','2025-05-21 17:13:50','2025-05-21 08:13:51'),(9,20,174,11,'imp_992326341193','order_1747815325396','trans',1,'paid','2025-05-21 17:15:57','2025-05-21 08:15:58'),(10,20,185,12,'imp_389378319780','order_1747815376084','trans',1,'paid','2025-05-21 17:16:39','2025-05-21 08:16:42');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recommendations_ibfk_1` (`package_id`),
  CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`pNum`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendations`
--

LOCK TABLES `recommendations` WRITE;
/*!40000 ALTER TABLE `recommendations` DISABLE KEYS */;
INSERT INTO `recommendations` VALUES (23,173),(21,174),(24,178),(22,184),(25,185);
/*!40000 ALTER TABLE `recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `rNum` int NOT NULL AUTO_INCREMENT COMMENT '후기 번호',
  `rImage` varchar(500) DEFAULT NULL COMMENT '후기 이미지 경로',
  `rReview` text NOT NULL COMMENT '후기 내용',
  `rDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성 시간',
  `rTitle` varchar(50) NOT NULL COMMENT '후기 제목',
  `rCnt` int NOT NULL DEFAULT '0' COMMENT '조회수',
  `mNum` int NOT NULL COMMENT '작성자 회원 번호',
  `pNum` int NOT NULL COMMENT '관련 여행 상품 번호',
  PRIMARY KEY (`rNum`),
  KEY `mNum` (`mNum`),
  KEY `pNum` (`pNum`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`mNum`) REFERENCES `member` (`mNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`pNum`) REFERENCES `package` (`pNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='여행 후기';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (12,'1a69f179-3a6c-4ba9-a68f-10c0dc35d460_베트남 썸네일.webp','재밌었따','2025-05-21 17:17:44','나트랑 여행후기',4,20,173),(13,'257c1966-13f2-4406-ad3c-b786b9852dce_7c6a7d909767d.jpg','재미써따','2025-05-21 17:18:08','태국 패키지여행',17,20,174);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-22  9:13:01
