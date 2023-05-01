-- create database
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8mb3_persian_ci ;

-- create tables
CREATE TABLE IF NOT EXISTS `library`.`books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `isbn` varchar(13) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `pages` int DEFAULT NULL,
  PRIMARY KEY (`book_id`)
);

CREATE TABLE IF NOT EXISTS `library`.`book_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text COLLATE utf8mb3_persian_ci,
  PRIMARY KEY (`category_id`),
  KEY `fk_books` (`book_id`)
);

CREATE TABLE IF NOT EXISTS `library`.`loans` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `loan_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fine` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `fk_books` (`book_id`),
  KEY `fk_members` (`member_id`)
);

CREATE TABLE IF NOT EXISTS `library`.`members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `phone_number` varchar(11) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  PRIMARY KEY (`member_id`)
);

