-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour medical
CREATE DATABASE IF NOT EXISTS `medical` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `medical`;

-- Listage de la structure de la table medical. fiches
CREATE TABLE IF NOT EXISTS `fiches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medecin_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `note_medecin` text,
  `joined_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient` (`patient_id`),
  KEY `fk_medecin` (`medecin_id`),
  CONSTRAINT `fk_medecin` FOREIGN KEY (`medecin_id`) REFERENCES `medecins` (`id`),
  CONSTRAINT `fk_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table medical.fiches : ~2 rows (environ)
/*!40000 ALTER TABLE `fiches` DISABLE KEYS */;
INSERT INTO `fiches` (`id`, `medecin_id`, `patient_id`, `created_at`, `created_by`, `note_medecin`, `joined_at`) VALUES
	(1, 8, 1, '2022-04-26 11:29:55', '1', 'qsdqsdqsdqd', '2022-04-27 12:40:29'),
	(2, 1, 1, '2022-04-27 01:18:29', '1', NULL, NULL);
/*!40000 ALTER TABLE `fiches` ENABLE KEYS */;

-- Listage de la structure de la table medical. medecins
CREATE TABLE IF NOT EXISTS `medecins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_service` (`service_id`),
  CONSTRAINT `fk_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Listage des données de la table medical.medecins : ~8 rows (environ)
/*!40000 ALTER TABLE `medecins` DISABLE KEYS */;
INSERT INTO `medecins` (`id`, `service_id`, `nom`, `prenom`, `email`, `password`, `tel`) VALUES
	(1, 1, 'AOUANI', 'CHERIFA', 'cherifa.aouani@gmail.com', '9GPaagzLv+TzXVcKc2Dhfw==', '98123456'),
	(2, 1, 'AOUIJ', 'Med LASSAAD', 'aouij.medlassaad@gmail.com', '9GPaagzLv+TzXVcKc2Dhfw==', '55741369'),
	(3, 2, 'MRAD', 'Amel', 'amel.mrad@gmail.com', '9GPaagzLv+TzXVcKc2Dhfw==', '96258741'),
	(4, 2, 'SELLAOUI', 'Hayder', 'sellaoui.hayder@gmail.com', '9GPaagzLv+TzXVcKc2Dhfw==', '98456321'),
	(5, 3, 'SANAA', 'Moahmed', 'sanaa.med@gmail.com', '9GPaagzLv+TzXVcKc2Dhfw==', '71258963'),
	(6, 4, 'MOHAMED BOUTEBEN', 'SALIM', 'salim.bouteben@gmail.com', '9GPaagzLv+TzXVcKc2Dhfw==', '98741236'),
	(7, 5, 'zakhama', 'anis', 'zakhama.anis@gmail.com', '9GPaagzLv+TzXVcKc2Dhfw==', '71222896'),
	(8, 5, 'Ben Salah', 'kamel', 'bensalah.kamel@gmail.com', '9GPaagzLv+TzXVcKc2Dhfw==', '96144177');
/*!40000 ALTER TABLE `medecins` ENABLE KEYS */;

-- Listage de la structure de la table medical. patients
CREATE TABLE IF NOT EXISTS `patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_prenom` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `sexe` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table medical.patients : ~2 rows (environ)
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` (`id`, `nom_prenom`, `date_naissance`, `sexe`, `email`, `tel`, `created_by`, `created_at`) VALUES
	(1, 'patient 1111', '2000-01-12', 'Homme', 'patient1.patient1@medcare.tn', '96258741', '1', '2022-04-27 00:45:29');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;

-- Listage de la structure de la table medical. personnels
CREATE TABLE IF NOT EXISTS `personnels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table medical.personnels : ~0 rows (environ)
/*!40000 ALTER TABLE `personnels` DISABLE KEYS */;
INSERT INTO `personnels` (`id`, `nom`, `prenom`, `email`, `tel`, `password`) VALUES
	(1, 'brahmia', 'yassine', 'brahmi.yassine@gmail.com', '96144177', '9GPaagzLv+TzXVcKc2Dhfw==');
/*!40000 ALTER TABLE `personnels` ENABLE KEYS */;

-- Listage de la structure de la table medical. services
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_service` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Listage des données de la table medical.services : ~4 rows (environ)
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`id`, `nom_service`, `description`) VALUES
	(1, 'Cardiologie', 'cardiologie'),
	(2, 'Dermatologie', 'dermatologie'),
	(3, 'medecine generale', NULL),
	(4, 'radiologie', 'radiologie'),
	(5, 'pneumologie', 'pneumologie');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
