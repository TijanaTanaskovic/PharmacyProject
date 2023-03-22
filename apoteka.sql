-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 21, 2023 at 09:49 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apoteka`
--

-- --------------------------------------------------------

--
-- Table structure for table `apoteka`
--

DROP TABLE IF EXISTS `apoteka`;
CREATE TABLE IF NOT EXISTS `apoteka` (
  `id_apoteka` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) NOT NULL,
  `grad` varchar(45) NOT NULL,
  `ulica` varchar(45) NOT NULL,
  `broj` int(11) NOT NULL,
  PRIMARY KEY (`id_apoteka`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dobavljac`
--

DROP TABLE IF EXISTS `dobavljac`;
CREATE TABLE IF NOT EXISTS `dobavljac` (
  `id_dobavljac` int(11) NOT NULL AUTO_INCREMENT,
  `ime_dobavljaca` varchar(45) NOT NULL,
  `grad_dobavljaca` varchar(45) NOT NULL,
  `ulica_dobavljaca` varchar(45) NOT NULL,
  `broj_dobavljaca` varchar(45) NOT NULL,
  `kontakt` int(11) NOT NULL,
  PRIMARY KEY (`id_dobavljac`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dobavljac`
--

INSERT INTO `dobavljac` (`id_dobavljac`, `ime_dobavljaca`, `grad_dobavljaca`, `ulica_dobavljaca`, `broj_dobavljaca`, `kontakt`) VALUES
(1, 'Nikolic', 'Kragujevac', 'Dr Jovana Risica ', '65', 123456),
(2, 'Zivkovic', 'Beograd', 'Kneza Milosa', '123', 666444),
(3, 'Minuks', 'Kragujevac', 'Stojana Protica', '6', 789526),
(4, 'Hemofarm', 'Beograd', 'Jabucka', '10', 555333);

-- --------------------------------------------------------

--
-- Table structure for table `lekovi`
--

DROP TABLE IF EXISTS `lekovi`;
CREATE TABLE IF NOT EXISTS `lekovi` (
  `ime` varchar(45) NOT NULL,
  `cena` int(11) NOT NULL,
  `tip` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lekovi`
--

INSERT INTO `lekovi` (`ime`, `cena`, `tip`) VALUES
('Paracetamol', 170, 'ne'),
('Bromazepam', 300, 'da'),
('Hemomomicin', 200, 'da'),
('Ventolin', 700, 'ne');

-- --------------------------------------------------------

--
-- Table structure for table `obezbedjuje`
--

DROP TABLE IF EXISTS `obezbedjuje`;
CREATE TABLE IF NOT EXISTS `obezbedjuje` (
  `id_proizvod` int(11) NOT NULL,
  `id_dobavljac` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ostali_proizvodi`
--

DROP TABLE IF EXISTS `ostali_proizvodi`;
CREATE TABLE IF NOT EXISTS `ostali_proizvodi` (
  `ime` varchar(45) NOT NULL,
  `cena` int(11) NOT NULL,
  `namena` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ostali_proizvodi`
--

INSERT INTO `ostali_proizvodi` (`ime`, `cena`, `namena`) VALUES
('Krema za sunacnje', 500, 'kozmetika'),
('Krema za bore', 2000, 'kozmetika'),
('udobne papuce', 3500, 'odevno');

-- --------------------------------------------------------

--
-- Table structure for table `pacijent`
--

DROP TABLE IF EXISTS `pacijent`;
CREATE TABLE IF NOT EXISTS `pacijent` (
  `jmbg_pacijent` int(13) NOT NULL,
  `ime_pacijenta` varchar(45) NOT NULL,
  `prezime_pacijenta` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prodaje`
--

DROP TABLE IF EXISTS `prodaje`;
CREATE TABLE IF NOT EXISTS `prodaje` (
  `id_zaposleni` int(11) NOT NULL,
  `id_proizvod` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recept`
--

DROP TABLE IF EXISTS `recept`;
CREATE TABLE IF NOT EXISTS `recept` (
  `id_recept` int(11) NOT NULL,
  `opis` varchar(45) NOT NULL,
  `jmbg_pacijent` int(13) NOT NULL,
  PRIMARY KEY (`id_recept`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sadrzi`
--

DROP TABLE IF EXISTS `sadrzi`;
CREATE TABLE IF NOT EXISTS `sadrzi` (
  `id_proizvod` int(11) NOT NULL AUTO_INCREMENT,
  `id_recept` int(11) NOT NULL,
  PRIMARY KEY (`id_proizvod`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zaposleni`
--

DROP TABLE IF EXISTS `zaposleni`;
CREATE TABLE IF NOT EXISTS `zaposleni` (
  `id_zaposleni` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  PRIMARY KEY (`id_zaposleni`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zaposleni`
--

INSERT INTO `zaposleni` (`id_zaposleni`, `username`, `password`, `ime`, `prezime`) VALUES
(1, 'tijana', 'tijana', 'Tijana', 'Tanaskovic'),
(2, 'teodora', 'teodora', 'Teodora', 'Tanaskovic'),
(3, 'marko', 'marko', 'Marko', 'Micic');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
