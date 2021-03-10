-- MariaDB dump 10.17  Distrib 10.5.6-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: octoquest
-- ------------------------------------------------------
-- Server version	10.5.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `cod_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nome_disciplina` varchar(50) DEFAULT NULL,
  `sigla_disciplina` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`cod_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Matemática','MAT'),(2,'Português','PT'),(3,'Química','QUI'),(4,'Física','FIS'),(5,'Biologia','BIO'),(6,'Geografia','GEO'),(7,'História','HIST'),(8,'Sociologia','SOC'),(9,'Filosofia','FILO'),(10,'Espanhol','ESP'),(11,'Inglês','ING'),(12,'Redação','RED');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prova`
--

DROP TABLE IF EXISTS `prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prova` (
  `cod_prova` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_prova` varchar(200) DEFAULT NULL,
  `salva` tinyint(1) DEFAULT NULL,
  `cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_prova`),
  KEY `´fk_usuario´` (`cadastro`),
  CONSTRAINT `´fk_usuario´` FOREIGN KEY (`cadastro`) REFERENCES `usuario` (`cadastro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prova`
--

LOCK TABLES `prova` WRITE;
/*!40000 ALTER TABLE `prova` DISABLE KEYS */;
/*!40000 ALTER TABLE `prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prova_questao`
--

DROP TABLE IF EXISTS `prova_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prova_questao` (
  `cod_questao` int(11) DEFAULT NULL,
  `cod_prova` int(11) DEFAULT NULL,
  KEY `´fk_questao1´` (`cod_questao`),
  KEY `´fk_prova´` (`cod_prova`),
  CONSTRAINT `´fk_prova´` FOREIGN KEY (`cod_prova`) REFERENCES `prova` (`cod_prova`),
  CONSTRAINT `´fk_questao1´` FOREIGN KEY (`cod_questao`) REFERENCES `questao` (`cod_questao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prova_questao`
--

LOCK TABLES `prova_questao` WRITE;
/*!40000 ALTER TABLE `prova_questao` DISABLE KEYS */;
/*!40000 ALTER TABLE `prova_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questao`
--

DROP TABLE IF EXISTS `questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questao` (
  `cod_questao` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_questao` varchar(50) DEFAULT NULL,
  `descricao` varchar(20000) DEFAULT NULL,
  `tipo_questao` varchar(50) DEFAULT NULL,
  `aprovado` tinyint(1) DEFAULT NULL,
  `cod_tema` int(11) DEFAULT NULL,
  `cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_questao`),
  KEY `´fk_tema´` (`cod_tema`),
  KEY `´fk_usuario1´` (`cadastro`),
  CONSTRAINT `´fk_tema´` FOREIGN KEY (`cod_tema`) REFERENCES `tema` (`cod_tema`),
  CONSTRAINT `´fk_usuario1´` FOREIGN KEY (`cadastro`) REFERENCES `usuario` (`cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questao`
--

LOCK TABLES `questao` WRITE;
/*!40000 ALTER TABLE `questao` DISABLE KEYS */;
INSERT INTO `questao` VALUES (1,'Citologia','UERJ 2019/1 - Macromoléculas polares são capazes de atravessar a membrana plasmática celular, passando do meio externo para o meio interno da célula. Essa passagem é possibilitada pela presença do seguinte componente na membrana plasmática:','Dissertativa',2,22,NULL),(2,'Saúde','Durante as estações chuvosas, aumentam no Brasil as campanhas de prevenção à dengue, que têm como objetivo a redução da proliferação do mosquito Aedes aegypti, transmissor do vírus da dengue. Que proposta preventiva poderia ser efetivada para diminuir a reprodução desse mosquito?','Dissertativa',2,23,NULL),(3,'Genética','Com base nos experimentos de plantas de Mendel, foram estabelecidos três princípios básicos, que são conhecidos como leis da uniformidade, segregação e distribuição independente. A lei da distribuição independente refere-se ao fato de que os membros de pares diferentes de genes segregam-se independentemente, uns dos outros, para a prole. Hoje, sabe-se que isso nem sempre é verdade. Por quê?','Dissertativa',2,24,NULL),(4,'Evolução','A principal explicação para a grande variedade de espécies na Amazônia é a teoria do refúgio. Nos últimos 100 000 anos, o planeta sofreu vários períodos de glaciação, em que as florestas enfrentaram fases de seca. Dessa forma, as matas expandiram-se e depois reduziram-se. Nos períodos de seca prolongados, cada núcleo de floresta ficava isolado do outro. Então, os grupos de animais dessas áreas isoladas passaram por processos de diferenciação genética, muitas vezes se transformando em espécies ou subespécies diferentes das originais e das que ficaram em outros refúgios. O principal processo evolutivo relacionado ao texto é a: ','Dissertativa',2,25,NULL),(5,'Sistema Nervoso','(Cesgranrio-RJ) Os anestésicos, largamente usados pela Medicina, tornam regiões ou todo o organismo insensível à dor porque atuam:','Dissertativa',2,26,NULL),(6,'Sistema Imunológico','(Enem – 2014) - Embora sejam produzidos e utilizados em situações distintas, os imunobiológicos I e II atuam de forma semelhante nos humanos e equinos, pois:','Dissertativa',2,27,NULL),(7,'A Pré-História','(Enem) Os nossos ancestrais dedicavam-se à caça, à pesca e à coleta de frutas e vegetais, garantindo sua subsistência, porque ainda não conheciam as práticas de agricultura e pecuária. Uma vez esgotados os alimentos, viam-se obrigados a transferir o acampamento para outro lugar.O texto refere-se ao movimento migratório denominado','Dissertativa',2,34,NULL),(8,'Religião Egípcia','(Vunesp) Os Estados teocráticos da Mesopotâmia e do Egito evoluíram acumulando características comuns e peculiaridades culturais. Os egípcios desenvolveram a prática de embalsamar o corpo humano porque?','Dissertativa',2,35,NULL),(9,'A Fenícia','Os fenícios, que desenvolveram sua civilização na região onde hoje se encontra o Estado do Líbano, destacaram-se como grandes comerciantes marítimos. Entretanto, outro importante legado foi deixado pelos fenícios para as civilizações posteriores. Qual foi este legado?','Dissertativa',2,36,NULL),(10,'Grécia Antiga','Na Grécia Antiga, as principais cidades-estado foram?','Dissertativa',2,37,NULL),(82,NULL,'Em que ano os Portugueses chegaram ao Brasil?','Múltipla-Escolha',0,NULL,35),(83,'Matemática','2+2?','Disssertativa',0,NULL,35),(84,NULL,'','Disssertativa',NULL,NULL,56),(85,NULL,'DIA ','Múltipla-Escolha',0,NULL,56),(86,NULL,'Como ser a Pegadora como a KAREN?','Disssertativa',NULL,NULL,57),(87,'OTAVIO','AAAAA','Múltipla-Escolha',0,NULL,60),(88,'Matemática','Quanto é 5/5?','Múltipla-Escolha',0,NULL,61),(89,'MATEMÁTICA','QUANTO É 9+9?','Disssertativa',0,NULL,61),(90,NULL,'','Disssertativa',NULL,NULL,61),(91,NULL,'aaaaaaaaaa','Disssertativa',NULL,NULL,61),(92,NULL,'aaaaaaaaaaaa','Disssertativa',NULL,NULL,61),(93,NULL,'aaaaaaaaaaaaaaaaaaaa','Disssertativa',NULL,NULL,61),(94,NULL,'','Disssertativa',NULL,NULL,61),(95,NULL,'aaaaaaaaaaa','Disssertativa',NULL,NULL,61),(96,NULL,'COMI UM HOTDOG DA ZONA LESTE, FIQUEI 3 MESES INTERNADO, NUNCA FAÇAM ISSO TO MORRENDO ','Disssertativa',NULL,NULL,61),(97,'aaa','aaaaa','Múltipla-Escolha',0,NULL,61),(98,'aaaaa','aaaaaaa','Disssertativa',0,NULL,61),(99,'HISTÓRIA','QUANDO O BRASIL FOI DESCOBERTO?','Disssertativa',0,NULL,6),(100,'HISTÓRIA','QUEM COONIZOU O BRASIL?','Disssertativa',0,NULL,69),(101,'MATEMÁTICA','QUANTO É 2+2?','Múltipla-Escolha',0,NULL,69),(102,'Matemática','Quanto é 2+2?','Disssertativa',0,NULL,70),(103,'MATEMÁTICA','Quanto é 5/0?','Múltipla-Escolha',0,NULL,70),(104,NULL,'Educação a distância','Disssertativa',NULL,NULL,70),(105,NULL,'Educação a distância','Disssertativa',NULL,NULL,70),(106,'matemática','quanto é 2+2?','Disssertativa',0,NULL,70),(107,'Matemática','Quando é 5+5?','Múltipla-Escolha',0,NULL,70),(108,NULL,'Educação a distância','Disssertativa',NULL,NULL,70),(109,'Matemática','Quanto é 2+2?','Múltipla-Escolha',0,NULL,70),(110,'História','Que povo colonizou o Brasil?','Disssertativa',0,NULL,70),(111,NULL,'Educação a distância','Disssertativa',NULL,NULL,70),(112,'Matemática','Quanto é 2+2?','Disssertativa',0,NULL,70),(113,'Matemática','Quanto é 2/2?','Múltipla-Escolha',0,NULL,70),(114,'Geografia','aaaaaaaa','Múltipla-Escolha',0,NULL,71),(115,'Sociologia ','Quem foi Carl Marx?','Disssertativa',0,NULL,72),(116,NULL,'UM DIA ANDEI DE CARRO','Disssertativa',NULL,NULL,74),(117,NULL,'Eu comi um lanche','Redacao',0,NULL,74),(118,'Geografia','Chove?','Múltipla Escolha',0,NULL,74),(119,'aaaaaaaaaaa','TO COM FOME','Disssertativa',0,NULL,74);
/*!40000 ALTER TABLE `questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resposta`
--

DROP TABLE IF EXISTS `resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resposta` (
  `cod_resposta` int(11) NOT NULL AUTO_INCREMENT,
  `resposta_certa` varchar(1000) DEFAULT NULL,
  `cod_questao` int(11) DEFAULT NULL,
  `opcoes` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`cod_resposta`),
  KEY `´fk_questao´` (`cod_questao`),
  CONSTRAINT `´fk_questao´` FOREIGN KEY (`cod_questao`) REFERENCES `questao` (`cod_questao`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resposta`
--

LOCK TABLES `resposta` WRITE;
/*!40000 ALTER TABLE `resposta` DISABLE KEYS */;
INSERT INTO `resposta` VALUES (1,'Proteína',1,NULL),(2,'Remoção dos recipientes que possam acumular água, porque as larvas do mosquito se desenvolvem nesse meio.',2,NULL),(3,'Os genes localizados fisicamente próximos no mesmo cromossomo tendem a ser herdados juntos.',3,NULL),(4,'Evolução alopátrica',4,NULL),(5,'Nas sinapses, impedindo a transmissão do impulso nervoso.',5,NULL),(6,'Estimulam a produção de anticorpos.',6,NULL),(7,'Nomadismo',7,NULL),(8,'depois da morte a alma podia voltar ao corpo mumificado.',8,NULL),(9,'Criação de uma escrita e um alfabeto fonético.',9,NULL),(10,'Atenas e Esparta',10,NULL),(118,'',82,'1500'),(119,'',82,'1600'),(120,'',82,'1550'),(121,'',82,'1651'),(122,'',82,'1354'),(123,'a',82,''),(124,'4',83,NULL),(125,'',85,'AAGFAF'),(126,'',85,'DASD'),(127,'',85,'ASDD'),(128,'',85,'FFA'),(129,'',85,'SSSSSSS'),(130,'d',85,''),(131,'',87,'AAAAAA'),(132,'',87,'AAAA'),(133,'',87,'SSSSS'),(134,'',87,'DDDDD'),(135,'',87,'AAAAAAA'),(136,'d',87,''),(137,'',88,'1'),(138,'',88,'2'),(139,'',88,'3'),(140,'',88,'4'),(141,'',88,'5'),(142,'a',88,''),(143,'18',89,NULL),(144,'',97,'sssssa'),(145,'',97,'aaaaaaa'),(146,'',97,'aaaaa'),(147,'',97,'aaaaaa'),(148,'',97,'aaaaaa'),(149,'',97,''),(150,'aaaaaaaaaa',98,NULL),(151,'1500',99,NULL),(152,'OS PORTUGUESES',100,NULL),(153,'',101,'7'),(154,'',101,'8'),(155,'',101,'5'),(156,'',101,'4'),(157,'',101,'2'),(158,'d',101,''),(159,'4',102,NULL),(160,'',103,'0'),(161,'',103,'5'),(162,'',103,'1'),(163,'',103,'2'),(164,'',103,'8'),(165,'a',103,''),(166,'4',106,NULL),(167,'',107,'10'),(168,'',107,'20'),(169,'',107,'5'),(170,'',107,'8'),(171,'',107,'9'),(172,'a',107,''),(173,'',109,'4'),(174,'',109,'5'),(175,'',109,'6'),(176,'',109,'7'),(177,'',109,'8'),(178,'a',109,''),(179,'portugueses',110,NULL),(180,'4',112,NULL),(181,'',113,'1'),(182,'',113,'2'),(183,'',113,'5'),(184,'',113,'4'),(185,'',113,'8'),(186,'a',113,''),(187,'',114,'aaaaa'),(188,'',114,'aaaaa'),(189,'',114,'aaaaa'),(190,'',114,'aaaa'),(191,'',114,'aaaaaaaa'),(192,'d',114,''),(193,'Um cara',115,NULL),(194,'',118,'Chove'),(195,'',118,'Não chove'),(196,'',118,'Chove as vezes'),(197,'',118,'Chove nunca '),(198,'',118,'O que é chuva?'),(199,'a',118,''),(200,'VAI COMER',119,NULL);
/*!40000 ALTER TABLE `resposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tema` (
  `cod_tema` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tema` varchar(50) DEFAULT NULL,
  `sigla_tema` varchar(5) DEFAULT NULL,
  `cod_disciplina` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_tema`),
  KEY `´fk_disciplina´` (`cod_disciplina`),
  CONSTRAINT `´fk_disciplina´` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` VALUES (1,'Conjuntos Numéricos','CJN',NULL),(2,'Função','FÇ',NULL),(3,'Função de 1 grau','FÇ1',NULL),(4,'Funçaõ de 2 grau','FÇ2',NULL),(5,'Teoria de Conjuntos','CJN',NULL),(6,'Textos verbais e não-verbais','TVTN',NULL),(7,'Texto x Contexto','TC',NULL),(8,'Período simples','PS',NULL),(9,'Pontuação','PONT',NULL),(10,'Figuras de sintaxe','FL',NULL),(11,'Funções Químicas','FQ',NULL),(12,'Modelos atômicos','MA',NULL),(13,'Tabela periódica','TP',NULL),(14,'Transformações químicas','TQ',NULL),(15,'Propriedades dos materiais','PM',NULL),(16,'Grandezas escalares e vetoriais;','GEV',NULL),(17,'Movimentos retilíneos','MR',NULL),(18,'lançamentos de projéteis','LP',NULL),(19,'Força peso','FP',NULL),(20,' força de atrito','FA',NULL),(21,'e força resultante','FR',NULL),(22,'Citologia','CITO',NULL),(23,'Saúde','SAU',NULL),(24,'Genética','GEN',NULL),(25,'Evolução','EVO',NULL),(26,'Sistema Nervoso','SN',NULL),(27,'Sistema Imunitário','SI',NULL),(28,'Democracia','DEM',NULL),(29,'Meritocracia','MER',NULL),(30,'Classe social','CS',NULL),(31,'Religião','RLG',NULL),(32,'Comunismo','COM',NULL),(33,'A Pré-História','PH',NULL),(34,' Antigo Egito','AE',NULL),(35,'Religião Egípcia','RE',NULL),(36,'A Fenícia','F',NULL),(37,'Grécia Antiga','GA',NULL),(38,'Meio Ambiente','MA',NULL),(39,'Poluição','POLU',NULL),(40,'Indústria','IND',NULL),(41,'Agricultura','AGRC',NULL),(42,'A questão democrática','QD',NULL),(43,'Arte e Técnica','AT',NULL),(44,'Bioética','BT',NULL),(45,'Corpo Humano','CH',NULL),(46,'Numbers','NUM',NULL),(47,'Colors','COL',NULL),(48,'Horas','HO',NULL),(49,'Dias da semana','DS',NULL),(50,'Números','N',NULL),(51,'Muy e mucho','MM',NULL),(52,'Mobilidade urbana sustentáve','MUS',NULL),(53,'O combate às epidemias no Brasil','CEB',NULL),(54,'Obesidade no Brasil','OB',NULL),(55,'Aumento das DSTs entre jovens brasileiros','ADJB',NULL),(56,'A evasão escolar em questão no Brasil','EEQB',NULL),(57,'O combate à depressão na sociedade brasileira','CDSB',NULL),(58,'Democratização do acesso ao cinema no Brasil','DACB',NULL),(59,'O perigo da escassez da água no Brasil','PEAB',NULL),(60,'Caminhos para combater os maus-tratos aos animais','CCMTA',NULL);
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `cadastro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nome_usuario` varchar(15) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `instituicao` text DEFAULT NULL,
  `tipo_insti` text DEFAULT NULL,
  PRIMARY KEY (`cadastro`),
  UNIQUE KEY `Index 2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'joana','joana@joana.joana','joana','123645','1236554','joana','joana'),(2,'fabiola','joana@fabiola','fabiola','123645','123','IFSP','Ensino Médio'),(3,'juliana','alice@alicerrrrrrr','alice','123458','54f74fbfb94518a527a36474dc904c25','IFSP','Ensino Médio'),(4,'thiago','thiago@thiago','thiago','1545','e358efa489f58062f10dd7316b65649e','IFSP','Ensino Médio'),(5,'felipe','felipe@felipe.com','felipe','skjakjshkajh','e358efa489f58062f10dd7316b65649e','IFSP','Ensino Médio'),(6,'henrique','henrique@henrique.com','henrique','45787','2510c39011c5be704182423e3a695e91','IFSP','Ensino Médio'),(7,'guilherme','guilherme@guilherme','guilherme','45788','b2f5ff47436671b6e533d8dc3614845d','IFSP','Ensino Médio'),(8,'claudia ','claudia@aptacontabilidade.com.br','clau','5758656','4a8a08f09d37b73795649038408b5f33','IFSP','Ensino Médio'),(9,'rodrigo','rodrigo.furman@rodrigo','rodrigo','8445454','4b43b0aee35624cd95b910189b3dc231','IFSP','Ensino Médio'),(11,'Matheus','mathues@matheus','matheus','7899785','6f8f57715090da2632453988d9a1501b','IFSP','Ensino Médio'),(12,'ana','ana@ana','ana','7855555','0cc175b9c0f1b6a831c399e269772661','IFSP','Ensino Médio'),(14,'julio','julio@julio','julio','(54) 5415-1521','363b122c528f54df4a0446b6bab05515','IFSP','Ensino Médio'),(15,'','','','','d41d8cd98f00b204e9800998ecf8427e','',''),(16,'he','he@he','he','(85) 4522-2022','6f96cfdfe5ccc627cadf24b41725caa4','IFSP','Ensino Médio'),(17,'clara','clara@clara','clara','(51) 3210-3210','161747ec4dc9f55f1760195593742232','IFSP','Ensino Médio'),(18,'Isabelle','isabelle@isabelle','isa','(41) 5454-1524','165a1761634db1e9bd304ea6f3ffcf2b','IFSP','Ensino Médio'),(20,'Paulo','paulo@paulo','Paulo','(12) 2454-5454','c20ad4d76fe97759aa27a0c99bff6710','IFSP','Ensino Médio'),(21,'Ursula','ursula@ursula','ursula','(87) 4545-2524','7b774effe4a349c6dd82ad4f4f21d34c','IFSP','Ensino Médio'),(23,'Isabelle','isabelleserrano.furman@gmail.com','isabelle','(24','d41d8cd98f00b204e9800998ecf8427e','',''),(25,'Carla Borges','carla@carla','carlinha','(88) 7552-2654','5435c69ed3bcc5b2e4d580e393e373d3','IFSP','Ensino Médio'),(26,'Henrique Paulo','henriquep@henriquep','Henrique','(54) 6354-3546','6f96cfdfe5ccc627cadf24b41725caa4','IFSP','Ensino Médio'),(31,'Gabriela','gabie@gabie','gabie','(58) 8852-2222','b2f5ff47436671b6e533d8dc3614845d','IFSP','Ensino Médio'),(32,'gustavo','gustavo@gustavo.com','gustavo','(41) 5212-0256','dbd65784717c867e8993450bf915aa2f','IFSP','Ensino Médio'),(33,'paula','paula@paula.com','paula','(11) 2240-8551','83878c91171338902e0fe0fb97a8c47a','IFSP','Ensino Médio'),(34,'Lais','lais@lais.com','Lais ','(41) 2152-1201','2db95e8e1a9267b7a1188556b2013b33','IFSP','Ensino Médio'),(35,'nilda','nilda@nilda.com.br','nilda','(44) 4444-4444','7b8b965ad4bca0e41ab51de7b31363a1','IFSP','Ensino Médio'),(36,'Miguel Serrano Filho','miguel@miguel.com','','','d41d8cd98f00b204e9800998ecf8427e','',''),(42,'juliana','felipe@felipe','matheus','(88) 8888-8888','03c7c0ace395d80182db07ae2c30f034','IFSP','Ensino Médio'),(47,'Isabelle','alice@alice','furman','(77) 7777-7777','0cc175b9c0f1b6a831c399e269772661','IFSP','Ensino Médio'),(52,'t','t@t','t','(44) 4444-4444','e358efa489f58062f10dd7316b65649e','IFSP','Ensino Médio'),(53,'u','u@u','u','(77) 7777-7777','7b774effe4a349c6dd82ad4f4f21d34c','IFSP','Ensino Médio'),(55,'Marcia','marcia@marcia','marcia','(77) 7777-7777','6f8f57715090da2632453988d9a1501b','IFSP','Ensino Médio'),(56,'G','G@G','G','(99) 9999-9999','dfcf28d0734569a6a693bc8194de62bf','IFSP','Ensino Médio'),(57,'Karen','karen@karen','Kaks','(88) 8888-8888','8ce4b16b22b58894aa86c421e8759df3','IFSP','Ensino Médio'),(59,'Otavio','otavio@otavio','marcelo','(77) 7777-7777','d3a363c7c51059889755aeff86c24889','IFSP','Ensino Médio'),(60,'Pedro','daniel@daniel.com','Daniel','(77) 7777-7777','8277e0910d750195b448797616e091ad','IFSP','Ensino Médio'),(61,'Bianca','bianca@bianca.com','bibibiiiiiii','(44) 4444-4444','92eb5ffee6ae2fec3ad71c777531578f','IFSP','Ensino Médio'),(63,'henrique','henrique@henrique','henrique','(77) 7777-7777','c1d9f50f86825a1a2302ec2449c17196','IFSP','Ensino Médio'),(65,'Daniela Pereira','da@da.com','DaniDani','(22) 2222-2222','8277e0910d750195b448797616e091ad','IFSP','Ensino Médio'),(68,'guilherme almeida','gui@gui','guilherme','(77) 7777-7777','b2f5ff47436671b6e533d8dc3614845d','IFSP','Ensino Médio'),(69,'Antonio','antonio@antonio.com','Antonio','(77) 7777-7777','0cc175b9c0f1b6a831c399e269772661','IFSP','Ensino Médio'),(70,'Kaylane','kay@kay','kay','(77) 7777-7777','8ce4b16b22b58894aa86c421e8759df3','IFSP','Ensino Médio'),(71,'Rafael','rafael@rafael.com','Rafa','(99) 9999-9999','e358efa489f58062f10dd7316b65649e','IFSP','Ensino Médio'),(72,'Lara','lara@lara.com.br','Lara','(77) 7777-7777','2db95e8e1a9267b7a1188556b2013b33','IFSP','Ensino Médio'),(74,'Marcela','marcela@marcela.com','Marcela','(77) 7777-7777','6f8f57715090da2632453988d9a1501b','IFSP','Ensino Médio');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-10 18:50:50
