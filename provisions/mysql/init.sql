/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table carriers
CREATE TABLE IF NOT EXISTS `carriers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F48AAB577153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table carriers: ~3 rows (approximately)
INSERT IGNORE INTO `carriers` (`id`, `name`, `code`, `is_active`) VALUES
	(1, 'Post', 'PST', 1),
	(2, 'Rail', 'RAL', 1),
	(3, 'Pidgeon', 'PDG', 1);

-- Dumping structure for table doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table doctrine_migration_versions: ~2 rows (approximately)
INSERT IGNORE INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20260908150436', '2026-09-23 09:29:34', 10),
	('DoctrineMigrations\\Version20260908175703', '2026-09-23 09:29:34', 61);

-- Dumping structure for table orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `items` json NOT NULL,
  `shipping_address` json NOT NULL,
  `status` varchar(50) NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int NOT NULL,
  `carrier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E52FFDEE19EB6921` (`client_id`),
  KEY `IDX_E52FFDEE21DFC797` (`carrier_id`),
  CONSTRAINT `FK_E52FFDEE19EB6921` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_E52FFDEE21DFC797` FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table orders: ~0 rows (approximately)

-- Dumping structure for table user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table user: ~1 rows (approximately)
INSERT IGNORE INTO `user` (`id`, `email`, `roles`, `password`) VALUES
	(1, 'admin@admin.pl', '["ROLE_CLIENT", "ROLE_ADMIN"]', '$2y$13$bShEA.eeNv4LPjNVXuPenupl9bCHcVk48nfT3aekAlZRy3QZDAAI6');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

