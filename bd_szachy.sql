-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Paź 2022, 18:34
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `bd_szachy`
--
CREATE DATABASE IF NOT EXISTS `bd_szachy` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `bd_szachy`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lista_czlonkow`
--

CREATE TABLE `lista_czlonkow` (
  `id` int(11) NOT NULL,
  `Imie` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `Nazwisko` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `Klasa` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `lista_czlonkow`
--

INSERT INTO `lista_czlonkow` (`id`, `Imie`, `Nazwisko`, `Klasa`) VALUES
(1, 'Łukasz', 'Siera', '3tf'),
(2, 'Kacper', 'Mańkowski', '3tc'),
(3, 'Jakub', 'Kruk', '3tc'),
(4, 'Kamil', 'Kamiński', '3tc'),
(5, 'Rafał', 'Kowalczyk', '3tc'),
(6, 'Daniel', 'Przymus', ''),
(7, 'Mikołaj', 'Kolański', ''),
(8, 'Oliwer', 'Sobecki', ''),
(9, 'Tymon', 'Tybor', ''),
(10, 'Aleksander', 'Jadczak', ''),
(11, 'Bartłomiej', 'Kulczycki', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lista_obecnosci`
--

CREATE TABLE `lista_obecnosci` (
  `id` int(11) NOT NULL,
  `Data` date NOT NULL,
  `lista` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `turniej1`
--

CREATE TABLE `turniej1` (
  `id` int(11) NOT NULL,
  `biale` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `wynik` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `czarne` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `lista_czlonkow`
--
ALTER TABLE `lista_czlonkow`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lista_obecnosci`
--
ALTER TABLE `lista_obecnosci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `turniej1`
--
ALTER TABLE `turniej1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `lista_czlonkow`
--
ALTER TABLE `lista_czlonkow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `lista_obecnosci`
--
ALTER TABLE `lista_obecnosci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `turniej1`
--
ALTER TABLE `turniej1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
