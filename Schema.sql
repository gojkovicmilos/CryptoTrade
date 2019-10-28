CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `symbol` text NOT NULL,
  `rank` int(11) NOT NULL,
  `price_usd` float NOT NULL,
  `price_btc` float NOT NULL,
  `24h_volume_usd` float NOT NULL,
  `market_cap_usd` float NOT NULL,
  `available_supply` float NOT NULL,
  `total_supply` float NOT NULL,
  `max_supply` float DEFAULT NULL,
  `percent_change_1h` float NOT NULL,
  `percent_change_24h` float NOT NULL,
  `percent_change_7d` float NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL,
  `date` datetime NOT NULL,
  `Wallet_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Transaction_Wallet1_idx` (`Wallet_id`),
  KEY `fk_transaction_currency1_idx` (`currency_id`),
  CONSTRAINT `fk_Transaction_Wallet1` FOREIGN KEY (`Wallet_id`) REFERENCES `wallet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_currency1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `balance` float NOT NULL,
  `name` text NOT NULL,
  `surname` text NOT NULL,
  `email` text NOT NULL,
  `wallet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_wallet1_idx` (`wallet_id`),
  CONSTRAINT `fk_user_wallet1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mg','pw',500,'Milos','Gojkovic','mgojkovic91@gmail.com',1),(2,'admin','admin',999,'admin','admin','adm@adm.adm',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BTC` float NOT NULL,
  `ETH` float NOT NULL,
  `LTC` float NOT NULL,
  `XMR` float NOT NULL,
  `ZEC` float NOT NULL,
  `BTG` float NOT NULL,
  `DOGE` float NOT NULL,
  `XRP` float NOT NULL,
  `BCH` float NOT NULL,
  `ADA` float NOT NULL,
  `XEM` float NOT NULL,
  `XLM` float NOT NULL,
  `MIOTA` float NOT NULL,
  `EOS` float NOT NULL,
  `DASH` float NOT NULL,
  `NEO` float NOT NULL,
  `TRX` float NOT NULL,
  `ICX` float NOT NULL,
  `QTUM` float NOT NULL,
  `ETC` float NOT NULL,
  `LSK` float NOT NULL,
  `XRB` float NOT NULL,
  `BNB` float NOT NULL,
  `XVG` float NOT NULL,
  `OMG` float NOT NULL,
  `BCN` float NOT NULL,
  `BCC` float NOT NULL,
  `PPT` float NOT NULL,
  `STRAT` float NOT NULL,
  `KCS` float NOT NULL,
  `BTS` float NOT NULL,
  `VEN` float NOT NULL,
  `SNT` float NOT NULL,
  `USDT` float NOT NULL,
  `ARDR` float NOT NULL,
  `STEEM` float NOT NULL,
  `DCN` float NOT NULL,
  `REP` float NOT NULL,
  `WAVES` float NOT NULL,
  `DRGN` float NOT NULL,
  `ZRX` float NOT NULL,
  `DGB` float NOT NULL,
  `LRC` float NOT NULL,
  `VERI` float NOT NULL,
  `WAX` float NOT NULL,
  `KMD` float NOT NULL,
  `ARK` float NOT NULL,
  `HSR` float NOT NULL,
  `SMART` float NOT NULL,
  `ETN` float NOT NULL,
  `GNT` float NOT NULL,
  `DENT` float NOT NULL,
  `BAT` float NOT NULL,
  `DCR` float NOT NULL,
  `PIVX` float NOT NULL,
  `SALT` float NOT NULL,
  `GBYTE` float NOT NULL,
  `QASH` float NOT NULL,
  `BTM` float NOT NULL,
  `ETHOS` float NOT NULL,
  `KNC` float NOT NULL,
  `FUN` float NOT NULL,
  `MED` float NOT NULL,
  `XP` float NOT NULL,
  `RDD` float NOT NULL,
  `POWR` float NOT NULL,
  `GXS` float NOT NULL,
  `FCT` float NOT NULL,
  `AE` float NOT NULL,
  `ENG` float NOT NULL,
  `ZCL` float NOT NULL,
  `WTC` float NOT NULL,
  `NXS` float NOT NULL,
  `ELF` float NOT NULL,
  `REQ` float NOT NULL,
  `AION` float NOT NULL,
  `GAS` float NOT NULL,
  `NEBL` float NOT NULL,
  `NXT` float NOT NULL,
  `KIN` float NOT NULL,
  `SUB` float NOT NULL,
  `RHOC` float NOT NULL,
  `MONA` float NOT NULL,
  `COB` float NOT NULL,
  `SYS` float NOT NULL,
  `MAID` float NOT NULL,
  `GNO` float NOT NULL,
  `XDN` float NOT NULL,
  `BTCD` float NOT NULL,
  `DGD` float NOT NULL,
  `SAN` float NOT NULL,
  `GAME` float NOT NULL,
  `ICN` float NOT NULL,
  `ZXC` float NOT NULL,
  `CVC` float NOT NULL,
  `BNT` float NOT NULL,
  `LINK` float NOT NULL,
  `PAY` float NOT NULL,
  `QSP` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-05  8:53:31
