-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Cze 2023, 15:48
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `nbp`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `full_name` varchar(40) NOT NULL,
  `exchange_rate` float NOT NULL,
  `bid` float DEFAULT NULL,
  `ask` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `full_name`, `exchange_rate`, `bid`, `ask`) VALUES
(1, 'THB', 'bat (Tajlandia)', 0.1176, 0, 0),
(2, 'USD', 'dolar amerykański', 4.0715, 4.0634, 4.1454),
(3, 'AUD', 'dolar australijski', 2.8027, 2.7839, 2.8401),
(4, 'HKD', 'dolar Hongkongu', 0.5202, 0, 0),
(5, 'CAD', 'dolar kanadyjski', 3.0795, 3.062, 3.1238),
(6, 'NZD', 'dolar nowozelandzki', 2.5397, 0, 0),
(7, 'SGD', 'dolar singapurski', 3.0455, 0, 0),
(8, 'EUR', 'euro', 4.4583, 4.4287, 4.5181),
(9, 'HUF', 'forint (Węgry)', 0.011914, 0.011835, 0.012075),
(10, 'CHF', 'frank szwajcarski', 4.57, 4.535, 4.6266),
(11, 'GBP', 'funt szterling', 5.2095, 5.1682, 5.2726),
(12, 'UAH', 'hrywna (Ukraina)', 0.1102, 0, 0),
(13, 'JPY', 'jen (Japonia)', 0.028866, 0.028936, 0.02952),
(14, 'CZK', 'korona czeska', 0.1872, 0.1862, 0.19),
(15, 'DKK', 'korona duńska', 0.5983, 0.5943, 0.6063),
(16, 'ISK', 'korona islandzka', 0.029861, 0, 0),
(17, 'NOK', 'korona norweska', 0.3879, 0.3862, 0.394),
(18, 'SEK', 'korona szwedzka', 0.3836, 0.3816, 0.3894),
(19, 'RON', 'lej rumuński', 0.8987, 0, 0),
(20, 'BGN', 'lew (Bułgaria)', 2.2795, 0, 0),
(21, 'TRY', 'lira turecka', 0.1721, 0, 0),
(22, 'ILS', 'nowy izraelski szekel', 1.1439, 0, 0),
(23, 'CLP', 'peso chilijskie', 0.005131, 0, 0),
(24, 'PHP', 'peso filipińskie', 0.0729, 0, 0),
(25, 'MXN', 'peso meksykańskie', 0.2375, 0, 0),
(26, 'ZAR', 'rand (Republika Południowej Afryki)', 0.2242, 0, 0),
(27, 'BRL', 'real (Brazylia)', 0.8463, 0, 0),
(28, 'MYR', 'ringgit (Malezja)', 0.8823, 0, 0),
(29, 'IDR', 'rupia indonezyjska', 0.00027262, 0, 0),
(30, 'INR', 'rupia indyjska', 0.049711, 0, 0),
(31, 'KRW', 'won południowokoreański', 0.003197, 0, 0),
(32, 'CNY', 'yuan renminbi (Chiny)', 0.5723, 0, 0),
(33, 'XDR', 'SDR (MFW)', 5.4997, 5.4649, 5.5753),
(34, 'AFN', 'afgani (Afganistan)', 0.04814, 0, 0),
(35, 'MGA', 'ariary (Madagaskar)', 0.000918, 0, 0),
(36, 'PAB', 'balboa (Panama)', 4.1393, 0, 0),
(37, 'ETB', 'birr etiopski', 0.0754, 0, 0),
(38, 'VES', 'boliwar soberano (Wenezuela)', 0.1536, 0, 0),
(39, 'BOB', 'boliwiano (Boliwia)', 0.5984, 0, 0),
(40, 'CRC', 'colon kostarykański', 0.00765, 0, 0),
(41, 'SVC', 'colon salwadorski', 0.4734, 0, 0),
(42, 'NIO', 'cordoba oro (Nikaragua)', 0.1133, 0, 0),
(43, 'GMD', 'dalasi (Gambia)', 0.0662, 0, 0),
(44, 'MKD', 'denar (Macedonia Północna)', 0.072578, 0, 0),
(45, 'DZD', 'dinar algierski', 0.030437, 0, 0),
(46, 'BHD', 'dinar bahrajski', 10.9919, 0, 0),
(47, 'IQD', 'dinar iracki', 0.003163, 0, 0),
(48, 'JOD', 'dinar jordański', 5.8417, 0, 0),
(49, 'KWD', 'dinar kuwejcki', 13.4846, 0, 0),
(50, 'LYD', 'dinar libijski', 0.8606, 0, 0),
(51, 'RSD', 'dinar serbski', 0.0381, 0, 0),
(52, 'TND', 'dinar tunezyjski', 1.337, 0, 0),
(53, 'MAD', 'dirham marokański', 0.4108, 0, 0),
(54, 'AED', 'dirham ZEA (Zjednoczone Emiraty Arabskie', 1.1283, 0, 0),
(55, 'STN', 'dobra (Wyspy Świętego Tomasza i Książęca', 0.1807, 0, 0),
(56, 'BSD', 'dolar bahamski', 4.1393, 0, 0),
(57, 'BBD', 'dolar barbadoski', 2.0524, 0, 0),
(58, 'BZD', 'dolar belizeński', 2.0559, 0, 0),
(59, 'BND', 'dolar brunejski', 3.0886, 0, 0),
(60, 'FJD', 'dolar Fidżi', 1.8717, 0, 0),
(61, 'GYD', 'dolar gujański', 0.019594, 0, 0),
(62, 'JMD', 'dolar jamajski', 0.0268, 0, 0),
(63, 'LRD', 'dolar liberyjski', 0.0233, 0, 0),
(64, 'NAD', 'dolar namibijski', 0.2236, 0, 0),
(65, 'SRD', 'dolar surinamski', 0.1109, 0, 0),
(66, 'TTD', 'dolar Trynidadu i Tobago', 0.6112, 0, 0),
(67, 'XCD', 'dolar wschodniokaraibski', 1.5287, 0, 0),
(68, 'SBD', 'dolar Wysp Salomona', 0.4876, 0, 0),
(69, 'ZWL', 'dolar Zimbabwe', 0.000628, 0, 0),
(70, 'VND', 'dong (Wietnam)', 0.00017629, 0, 0),
(71, 'AMD', 'dram (Armenia)', 0.010702, 0, 0),
(72, 'CVE', 'escudo Zielonego Przylądka', 0.0404, 0, 0),
(73, 'AWG', 'florin arubański', 2.2896, 0, 0),
(74, 'BIF', 'frank burundyjski', 0.001467, 0, 0),
(75, 'XOF', 'frank CFA BCEAO ', 0.006824, 0, 0),
(76, 'XAF', 'frank CFA BEAC', 0.006707, 0, 0),
(77, 'XPF', 'frank CFP  ', 0.037458, 0, 0),
(78, 'DJF', 'frank Dżibuti', 0.023275, 0, 0),
(79, 'GNF', 'frank gwinejski', 0.000482, 0, 0),
(80, 'KMF', 'frank Komorów', 0.009084, 0, 0),
(81, 'CDF', 'frank kongijski (Dem. Republika Konga)', 0.001769, 0, 0),
(82, 'RWF', 'frank rwandyjski', 0.00364, 0, 0),
(83, 'EGP', 'funt egipski', 0.1341, 0, 0),
(84, 'GIP', 'funt gibraltarski', 5.2298, 0, 0),
(85, 'LBP', 'funt libański', 0.000276, 0, 0),
(86, 'SSP', 'funt południowosudański', 0.004328, 0, 0),
(87, 'SDG', 'funt sudański', 0.0069, 0, 0),
(88, 'SYP', 'funt syryjski', 0.0016, 0, 0),
(89, 'GHS', 'Ghana cedi ', 0.3651, 0, 0),
(90, 'HTG', 'gourde (Haiti)', 0.0297, 0, 0),
(91, 'PYG', 'guarani (Paragwaj)', 0.000572, 0, 0),
(92, 'ANG', 'gulden Antyli Holenderskich', 2.2994, 0, 0),
(93, 'PGK', 'kina (Papua-Nowa Gwinea)', 1.1529, 0, 0),
(94, 'LAK', 'kip (Laos)', 0.000227, 0, 0),
(95, 'MWK', 'kwacha malawijska', 0.004037, 0, 0),
(96, 'ZMW', 'kwacha zambijska', 0.2184, 0, 0),
(97, 'AOA', 'kwanza (Angola)', 0.006, 0, 0),
(98, 'MMK', 'kyat (Myanmar, Birma)', 0.001973, 0, 0),
(99, 'GEL', 'lari (Gruzja)', 1.5847, 0, 0),
(100, 'MDL', 'lej Mołdawii', 0.2325, 0, 0),
(101, 'ALL', 'lek (Albania)', 0.041721, 0, 0),
(102, 'HNL', 'lempira (Honduras)', 0.1691, 0, 0),
(103, 'SLE', 'leone (Sierra Leone)', 0.1826, 0, 0),
(104, 'SZL', 'lilangeni (Eswatini)', 0.2235, 0, 0),
(105, 'LSL', 'loti (Lesotho)', 0.2235, 0, 0),
(106, 'AZN', 'manat azerbejdżański', 2.4377, 0, 0),
(107, 'MZN', 'metical (Mozambik)', 0.0645, 0, 0),
(108, 'NGN', 'naira (Nigeria)', 0.008953, 0, 0),
(109, 'ERN', 'nakfa (Erytrea)', 0.2749, 0, 0),
(110, 'TWD', 'nowy dolar tajwański', 0.1348, 0, 0),
(111, 'TMT', 'nowy manat (Turkmenistan)', 1.1845, 0, 0),
(112, 'MRU', 'ouguiya (Mauretania)', 0.1203, 0, 0),
(113, 'TOP', 'pa\'anga (Tonga)', 1.7067, 0, 0),
(114, 'MOP', 'patca (Makau', 0.5132, 0, 0),
(115, 'ARS', 'peso argentyńskie', 0.0168, 0, 0),
(116, 'DOP', 'peso dominikańskie', 0.0756, 0, 0),
(117, 'COP', 'peso kolumbijskie', 0.000991, 0, 0),
(118, 'CUP', 'peso kubańskie', 4.1393, 0, 0),
(119, 'UYU', 'peso urugwajskie', 0.1072, 0, 0),
(120, 'BWP', 'pula (Botswana)', 0.3096, 0, 0),
(121, 'GTQ', 'quetzal (Gwatemala)', 0.5289, 0, 0),
(122, 'IRR', 'rial irański', 0.000099, 0, 0),
(123, 'YER', 'rial jemeński', 0.016561, 0, 0),
(124, 'QAR', 'rial katarski', 1.1366, 0, 0),
(125, 'OMR', 'rial omański', 10.7779, 0, 0),
(126, 'SAR', 'rial saudyjski', 1.1049, 0, 0),
(127, 'KHR', 'riel (Kambodża)', 0.001007, 0, 0),
(128, 'BYN', 'rubel białoruski', 1.2955, 0, 0),
(129, 'RUB', 'rubel rosyjski', 0.049, 0, 0),
(130, 'LKR', 'rupia lankijska', 0.013325, 0, 0),
(131, 'MVR', 'rupia (Malediwy)', 0.2681, 0, 0),
(132, 'MUR', 'rupia Mauritiusu', 0.0909, 0, 0),
(133, 'NPR', 'rupia nepalska', 0.031499, 0, 0),
(134, 'PKR', 'rupia pakistańska', 0.0146, 0, 0),
(135, 'SCR', 'rupia seszelska', 0.3124, 0, 0),
(136, 'PEN', 'sol (Peru)', 1.1348, 0, 0),
(137, 'KGS', 'som (Kirgistan)', 0.0473, 0, 0),
(138, 'TJS', 'somoni (Tadżykistan)', 0.3793, 0, 0),
(139, 'UZS', 'sum (Uzbekistan)', 0.000361, 0, 0),
(140, 'KES', 'szyling kenijski', 0.029665, 0, 0),
(141, 'SOS', 'szyling somalijski', 0.00729, 0, 0),
(142, 'TZS', 'szyling tanzański', 0.001738, 0, 0),
(143, 'UGX', 'szyling ugandyjski', 0.001114, 0, 0),
(144, 'BDT', 'taka (Bangladesz)', 0.037915, 0, 0),
(145, 'WST', 'tala (Samoa)', 1.534, 0, 0),
(146, 'KZT', 'tenge (Kazachstan)', 0.009201, 0, 0),
(147, 'MNT', 'tugrik (Mongolia)', 0.001193, 0, 0),
(148, 'VUV', 'vatu (Vanuatu)', 0.034766, 0, 0),
(149, 'BAM', 'wymienialna marka (Bośnia i Hercegowina)', 2.2807, 0, 0),
(150, 'PLN', 'zloty polski', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `currency_conversions`
--

CREATE TABLE `currency_conversions` (
  `id` int(11) NOT NULL,
  `currency_from` int(11) NOT NULL,
  `currency_to` int(11) NOT NULL,
  `amount_before` float NOT NULL,
  `amount_after` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `currency_conversions`
--

INSERT INTO `currency_conversions` (`id`, `currency_from`, `currency_to`, `amount_before`, `amount_after`) VALUES
(1, 2, 8, 1000, 913.24),
(2, 2, 8, 1000, 913.24),
(3, 2, 8, 1000, 913.24),
(4, 2, 8, 1000, 913.24),
(5, 2, 8, 1000, 913.24),
(6, 2, 8, 1000, 913.24),
(7, 7, 8, 123, 84.0223),
(8, 7, 8, 123, 84.0223),
(9, 7, 8, 123, 84.0223),
(10, 7, 8, 123, 84.0223),
(11, 7, 8, 123, 84.0223),
(12, 7, 8, 123, 84.0223),
(13, 7, 8, 123, 84.0223),
(14, 1, 3, 1000, 41.9595),
(15, 1, 3, 1000, 41.9595),
(16, 117, 8, 1060, 0.235619),
(17, 117, 8, 1060, 0.235619),
(18, 9, 8, 12345, 32.9898),
(19, 9, 8, 12345, 32.9898),
(20, 11, 1, 123123, 5454160),
(21, 11, 1, 123123, 5454160),
(22, 11, 1, 123123, 5454160),
(23, 11, 1, 123123, 5454160),
(24, 3, 8, 123123, 77401),
(25, 5, 11, 123123, 72781.9),
(26, 2, 7, 123123, 164602),
(27, 2, 7, 123123, 164602),
(28, 2, 7, 123123, 164602),
(29, 2, 7, 123123, 164602),
(30, 2, 7, 123123, 164602),
(31, 2, 8, 6543, 5975.33),
(32, 5, 2, 12341200, 9334360),
(33, 150, 8, 999, 224.076),
(34, 150, 8, 999, 224.076),
(35, 150, 8, 999, 224.076);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indeksy dla tabeli `currency_conversions`
--
ALTER TABLE `currency_conversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_from` (`currency_from`,`currency_to`),
  ADD KEY `currency_to` (`currency_to`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT dla tabeli `currency_conversions`
--
ALTER TABLE `currency_conversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `currency_conversions`
--
ALTER TABLE `currency_conversions`
  ADD CONSTRAINT `currency_conversions_ibfk_1` FOREIGN KEY (`currency_from`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `currency_conversions_ibfk_2` FOREIGN KEY (`currency_to`) REFERENCES `currencies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
