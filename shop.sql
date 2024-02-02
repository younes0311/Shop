-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2024 at 03:19 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `ad_id` int(11) NOT NULL,
  `ad_title` varchar(255) NOT NULL,
  `ad_description` text DEFAULT NULL,
  `ad_image` varchar(255) DEFAULT NULL,
  `ad_link` varchar(255) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`ad_id`, `ad_title`, `ad_description`, `ad_image`, `ad_link`, `location`, `start_date`, `end_date`) VALUES
(2, 'Pc werbung', '#######', 'uploads/Rectangle 12.png', 'http://localhost/shop/single_product.php?id=50', 1, '2024-01-02', '2024-01-20'),
(3, 'Pc werbung126', '####', 'uploads/2525265.png', 'http://localhost/shop/single_product.php?id=51', 1, '2024-01-13', '2024-01-26'),
(4, '#####', '#####', 'uploads/Rectangle 1.png', 'http://localhost/shop/single_product.php?id=75', 1, '2024-01-20', '2024-01-04'),
(5, '#', '##', 'uploads/321323.png', 'http://localhost/shop/single_product.php?id=52', 1, '2024-01-18', '2024-01-03'),
(7, '###', '####', 'uploads/25252.png', 'http://localhost/shop/single_product.php?id=72', 1, '2024-01-03', '2024-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_image` varchar(255) DEFAULT NULL,
  `cata_loc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `category_image`, `cata_loc`) VALUES
(1, 'Home', '2024-01-16 08:16:45', NULL, NULL),
(2, 'Display', '2024-01-16 08:16:53', NULL, 0),
(4, 'Garten', '2024-01-16 09:23:29', NULL, NULL),
(6, 'Schmuck', '2024-01-17 17:14:02', NULL, NULL),
(7, 'Pc', '2024-01-17 17:14:23', NULL, NULL),
(8, 'Pc Zubehör', '2024-01-18 13:41:54', NULL, NULL),
(9, 'Monitor', '2024-01-18 14:31:41', NULL, NULL),
(10, 'Auto Zubehör', '2024-01-19 21:52:31', 'uploads/az.png', 1),
(11, 'Elektronik', '2024-01-28 11:50:14', NULL, NULL),
(12, 'Mode und Bekleidung', '2024-01-28 11:51:29', NULL, NULL),
(13, 'Schreibwaren', '2024-01-28 12:30:35', NULL, NULL),
(14, 'Kosmetikprodukte', '2024-01-28 12:37:04', NULL, NULL),
(15, 'Möbel', '2024-01-28 12:39:22', NULL, NULL),
(16, 'Lebensmittel und Getränke', '2024-01-28 12:39:36', NULL, NULL),
(17, 'Computerhardware', '2024-01-28 12:39:50', NULL, NULL),
(18, 'Bücher', '2024-01-28 12:39:55', NULL, NULL),
(19, 'Spielzeug', '2024-01-28 12:40:03', NULL, NULL),
(20, 'Werkzeuge', '2024-01-28 12:40:12', NULL, NULL),
(21, 'Musikinstrumente', '2024-01-28 12:40:29', NULL, NULL),
(22, 'Sportbekleidung', '2024-01-28 12:40:44', NULL, NULL),
(23, 'Schuhe', '2024-01-28 12:40:51', NULL, NULL),
(24, 'Elektrogeräte', '2024-01-28 12:41:03', NULL, NULL),
(25, 'Outdoor-Ausrüstung', '2024-01-28 12:41:13', NULL, NULL),
(26, 'Kunstbedarf', '2024-01-28 12:41:30', NULL, NULL),
(27, 'Gartenbedarf', '2024-01-28 12:41:36', 'uploads/Gartenbedarf.webp', NULL),
(28, 'Haustierbedarf', '2024-01-28 12:41:45', NULL, NULL),
(29, 'Reisezubehör', '2024-01-28 12:41:55', NULL, NULL),
(30, 'Autozubehör', '2024-01-28 12:58:14', NULL, NULL),
(31, 'Bürobedarf', '2024-01-28 12:58:24', 'uploads/Bürobedarf.avif', NULL),
(32, 'Gesundheits- und Wellnessprodukte', '2024-01-28 12:58:42', NULL, NULL),
(33, 'Wohnaccessoires', '2024-01-28 12:58:56', NULL, NULL),
(34, 'Handtaschen und Accessoires', '2024-01-28 12:59:22', 'uploads/Handtaschen.webp', NULL),
(35, 'Babyprodukte', '2024-01-28 12:59:31', 'uploads/Babyprodukte.png', NULL),
(36, 'Fitnessgeräte', '2024-01-28 13:01:21', NULL, NULL),
(37, 'Unterhaltungselektronik', '2024-01-28 13:01:34', NULL, NULL),
(38, 'Fahrräder', '2024-01-28 13:01:42', NULL, NULL),
(39, 'Spielkonsolen und Spiele', '2024-01-28 13:01:55', NULL, NULL),
(40, 'Brillen und Sonnenbrillen', '2024-01-28 13:02:05', 'uploads/sonnenbrillen196_v-fullhd.avif', NULL),
(41, 'Fotografieausrüstung', '2024-01-28 13:02:30', NULL, NULL),
(42, 'Audio- und Kopfhörer', '2024-01-28 13:02:42', 'uploads/kh.png', 1),
(43, 'Schreibgeräte', '2024-01-28 13:02:59', NULL, NULL),
(44, 'Campingausrüstung', '2024-01-28 13:03:30', 'uploads/kaaa.png', 1),
(45, 'Matratzen und Bettwaren', '2024-01-28 13:03:43', NULL, NULL),
(46, 'Smart Home-Geräte', '2024-01-28 13:03:55', NULL, NULL),
(47, 'Skiausrüstung', '2024-01-28 13:04:06', NULL, NULL),
(48, 'Uhren', '2024-01-28 13:04:13', NULL, NULL),
(49, 'Handys und Zubehör', '2024-01-28 13:04:26', 'uploads/Handy-Zubehoer-Smartphone-Accessoires-Anker-Powerbank-Technik.webp', NULL),
(50, 'Fahrradausrüstung', '2024-01-28 13:04:37', 'uploads/Fahrradausrüstung.jpg', NULL),
(51, 'Kosmetiktaschen und Koffer', '2024-01-28 13:04:50', NULL, NULL),
(52, 'Lautsprecher', '2024-01-28 13:04:58', NULL, NULL),
(53, 'Elektrische Zahnbürsten', '2024-01-28 13:05:18', NULL, NULL),
(54, 'Heimkinosysteme', '2024-01-28 13:05:29', NULL, NULL),
(55, 'Nabigationsgeräte', '2024-01-28 13:05:41', NULL, NULL),
(56, 'Fitness-Tracker', '2024-01-28 13:05:49', NULL, NULL),
(57, 'Nahrungsergänzungsmittel', '2024-01-28 13:06:01', NULL, NULL),
(58, 'Laufschuhe', '2024-01-28 13:06:09', NULL, NULL),
(59, 'Wanderschuhe', '2024-01-28 13:06:16', NULL, NULL),
(60, 'Wandfarben und Malutensilien', '2024-01-28 13:06:30', NULL, NULL),
(61, 'Taschenlampen', '2024-01-28 13:06:38', NULL, NULL),
(62, 'Kaffemaschinen', '2024-01-28 13:06:51', NULL, NULL),
(63, 'Drucker und Scanner', '2024-01-28 13:06:59', NULL, NULL),
(64, 'Skibrillen', '2024-01-28 13:07:05', NULL, NULL),
(65, 'Fitnesskleidung', '2024-01-28 13:07:13', NULL, NULL),
(66, 'Outdoor-Beleuchtung', '2024-01-28 13:07:29', NULL, NULL),
(67, 'Kinderwagen', '2024-01-28 13:07:35', NULL, NULL),
(68, 'Heimtextilien', '2024-01-28 13:07:50', NULL, NULL),
(69, 'Smartphne-Zubehör', '2024-01-28 13:08:12', NULL, NULL),
(70, 'Elektrische Rasierer', '2024-01-28 13:08:22', NULL, NULL),
(71, 'Babykleidung', '2024-01-28 13:08:30', NULL, NULL),
(72, 'Fitnessbänder', '2024-01-28 13:08:40', 'uploads/Fitnessbänder.jpg', NULL),
(73, 'Laptops', '2024-01-28 13:08:48', NULL, NULL),
(74, 'Autoinnenreinigungsprodukte', '2024-01-28 13:10:35', NULL, NULL),
(75, 'Sonnenschutzmittel', '2024-01-28 13:10:49', NULL, NULL),
(76, 'Digitale Kameras', '2024-01-28 13:10:58', 'uploads/kaerma.jpg', NULL),
(77, 'Kochgeschirr', '2024-01-28 13:11:09', NULL, NULL),
(78, 'Outdoor-Möbel', '2024-01-28 13:11:20', NULL, NULL),
(79, 'Skihelme', '2024-01-28 13:11:28', NULL, NULL),
(80, 'GPS-Geräte', '2024-01-28 13:19:27', NULL, NULL),
(81, 'Fahrradzubehör', '2024-01-28 13:19:39', NULL, NULL),
(82, 'Küchenmesser', '2024-01-28 13:19:48', NULL, NULL),
(83, 'Kopfkissen', '2024-01-28 13:19:54', NULL, NULL),
(84, 'Smartwatches', '2024-01-28 13:20:05', NULL, NULL),
(85, 'Aktentaschen', '2024-01-28 13:20:14', 'uploads/Aktentaschen.jpg', 0),
(86, 'Rucksäcke', '2024-01-28 13:20:22', NULL, NULL),
(87, 'Windschutzscheibenwischer', '2024-01-28 13:20:43', NULL, NULL),
(88, 'Lesebrillen', '2024-01-28 13:20:50', NULL, NULL),
(89, 'Kindersitze für Autos', '2024-01-28 13:21:06', NULL, NULL),
(90, 'Fitnessmatten', '2024-01-28 13:21:14', NULL, NULL),
(91, 'Angelzubehör', '2024-01-28 13:21:22', 'uploads/azz.png', 1),
(92, 'Staubsauger', '2024-01-28 13:21:28', NULL, NULL),
(93, 'Bluetooth-Ohrhörer', '2024-01-28 13:21:37', 'uploads/Bluetooth-Ohrhörer.jpg', NULL),
(94, 'Koffer und Reisetaschen', '2024-01-28 13:21:52', NULL, NULL),
(95, 'Schreibtischzubehör', '2024-01-28 13:22:03', NULL, NULL),
(96, 'Babybetten', '2024-01-28 13:22:10', NULL, NULL),
(97, 'Trinkflaschen', '2024-01-28 13:22:17', NULL, NULL),
(98, 'Winterjacken', '2024-01-28 13:22:24', NULL, NULL),
(99, 'Sonnenschirme', '2024-01-28 13:22:34', NULL, NULL),
(100, 'Fotoalben', '2024-01-28 13:22:41', NULL, NULL),
(101, 'Fahrradschlösser', '2024-01-28 13:22:50', NULL, NULL),
(102, 'Skistöcke', '2024-01-28 13:22:56', NULL, NULL),
(103, 'Kühlschränke', '2024-01-28 13:23:05', NULL, NULL),
(104, 'Smart-TVs', '2024-01-28 13:23:13', NULL, NULL),
(105, 'Videospiele', '2024-01-28 13:23:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lieferanten`
--

CREATE TABLE `lieferanten` (
  `id` int(11) NOT NULL,
  `lieferant_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lieferanten`
--

INSERT INTO `lieferanten` (`id`, `lieferant_name`) VALUES
(1, 'Ali Express'),
(2, 'ali Baba'),
(3, 'BigBuy'),
(4, 'Amazon'),
(5, 'Otto'),
(6, 'eBay'),
(7, 'Fahrrad XXL mein Hövel');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `newsletter_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_details`
--

CREATE TABLE `products_details` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `lieferant_preis` decimal(10,2) DEFAULT 0.00,
  `unser_preis` decimal(10,2) DEFAULT 0.00,
  `Sale_preis` decimal(10,2) DEFAULT 0.00,
  `profit` decimal(10,2) GENERATED ALWAYS AS (`unser_preis` - `lieferant_preis`) STORED,
  `company` varchar(255) NOT NULL,
  `cpi` varchar(20) NOT NULL,
  `category` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `type_number` varchar(50) NOT NULL,
  `first_picture` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `product_status` varchar(255) DEFAULT 'normal',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_prozent` decimal(10,2) DEFAULT 0.00,
  `sale_profit` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_details`
--

INSERT INTO `products_details` (`product_id`, `product_name`, `brand`, `description`, `lieferant_preis`, `unser_preis`, `Sale_preis`, `company`, `cpi`, `category`, `quantity`, `type_number`, `first_picture`, `status`, `product_status`, `created_at`, `sale_prozent`, `sale_profit`) VALUES
(50, 'Memory PC Gaming-PC (AMD Ryzen 7 5800X, AMD RX 6700, 16 GB RAM, 500 GB SSD, Wasserkühlung)', NULL, 'Inklusive 9-teiliges Kissenset\r\nWahlweise mit Bettfunktion und Bettkasten\r\nRecamiere links oder rechts montierbar\r\nFrei im Raum stellbar\r\nMit PUR-Schaumstoff ausgestattetes Sofa\r\nDiese Wohnlandschaft »Win« von Home affaire ist mit PUR-Schaumstoff gepolstert, der für eine gute Sitzqualität und lange Lebensdauer steht. Wovon du auch profitierst, sind die passenden Zierkissen, die nicht nur schöne Deko-Element sind, sondern auch für noch mehr Komfort sorgen. Die Recamiere kann entweder auf der linken oder auf rechten Seite angebracht werden. Durch die FSC®-Zertifizierung wird gewährleistet, dass kein Raubbau an den Wäldern betrieben und die Artenvielfalt erhalten wird. Der strukturierte Bezug überzeugt durch seine pflegeleichte und hautsympathische Eigenschaft. Aus Liebe zum Detail wurde dieses Modell von Hand angefertigt.\r\n\r\nMit der Wohnlandschaft »Win« von Home affaire findet jeder einen kuscheligen Platz.', 1200.00, 2000.00, 1000.00, 'BigBuy', 'S0K4503UP2', 'Auto zubehör', 999, '1', 'uploads/5eb3ebe6-f656-4e93-8420-c39c5736e06a.jpg', 'online', 'sale', '2024-01-19 20:41:26', 50.00, 400.00),
(51, 'Kiebel Tricera V Gaming-PC (AMD Ryzen 5 AMD Ryzen 5 5500, RTX 3050, 16 GB RAM, 512 GB SSD, Luftkühlung, ARGB-Beleuchtung)', NULL, 'AMD Ryzen 5 5500, 6x 3.6 GHz\r\n16 GB DDR4-3200 MHz RAM\r\nNVIDIA GeForce RTX 3050, 8GB GDDR6\r\n512 GB M.2, NVMe SSD\r\nDas Gaming Allround Talent ist für alle gängigen Spiele wie Cybrpnk 77, Call of Duty Vanguard, Battlefield 2042, Far Cry 6, GTA5 und vielen mehr geeignet. Alle anderen Bereiche von Multimedia, Internet, Office, Präsentation bewältigt dieser meisterhaft.\r\n\r\nAMD ist zurück: Der neue Ryzen 5 Prozessor liefert eine gewaltige Leistung für höchste Anforderungen im PC Bereich. Der integrierte Turbo sorgt automatisch für den notwendigen Schub in anspruchvollsten Situationen.\r\n\r\nNVIDIAs neueste Grafikkartengeneration optimiert die Spieleleistung im FullHD und WQHD Bereich. Besonders bei den neuesten Spieletitel zeugt dieser PC eindrucksvoll, dass er eine wahre Gaming-Maschine ist. Ein System mit dem Spiele erst richtig zum Leben erweckt werden.\r\n\r\nBewährte Markenqualität bei allen unseren Systemen. Wir verbauen ausschließlich hochwertige Produkte von etablierten Herstellern die beste Zuverlässigkeit und Langlebigkeit garantieren.\r\n\r\n\r\nKonfiguration:\r\nCPU: AMD Ryzen 5 5500, 6x 3.6 GHz\r\nCooler: AMD temperaturgeregelter Kühler\r\nSpeicher: 16 GB DDR4-3200 MHz (2x8GB), Dual-Channel\r\nGrafikkarte: NVIDIA GeForce RTX 3050, 8GB GDDR6\r\nMainboard: MSI A520M Pro, AMD A520, AM4, mATX\r\nSound: 5.1 Surround-Sound (6-Kanal) Digital Audio, onboard\r\nM.2 SSD Festplatte: 512 GB M.2 SSD (NVMe)\r\nNetzteil: 620 Watt ATX-Netzteil, 82% Wirkungsgrad\r\nGehäuse: ATX-Midi Observatory LT Mesh, 4x RGB\r\nService: Service24 basic\r\n\r\nLieferumfang:\r\nPC-System\r\nStromkabel\r\nSystemhandbuch in Deutsch\r\nHerstellernummer: 185664', 10.00, 200.00, 180.00, 'Otto', 'S0S2Y04XP2', 'PC', 99, '1', 'uploads8600365700_186447_prod_006.avif', 'online', 'sale', '2024-01-19 20:47:57', 10.00, 171.00),
(52, 'Acer Predator Orion 3000 (PO3-630) Gaming-PC (Intel® Core i7 11700F, GeForce GTX 1660 Super, 16 GB RAM, 1000 GB HDD, 512 GB SSD, Luftkühlung)', NULL, 'Intel®Core™i7-11700F 2,5 GHz (Turbo-Boost bis 4,9 GHz)\r\n16 GB DDR4-RAM Arbeitsspeicher\r\nSpeicher: 512 GB SSD, 1000 GB HDD\r\nNVIDIA® GeForce® GTX 1660 SUPER\r\n2x USB 2.0, 5x USB 3.2, 1x HDMI\r\nDer mit Liebe zum Detail verarbeitete Predator Orion 3000 lässt das Gamer Herz höher schlagen. Mit modernster Technologie ausgestattet bringt dieses kleine Kraftpaket den Gamer auf das nächste Level. Für alle die den Durchblick behalten wollen, gibt es den Orion 3000 auch mit einem seitlich angebrachten optionalen Glasfenster für einen beeindruckenden Blick auf seine inneren Werte.', 1200.00, 1500.00, 750.00, 'Fahrrad XXL mein Hövel', '1639023910', 'Home', 999, '1', 'uploadsACER-P~1.JPG', 'online', 'sale', '2024-01-19 20:55:16', 50.00, 150.00),
(53, 'Kiebel Dragon V Gaming-PC (AMD Ryzen 7 AMD Ryzen 7 5700X, RTX 4060, 32 GB RAM, 2000 GB SSD, Wasserkühlung, RGB-Beleuchtung)', NULL, 'AMD Ryzen 7 5700X, 8x 3.4 GHz\r\n32 GB DDR4-3200 MHz RAM\r\nNVIDIA GeForce RTX 4060, 8GB GDDR6\r\n2000 GB M.2, SSD (NVMe)\r\nWindows 11 Home (schon installiert)\r\nDer [Kiebel Gamer PC Dragon] basiert auf AMDs leistungsstarken Ryzen 7 Prozessoren, gepaart mit einer schnellen nvidia Grafikkarte der RTX 40xx Generation. Vom etablierten AMD Preiswunder der 5ten Generation [Dragon V] bis zum aktuellen Ryzen 7 der 7ten und neuesten Generation [Dragon VII] werden zahlreiche Konfiguration angeboten.\r\n\r\nDurch die Wahl der nvidia Grafikkarte bestimmst du deine Gaming Leistung. Von der RTX 4060 für bestes Gaming in FullHD und WQHD, über die 4060Ti, die in diesem Bereich zudem beste 144Hz Unterstützung liefert, sowie der RTX 4070 mit der in den UltaHD(4K) Bereich vorgestoßen werden kann. Alle beschleunigen alle aktuell erhältlichen Spieletitel auf ein atemberaubendes Niveau und bieten Reserven für die zukünftigeb Spiele von morgen.\r\n\r\nWir geben die Wahl im Design: Der Kiebel Dragon Gamer PC steht in verschiedenen Gehäusen zur Verfügung, dabei liegt bei allen ein hoher Wert auf beste Kühleigenschaften und Erweiterbarkeit. Einige optische Highlights bändigen die enorme Prozessorleistung durch einen Wasserkühler.\r\n\r\nBei allen unseren Dragons erfreut man sich an 32GB Speicher und an einer schnellen 2TB (NVME) M.2 SSD. Alle Systeme bewältigen die klassischen PC Bereiche von Multimedia, Internet, Office, Präsentation, Streaming meisterhaft. Die Systeme sind vorbereitet für Windows 11 und sofort startklar: nur noch anschliessen und sofort loslegen.\r\n\r\n\r\nKonfiguration:\r\nCPU: AMD Ryzen 7 5700X, 8x 3.4 GHz\r\nCooler: Cooler MasterLiquid ML240L V2 ARGB, weiss, Wasserkühlung (240mm)\r\nSpeicher: 32 GB DDR4-3200 MHz (2x16GB), Dual-Channel\r\nGrafikkarte: NVIDIA GeForce RTX 4060, 8GB GDDR6\r\nMainboard: ASRock B450M Pro4 R2.0, AMD B450, AM4, mATX\r\nSound: 5.1 Surround-Sound (6-Kanal) Digital Audio, onboard\r\nM.2 SSD Festplatte: 2000 GB M.2 SSD (NVMe)\r\nNetzteil: 620 Watt ATX-Netzteil, 82% Wirkungsgrad\r\nGehäuse: ATX-Midi XPG Starker Air, Liquid, weiss\r\nBetriebssystem: Windows 11 Home, inkl. Xbox Pass und Norton 360\r\nService: Service24 basic\r\n\r\nLieferumfang:\r\nPC-System\r\nStromkabel\r\nSystemhandbuch in Deutsch\r\nHerstellernummer: 185217', 0.00, 0.00, 0.00, 'Otto', 'S004E0KVP2', 'PC', 99, '1', 'uploadsKIEBEL~1.JPG', 'online', 'normal', '2024-01-19 20:59:10', 0.00, 0.00),
(54, 'Kiebel Raptor V Gaming-PC (AMD Ryzen 7 AMD Ryzen 7 5800X, RTX 4060, 32 GB RAM, 1000 GB SSD, Luftkühlung)', NULL, 'AMD Ryzen 7 5800X, 8x 3.8 GHz\r\n32 GB DDR4-3200 MHz RAM\r\nNVIDIA GeForce RTX 4060, 8GB GDDR6\r\n1000 GB M.2, SSD (NVMe)\r\nWindows 11 Home\r\nAMD Ryzen Prozessoren erobern das Innenleben aktueller PC-Systeme. Die fortschrittlichen Prozessoren sind für schnelles Gaming und anspruchsvolle Datenverarbeitung ausgelegt. Die Messlatte für die Computer Performance wurde ein deutliches Stück nach oben versetzt.\r\n\r\nNVIDIAs neueste Grafikkartengeneration optimiert die Spieleleistung im FullHD (1920x1080) und WQHD (2560x1440) Bereich. Besonders bei den neuesten Spieletitel zeugt dieser PC eindrucksvoll, dass er eine wahre Gaming-Maschine ist. Ein System mit dem Spiele erst richtig zum Leben erweckt werden. Das Gaming Allround Talent ist für alle gängigen Spiele geeignet und dank Raytracing Technologie erstrahlen diese in einer bisher unerreichten Bildqualität.\r\n\r\nEine perfekte Ausstattung. In diesem Gamer-PC befinden sich eine schnelle SSD Systemplatte, viel Arbeitsspeicher, starker AMD Ryzen Multicore Prozessor, Gaming Grafikkarte, alle gängigen Anschlüsse wie USB3 / HDMI und dies ist einem beeindruckenden Gehäuse mit einstellbarer Beleuchtung.\r\n\r\nDas PC-System ist vorinstalliert mit Windows 11. Es ist eine werbefreie und performanceschonende Installation die nur das Wichtigste enthält. Sofort startklar: nur noch anschliessen und sofort loslegen. Wir verwenden ausschließlich qualitativ hochwertige Produkte namhafter Markenhersteller um Ihnen ein Produkt mit hoher Langlebigkeit und Stabilität anzubieten.\r\n\r\n\r\nKonfiguration:\r\nCPU: AMD Ryzen 7 5800X, 8x 3.8 GHz\r\nCooler: Arctic Freezer A35\r\nSpeicher: 32 GB DDR4-3200 MHz (2x16GB), Dual-Channel\r\nGrafikkarte: NVIDIA GeForce RTX 4060, 8GB GDDR6\r\nMainboard: MSI A520M Pro, AMD A520, AM4, mATX\r\nSound: 7.1 (8-Kanal) Surround-Sound, Digital Audio, onboard\r\nM.2 SSD Festplatte: 1000 GB M.2 SSD (NVMe)\r\nNetzteil: 620 Watt ATX-Netzteil, 82% Wirkungsgrad\r\nGehäuse: ATX-Midi Fractal Focus 2, RGB, weiss\r\nBetriebssystem: System Ersteinrichtung / Installation / Treiber\r\nService: Service24 basic\r\n\r\nLieferumfang:\r\nPC-System\r\nStromkabel\r\nSystemhandbuch in Deutsch\r\nHerstellernummer: 186791', 0.00, 0.00, 0.00, 'Otto', 'S0U880ZWP2', 'PC', 99, '1', 'uploads48768895-fd7c-51f6-b4c7-fff7d7deb16d.jpg', 'online', 'normal', '2024-01-19 21:14:45', 0.00, 0.00),
(55, 'Acer Nitro 50 (N50-640) Gaming-PC (Intel® Core i5 12400F, GeForce GTX 1660 Super, 16 GB RAM, 1024 GB SSD, Luftkühlung)', NULL, 'Intel®Core™i5-12400F 2,5 GHz (Turbo-Boost bis 4,4 GHz)\r\n16 GB DDR4-RAM Arbeitsspeicher\r\nSpeicher: 1024 GB SSD\r\nNVIDIA® GeForce® GTX 1660 SUPER\r\n4x USB 2.0, 2x USB 3.2 Gen1, 2x USB 3.2 Gen2, 1x HDMI', 300.00, 500.00, 0.00, 'Otto', '5178336941', 'Pc', 999, '1', 'uploads/4d2431c29b71981ebde81b345a91c186.jpg', 'online', 'normal', '2024-01-19 21:17:52', 0.00, 0.00),
(56, 'MSI MAG INFINITE S3 13NUC-820DE Gaming-PC (Intel Core i7 13700F, GeForce RTX 4060 VENTUS 2X BLACK 8G OC, 16 GB RAM, 1000 GB SSD, Luftkühlung)', NULL, 'Intel® Core™ i7-13700F 2,1 GHz (Turbo-Boost bis 5,2 GHz)\r\n16 GB DDR5-RAM Arbeitsspeicher\r\nSpeicher: 1000 GB SSD\r\nNVIDIA GeForce RTX 4060 VENTUS 2X BLACK 8G OC\r\n4x USB 2.0, 4x USB 3.2, 1x HDMI\r\nDie Gaming-PCs der MAG Infinite S3 13 Serie richten sich an Gaming-Enthusiasten,\r\n die sich nur mit dem Besten zufriedengeben.\r\n Ausgestattet mit Intel® Core™-Prozessoren der 13.\r\n Generation und Grafikkarten der NVIDIA GeForce RTX Serie ist ein\r\n intensives Gaming-Erlebnis vorprogammiert. Dank Silent Storm \r\nCooling-System bleiben deine Komponenten auch in diesem kompakten\r\n Gaming-PC immer im optimalen Temperaturbereich und der Geräuschpegel\r\n extrem niedrig. Durch die Bauart des Gehäuses ist ein einfaches und \r\nschnelles Aufrüsten möglich, sodass du immer auf dem neuesten Stand bleibst.', 0.00, 0.00, 0.00, 'Amazon', '4052905323', 'Pc', 99, '1', 'uploads/10252669.webp', 'online', 'normal', '2024-01-19 21:26:02', 0.00, 0.00),
(57, 'Kiebel Panorama Gaming-PC (Intel Core i7 Intel Core i7-10700F, RTX 3060, 16 GB RAM, 1000 GB SSD, Luftkühlung, RGB-Beleuchtung)', NULL, 'Intel Core i7-10700F\r\n16 GB DDR4-3200 MHz RAM\r\nNVIDIA GeForce RTX 3060, 12GB GDDR6\r\n1000 GB M.2, SSD (NVMe)\r\nDer Panorama Gamer-PC ist nicht nur ein optischer Blickfang, dank der 6 eingebauten Zusatzlüfter wird eine perfekte Kühlung realisiert. Das optische Highlight strahlt durch hochwertige Glasscheiben (kratzfest) in jeder gewünschten Farbeinstellung.\r\n\r\nMit diesem Gaming System ist flüssiges Spielen in FullHD-Auflösung (1920x1080) ein Genuss. Spiele wie Modern Warfare, GTA5, Anno 1800, The Division, Battlefield, Tomb Raider, Overwatch uvm. erwachen mit diesem System erst richtig zum Leben.\r\n\r\nSchnelle SSD Systemplatte, viel Arbeitsspeicher, starker Intel Multicore Prozessor, Gaming Grafikkarte und alle gängigen Anschlüsse runden das Angebiot ab.\r\n\r\nWir verwenden ausschliesslich qualitativ hochwertige Produkte namhafter Markenhersteller um Ihnen ein Produkt mit hoher Langlebigkeit und Stabiltät zu einem bestmöglichen Preis anzubieten.\r\n\r\n\r\nKonfiguration:\r\nCPU: Intel Core i7-10700F, 8x2.9 GHz (Comet Lake)\r\nCooler: be quiet! Pure Rock Slim 2 (supersilent)\r\nSpeicher: 16 GB DDR4-3200 MHz (2x8GB), Dual-Channel\r\nGrafikkarte: NVIDIA GeForce RTX 3060, 12GB GDDR6\r\nMainboard: ASRock H510M-HDV/M.2 SE, Sockel 1200, mATX\r\nM.2 SSD Festplatte: 1000 GB M.2 SSD (NVMe)\r\nNetzteil: 620 Watt ATX-Netzteil, 82% Wirkungsgrad\r\nGehäuse: ATX-Midi Panorama mit 6 LED Lüfter\r\nService: Service24 basic\r\n\r\nLieferumfang:\r\nPC-System\r\nStromkabel\r\nSystemhandbuch in Deutsch\r\nHerstellernummer: 186119', 0.00, 0.00, 0.00, 'Ali Express', 'S0V010AQP2', 'Home', 99, '1', 'uploadsKIEBEL~2.JPG', 'online', 'normal', '2024-01-19 21:30:30', 0.00, 0.00),
(58, 'Mutoy Bluetooth 5.0 FM Transmitter für Auto,PD 30W+QC3.0 Schnelllade KFZ-Transmitter FM Transmitter,Stärkeres Dual Mic & Bass-Boost,KFZ Bluetooth Freisprechen Mit 8-Farbiger Hintergrundbeleuchtung, Musik-Player,U-Disk', NULL, '30 W PD & QC 3.0 Schnellladung:Ausgestattet mit 2 Ladeanschlüssen: Typ-C (30 W PD) und QC3.0 (18 W) Anschlüsse bieten gleichzeitig schnelles Aufladen für zwei Geräte.\r\nEinfachere Bedienung und 8 Beleuchtungsmodi: Das neueste scrollrad-design, das die Lautstärke- oder UKW-Kanaleinstellung durch einfaches Scrollen nach oben/unten ermöglicht.\r\nDoppelmikrofon,Freisprechen:Mit dem eingebauten Doppelmikrofon in High-Fidelity-Technologie können Sie Freisprechanrufe mit besserer Klangqualität entgegennehmen.\r\nEin Klick:Durch langes drücken der taste\"B\"auf dem fm transmitter können sie den klang ganz einfach mit der bassverstärkung verstärken,Umschalten zwischen HiFi und Bass Boost-Modi.\r\nBreite Kompatibilität: Durch die Verwendung des fortschrittlichen Bluetooth V5.0-Chips bietet es einen stabileren Bluetooth-Signalempfang und breitere Kompatibilität.\r\nTABILE ÜBERTRAGUNG & HI-FI-BASS-VERSTÄRKUNG\r\nDer fortschrittliche Bluetooth 5.0-Chip bietet eine schnellere Kopplung und einen stabileren Klang als andere. Die leistungsstarke Bass-gesteuerte Technologie kann Ihnen über die Musik-Soundeffekt-Taste „B“ 100% mehr Bass bringen als ein gewöhnlicher FM Transmitter Auto Bluetooth. Ein Klick, und Sie ein erleben brandneues Fahrerlebnis.\r\n\r\nDIE SCHNELLSTE LADEGESCHWINDIGKEIT\r\nDer CIRYCASE Bluetooth Adapter Auto unterstützt das gleichzeitige Laden von zwei Arten von Geräten - PD 30W Type-C und QC3.0 18W USB-A-Ladeanschlüsse. Der PD-Anschluss mit bis zu 30W Leistung kann Galaxy S22 Ultra, iPhone 14, Pixel 3 usw. schnell aufladen, was 6-mal schneller ist als ein normales Autoladegerät. Der QC-Anschluss hat eine Ausgangsleistung von bis zu 18W, wodurch die kompatiblen Geräte in 35 Minuten auf 80% aufgeladen werden können.\r\n\r\nVERBESSERTES DUAL-MIKROFON & SCROLLRAD-DESIGN\r\nDie 2 Mikrofone arbeiten zusammen, um Ihre Stimme aus allen Richtungen zu erfassen, während die neueste CVC 8.0-Rauschunterdrückungstechnologie mehr Straßengeräusche, Windgeräusche und andere Ablenkungen blockiert. So gewährleisten Sie einen kristallklaren Anruf. Sie können einfach nach oben/unten scrollen, um die Lautstärke oder den UKW-Kanal mit dem neuesten Scrollrad-Design anzupassen.\r\n\r\nFANTASTISCHER ATMOSPHÄRENSCHÖPFER\r\nDer Transmitter für Auto Bluetooth unterstützt 8 Farben der LED-Hintergrundbeleuchtung. Sie können die Farbe je nach Stimmung oder Fahrzeuginnenraum ändern und erhalten durch die 8-farbige LED-Hintergrundbeleuchtung eine optisch beeindruckende Farbdarstellung. Darüber hinaus zeigt Ihnen ein LED-Bildschirm die Spannung der Autobatterie an, um Sie über den Zustand des Fahrzeugs auf dem Laufenden zu halten.\r\n\r\nBREITE KOMPATIBILITÄT\r\nEs ist gut kompatibel mit iPhone, iPad, Samsung, HTC, Sony, Tablet und anderen Bluetooth-fähigen Geräten. Außerdem passt es auf alle Autos und Lastwagen (12-24V). Dieser Bluetooth Transmitter Auto streamt jedes Audio von Ihrem Telefon an das Autosystem, einschließlich Navigation, und bringt Ihren Oldtimer auf ein neues Niveau.', 0.00, 0.00, 0.00, 'eBay', 'S0F9A0N0P2', 'Auto Zubehör', 99, '1', 'uploads/372CB6~1.JPG', 'online', 'normal', '2024-01-19 21:46:38', 0.00, 0.00),
(59, 'MAVURA Head Up Display HeadUp HUD Head Up Navigation Display PKW Smartphone, Halter Stand Handy Projektor Auto KFZ GPS OBD', NULL, 'Artikel-Nr. S0I49053P2\r\n☑ UNIVERSAL HUD - Verwandelt jedes Smartphone bis 6.5 Zoll in ein Head-Up-Display (HUD).\r\n☑ GLASKLARES BILD - Das reflektierte Bild ist bei jeder Sicht (Tag und Nacht) erkennbar, für zusätzliche Sicherheit und mehr Konzentration auf das wesentliche.\r\n☑ 360° GRAD - Flexibel und um 360 Grad drehbar, mit rutschfester Silikonmatte. Für die meisten Android-Smartphones und iPhones geeignet.\r\n☑ ANTI-SCRATCH - Eingebauter organischer Glasreflektor mit anti-scratch und 100% wasserdicht. Dank des klappbaren Designs kann man es platzsparend verstauen.\r\n☑ UNSER VERSPRECHEN- Ihre Zufriedenheit hat für uns allerhöchste Priorität! Daher bieten wir Ihnen neben unserem 24/7 Kundensupport, auch noch ein 30 Tage Geld-zurück-Versprechen!\r\nEntdecken Sie das MAVURA Head-Up Display - das ultimative Sicherheits- und Komfortzubehör für Ihr Auto!\r\n\r\nHalten Sie Ihre Augen immer auf der Straße und bleiben Sie sicher, während Sie fahren! Sie können alle Fahrtinformationen von Ihrem Smartphone direkt auf der Frontscheibe vor Ihnen ablesen.\r\n\r\nDie Einrichtung und Verwendung sind denkbar einfach. Bringen Sie die Head-Up Display Schale einmalig an Ihrem Armaturenbrett an und es bleibt sicher an Ort und Stelle. Kein Verrutschen oder Herumfummeln mehr!\r\n\r\nDank der ausgezeichneten Sichtbarkeit funktioniert die Projektion sowohl tagsüber als auch nachts einwandfrei. Sie können alle Informationen deutlich ablesen, ohne dabei Ihre Augen von der Straße nehmen zu müssen.\r\n\r\nMit den nützlichen Fahrwidgets können Sie das Display ganz nach Ihren Bedürfnissen anpassen. Entscheiden Sie selbst, welche Informationen Sie sehen möchten und passen Sie das Widget-Layout Ihres Smartphones an Ihre Vorlieben an.\r\n\r\nDas MAVURA Head-Up Display ist nicht nur funktional, sondern auch schlank und stilvoll. Es fügt sich perfekt in das Design Ihres Armaturenbretts ein und nimmt nur wenig Platz ein. Ein echter Blickfang!\r\n\r\nBefreien Sie sich von Ablenkungen während der Fahrt und sorgen Sie für Ihre Sicherheit. Holen Sie sich die MAVURA Head-Up Display Schale für das Smartphone und erleben Sie eine völlig neue Art des Autofahrens. Bestellen Sie jetzt und machen Sie Ihre Fahrt sicherer und komfortabler!\r\n\r\n \r\n\r\nDAS PAKET ENTHÄLT:\r\n\r\n1 x MAVURA HEAD-UP-Schale für Smartphone', 0.00, 0.00, 0.00, 'ali Baba', 'S0I49053P2', 'Auto Zubehör', 66, '1', 'uploads57eead75-794e-489c-9492-3e8a8d6b59cf.jpg', 'online', 'normal', '2024-01-19 21:54:18', 0.00, 0.00),
(60, 'Yaviel Handyhalterung Auto Qi mit Ladefunktion Autohalterung mit Ladefunktion Induktions-Ladegerät (15W Fast Kabellose Kfz-Ladegerät für iPhone Samsung Huawei LG, Ladegerät Auto Induktive Ladestation auto Wireless Charger au', NULL, '[15W Fast Kabellose Kfz-Ladegerät:]Das Auto Handyhalterung mit Ladefunktion verfügt über einen eingebauten intelligenten Hauptsteuerchip, die maximale Ausgangsleistung erreicht 15W\r\n[Entlüftungsclip :] Mit dem verbesserten Entlüftungsclip mit Haken lässt sich der Telefonhalter einfach und fest am Luftauslass befestigen, indem er festgeschraubt wird.\r\n[2 In 1 Kreatives Design :]Kombiniert the 15W Schnelles kabelloses Autoladegerät & handyhalterung auto, um Platz zu sparen und Komfort zu bieten.\r\n[Entlüftungsclip :] Mit dem verbesserten Entlüftungsclip mit Haken lässt sich der Telefonhalter einfach und fest am Luftauslass befestigen, indem er festgeschraubt wird.\r\n[Kompatible Geräte: ]iPhone 15/14/13/12/Pro/Max/Mini, Samsung Galaxy S23/S22/S21 Ultra/Z Flip3/A53, Xiaomi 12/12 pro/11 . Kompatibel mit QI-fähigen Geräten Telefone.\r\n15-W-Schnellladung, universell kompatibel\r\nDas kabellose Autoladegerät kann die Ladeleistung des Telefons automatisch erkennen und eine maximale Ladeleistung von 15 W für das iPhone 15/15 Pro/15 Pro Max/15 Plus/14 Pro/14 Pro Max bieten. 14/14 Plus/13/13 Pro/13 Pro Max/13 Mini/12/12 Pro/12 Pro Max/12 Mini/ 11/11 Pro/11 Pro Max/Xs Max/Xs/SE/Xr/X/8 , Samsung S23/S23+/S23 Ultra/S22/ S22+/S21/ S21+/S20/S20+/Note 20/S10 /S9/S8/ S7/S6/Note10, Google, ONEPLUS, LG usw. Kompatibel mit allen QI-fähigen Geräten Telefone.\r\n\r\nStabiler Entlüftungsclip\r\nVerwendet den verbesserten Butterfly-Entlüftungsclip, doppelt verriegelbar, superstabil, die hintere Kerbe des Clips blockiert nicht das Entlüftungsgitter, Sie müssen sich keine Sorgen machen, dass es herunterfällt. Geeignet für horizontale und vertikale Lüftungsschlitze, nicht für runde und unregelmäßige Lüftungsschlitze.\r\n\r\nVerbesserter Metallhaken\r\nDieses Induktionsladegerät Auto ist mit Metallhaken gestaltet, das die Haltbarkeit und Stabilität des Hakens erheblich verbessert, sicher an den Lüftungslamellen befestigt werden kann, ohne zu fallen, und für die meisten horizontalen und vertikalen Autoentlüftungen geeignet ist.\r\n\r\nStabiler und flexibler Betrachtungswinkel\r\nDieses kabellose Autoladegerät aus Kohlefaser mit einem um 360 Grad drehbaren und schwenkbaren Kugelgelenk kann Ihnen dabei helfen, beim Aufladen Ihres Telefons die bequemste und sicherste Betrachtung ohne Nacken- oder Augenbelastung zu erzielen.\r\n\r\nMehrfachschutz\r\nEingebauter, verbesserter intelligenter Chip, dieses Handyhalterung Auto Induktives Laden bietet mehrfachen Sicherheitsschutz wie Überladung, Überstrom, Kurzschluss, Temperaturregelung usw. Die Anzeigeleuchte an der Unterseite informiert Sie jederzeit über den Ladestatus Ihres Geräts. Bitte entfernen Sie vor dem Laden metallische / magnetische Gegenstände, Kreditkarten oder Pop-Halter.', 0.00, 0.00, 0.00, 'Otto', 'S0A7W09XJVCP2', 'Auto Zubehör', 99, '1', 'uploads607ED8~1.JPG', 'online', 'normal', '2024-01-20 21:00:54', 0.00, 0.00),
(61, 'HP-AUTOZUBEHÖR Auto-Fußmatte Auto Fußmatten Set, Rutschhemmende Rückenbeschichtung', NULL, 'Hochwertige Dilour-Matte mit rutschfestem Gummi-Granulatrücken\r\nund textiler Randeinfassung.\r\nTextile Ton-in-Ton Ketteleinfassung, Fahrermatte mit Trittschutz. Material 100% Polypropylen Abmessungen 63 x 43 cm / 40 x 30 cm.', 0.00, 0.00, 0.00, 'Otto', 'S0U8005UP2', 'Auto Zubehör', 99, '1', 'uploads/26927d73-7d20-5224-8ffa-ac6e842368ed.jpg', 'online', 'normal', '2024-01-20 21:05:27', 0.00, 0.00),
(62, 'ELMASLINE Auto-Fußmatten Gummi (4 St), für VW PASSAT B8 (2014-2023) 3D Gummimatten - Zubehör - Hoher Rand, (2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2021, 2022, 2023)', NULL, 'Perfekte Passform: Unsere Fußmatten werden individuell nach Maß angefertigt, um eine garantiert perfekte Passform für Ihr Fahrzeug zu gewährleisten.\r\nRundumschutz mit hohem 3D-Rand: Effektiver Schutz vor Flüssigkeiten und Schmutz im Innenraum dank des extra hohen 3D-Rands.\r\nZusätzlicher Schutz: Inklusive Mitteltunnelabdeckung und Abdeckung für die linke Fußablage des Fahrers für zusätzlichen einzigartigen Schutz.\r\nKompatible Befestigungen: Inklusive originaler Befestigungen, die nahtlos zu den vorhandenen Befestigungspunkten in Ihrem Fahrzeug passen.\r\nGeruchlos und umweltfreundlich: Geruchloses, hochwertiges, strapazierfähiges und pflegeleichtes TPE-Gummi. Herstellung aus nachhaltigen Rohstoffen. Recyclefähig.', 0.00, 0.00, 0.00, 'Otto', 'S0U8C0F6P2', 'Auto Zubehör', 99, '1', 'uploads03611aef-8170-54fe-8d0a-2be73b739e86.jpg', 'online', 'normal', '2024-01-21 10:09:25', 0.00, 0.00),
(63, 'HR-IMOTION TRIBALS GREY Lenkradbezug Lenkradhülle für 37 - 39 cm Lenkräder Auto-Adapter', NULL, 'Geeignet für Lenkräder von 37 bis 39 cm Durchmesser\r\nHemmt abrutschen und schwitzende Hände\r\nMaterial 100% PU (Polyurethan)\r\nFormbeständig und thermostabil von -40° bis +140° Celsius\r\nGriffiges Material sorgt für einen angenehmen Lenkradkontakt und für sicheres Fahrgefühl. Sportlich griffig und atmungsaktiv. Wird über das Lenkrad drübergezogen (im warmen Zustand).', 0.00, 0.00, 0.00, 'Otto', 'S0133086P2', 'Auto Zubehör', 999, '1', 'uploads/7889dd13-fe41-489f-b5bb-686c93cccba1.jpg', 'online', 'normal', '2024-01-21 10:12:50', 0.00, 0.00),
(64, 'HP-AUTOZUBEHÖR Handstaubsauger Nass- und Trockenstaubsauger', NULL, 'Leistung 90 W\r\nWassersäule 500 mm\r\nStaubbehälterinhalt 4,5 l\r\nEin leistungsstarker Staubsauger für PKW, Caravan, mit Adapter zum Auf- und Abpumpen von Luftmatratzen und Schlauchbooten etc..', 0.00, 0.00, 0.00, 'Otto', 'S0Z4A0DYP2', 'Auto Zubehör', 999, '1', 'uploads/c69f8e64-50ea-55ef-b06a-c8d54f6fa915.jpg', 'online', 'normal', '2024-01-21 10:14:07', 0.00, 0.00),
(65, 'GAMEMAX GP-750 PC-Netzteil (750W, 80 Plus Bronze)', NULL, 'Die durchschnittliche Zeit zwischen Ausfällen beträgt mehr als 100.000 Stunden.\r\nDas Netzteil besitzt folgende Schutzfunktionen: OVP,UVP, SIP, OCP, OLP, OPP, SCP.\r\nGekühlt wird es durch einen 140mm Ultra-leisen Lüfter.\r\nWährend des Betriebes hat es Temperaturen zwischen 0 - 40 °C.\r\nAnschlüsse: 1x 20+4 Pin, 1x 4+4 Pin 12V, 7x SATA, 3x 4 Pin Molex, 4x 6+2 Pin\r\nGamemax GP-750 Netzteil\r\nDas elegante schwarze Netzteilgehäuse ist mit vollständig schwarzen Mesh-Kabeln ausgestattet. Es ist kompatibel mit den ATX12V Ver.2.30 und ATX12V Ver.2.31 Standards. Das Netzteil ist hoch effizient und erreicht eine Effizienz von bis zu 85%. Es verfügt über eine einzelne 12V-Schiene, die eine hohe Kompatibilität und eine extrem hohe Stromausgabe ermöglicht. Die längeren 20 + 4 und 4 + 4 Pins haben eine Länge von bis zu 550 mm, was sie ideal für den Einbau in High-End-Tower-Gehäuse macht. Der 14 cm leise schwarze Lüfter ist mit einer intelligenten thermischen Lüfterdrehzahlregelungsschaltung ausgestattet, um einen optimalen Betrieb zu gewährleisten. Das Netzteil bietet einen vollständigen Schutz durch Funktionen wie OVP (Überspannungsschutz), UVP (Unterspannungsschutz), OPP (Überlastschutz), SCP (Kurzschlussschutz) und SIP (Überspannungsschutz bei Inkrementalbetrieb). Es ist nach CE-Normen für Sicherheit und elektromagnetische Verträglichkeit zertifiziert. Darüber hinaus erfüllt das Netzteil die umweltfreundlichen Anforderungen der RoHS- und ErP-2013-Richtlinien, was bedeutet, dass es umweltverträglich und energieeffizient ist.\r\n\r\nTechnische Daten:\r\n\r\nLeistung: 750W\r\n80+ Bronze\r\nBetriebsspannung: 100-240 VAC\r\nEingangsstrom: 12-6A\r\nEffizienz: > 81% (85% max)\r\nSchutzfunktionen: Überspannungsschutz, Unterspannungsschutz, Überstromschutz, Überlastschutz, Kurzschlussschutz\r\nBetriebstemperatur: 0-40°C\r\nKühlung: Aktiv, 140mm Ultra Silent Lüfter\r\nFrequenz: 50-60 Hz\r\nSicherheit: CE, FCC, CB\r\nLautstärke: < 25dBa\r\nGewicht: 1600g\r\nMaße (mm): 150x85x140\r\nLieferumfang: Netzteil, Schrauben, Bedienungsanleitung, Kabelbinder', 0.00, 0.00, 0.00, 'BigBuy', 'S017Z0ZLP2', 'Pc Zubehör', 99, '1', 'uploads85c98b24-1fc5-427a-89c0-35742b083731.jpg', 'online', 'normal', '2024-01-21 10:20:17', 0.00, 0.00),
(66, 'TradeNation Laptop-Dockingstation USB C Hub 6 in 1 Adapter HDMI 4K USB 3.0 Micro SD für Laptop Samsung, (1 St), Schnelles Laden, 4K', NULL, 'Kompatibel mit jedem Notebook / Macbook - Garantiert!\r\nVersand aus Deutschland - 2 Tage Versandzeit\r\nModernes Design / Datenübertragung + Schnell Laden\r\nSuperleichte Nutzung ohne Treiber / Plug & Play\r\n6 Anschlüsse\r\nKompatibel mit jedem Notebook / Macbook - Garantiert!\r\nSollte Ihr Gerät nicht mit dem HUB kompatibel sein, nehmen wir diesen natürlich zurück.\r\n->KEINE SMARTPHONES / TABLETS\r\n\r\nVersand aus Deutschland - 2 Tage Versandzeit\r\nIm Gegensatz zu vielen Konkurrenten, welche Produkte aus China verschicken mit langen Versandzeiten, wird das Produkt direkt aus Deutschland per Brief versandt. Die durchschnittliche Versandzeit beträgt 2 Tage.\r\n\r\n6 Anschlüsse\r\n1x USB C\r\n1x USB 3.0\r\n1x USB 2.0\r\n1x SD-Karte\r\n1x Micro SD\r\n1x 4K-HDMI (30 Hz) oder 1080p (60 Hz)\r\n\r\nModernes Design / Datenübertragung + Schnell Laden\r\nSie suchen nach einem verlässlichen HUB mit 6 Anschlüssen in modernem Design und edelster Aluminiumverarbeitung, der Daten übertragen kann und den Computer aufladen kann?\r\nDann ist dieser HUB genau richtig.\r\n\r\nSuperleichte Nutzung ohne Treiber / Plug & Play\r\nStecken Sie den HUB in Ihr Laptop und schon verbindet sich der HUB mit Ihrem Betriebssystem. Nun sollte die LED leuchten. Sie müssen keine Treiber oder ähnliches installieren.\r\n\r\nFester Halt selbst bei ruckeligen Aktivitäten\r\nDank der feinen und starken Steckverbindung bleibt der HUB immer fest verankert.\r\n\r\nTechnische Details\r\nDatenstrom 55W Plug & Play unterstützt', 0.00, 0.00, 0.00, 'Ali Express', 'S0A590B7P2', 'Pc Zubehör', 99, '1', 'uploads164941f5-11ca-4416-9cf2-a1c662442418.jpg', 'online', 'normal', '2024-01-21 10:36:07', 0.00, 0.00),
(67, 'FITUEYES Monitorständer aus Holz Monitorständer, (für PC Laptop)', NULL, 'Ergonomisches Design140mm hoch, hebt Ihren Computerbildschirm an, entlastet Nacken- und Rückenschmerzen, die durch das Sitzen vor dem Computer verursacht werden.\r\nStabil und Langlebig Vier Gummipuffer unter dem Sockel sorgen für Stabilität, verhindern Rutschen und Kratzer und verlängern die Lebensdauer des Geräts.\r\nMultifunktion Auf der zweiten Ebene können Sie Dinge wie Bücher, Stifte usw. unterbringen. Sorgen Sie für einen geräumigen und aufgeräumten Arbeitsbereich.\r\nTechnisches Detail Abmessungen: 42,5cm x 23,5cm x 14cm / 54 x 25,5 x 14cm, maximale Kapazität: 25kg. Hergestellt aus 12mm mattem MDF-Karton.\r\nEinfach zu Montieren Eine ausführliche Anleitung und das nötige Werkzeug werden mitgeliefert, um den Zusammenbau zu erleichtern.\r\nProduktname: Monitorständer.\r\n\r\nMaterial: MDF.\r\n\r\nGröße: 42,5x23,5x14cm / 54x25,5x14cm\r\n\r\nMaximale Tragkraft: 25kg.\r\n\r\nGeeignet für: Computer, PC, TV, Monitore.\r\n\r\nErhöhen Sie Ihren Bildschirm für eine angenehme Höhe, um Rücken- und Nackenbelastung zu reduzieren und den Platz optimal zu nutzen.\r\nHinweis: Unser Computer-Erhöhungsständer ist nach strengen Standards hergestellt, sehr kostengünstig.', 0.00, 0.00, 0.00, 'Amazon', 'S0B3O0ABF9WP2', 'Pc Zubehör', 99, '1', 'uploadsdb94650c-8515-48bc-b1de-714a5ff826af.jpg', 'online', 'normal', '2024-01-21 10:37:55', 0.00, 0.00),
(68, 'RICOO TS5811 Monitor-Halterung, (bis 32 Zoll, Tischhalterung 2 Monitore Dual Monitorständer Bildschirm schwenkbar)', NULL, 'Diese ergonomische doppel Schreibtischhalterung für 2 PC Bildschirme ist das ideale Zubehör für den Tisch am Arbeitsplatz zu Hause oder im Büro.\r\nDiese Computer Monitor Halterung ist schwenkbar, neigbar und höhenverstellbar. Sie ist geeignet für zwei 15 - 27 Zoll Bildschirme.\r\nBei der Montage von 2 Computerbildschirmen darf die Breite der Monitore maximal 720 mm betragen.\r\nMontage per Tischklemme an der Tischkante des Computertisches. Mit integrierter Kabelführung.\r\nFür alle Hersteller und Marken sowie curved Bildschirme geeignet, wenn Position und Größe der VESA-Norm sowie das Gewicht des Monitors unterstützt werden.\r\nBitte überprüfen Sie vor dem Kauf ob die Halterung zu Ihrem Bildschirm passt.\r\n\r\nPasst die Halterung zu meinem TV oder Monitor?\r\nNur wenn VESA-Norm*, Bildschirmgewicht und Lage der Kabelanschlüsse zur Konstitution der Halterung passen, ist die Halterung universell passend für sowohl kleine als auch große Bildschirme. Das heißt konkret: Die Halterung braucht dieselbe VESA-Norm wie Ihre Bildschirme, genügend Tragkraft (Bildschirme dürfen nicht mehr wiegen als die Halterung tragen kann) und Frontplatten (werden mit den Bildschirmen verschraubt), die den Kabelanschlüssen freien Zugang bieten. Wenn Ihre Bildschirme dann noch die Aufnahmeplatten überragen, statt umgekehrt, stimmt auch die Optik. Alle von uns angegebenen Zoll- und Diagonalangaben sind ungefähre Orientierungswerte.\r\n\r\n\r\nDiese Halterung besitzt folgende VESA-Schraubloch-Abstände:\r\n\r\nHorizontal / Waagerecht: 75mm, 100mm\r\nVertikal / Senkrecht: 75mm, 100mm\r\n\r\n\r\nWas ist VESA und wo find ich die Angaben?*\r\nAn den VESA-Gewindelöchern werden Bildschirme und Halterung zusammengeschraubt. Sie befinden sich auf den TV-Rückseiten und an den TV-Aufnahmeplatten der Tischhalterung. Sie müssen in ihrer Schraubloch-Anordnung übereinstimmen, also die gleichen Schraubloch-Abstände vertikal und horizontal zueinander aufweisen. Das ist die VESA-Norm: horizontaler Abstand in mm × vertikaler Abstand in mm. Die Ihrer Bildschirme finden Sie im Handbuch oder im Datenblatt auf der Internetseite des Herstellers. Andernfalls können Sie die VESA-Norm auch eigenhändig ermitteln und zwar wie folgt:\r\n\r\nVESA eigenständig ermitteln\r\nMessen Sie mit einem Zollstock oder Lineal auf der Rückseite Ihrer Bildschirme die Abstände der horizontalen und vertikalen Schraublöcher zueinander, die ein Quadrat oder Rechteck bilden. Diese Maße in Millimetern ergeben die VESA-Norm Ihrer Bildschirme.\r\n\r\n \r\n\r\n \r\n\r\n8-fache Schwenkbarkeit, Neigung, 360° Drehung + Höhenverstellbarkeit\r\n\r\nDie hat\'s drauf - Liefern Sie sich mit dieser doppel Tischhalterung Schwenkbarkeit an 4 Gelenken pro Arm à 180° (90° zu jeder Seite, je nach Bildschirm-Größe), +/- 45° Neigung und 360° Frontplatten-Drehbarkeit pro Monitoraufnahme an den Tisch. Unzählige Ausrichtungsmöglichkeiten der Bildschirme in sowohl synchroner als auch in unterschiedlicher Form werden möglich. 30mm Höhennachjustierung des Monitors und Clips für die Kabeldurchführung runden das Feature-Reichtum ab.\r\n\r\n \r\n\r\nNebeneinander, voneinander und asynchron auf verschiedene Plätze ausrichten\r\n\r\nDurch die vielseitige Schwenkung erreichen Sie mehrere Sitz-, Steh- und Liegeplätze von einem Tisch auch asynchron. Setzen Sie beispielsweise einen Fernseher und einen Monitor auf die Halterung oder zwei Monitore für Multimonitoring, Gaming und das Arbeiten und richten Sie die Bildschirme gewinkelt oder gestreckt voneinander entfernt oder nah beieinander aus. So bedient dieser Tischhalter auch einen zweiten Tisch mit. Da wird Zeit und Geld gespart, beispielsweise für die Büro-Raumausstattung. Mit einfachen Handgriffen verändern Sie die Bewegungen der Halterung. Auch ist der horizontale Arm rundherum aufsetzbar.\r\n\r\n \r\n\r\n16 Kg Gesamt-Tragkraft bei 8 Kg pro Arm und VESA 75x75 + 100x100\r\n\r\nMit seinen hochwertigen Stahl-Komponenten und der 16 Kg Gesamt-Tragkraft bei 8 Kg pro Monitoraufnahme hält dieser Tischhalter Ihre Bildschirme sicher bei all seinen Bewegungen in der Höhe. Die Verschraubung erfolgt via VESA-Standard, der physikalisch durchdacht auf Halterung und entsprechendem Bildschirm abgestimmt ist. Daher bietet dieser Tischhalter Ihren Bildschirm auch die passende Verschraub-Qualität, mit der heute nahezu alle Hersteller ihre Bildschirme ausstatten. Die geschwungene Form der Aufnahmeplatten bietet den Kabelausgängen seitens der Platte dann noch die passende Freiheit und das neue Bildschirm-Erlebnis kann losgehen.\r\n\r\n \r\n\r\nTipps & Tricks\r\n\r\nMit dem anbei liegenden Zubehör befestigen Sie die Halterung an einer Tischkante. \r\n\r\nWenn Sie diese Monitorhalterung besitzen und diese nicht per Tischklemme, sondern per Tischloch am Schreibtisch befestigen möchten, haben Sie mit dem optionalen Tischloch-Montage-Artikel (Modell-Nr. RICOO Z5811 / EAN: 4260201867192 / Amazon-ASIN: B07KQ7XZFH) die Möglichkeit dazu\r\n\r\nModell-Nr.: TS5811\r\nMontageart: Tischmontage\r\nUnterstütze VESA-Normen (in mm): 75x75  100x100 \r\nMaximale Belastbarkeit: ca. 8 Kg (je Monitoraufnahme)\r\nBildschirmdiagonale von bis: ca. 33 - 68cm (13\"-27\")\r\nAnzahl Monitore: 2 (bis max. 72cm Monitorbreite je Monitor)\r\nSchwenkbereich:  pro Arm 180° (90° zu jeder Seite, je nach Bildschirm-Größe)\r\nNeigebereich: +/- 45°\r\nFrontplattendrehung: 360°\r\nBildschirmhöhe Nachjustierung : ca. 30mm\r\nFür Tischdicke: min. 10mm - max. 88mm\r\nSonstiges: Clips für die Kabeldurchführung\r\nMaterial: Kaltgerollter Stahl\r\nProduktabmessung BxH: ca. 85cm x 51,5cm\r\nEigengewicht: ca. 5 Kg', 0.00, 0.00, 0.00, 'Otto', 'S0F3R0Z3P2', 'Pc Zubehör', 99, '1', 'uploads17dc1d82-dbdc-55e3-9238-6805c0243283.jpg', 'online', 'normal', '2024-01-21 10:39:45', 0.00, 0.00),
(69, 'be quiet! SFX-L Power 80 PLUS Gold modular 600 W PC- Netzteil4x PCIe PC-Netzteil', NULL, 'Kompakter SFX-L-Formfaktor\r\n600 Watt Gesamtleistung\r\nStarke Singlerail mit 50 A\r\nLeiser 120-Millimeter-Lüfter\r\nVollmodulares Kabelmanagement\r\nDie perfekte Mischung: SFX-L Formfaktor\r\nMit dem SFX-L Power Netzteil setzt be quiet! auf den kompakten SFX-L-Formfaktor, der einen der wenigen Nachteile des klassischen SFX-Formats beseitigt, indem die Länge der PSU geringfügig erhöht wird. Durch diese Maßnahme passt in den kompakten Energiespender ein größerer und leiserer 120-mm-Lüfter anstelle des oft zu schnell drehenden 80-mm-Lüfters. Das Ergebnis ist ein leistungsstarkes SFX-L-Netzteil mit einer enorm hohen kontinuierlichen Leistung von 600 Watt und einem leisen Lüfter, der seine Drehgeschwindigkeiten in Abhängigkeit der Last steuert.\r\n\r\nDank SFX-L-Format ist das SFX-L Power vor allem für Mini-Gehäuse vorgesehen, sticht aber trotzdem durch sein umfangreiches Anschlussarsenal hervor und bietet eine sehr hohe Leistung bei minimalen Abmessungen. Aufgrund der Tiefe von 12,5 cm muss jedoch vor dem Kauf auf die Kompatibilität mit dem Wunschgehäuse geachtet werden. Über die mitgelieferte Austauschblende lässt sich die PSU auch in ATX-Gehäusen montieren.\r\n\r\nVollmodulares Kabelmanagement & 80 PLUS Gold Effizienz\r\nBesonders komfortabel wird die Montage des Netzteils in kleinen Gehäusen durch die exzellente Kabelverwaltung, denn das Gerät ist vollmodular und wird mit abnehmbaren Flachbandkabeln für eine bedarfsgerechte Anschlussausstattung ausgeliefert. Die extrem hohe Effizienz des Netzteils von durchschnittlich 86,5 % - 89,5 % wurde mit dem 80 PLUS Gold Zertifikat ausgezeichnet und sorgt dafür, dass nur relativ wenig elektrische Energie in Wärme umgewandelt wird.\r\n\r\nStatt einer mehrfach aufgesplitteten 12-V-Leitung verfügt diese Version über eine kräftige Single-Rail mit satten 50 Ampere und bietet diverse Schutzfunktionen. Die individuell ansteckbaren Anschlüsse verdeutlichen die Leistungsstärke des Netzteils: So stehen neben 20+4-Pin- und 4+4-Pin-Stecker sogar vier 6+2-Pin-PCI-Express-Anschlüsse zur Verfügung. Über sechs SATA-Stecker und drei 4-Pol-Molex-Anschlüsse werden Peripherie-Geräte wie HDDs oder Brenner versorgt.\r\nZustand\r\n\r\nNeuware\r\nLieferumfang\r\n\r\nbe quiet! SFX-L Power 80 PLUS Gold PC-Netzteil modular - 600 Watt', 0.00, 0.00, 0.00, 'Otto', 'S0K1P0PRP2', 'Pc Zubehör', 99, '1', 'uploads/56a30558-fbc2-5c67-b759-688dec44f54c.jpg', 'online', 'normal', '2024-01-21 10:41:14', 0.00, 0.00),
(70, 'sus ROG Strix 1000W Gold Aura Edition PC-Netzteil', NULL, 'Das Aluminiumgehäuse dient als interner Kühlkörper für den Leistungstransformator und sorgt so für niedrige Temperaturen und Geräuschpegel\r\nROG-Kühlkörper decken wichtige Komponenten ab und sorgen für niedrigere Temperaturen und weniger Lärm\r\nDas Axial-Tech-Lüfterdesign hat eine kleinere Nabe, die längere Flügel ermöglicht, und einen Sperrring, der den Luftdruck nach unten erhöht\r\nLüfter mit Doppelkugellagern können bis zu doppelt so lange halten wie Gleitlagerausführungen\r\nMit der 0dB-Technologie kannst du leichte Spiele in relativer Stille genießen\r\nDas ROG Strix 1000W Gold Aura kombiniert erstklassige Komponenten, überlegene Kühlung und fesselnde RGB-Beleuchtung zu einer beeindruckenden Einheit. Mit riesigen ROG-Kühlkörpern, einem hocheffizienten Axial-Tech-Lüfter und einem auffälligen Aluminium-Finish ist es ein leistungsstarkes Netzteil für dein nächstes Gaming-Rig.', 0.00, 0.00, 0.00, 'Otto', 'S0O700NPP2', 'Pc Zubehör', 99, '1', 'uploads/0ccec79a-263e-5a48-a020-11be83391ca7.jpg', 'online', 'normal', '2024-01-21 10:44:22', 0.00, 0.00),
(71, 'Seasonic G12 GC-750 PC-Netzteil (80+ Gold)', NULL, 'Hoher Wirkungsgrad: Energieeffiziente G12 GC Reihe, 80 PLUS Gold zertifiziert, 90% Wirkungsgrad bei 50% Auslastung - spart Energie deutlich ein\r\nLeistungsstark: 750W & 62A Leistung für Gaming & Business. Das B12 BC-Netzteil versorgt Ihren PC zuverlässig und professionell.\r\nOptimale Kühlung: Hybrid-Lüftersteuerung, dreiphasige Wärmeregelung - leise, effizient und langlebig\r\nStromsparend: G12 GC-Serie mit hoher Effizienz & aktiver Leistungsfaktorkorrektur - weniger Energieverschwendung\r\nKompakte Größe: 140x150x86 mm - passt in zahlreiche PC-Gehäusevarianten\r\nMit dem Seasonic G12 GC-850 versorgst du deine professionellen High-End-Komponenten mit Strom und sparst bei den jährlichen Stromkosten. Die 80 Plus Gold-Zertifizierung bedeutet, dass mit mindestens 87 % der aufgenommenen Leistung der Computer mit Strom versorgt wird. So haben deine Komponenten genug Elektrizität und es geht weniger Leckstrom verloren. Mit einer Leistung von 850 Watt versorgst du eine professionelle High-End-Gaming-Konfiguration mit genug Strom. Hast du dein Spiel beendet? Der Ventilator schaltet dann automatisch den passiven Modus ein und funktioniert weiterhin leise im Hintergrund. So wirst du nicht durch Lärm belästigt. Befindest du dich in einer erhitzten Partie, aber draußen tobt ein Gewitterschauer? Keine Sorge. Die Konstruktion des Netzteils ist vor Stromschwankungen, Überspannung, Unterspannung, Kurzschluss und Überhitzung geschützt. So verwendest du dieses Seasonic G12 GC sicher in jeder Situation. Das leistungsstarke Netzteil bietet eine Vielzahl von internen Anschlussmöglichkeiten für deinen PC. Mit einem 20+4 PIN ATX Stromanschluss (1x) und einem 4+4-Pin 12V Anschluss (1x) ist eine zuverlässige Stromversorgung gewährleistet. Außerdem bieten das Netzteil dir 3x 6+2-Pin PCI-Express Anschlüsse für anspruchsvolle Grafikkarten sowie 5x 4-Pin Molex und beeindruckende 16x S-ATA III Anschlüsse für vielseitige Erweiterungen und Speicheroptionen. Erlebe maximale Flexibilität und Leistungsfähigkeit für deine Gaming- und Business-Bedürfnisse.', 0.00, 0.00, 0.00, 'Otto', 'S0E0N0NYP2', 'Pc Zubehör', 99, '1', 'uploadscbe02e6a-5b6f-571a-b77d-73ff1e306cc5.jpg', 'online', 'normal', '2024-01-21 10:45:28', 0.00, 0.00),
(72, 'RAZER Gaming-Stuhl Tarok Pro X by Zen', NULL, 'Gepolsterte 3D-Armlehnen\r\nXL 60mm PU bedeckte Druckentlastungsräder\r\nKlasse 4 Gaslift mit 100mm Federweg\r\nVollmetallrahmen mit 1,2 mm Dicke\r\nVerstärkte und erhöhte 700mm Nylonbasis\r\nMit Samt bezogene Schaumkissen\r\nKippmechanismus\r\nSitz aus Formschaum mit 45er Dichte\r\nRückenlehne aus Formschaum mit 18er Dichte\r\nMax. zulässiges Gewicht: 130 Kg\r\nAbmessung des Stuhls: H: 126 ~ 136cm, B: 70cm, T: 54cm\r\nGewicht des Stuhls: 20Kg\r\n\r\nRazer Edition Gaming Chair TAROK PRO X by Zen\r\nDer von Zen designte TAROK PRO X ist für alle wettbewerbsorientierten Spieler geeignet und wird Ihnen helfen, jedes Spiel zu dominieren. Das traditionelle Aussehen kombiniert mit den feinen Details der Handwerkskunst machen diesen Stuhl zu einem Blickfang. Die gut aufeinander abgestimmten Kreuzstichlinien und das Lochmuster in Sitz und Rückenlehne sorgen für einen klassischen Look mit feiner Detailarbeit. Mit den großen 3D-Armlehnen werden Ihre Ellbogen bei jedem Manöver perfekt unterstützt. Die 60-mm-PU-Räder sorgen für ein perfektes Roll-Erlebnis auf allen Oberflächen. All dies in Kombination mit dem speziell geformten Schaumstoff sorgt für köstlichen Spielkomfort!\r\n\r\nStrapazierfähiger Stoff\r\nDer TAROK PRO X ist am gesamten Stuhl aus hochwertigem CLOTH gefertigt. Der Stoff ist so fein gearbeitet, dass die Nähte kaum sichtbar sind. Der maßgefertigte hochdichte Formschaum auf dem Metallrahmen sorgt für einen festen, aber bequemen Sitz. Sehen, fühlen und riechen Sie die Handwerkskunst von Razer im TAROK PRO X. Der Sitz bietet Stabilität und Atmungsaktivität mit dem CLOTH-Sitzdesign, das Ihren Körper atmen lässt, wenn Sie stundenlang sitzen!\r\n\r\nMemoryfoam-Kissen\r\nTAROK PRO X wird mit einem Satz samtbezogener Memory-Foam-Kissen geliefert. Das Nackenkissen stützt den Nacken beim Zurücklehnen und das Rückenkissen stützt den unteren Rücken, um jederzeit eine ergonomische Sitzposition zu gewährleisten. Das Rückenkissen ist in der Höhe verstellbar, um eine optimale Unterstützung zu gewährleisten.', 800.00, 1000.00, 200.00, 'Otto', '1882081181', 'Pc Zubehör', 99, '1', 'uploads4e641875-d01a-561a-abc6-3515dacf2449.jpg', 'online', 'sale', '2024-01-21 10:47:11', 80.00, 40.00),
(73, 'Aryond Aryond A32 V1.3 Curved Monitor Curved-Gaming-Monitor (2560x1440 px, UWQHD, 1 ms Reaktionszeit, 165 Hz, VA)', NULL, 'Genießen Sie den reibungslosen täglichen Gebrauch und das Spielen mit einer Bildwiederholfrequenz von 165 Hz\r\nMit einer Reaktionszeit von 1Ms erhalten Sie eine gestochen scharfe Ausgabe, egal wie schnell das Bild ist\r\nSpiele spielen, Filme schauen oder Musik hören ohne zusätzliche Tonquelle - dank der eingebauten Lautsprecher\r\nMit 122 % sRGB sehen Sie bei der Arbeit und beim Spielen exakt Farben\r\nMit einem Seitenverhältnis von 16:9 und einem geschweifte 32-Zoll-QHD-Display ist das Aryond A32 V1.3 ideal für Arbeit und Freizeit. Genießen Sie den reibungslosen täglichen Gebrauch und das Spielen mit einer Bildwiederholfrequenz von 165 Hz. Mit einer Reaktionszeit von 1Ms erhalten Sie eine gestochen scharfe Ausgabe, egal wie schnell das Bild ist. Spiele spielen, Filme schauen oder Musik hören ohne zusätzliche Tonquelle - dank der eingebauten Lautsprecher. Mit 122 % sRGB sehen Sie bei der Arbeit und beim Spielen exakt Farben.', 0.00, 0.00, 0.00, 'Otto', 'S0M5P0R6P2', 'Monitor', 99, '1', 'uploads194d171a-c912-468d-823f-cac529bbd8f7.jpg', 'online', 'normal', '2024-01-21 10:50:02', 0.00, 0.00),
(74, 'MSI G322CQP Curved-Gaming-LED-Monitor (80 cm32 , 2560 x 1440 px, WQHD, 1 ms Reaktionszeit, 170 Hz, VA LED)', NULL, 'Bildschirmdiagonale: 80 cm (32 Zoll)\r\nMax. Auflösung 2560 x 1440 (WQHD)\r\nReaktionszeit: 1 ms\r\nAnschlüsse: 2x HDMI, DP\r\nNeig-, schwenk-, höhenverstellbar, Vesa Wandhalterung, FreeSync Premium, HDR Ready, Kensington Sicherung\r\nInspiriert von den strengen Qualitätstests bei der Produktion ist das Design der MSI G-Serie voller Symbolkraft und steht für Robustheit und Langlebigkeit. Um ein qualitativ hochwertiges Benutzererlebnis zu bieten, verfügt die G-Serie außerdem über einen wirklich einfachen Installationsprozess und eine benutzerfreundliche Menüoberfläche und ist die beste Wahl für Einsteiger, um mit dem Gaming zu beginnen.\r\n\r\nG322CQPDE Curved Gaming Monitor\r\nWeit über das Spiel hinaussehen\r\n\r\nAusgestattet mit einem immersiven, gebogenen 31,5 Zoll WQHD (2560x1440 VA-Panel (1000R) mit 170Hz Bildwiederholrate und 1ms Reaktionszeit, verschafft damit Gamern einen entscheidenden Vorsprung gegenüber Gegnern.\r\n\r\nDer G322CQP verfügt über die AMD FreeSync Premium Technologie, die die Bildwiederholfrequenz von Display und GPU für ein extrem flüssiges Gameplay anpasst, HDR Ready dynamischen Kontrast und einen neig- & höhenverstellbaren Standfuß\r\n\r\n170Hz Bildwiederholfrequenz\r\nMit dem G322CQPDE lassen sich flüssigere Bewegungen und Tracking mit einer hohen Bildwiederholfrequenz von 170Hz erleben und dazu das volle Potenzial der erstklassigen GPU- & Speicherhardware ausschöpfen.Die niedrige Reaktionszeit von 1ms (MPRT) reduziert die Unschärfe des Bildschirms drastisch und ist für rasante Spiele unerlässlich.\r\n\r\nHDR ready\r\nHDR Ready-Monitore bieten eine überragende Detailgenauigkeit in dunklen Bereichen mit einem realistischen dynamischen Kontrast, der das menschliche Auge in der realen Welt nachahmt.\r\n\r\nKontrastverhältnis:2500:1\r\nDCR: 100000000:1\r\n\r\nAMD FreeSync Premium\r\nAMD FreeSync Premium erweitert die Basisstufe der FreeSync Technologie um ein flüssiges, ruckelfreies Gamingerlebnis bei höchster Leistung.\r\n\r\nNiedriger Framerate-Ausgleich\r\nNiedrige Latenz\r\n\r\nLess Blue Light & Anti-Flicker-Technologie\r\nMSI Monitore sind mit Blaulichtfilter optimiert, um weniger blaues Licht erzeugen, so dass die Benutzer weiße Hintergründe (Suchmaschinen, Online-Spiele, Windows-Anwendungen) länger betrachten können, ohne dass die Augen unnötig belastet werden.Die Anti-Flicker-Technologie sorgt für ein überragendes Seherlebnis, indem sie das Flimmern reduziert - im Gegensatz zu herkömmlichen Monitoren, die in der Regel mit einer Flimmerrate von etwa 200 Mal* pro Sekunde anzeigen.*Auch wenn dies mit dem bloßen Auge nicht wahrnehmbar ist, kann es mit der Zeit zu Ermüdungserscheinungen führen.Verstellbarer Standfuß\r\nDer Monitorstandfuß lässt sich auf Wunsch in derNeigung (-5°~20°) und in der Höhe (0~130mm) verstellen, um den Betrachtungskomfort zu verbessern.E/A-Konnektivität:\r\n\r\nDisplayPort 1.2a: 2560 x 1440 (170 Hz max. über DisplayPort-Übertaktung)\r\n2 x HDMI 2.0a: 2560 x 1440 (144 Hz max.)\"', 200.00, 500.00, 250.00, 'Otto', '3962231873', 'Monitor', 99, '1', 'uploads65e27b50-9afe-5c2e-a0f4-fd718e7afe4d.jpg', 'online', 'sale', '2024-01-21 10:53:00', 50.00, 150.00);
INSERT INTO `products_details` (`product_id`, `product_name`, `brand`, `description`, `lieferant_preis`, `unser_preis`, `Sale_preis`, `company`, `cpi`, `category`, `quantity`, `type_number`, `first_picture`, `status`, `product_status`, `created_at`, `sale_prozent`, `sale_profit`) VALUES
(75, 'Samsung ViewFinity S5 S34C500GAU LED-Monitor (86,4 cm34 , 3440 x 1440 px, Wide Quad HD, 5 ms Reaktionszeit, 100 Hz)', NULL, 'Display-Auflösung: 3440 x 1440 Pixel\r\nHD-Typ: UltraWide Quad HD\r\nBildschirmtechnologie: LED\r\nReaktionszeit: 5 ms\r\nNatives Seitenverhältnis: 21:9\r\nSamsung ViewFinity S5 S50GC, 86,4 cm (34 Zoll), 3440 x 1440 Pixel, UltraWide Quad HD, LED, 5 ms, Schwarz\r\nMehr auf nur einem Bildschirm erledigen\r\nEgal, ob du an einem Projekt arbeitest oder du dir einen Film anschaust - auf dem breiteren Display mit einem Seitenverhältnis von 21:9 entdeckst du jedes Detail. Ultra WQHD gibt dir die Möglichkeit, die Bildschirmfläche zu maximieren und nahtloses Multitasking auf nur einem Bildschirm zu erleben.\r\nEine Milliarde Farben mit unglaublicher Tiefe\r\nGeniesse jeden Inhalt atemberaubend genau. Mit HDR10, das über 1 Milliarde Farben anzeigt, sind dunkle Farben dunkler und die hellsten heller. So wird jeder Inhalt zum Genuss und kann genau so erlebt werden, wie es konzipiert wurde.\r\nSchont die Augen bei Tag und Nacht\r\nSchenk deinen Augen mehr Komfort. Ein Umgebungslichtsensor auf dem Monitor erkennt die Beleuchtung in deinem Arbeitsbereich und passt die Helligkeit automatisch an. Übermässiges, blaues Licht wird mit dem Eye Saver Mode minimiert, während die Flicker Free-Funktion die Augen entlastet.\r\nEin reibungsloses Seherlebnis\r\nFlüssige Action, mit weniger Lags und Schlieren. Die Bildwiederholfrequenz von 100 Hz eliminiert Verzögerungen und Unschärfe und sorgt für flüssige Bilder, wenn du Videos schaust, an deinen Projekten arbeitest oder dein Gaming auf ein neues Level setzen willst.\r\nErlebe nahtlose Action\r\nAMD Radeon FreeSync™ hält die Bildwiederholfrequenz von Monitor und Grafikkarte synchron, um Tearing zu vermeiden. So kannst du deine Filme und Games ohne Verzögerungen genießen. Selbst schnelle Szenen sehen nahtlos und flüssig aus – für ein reibungsloses Seherlebnis.', 0.00, 0.00, 0.00, 'Otto', '6360225254', 'Monitor', 99, '1', 'uploadsaf190095-3acc-4a63-b9b4-516c06bc6a6c.jpg', 'online', 'normal', '2024-01-21 10:55:27', 0.00, 0.00),
(76, 'Sony INZONE M3 Gaming-Monitor (69 cm27 , 1920 x 1080 px, Full HD, 1 ms Reaktionszeit, 240 Hz, IPS-LCD, Perfekt für PlayStation®5)', NULL, 'Bildschirmdiagonale 80 cm (32 Zoll)\r\nMax. Auflösung 1920 x 1080 (Full HD)\r\nReaktionszeit: 1 ms\r\nAnschlüsse: 2x HDMI 2.1, 3x USB-A, USB-B, USB-C, DisplayPort 1.4\r\nMit dem Auto KVM Switch (Auto USB Hub Switch) können Sie bis zu zwei PCs über eine einzige Tastatur, Maus und ein Headset steuern, die an den Monitor angeschlossen sind.', 0.00, 0.00, 0.00, 'Amazon', '7058245868', 'Monitor', 99, '1', 'uploads58867c1c-926b-59ae-bdc1-02efe47ed2d4.jpg', 'online', 'normal', '2024-01-21 10:57:02', 0.00, 0.00),
(77, 'Asus CG32UQ Gaming-Monitor (80,00 cm31,5 , 3840 x 2160 px, 4K Ultra HD, 5 ms Reaktionszeit, 60 Hz, HDR, Konsolen Gaming Monitor, HaloSync, FreeSync, DisplayHDR 600, GameFast)', NULL, '4K HDR mit DCI-P3 95%\r\nGameFast-Eingabetechnologie\r\nHalo Sync: Mit 66 adressierbaren RGB-LEDs\r\nDynamisches Onscreen-Display (OSD)\r\nAMD-Radeon-FreeSync-Technologie\r\nASUS CG32UQ 81,3 cm (32 Zoll) Gaming Monitor HDR Konsolen-Gaming-Monitor – 81,28cm (32-Zoll) 4K (3840x2160), Halo Sync, FreeSync, DisplayHDR 600, DCI-P3 95%, GameFast, Fernbedienung\r\n\r\nHDR Konsolen-Gaming-Monitor – 81,28cm (32-Zoll) 4K (3840x2160), Halo Sync, FreeSync, DisplayHDR 600, DCI-P3 95%, GameFast, Fernbedienung\r\n\r\n31.5\" 4K (3840 x 2160) HDR Konsolen-Gaming-Monitor mit AMD Radeon FreeSync für Xbox, PlayStation und Nintendo Switch.\r\nHalo Sync ist eine Bias-Beleuchtung (Umgebungslicht auf der Rückseite), die das Display erweitert und Blendeffekte in kontrastreichen Szenen reduziert. Die Farben werden dabei auf den Bildschirminhalt abgestimmt, um dein Sichtfeld optimal auszufüllen.\r\nDie High-Dynamic-Range(HDR)-Technologie mit professionellem DCI-P3 95% Farbraum liefert einen Kontrast und eine Farbleistung, die den Anforderungen der DisplayHDR-600-Zertifizierung entspricht.\r\nDie GameFast-Input-Technologie minimiert den Input-Lag und ermöglicht eine wesentlich schnellere Übertragung der Bewegungsinformationen vom Endgerät zum Monitor\r\nDas konsolenfreundliche Design umfasst eine Fernbedienung zum Einstellen der Helligkeit, Wechseln des Videoeingangs und Steuern anderer Funktionen, sowie einen Standfuß mit eingebautem USB-Hub zum praktischen Aufladen der Spielcontroller.\r\n\r\n4K HDR mit DCI-P3 95%\r\n\r\nDer ASUS CG32UQ liefert eine überragende Bildqualität mit 4K-Auflösung, HDR10-Unterstützung und VESA-DisplayHDR-600. Er bietet 10-Bit-Farben und deckt 95% des kinoreifen DCI-P3-Farbraums ab, der eine viel größere Farbpalette bietet als sRGB. Das zonenbasierte Dimmen ermöglicht einen großen Dynamikbereich von tiefem Schwarz bis hin zu leuchtendem Weiß, das eine lokale Leuchtdichte von bis zu600 cd/m² erreicht.\r\n\r\nGameFast-Eingabetechnologie\r\n\r\nWährend konkurrierende TV-Geräte in der Regel 27–50 Millisekunden benötigen, um mit deinen Eingaben Schritt zu halten, verringert der ASUS CG32UQ mit der GameFast-Input-Technologie diese Verzögerung auf gerade einmal 13 Millisekunden. Die Reduzierung der Latenz zwischen Eingabe und Darstellung auf dem Bildschirm kann dazu führen, dass du dich direkter mit dem Spiel verbunden fühlst. Im Vergleich zu Gegnern mit langsameren Monitoren kann dies sogar einen echten Wettbewerbsvorteil darstellen.\r\n\r\nHalo Sync\r\n\r\nMit 66 adressierbaren RGB-LEDs, die in die Rückseite des Monitors integriert sind, projiziert Halo Sync eine farbenfrohe Lichtstimmung an deine Wände. Immer wenn du spielst, einen Film siehst oder deinen Computer für alltägliche Aufgaben nutzt, passt Halo Sync die LED-Farben entlang der Monitorkanten an die Inhalte auf dem Bildschirm an. Das synchronisierte Umgebungslicht erweitert die Immersion in dein Zimmer und liefert dir deine eigene Lichtshow.\r\n\r\nDynamisches Onscreen-Display (OSD)\r\n\r\nDas dynamische Onscreen-Display bietet dir einen intuitiven Überblick über alle wichtigen Einstellungen. Durch die Animationen beim Ändern der Einstellungen fühlt sich die Konfiguration des Monitors fast wie ein Spiel an.\r\n\r\nAMD-Radeon-FreeSync-Technologie\r\n\r\nDie AMD-Radeon-FreeSync-Technologie gleicht die Bildwiederholrate des Monitors mit der Bildwiederholrate kompatibler Grafikkarten und Konsolen ab, um ein sichtbares Zerreißen des Bildes (Tearing) zu vermeiden. Zusätzlich werden Ruckler beim Abfallen der Performance unter die maximale Bildwiederholrate reduziert, ein Effekt, der beim Spielen in 4K auf fast allen PCs auftritt, mit Ausnahme von absoluten High-End-Systemen. Der ASUS CG32UQ hat die Möglichkeit, seine Bildwiederholfrequenz zwischen 40-60Hz zu variieren, um die üblichen Leistungsschwankungen im Spiel auszugleichen. Adaptive-Sync funktioniert nicht nur mit dem DisplayPort-1.2-Eingang, sondern auch mit allen drei HDMI-2.0-Anschlüssen, sodass du die Vorteile dieser Technik auf all deinen Gaming-Geräten nutzen kannst.\r\n\r\nAudio-Wizard\r\n\r\nMit vier individuellen Profileinstellungen lässt sich der Klang an eine Vielzahl von Gaming-Genres anpassen, wie beispielsweise Egoshooter (FPS), Rennsimulationen oder Kampfspiele. Zusätzlich ist ein Filmmodus vorhanden. Der Spieler kann das für seinen Zweck passende Audio-Profil auswählen und das Headset verstärkt automatisch die kritischen Klangdetails.\r\n\r\nUSB-Ladestation auf dem Standfuß\r\n\r\nDer ASUS CG32UQ lässt sich mit zwei USB-3.0-Schnittstellen am Standfuß auch als Peripherie- und Aufladestation nutzen. Die Anschlüsse sind zum Aufladen von Geräten reserviert – halte deine Gamepads einsatzbereit oder schließe dein Smartphone an, wenn der Akku leer ist.\r\n\r\nRemote Control\r\n\r\nUm dir die gleiche unkomplizierte Bedienung zu ermöglichen, während du auf der Couch am anderen Ende des Raumes sitzt, verfügt der ASUS CG32UQ über eine praktische Fernbedienung, mit der du schnell und einfach die Helligkeit einstellen, den Signaleingang ändern und andere Funktionen im Bildschirmmenü ausführen kannst.\r\n\r\nVESA-Kompatibilität und mitgelieferter Kopfhörerständer\r\n\r\nDie Wandmontage ist mit einer standardmäßigen VESA-Halterung möglich. Wenn du dich dafür entscheidest, den ASUS CG32UQ aufzuhängen, kannst du den Standfuß weiterhin als Kopfhörerständer und USB-Hub verwenden. Schließe den Standfuß einfach mit einem Ladekabel an den Monitor an und du kannst alle USB-Anschlüsse nutzen.\r\n\r\n\r\nTechnische Details\r\n\r\nBildschirm\r\nBildschirmdiagonale: 80 cm (31.5 Zoll)\r\nBildschirmauflösung: 3840 x 2160 Pixel\r\nPanel-Typ: VA\r\nHD-Typ: 4K Ultra HD\r\nBildschirmform: Flach\r\nKontrastverhältnis: 3000:1\r\nAnzahl der Farben des Displays: 16,78 Millionen Farben\r\nHelligkeit (typisch): 400 cd/m²\r\nReaktionszeit: 5 ms\r\nDisplay-Oberfläche: Matt\r\nUnterstützte Grafik-Auflösungen: 3840 x 2160\r\nBildwinkel, horizontal: 178°\r\nBildwinkel, vertikal: 178°\r\nHorizontaler Scanbereich: 30 – 134 kHz\r\nVertikaler Scanbereich: 40 – 60 Hz\r\nSichtbare Größe (horizontal): 69,8 cm\r\nSichtbare Größe (vertikal): 39,3 cm\r\nHigh Dynamic Range Video (HDR) Unterstützung: Ja\r\nTechnologie mit hohem Dynamikbereich (HDR): High Dynamic Range (HDR) 600\r\nAnschlüsse und Schnittstellen\r\nIntegrierter USB-Hub: Ja\r\nHDMI: Ja\r\nKopfhörerausgang: Ja\r\nUSB-Hub-Version: 3.2 Gen 1 (3.1 Gen 1)\r\nAnzahl der nachgeschalteten Steckplätze vom Typ USB-A: 4\r\nDVI Anschluss: Nein\r\nAnzahl HDMI-Anschlüsse: 3\r\nHDMI-Version: 2.0\r\nAnzahl DisplayPort Anschlüsse: 1\r\nDisplayPorts-Version: 1.2\r\nAudioanschlüsse: Nein\r\nKopfhörerausgänge: 1\r\nKopfhörer-Anschluss: 3,5 mm\r\nHDCP: Ja\r\nStromeingang: Ja\r\nGewicht und Abmessungen\r\nGerätebreite (inkl. Fuß): 730,4 mm\r\nGerätetiefe (inkl. Fuß): 268,5 mm\r\nGerätehöhe (inkl. Fuß): 606,1 mm\r\nGewicht (mit Ständer): 13,4 kg\r\nBreite (ohne Standfuß): 73 cm\r\nTiefe (ohne Standfuß): 7,82 cm\r\nHöhe (ohne Standfuß): 43 cm\r\nGewicht (ohne Ständer): 9,1 kg\r\nLeistung\r\nEnergieeffizienzklasse (SDR): G\r\nEnergieeffizienzklasse (HDR): G\r\nEnergieverbrauch (SDR) pro 1.000 Stunden: 41 kWh\r\nEnergieverbrauch (HDR) pro 1.000 Stunden: 138 kWh\r\nStromverbrauch (Standardbetrieb): 40,8 W\r\nStromverbrauch (Standby): 0,5 W\r\nStromverbrauch (aus): 0,3 W\r\nEnergieeffizienzskala: A bis G\r\nVerpackungsdaten\r\nStänder enthalten: Ja\r\nMitgelieferte Kabel: AC, USB\r\nSchnellstartübersicht: Ja\r\nFernbedienung enthalten: Ja\r\nVerpackungsbreite: 825 mm\r\nVerpackungstiefe: 322 mm\r\nVerpackungshöhe: 550 mm\r\nVerpackungsart: Box\r\nErgonomie\r\nVESA-Halterung: Ja\r\nKabelsperre-Slot: Ja\r\nHöhenverstellung: Ja\r\nPanel-Montage-Schnittstelle: 100 x 100 mm\r\nSlot-Typ Kabelsperre: Kensington\r\nHöheneinstellung: 10 cm\r\nkippbar: Ja\r\nNeigungswinkelbereich: -5 – 20°\r\nSonstige Funktionen\r\nHelligkeit (peak): 600 cd/m²\r\nEin-/Ausschalter: Ja\r\nTV Tuner integriert: Nein\r\nIntergrierter Kopfhörer-Haken: Ja\r\nDesign\r\nMarktpositionierung: Gaming\r\nProduktfarbe: Schwarz\r\nAbnehmbarer Standfuß: Ja\r\nFußfarbe: Schwarz\r\nLeistungen\r\nAMD FreeSync: Ja\r\nAMD FreeSync-Typ: FreeSync\r\nVESA Adaptive Sync unterstützt: Ja\r\nLow-Blue-Light-Technologie: Ja\r\nMultimedia\r\nEingebaute Lautsprecher: Ja\r\nIntegrierte Kamera: Nein\r\nAnzahl der Lautsprecher: 2\r\nRMS-Leistung: 12 W', 400.00, 500.00, 250.00, 'Otto', 'S0T79087P2', 'Monitor', 99, '1', 'uploadsaf190095-3acc-4a63-b9b4-516c06bc6a6c.jpg', 'online', 'sale', '2024-01-21 10:59:10', 50.00, 50.00),
(78, 'LG 32GP850 Gaming-Monitor (80 cm31,5 , 2560 x 1440 px, WQHD, 1 ms Reaktionszeit, 165 Hz, IPS)', NULL, 'Bildschirmdiagonale: 80 cm (32 Zoll)\r\nMax. Auflösung 2560 x 1440\r\nReaktionszeit: 1 ms\r\nAnschlüsse: 2x HDMI, 3x USB\r\nMit dem 32GP850 von LG Electronics ist jedes Home-Office bestens ausgestattet. Der besonders schlanke 31,5-Zoll-Monitor mit einer Bilddiagonalen von 80 Zentimetern ist durch sein herausragendes IPS-Display für alle Aufgaben bestens gerüstet. Bei einer Spitzenhelligkeit von 350 cd/m2 und der brillanten Kontrastschärfe dank HDR10 sehen Inhalte absolut umwerfend aus. Die 2.560 x 1.440 Pixel native Auflösung ermöglicht sowohl im produktiven Einsatz als auch bei Multimedia-Unterhaltung beste Ergebnisse. Mit seiner rasanten 1 Millisekunde Reaktionszeit (GtG) sowie Kompatibilität zu AMD FreeSync™ und „NVIDIA G-SYNC Compatible“-Zertifizierung ist der 32GP850 zudem auch als Gaming-Monitor ein Garant für besten Spielspaß.', 0.00, 0.00, 0.00, 'BigBuy', '7814913657', 'Monitor', 99, '1', 'uploads4584e223-8f3d-5f07-a6b3-dd940d07fbac.jpg', 'online', 'normal', '2024-01-21 11:01:45', 0.00, 0.00),
(79, 'Asus XG27AQ-W Gaming-Monitor (68,6 cm27 , 2560 x 1440 px, Wide Quad HD, 1 ms Reaktionszeit, 170 Hz)', NULL, 'Bildschirmdiagonale: 68,6 cm (27 Zoll)\r\nMax. Auflösung: 2560 x 1440 (Wide Quad HD)\r\nReaktionszeit: 1 ms', 0.00, 0.00, 0.00, 'Otto', '1053231290', 'Monitor', 99, '1', 'uploads4ba97d4a-31a8-5b19-a77f-3417eebb6f45.jpg', 'online', 'normal', '2024-01-21 11:04:41', 0.00, 0.00),
(80, 'Asus XG27AQ Gaming-Monitor (69 cm27 , 2560 x 1440 px, WQHD, 1 ms Reaktionszeit, 170 Hz, LED)', NULL, 'Bildschirmdiagonale 69 cm (27 Zoll)\r\nMax. Auflösung 2560 x 1440 (WQHD)\r\nReaktionszeit: 1 ms\r\nAnschlüsse: 2x HDMI, 3x USB', 500.00, 800.00, 160.00, 'Otto', '9434920939', 'Monitor', 99, '1', 'uploadsf421f05e-d198-57da-930e-f16e258a7859.jpg', 'online', 'sale', '2024-01-21 11:08:33', 80.00, 60.00),
(81, 'moebel-direkt-online Weinregal Zoffoli, Aus dem Hause Zoffoli', NULL, 'In drei trendigen Farben lieferbar\r\nSäulen aus Massivholz Buche\r\nHochwertige Verarbeitung \"Made in Italy\"\r\nQualität aus dem Hause Zoffoli\r\nPaketversand\r\nHochwertige, funktionelle Globus-Bar mit vielen aufwändigen Details gearbeitet und erstklassig verarbeitet. Böden, Kugel und Inneneineteilung der Kugel aus MDF mit pflegeleichten Beschichtungen. Die gedrechselten Beine und die Mittelsäule sind aus Massivholz, Buche, nussbaumfarben gebeizt und lackiert. Unten mit goldfarbenen Metallring. Drei Rollen sorgen für Mobilität. Kugel lässt sich aufklappen, darunter Stellfläche und praktische Einteilung für Glaser, Flaschen usw. Rollen und Scharniere aus Metall, antik goldfarben. Lieferung der schönen Glosbus-Bar erfolgt zur Selbstmontage, inklusive Aufbauanleitung. Maße ca. cm: (ØxH) 55/93.', 0.00, 0.00, 0.00, 'Otto', 'S0L3J0NRYANP2', 'Home', 99, '1', 'uploads/3e278f7c-a371-485f-9762-393f2c2ff9ee.jpg', 'online', 'normal', '2024-01-21 12:04:04', 0.00, 0.00),
(82, 'neu.haus Klapptisch, »Alta« Schreibtisch höhenverstellbar 120x60 cm Dunkelbraun  Schwarz', NULL, 'Der Tisch eignet sich ideal für Ihr Zuhause oder Büro. Er ist nicht nur höhenverstellbar sondern auch klappbar und dadurch sehr platzsparend.\r\nBietet Platz für bis zu 4 Personen zum angenehmen Sitzen\r\nMaterial: Tischplatte: Spanplatte Gestell: Metall, pulverbeschichtet\r\nMaße: Gesamt (LxBxH): 120x60x75-76,4cm Gestell (BxT): 3x3cm, Farbe: Tischplatte: Dunkelbraun, Gestell: Schwarz\r\nMarkenware aus dem Hause: [neu.haus]®\r\nKlapptisch\r\n\r\nDer Tisch eignet sich ideal für Ihr Zuhause oder Büro. Er ist nicht nur höhenverstellbar sondern auch klappbar und dadurch sehr platzsparend.\r\n\r\nProduktdetails:\r\n\r\n- Bietet Platz für bis zu 4 Personen zum angenehmen Sitzen\r\n- Platzsparend zu verstauen, durch Klappmechanismus\r\n- Höhenverstellbar um 1,4cm\r\n\r\nMaterial:\r\n\r\nTischplatte: Spanplatte, Melamin beschichtet\r\nGestell: Metall, pulverbeschichtet\r\n\r\nFarbe:\r\n\r\nTischplatte: Dunkelbraun\r\nGestell: Schwarz\r\n\r\nMaße:\r\n\r\nGesamt (LxBxH): 120 x 60 x 75 - 76,4cm\r\nGestell (BxT): 3 x 3cm\r\n\r\nLieferumfang:\r\n\r\n1x Klapptisch\r\n\r\nMarkenware aus dem Hause:\r\n\r\n[neu.haus]®', 0.00, 0.00, 0.00, 'Otto', 'S0V0302Z7RAP2', 'Home', 99, '1', 'uploads/33b3aeb0-dfea-5a9b-9302-dbccf27a075e.jpg', 'online', 'normal', '2024-01-21 12:44:58', 0.00, 0.00),
(83, 'Ambiente Haus Sitzgruppe, Stühle mit Tisch Outdoor geeignet', NULL, 'Praktische Bank\r\nIm romantischen Stil\r\nPulverbeschichtetes Metall\r\nDieses schöne schmiedeeiserne Ensemble, bestehend aus zwei Stühlen und einem Tisch, ist ein echter Hingucker und bringt ein besonderes Ambiente in Ihren Garten. Der ideale Ort, um zu zweit ein oder zwei Gläser Wein zu genießen. Der Tisch, der mit den beiden Stühlen verbunden ist, verfügt über eine Öffnung für einen Sonnenschirm und bietet ausreichend Platz für Getränke, Knabbereien oder auch Zeitschriften. Unser schmideeisernes Gartenensemble wurde liebevoll handgefertigt und mit einer speziellen Pulverbeschichtung versehen, durch die der nostalgische Look erzielt wird. Auch dadurch ist der Artikel für den Innen- wie auch Außenbereich geeignet.', 0.00, 0.00, 0.00, 'Otto', '4411630981', 'Garten', 99, '1', 'uploadsaae5c89e-af8d-54e2-b952-78ecf07cc356.jpg', 'online', 'normal', '2024-01-21 12:46:28', 0.00, 0.00),
(84, 'Casa Padrino Chesterfield-Sofa Chesterfield 2er Sofa Antikgrau aus dem Hause - Wohnzimmer Möbel - Couch', NULL, 'Chesterfield 2er Sofa Antikgrau aus dem Hause Casa Padrino - Wohnzimmer Möbel - Couch\r\nSofas,Chesterfield Sofas,Chesterfield Möbel,Sofas,Chesterfield Sofas\r\nChesterfield 2er Sofa Antikgrau aus dem Hause Casa Padrino - Wohnzimmer Möbel - Couch\r\n\r\nBreite: 150cm\r\nHöhe: 70cm\r\nTiefe: 90cm\r\nSitz: 95cm x 50cm x 55cm (BxHxT)\r\nFarbe: Antikgrau\r\nMaterial: Bezug aus Kunstleder  (100% Polyester)\r\nmit Nietenbesatz\r\nMassivholzgestell\r\nsehr bequemer und stabiler Sitz', 0.00, 0.00, 0.00, 'Otto', 'S0D5N03YP2', 'Home', 99, '1', 'uploads9aff5908-39e4-520d-bbd3-41773b2b4416.jpg', 'online', 'normal', '2024-01-21 12:49:13', 0.00, 0.00),
(85, 'MKS MÖBEL Ecksofa GUSTAW U, Wohnzimmer - Wohnlandschaft, U-Form Couch mit Schlaffunktion', NULL, 'Bequem und praktisch. Das freistehende Ecksofa ist ein Möbelstück, für dessen Herstellung die hochwertigsten Materialien verwendet wurden.\r\nSolide. Das Sofa wird Ihnen jahrelang als Loungemöbel in Ihrem Wohnzimmer dienen! Der Rahmen ist aus hochwertigen, stabilen Holzplatten gefertigt, was den Komfort erhöht.\r\nLanglebig. Dank der Füllung behält das Ecksofa seine ursprüngliche Weichheit und sein Aussehen für eine lange Zeit.\r\nStilvoll. Unser Sofabett ist nicht nur ein praktisches und bequemes Freizeitmöbelstück. Dank einen modernen, eleganten Stils ist es auch eine echte Zierde in jedem Wohnzimmer!\r\nAbmessungen:\r\n\r\nBreite: 330 cm\r\nTiefe: 205 cm\r\nGesamthöhe: 88 cm\r\nSitzhöhe: 44 cm\r\nSchlaffläche: 125x250 cm\r\n\r\n\r\nTechnische Daten:\r\n\r\nFreistehendes Ecksofa – rückseitig mit Stoff gepolstert\r\nUniversell – die Seite der Ecksofa muss nicht angegeben werdenBettkasten aus Laminatplatte\r\nArt der verwendeten Feder: Wellfeder\r\nEcke mit zwei Behältern für Bettwäsche \r\n\r\nDas Sofa verformt sich auch nach Jahren nicht, da es mit gewellten Federn ausgestattet ist. Und Sie werden trotzdem maximalen Komfort spüren.\r\nDer mittelharte und verformungsbeständige T30-Schaumstoff sorgt dafür, dass Sie den Komfort des Ecksofas noch länger genießen können. Die losen Kissen, die mit einem Reißverschluss versehen sind. Dadurch können die Bezüge schnell abgenommen und gewaschen werden. Dies ist eine bequeme Lösung, die Sie leicht sauber halten können.\r\nGepolstert. Das bequeme Bettsofa ist mit hochwertigem Sofabezug gepolstert. Der Stoff fühlt sich sehr angenehm an, was den Komfort und die Bequemlichkeit bei der Benutzung erhöht. Es zeichnet sich durch seine Abriebfestigkeit aus, wodurch die Möbel leicht zu reinigen sind und ihre Farbe und Form länger behalten.', 0.00, 0.00, 0.00, 'Otto', 'S087P0GNGWWP2', 'Home', 99, '1', 'uploads/8124ccdd-86a6-469b-adf8-bc15554b8ca5.jpg', 'online', 'normal', '2024-01-21 12:50:45', 0.00, 0.00),
(86, 'MOEBLO Wohnlandschaft VITI, Couch für Wohnzimmer, Schlafsofa Sofagarnitur Sofa Eckcouch U-Form Wohnlandschaft, mit Schlaffunktion', NULL, 'Länge: 165 cm | Breite: 355 cm | Höhe: 80 cm | Sitztiefe: 60 cm | Sitzhöhe: 38 cm | Liegefläche: 300x129 cm\r\nFunktionales und bequemes Ecksofa mit Schlaffunktion. Sofa ist leicht in ein vollwertiges Bett verwandelbar.\r\nDas Ecksofa U-Form ist modern, designorientiert und zeitlos zugleich. Lieferung inkl. Kissen, Komplett bezogen - Möbelstück frei im Raum aufstellbar.\r\nDie kostenlose Lieferung, Aufstellung und Montage. Das Produkt wird in den Raum Ihrer Wahl geliefert.\r\nWohnlandschaft VITI\r\n\r\nDie U-förmige Ecksofa ist ein elegantes und praktisches Möbelstück, das sich ideal für Wohnzimmer eignet. Mit großzügigem Platzangebot bietet es gemütliche Sitzgelegenheiten für die ganze Familie oder Gäste. Die geschwungene Form schafft eine einladende Atmosphäre und ermöglicht vielseitige Sitzpositionen. Die hochwertige Verarbeitung und das moderne Design machen diese Sofa-Variante zu einem stilvollen Mittelpunkt in jedem Raum.\r\n\r\n\r\nMaße:\r\n\r\nBreite: 355 cm\r\nTiefe: 165 cm\r\nHöhe: 80 cm\r\nLiegefläche: 300x129 cm\r\nchat\r\nDetails:\r\n\r\n<\r\nKonstruktion aus Massivholz und Laminatplatte\r\nPolsterung: Hochwertiger Schaum\r\nPolster-Unterkonstruktion: Komfortable Wellenunterfederung\r\nWohnlandschaft mit Schlaffunktion\r\nEcksofa U-Form ist leicht in ein vollwertiges Bett verwandelbar.\r\nSofa in der EU hergestellt', 0.00, 0.00, 0.00, 'Otto', 'S0Z8Y0XEBMJP2', 'Home', 99, '1', 'uploads/0bd40f8a-b580-457d-8f39-6cd6bdccc935.jpg', 'online', 'normal', '2024-01-21 12:52:15', 0.00, 0.00),
(87, 'Jockenhöfer Gruppe Ecksofa Laredo, inklusive RGB-LED-Beleuchtung und Bluetooth-Soundsystem', NULL, 'Inklusive loser Rücken- und Zierkissen\r\nRecamiere links oder rechts montierbar\r\nFrei im Raum stellbar\r\nSoundsystem inklusive Bluetooth, USB-Ladefunktion, MP3-Player-Anschluss, AUX-IN-Anschluss\r\nBoxen je 2,5 Watt, Subwoofer 12 Watt\r\nKomfortabel und bequem: Das moderne Big-Sofa der Jockenhöfer Gruppe lädt zur erholsamen Freizeit ein. Die Sitzfläche bietet ausreichend Platz. Die Couch besitzt eine raffinierte technische Ausstattung, die den Feierabend zum Erlebnis werden lässt. Über das integrierte Soundsystem kann Musik vom Smartphone per Bluetooth übertragen werden. Die vorhandene USB-Ladestation sorgt dafür, dass der Akku voll bleibt und die Inhalte vom MP3-Player abgespielt werden können. Der ebenfalls vorhandene AUX-IN-Anschluss sorgt für ein tolles Multimediavergnügen. Die im Frontbereich der 3-Sitzer Couch eingearbeitete RGB-LED-Beleuchtung untermalt das musische Vergnügen optisch. Energieeffizienz: A (Skala A ++ bis E). Für das Wohlfühlerlebnis ist die Couch mit einer gemütlichen Polsterung ausgestattet. Lose Zierkissen sind für bequemes Sitzen und Ruhen vorhanden. Damit das Sitzmöbel zur Einrichtung passt, stehen mehrere Farbkombinationen zur Wahl. Die Rahmenkonstruktion ist aus Holzwerkstoff hergestellt, die Récamiere kann wahlweise rechts oder links angebaut werden. Diese Polsterecke der Jockenhöfer Gruppe bereichert mit ihren Extras die eigenen vier Wände und sorgt für entspannte Stunden in der Freizeit.', 0.00, 0.00, 0.00, 'Otto', '9296321422', 'Home', 99, '1', 'uploads/20a36876-1924-57bf-8fb0-91e3927a1839.jpg', 'online', 'normal', '2024-01-21 12:53:58', 0.00, 0.00),
(88, 'Home affaire Wohnlandschaft Win, wahlweise mit Bettfunktion und Bettkasten', NULL, 'Inklusive 9-teiliges Kissenset\r\nWahlweise mit Bettfunktion und Bettkasten\r\nRecamiere links oder rechts montierbar\r\nFrei im Raum stellbar\r\nMit PUR-Schaumstoff ausgestattetes Sofa\r\nDiese Wohnlandschaft »Win« von Home affaire ist mit PUR-Schaumstoff gepolstert, der für eine gute Sitzqualität und lange Lebensdauer steht. Wovon du auch profitierst, sind die passenden Zierkissen, die nicht nur schöne Deko-Element sind, sondern auch für noch mehr Komfort sorgen. Die Recamiere kann entweder auf der linken oder auf rechten Seite angebracht werden. Durch die FSC®-Zertifizierung wird gewährleistet, dass kein Raubbau an den Wäldern betrieben und die Artenvielfalt erhalten wird. Der strukturierte Bezug überzeugt durch seine pflegeleichte und hautsympathische Eigenschaft. Aus Liebe zum Detail wurde dieses Modell von Hand angefertigt.\r\n\r\nMit der Wohnlandschaft »Win« von Home affaire findet jeder einen kuscheligen Platz.', 0.00, 0.00, 0.00, 'Otto', '3242243919', 'Home', 99, '1', 'uploadsf1ec8176-328e-5a14-a920-cdd4a66f2385.jpg', 'online', 'normal', '2024-01-21 12:57:08', 0.00, 0.00),
(89, 'ths is a test title of a Product', 'MaPa', 'sich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartet\r\nsich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartetsich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartet\r\n\r\nsich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartet\r\n\r\nsich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartet\r\n\r\nsich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartet', 60.00, 100.00, 0.00, 'BigBuy', '111111111111', 'Home', 99, '1', 'uploads/product1 (3).png', 'online', 'normal', '2024-01-27 15:41:36', 0.00, 0.00),
(90, 'ths is a test title of a Product', 'MaPa', 'sich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartet\r\n\r\nsich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartet\r\n\r\nsich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartet\r\n\r\nsich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartet\r\n\r\n\r\nsich im Deutschen mit \"zufällig\" übersetzen. Bei der Verwendung im Internet wird damit allerdings eine Information oder Aussage bezeichnet, die unerwartet', 60.00, 100.00, 0.00, 'BigBuy', '111111111111', 'Home', 44, '1', 'uploads/images-removebg-preview.png', 'online', 'normal', '2024-01-27 15:43:15', 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

CREATE TABLE `products_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_images`
--

INSERT INTO `products_images` (`id`, `product_id`, `image_path`, `description`, `upload_date`) VALUES
(44, 50, 'uploads/9d68cbe7-0a07-4d81-8cbf-08f042534ac3.jpg', NULL, '2024-01-19 20:41:26'),
(45, 50, 'uploads/22c8ae06-b404-4e42-b977-eb8799748b2f.jpg', NULL, '2024-01-19 20:41:26'),
(46, 50, 'uploads/70a5c802-7b74-4eaa-8833-31e56ef1c17d.jpg', NULL, '2024-01-19 20:41:26'),
(47, 50, 'uploads/55170d08-fb52-436f-82dc-a6f11b6613fa.jpg', NULL, '2024-01-19 20:41:26'),
(48, 51, 'uploads/8600365700_186447_prod_006.avif', NULL, '2024-01-19 20:47:57'),
(49, 51, 'uploads/KIEBEL~1.JPG', NULL, '2024-01-19 20:47:57'),
(50, 52, 'uploads/ACER-P~1.JPG', NULL, '2024-01-19 20:55:16'),
(51, 53, 'uploads/kiebel-dragon-v-deluxe-4099836003190.jpg', NULL, '2024-01-19 20:59:10'),
(52, 53, 'uploads/KIEBEL~1.JPG', NULL, '2024-01-19 20:59:10'),
(53, 53, 'uploads/nbvfdsdtzdhjfgkhl.jpg', NULL, '2024-01-19 20:59:10'),
(54, 54, 'uploads/73c1fc51-61cc-5b91-9d85-920d1483ae34.jpg', NULL, '2024-01-19 21:14:45'),
(55, 54, 'uploads/2844c14e-ba67-56a2-a62c-2ab2df823e56.jpg', NULL, '2024-01-19 21:14:45'),
(56, 54, 'uploads/014492d9-92e6-5f3b-8d31-9ccd121295c4.jpg', NULL, '2024-01-19 21:14:45'),
(57, 54, 'uploads/48768895-fd7c-51f6-b4c7-fff7d7deb16d.jpg', NULL, '2024-01-19 21:14:45'),
(58, 54, 'uploads/b1e4b75d-5bc4-5455-87e2-9a9930dad3c8.jpg', NULL, '2024-01-19 21:14:45'),
(59, 55, 'uploads/acer-nitro-50-n50-640-gaming-pc-intel-core-i5-12400f-geforce-gtx-1660-super-16-gb-ram-1024-gb-ssd-luftkuehlung.jpg', NULL, '2024-01-19 21:17:52'),
(60, 55, 'uploads/nitroooooooo.jpg', NULL, '2024-01-19 21:17:52'),
(61, 56, 'uploads/MSI-MA~1.JPG', NULL, '2024-01-19 21:26:02'),
(62, 56, 'uploads/WKSMSI5735838C__2.jpg', NULL, '2024-01-19 21:26:02'),
(63, 57, 'uploads/8600365700_186784_prod_003.avif', NULL, '2024-01-19 21:30:30'),
(64, 57, 'uploads/b9f6817386a58667804a46740b8c4919.jpg', NULL, '2024-01-19 21:30:30'),
(65, 57, 'uploads/KIEBEL~2.JPG', NULL, '2024-01-19 21:30:30'),
(66, 57, 'uploads/KIEBEL~1.JPG', NULL, '2024-01-19 21:30:30'),
(67, 58, 'uploads/698ACD~1.JPG', NULL, '2024-01-19 21:46:38'),
(68, 58, 'uploads/12492C~1.JPG', NULL, '2024-01-19 21:46:39'),
(69, 58, 'uploads/CC95A2~1.JPG', NULL, '2024-01-19 21:46:39'),
(70, 59, 'uploads/57eead75-794e-489c-9492-3e8a8d6b59cf.jpg', NULL, '2024-01-19 21:54:18'),
(71, 59, 'uploads/73f4fff2-9d39-4cc9-9833-40bd02323947.jpg', NULL, '2024-01-19 21:54:18'),
(72, 59, 'uploads/097eab80-efda-4e4b-a3c9-b6bbce915a5d.jpg', NULL, '2024-01-19 21:54:18'),
(73, 60, 'uploads/4D5CDF~1.JPG', NULL, '2024-01-20 21:00:54'),
(74, 60, 'uploads/9D09FD~1.JPG', NULL, '2024-01-20 21:00:54'),
(75, 60, 'uploads/607ED8~1.JPG', NULL, '2024-01-20 21:00:54'),
(76, 60, 'uploads/F39077~1.JPG', NULL, '2024-01-20 21:00:54'),
(77, 62, 'uploads/37a6a4da-ed67-57da-a83e-e8a22a3091fa.jpg', NULL, '2024-01-21 10:09:25'),
(78, 62, 'uploads/03611aef-8170-54fe-8d0a-2be73b739e86.jpg', NULL, '2024-01-21 10:09:25'),
(79, 62, 'uploads/6817b994-fe0d-5d72-bf1b-483b44106ab8.jpg', NULL, '2024-01-21 10:09:25'),
(80, 62, 'uploads/e4fbcec0-5fe2-5f78-857a-bf6559445f9a.jpg', NULL, '2024-01-21 10:09:25'),
(81, 63, 'uploads/731290f6-9d0a-4184-8438-84d526633b82.jpg', NULL, '2024-01-21 10:12:50'),
(82, 63, 'uploads/a2ccfea7-73c9-4339-87a7-86c256f1ab28.jpg', NULL, '2024-01-21 10:12:51'),
(83, 63, 'uploads/f33f131f-bdb8-4c81-9b1f-1e5c7becdc9b.jpg', NULL, '2024-01-21 10:12:51'),
(84, 65, 'uploads/85c98b24-1fc5-427a-89c0-35742b083731.jpg', NULL, '2024-01-21 10:20:17'),
(85, 65, 'uploads/2796b093-21a8-4169-accb-bf23ed0616e3.jpg', NULL, '2024-01-21 10:20:17'),
(86, 65, 'uploads/63610dd3-0d30-484d-bd2b-558f61d19fc3.jpg', NULL, '2024-01-21 10:20:17'),
(87, 65, 'uploads/fbf121d3-3bae-4c3b-a437-13b5db0cdb2f.jpg', NULL, '2024-01-21 10:20:17'),
(88, 66, 'uploads/71215bf1-7308-4b23-9a3f-ce011a5cc80d.jpg', NULL, '2024-01-21 10:36:07'),
(89, 66, 'uploads/164941f5-11ca-4416-9cf2-a1c662442418.jpg', NULL, '2024-01-21 10:36:07'),
(90, 66, 'uploads/eb52aaaa-d096-455f-a37f-64153a55daf7.jpg', NULL, '2024-01-21 10:36:07'),
(91, 67, 'uploads/2127976f-cba3-4207-a656-e7052d1fb061.avif', NULL, '2024-01-21 10:37:55'),
(92, 67, 'uploads/b0efd82b-7026-406b-b812-e7b44aea1328.jpg', NULL, '2024-01-21 10:37:55'),
(93, 67, 'uploads/db94650c-8515-48bc-b1de-714a5ff826af.jpg', NULL, '2024-01-21 10:37:55'),
(94, 68, 'uploads/8bc1d270-5e4c-5249-84a6-793b435e46ed.jpg', NULL, '2024-01-21 10:39:45'),
(95, 68, 'uploads/17dc1d82-dbdc-55e3-9238-6805c0243283.jpg', NULL, '2024-01-21 10:39:45'),
(96, 68, 'uploads/b4b1475b-8660-587a-88f8-fd9dee77b476.jpg', NULL, '2024-01-21 10:39:45'),
(97, 68, 'uploads/c5f5d991-b113-5e2b-8dc7-55a109d2488c.jpg', NULL, '2024-01-21 10:39:45'),
(98, 69, 'uploads/57eecda1-ba89-5f25-903c-e22b7877e4e4.jpg', NULL, '2024-01-21 10:41:14'),
(99, 69, 'uploads/a3aae4cc-2424-521c-ab87-f0a9198ee873.jpg', NULL, '2024-01-21 10:41:14'),
(100, 69, 'uploads/f8006c9c-b6de-5917-abad-2417fa4d9303.jpg', NULL, '2024-01-21 10:41:14'),
(101, 70, 'uploads/5f930bc0-0ed8-59b7-b3f6-611e6030ea00.jpg', NULL, '2024-01-21 10:44:22'),
(102, 70, 'uploads/6e9aa262-e115-5d03-97c7-8e406de398f8.jpg', NULL, '2024-01-21 10:44:22'),
(103, 70, 'uploads/1112f7ef-b6f2-5631-80f8-94c58b797465.jpg', NULL, '2024-01-21 10:44:22'),
(104, 70, 'uploads/a6c24b7e-aa17-5793-aa5f-c8d97e176ecd.jpg', NULL, '2024-01-21 10:44:22'),
(105, 70, 'uploads/c30eb92b-d214-5bc7-a4bd-667da98ad9b3.jpg', NULL, '2024-01-21 10:44:22'),
(106, 70, 'uploads/ca9e09af-4506-5f42-8460-a7974dd250aa.jpg', NULL, '2024-01-21 10:44:22'),
(107, 70, 'uploads/f9359c2d-70f4-55a5-9ab7-d9d0e8891fde.avif', NULL, '2024-01-21 10:44:22'),
(108, 71, 'uploads/05423576-46d7-54ea-ac92-9be39046354c.jpg', NULL, '2024-01-21 10:45:28'),
(109, 71, 'uploads/a63e8561-4a23-564a-89e0-db304cf2df6b.jpg', NULL, '2024-01-21 10:45:28'),
(110, 71, 'uploads/cbe02e6a-5b6f-571a-b77d-73ff1e306cc5.jpg', NULL, '2024-01-21 10:45:28'),
(111, 72, 'uploads/4e641875-d01a-561a-abc6-3515dacf2449.jpg', NULL, '2024-01-21 10:47:11'),
(112, 72, 'uploads/40a48f24-7fdd-507d-9eaa-d1ee9c74d1b8.jpg', NULL, '2024-01-21 10:47:11'),
(113, 72, 'uploads/932abcbf-58b1-5d52-97a0-d2594baede89.jpg', NULL, '2024-01-21 10:47:11'),
(114, 72, 'uploads/cffc6b8e-7cd8-53bb-9f2a-a1a0dc67ea24.jpg', NULL, '2024-01-21 10:47:11'),
(115, 72, 'uploads/d7fd6bad-f910-56c3-9d97-72bdf89a7abf.jpg', NULL, '2024-01-21 10:47:11'),
(116, 72, 'uploads/dcd7c011-253f-5bee-b32e-66327b6a9258.jpg', NULL, '2024-01-21 10:47:11'),
(117, 73, 'uploads/194d171a-c912-468d-823f-cac529bbd8f7.jpg', NULL, '2024-01-21 10:50:02'),
(118, 73, 'uploads/7903e503-9d3b-4540-94dc-b38ca7730c9c.jpg', NULL, '2024-01-21 10:50:02'),
(119, 73, 'uploads/e1b4ef7e-c56a-491e-8a2c-7f1fed6c9271.jpg', NULL, '2024-01-21 10:50:02'),
(120, 74, 'uploads/9e7ae8b4-06da-547a-8c68-59b34771c16e.jpg', NULL, '2024-01-21 10:53:00'),
(121, 74, 'uploads/65e27b50-9afe-5c2e-a0f4-fd718e7afe4d.jpg', NULL, '2024-01-21 10:53:00'),
(122, 74, 'uploads/c0335861-5fa6-5fbf-aed3-e9c6e427ad35.jpg', NULL, '2024-01-21 10:53:00'),
(123, 74, 'uploads/cab6efd3-acc7-5d35-b743-6c1dd50eb52b.jpg', NULL, '2024-01-21 10:53:00'),
(124, 74, 'uploads/d6076106-e942-595f-b252-f3787551f3e9.jpg', NULL, '2024-01-21 10:53:00'),
(125, 75, 'uploads/7b101cec-cb06-5124-8ce2-8f4d4fa88a57.jpg', NULL, '2024-01-21 10:55:27'),
(126, 75, 'uploads/786a0dae-2846-52ce-8982-6402ddb4a819.jpg', NULL, '2024-01-21 10:55:27'),
(127, 75, 'uploads/87702cd5-f97e-58c6-aacf-452d76fb5f3e.jpg', NULL, '2024-01-21 10:55:27'),
(128, 75, 'uploads/bf11ab9f-6017-5aa6-8f37-b0583f507d4f.jpg', NULL, '2024-01-21 10:55:27'),
(129, 75, 'uploads/fe8d4eac-5f23-55d1-b270-45ed2f443fd0.jpg', NULL, '2024-01-21 10:55:27'),
(130, 76, 'uploads/23e08d8f-95c5-52ba-bb60-13df27535c0c.jpg', NULL, '2024-01-21 10:57:02'),
(131, 76, 'uploads/58867c1c-926b-59ae-bdc1-02efe47ed2d4.jpg', NULL, '2024-01-21 10:57:02'),
(132, 76, 'uploads/adbff696-a625-515c-9516-b1f8f1763e5a.jpg', NULL, '2024-01-21 10:57:02'),
(133, 76, 'uploads/cbf2e15e-fe62-5386-8e69-6a2ecadc63c1.jpg', NULL, '2024-01-21 10:57:02'),
(134, 76, 'uploads/f6e620c0-ab3b-5b8f-9d3d-da2728e9f5ef.jpg', NULL, '2024-01-21 10:57:02'),
(135, 76, 'uploads/f08ac264-5dfe-5314-9778-c7e2fa1ee595.jpg', NULL, '2024-01-21 10:57:02'),
(136, 77, 'uploads/af190095-3acc-4a63-b9b4-516c06bc6a6c.jpg', NULL, '2024-01-21 10:59:10'),
(137, 77, 'uploads/c7beaecb-d71b-40c0-bb24-d4545d754577.jpg', NULL, '2024-01-21 10:59:10'),
(138, 78, 'uploads/3462a674-85f2-5300-9922-38222d1f3e17.jpg', NULL, '2024-01-21 11:01:45'),
(139, 78, 'uploads/4584e223-8f3d-5f07-a6b3-dd940d07fbac.jpg', NULL, '2024-01-21 11:01:45'),
(140, 78, 'uploads/2600412b-5bad-59bc-b3a1-639fdb43b264.jpg', NULL, '2024-01-21 11:01:45'),
(141, 78, 'uploads/b4928ea4-b916-5289-a13f-51198dda5767.jpg', NULL, '2024-01-21 11:01:45'),
(142, 78, 'uploads/e68ebb36-397b-59c9-90f3-3354e2269f13.jpg', NULL, '2024-01-21 11:01:45'),
(143, 79, 'uploads/3ec5ab1b-0413-5dc3-bfae-9f9a51a089d5.jpg', NULL, '2024-01-21 11:04:41'),
(144, 79, 'uploads/4ba97d4a-31a8-5b19-a77f-3417eebb6f45.jpg', NULL, '2024-01-21 11:04:41'),
(145, 79, 'uploads/8bc04ad9-e58b-5b3f-94ef-1b0b56391f5b.jpg', NULL, '2024-01-21 11:04:41'),
(146, 79, 'uploads/37eb4d51-542c-504d-a488-10672f04a128.jpg', NULL, '2024-01-21 11:04:41'),
(147, 79, 'uploads/cc5a936f-391e-5d11-a354-151a3956c775.jpg', NULL, '2024-01-21 11:04:41'),
(148, 79, 'uploads/fb3c35cf-7844-5567-a0cc-a54acaf1d0bf.jpg', NULL, '2024-01-21 11:04:41'),
(149, 80, 'uploads/1a09410a-6a4a-501a-ab8c-4322055dc8e8.jpg', NULL, '2024-01-21 11:08:33'),
(150, 80, 'uploads/21bef1df-3514-5af4-a88a-2c768b548b5d.jpg', NULL, '2024-01-21 11:08:33'),
(151, 80, 'uploads/66d1c6c6-b0cd-5112-b150-43c73d41a072.jpg', NULL, '2024-01-21 11:08:33'),
(152, 80, 'uploads/bd002569-9492-5f65-bc8e-697ae05d49f8.jpg', NULL, '2024-01-21 11:08:33'),
(153, 80, 'uploads/f421f05e-d198-57da-930e-f16e258a7859.jpg', NULL, '2024-01-21 11:08:33'),
(154, 81, 'uploads/67f81a83-7e0b-4579-aa9d-cad8019a7002.jpg', NULL, '2024-01-21 12:04:04'),
(155, 81, 'uploads/37875ddb-d32f-4a30-b4af-3cbffd936a78.jpg', NULL, '2024-01-21 12:04:04'),
(156, 81, 'uploads/f45a33da-cb7b-42e0-83bf-752972fc5ede.jpg', NULL, '2024-01-21 12:04:04'),
(157, 82, 'uploads/93c568bd-2c6e-5e1f-b8a1-e99689215278.jpg', NULL, '2024-01-21 12:44:58'),
(158, 82, 'uploads/5138ec34-33b4-5dcb-a106-ab3b275d2ee5.jpg', NULL, '2024-01-21 12:44:58'),
(159, 82, 'uploads/032511b0-5d48-502a-8ec8-b1e82165becb.jpg', NULL, '2024-01-21 12:44:58'),
(160, 82, 'uploads/d5c08e96-e258-587f-9c7c-c9644e6caa90.jpg', NULL, '2024-01-21 12:44:58'),
(161, 83, 'uploads/75aa61c5-5111-5491-a0eb-e9619ad0b340.jpg', NULL, '2024-01-21 12:46:28'),
(162, 83, 'uploads/652deb0c-e2cd-57b4-bd79-cdf900a51c42.jpg', NULL, '2024-01-21 12:46:28'),
(163, 83, 'uploads/891cacc8-abdd-568f-97ee-e0d6df08603c.jpg', NULL, '2024-01-21 12:46:28'),
(164, 83, 'uploads/aae5c89e-af8d-54e2-b952-78ecf07cc356.jpg', NULL, '2024-01-21 12:46:28'),
(165, 84, 'uploads/9aff5908-39e4-520d-bbd3-41773b2b4416.jpg', NULL, '2024-01-21 12:49:13'),
(166, 84, 'uploads/03817fae-8794-5306-863b-7754b2d9e459.jpg', NULL, '2024-01-21 12:49:13'),
(167, 84, 'uploads/87854c0d-0e5f-5158-b014-a82ef19cdbec.jpg', NULL, '2024-01-21 12:49:13'),
(168, 84, 'uploads/cad07248-769d-5ad0-b75e-903519264154.jpg', NULL, '2024-01-21 12:49:13'),
(169, 85, 'uploads/ac2e4d64-f08a-41d3-91ab-e4bf5cc4b076.jpg', NULL, '2024-01-21 12:50:45'),
(170, 85, 'uploads/c30d2300-6941-4a14-afdb-d460bfc1a741.jpg', NULL, '2024-01-21 12:50:45'),
(171, 85, 'uploads/d12a6932-d2e0-4c15-9c7c-11774d32843c.jpg', NULL, '2024-01-21 12:50:45'),
(172, 85, 'uploads/e9cb1ba4-3209-489f-bbef-e525f6ebd7db.avif', NULL, '2024-01-21 12:50:45'),
(173, 85, 'uploads/eee073a8-3641-40db-b02d-f57c17670393.jpg', NULL, '2024-01-21 12:50:45'),
(174, 86, 'uploads/27fca2d6-22ef-4012-90fb-408dc16855dc.jpg', NULL, '2024-01-21 12:52:15'),
(175, 86, 'uploads/051973d1-1f8c-481b-9b61-a541fcb5eb6d.jpg', NULL, '2024-01-21 12:52:15'),
(176, 86, 'uploads/ad1d0dc7-4298-4d26-a320-c34e7b3fe0e1.jpg', NULL, '2024-01-21 12:52:15'),
(177, 87, 'uploads/83d80e2b-5974-507b-a001-8503c9ccb23c.jpg', NULL, '2024-01-21 12:53:58'),
(178, 87, 'uploads/ab3d9dd0-4166-5d4b-9107-c1db8ffd0c9a.jpg', NULL, '2024-01-21 12:53:58'),
(179, 87, 'uploads/b0cd734a-f154-540f-a6d9-2682638ab583.jpg', NULL, '2024-01-21 12:53:58'),
(180, 87, 'uploads/bda2183b-7ad6-5515-bf1c-b122834eecde.jpg', NULL, '2024-01-21 12:53:58'),
(181, 87, 'uploads/c5088201-96b0-57f8-88bd-49d1f27aa183.jpg', NULL, '2024-01-21 12:53:58'),
(182, 87, 'uploads/f9401d14-71af-5ddd-9585-e672b807a085.jpg', NULL, '2024-01-21 12:53:58'),
(183, 88, 'uploads/5bd7b8f1-5ea9-50d3-86f6-e3ea43e45bfc.jpg', NULL, '2024-01-21 12:57:08'),
(184, 88, 'uploads/3650cd88-9e2c-5a35-aa60-2efda7818e97.jpg', NULL, '2024-01-21 12:57:08'),
(185, 88, 'uploads/69344d17-7dec-5c5e-9a08-b6407a3c3a72.jpg', NULL, '2024-01-21 12:57:08'),
(186, 88, 'uploads/f1ec8176-328e-5a14-a920-cdd4a66f2385.jpg', NULL, '2024-01-21 12:57:08'),
(187, 89, 'uploads/product1 (4).png', NULL, '2024-01-27 15:41:36'),
(188, 89, 'uploads/product1 (5).png', NULL, '2024-01-27 15:41:36'),
(189, 89, 'uploads/product1 (6).png', NULL, '2024-01-27 15:41:36'),
(190, 90, 'uploads/ferrari-scuderia-r-300-over-ear-headphones-white_l-removebg-preview.png', NULL, '2024-01-27 15:43:15'),
(191, 90, 'uploads/s-l300-removebg-preview.png', NULL, '2024-01-27 15:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `shop_cart`
--

CREATE TABLE `shop_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `first_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop_cart`
--

INSERT INTO `shop_cart` (`id`, `user_id`, `product_id`, `product_name`, `price`, `first_picture`) VALUES
(4, 10, NULL, NULL, NULL, NULL),
(5, 11, NULL, NULL, NULL, NULL),
(6, 12, NULL, NULL, NULL, NULL),
(7, 13, NULL, NULL, NULL, NULL),
(8, 14, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_details`
--

CREATE TABLE `users_details` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_details`
--

INSERT INTO `users_details` (`user_id`, `first_name`, `last_name`, `email`, `password`, `is_admin`, `remember_token`) VALUES
(10, 'Goto', 'mdar', 'younesvlogs2@gmail.com', '$2y$10$GUZ0Aspa7zWUYJkzwMu6y.OBzknpUYWD6nkG.XunFJsA7cOt4JNl.', 1, '8a967871663d3f305d3c36366073951004f16982d65662edd38c4f4ccfbb1238'),
(11, 'Goto', '######', 'younesvlogs150@gmail.com', '$2y$10$PqsGUJO6gI0s0EJWpELZUOTsHctZhMSUv/OmD9..AOwp.hvsYcuoe', 0, NULL),
(12, 'SAd', 'wqsad', 'younesvlogs2000@gmail.com', '$2y$10$qFCc2Pqw4QVPOh4jX8fIXuLqk8zzAS/Sosf1HbIUM.tgO0SRpeI6q', 0, NULL),
(13, '######', '######', 'younesvlogs3072004@gmail.com', '$2y$10$gC09laqFY5jr0XPvWIkIoujuRzXaOJQvfOA0K.rpK09Ddp6.N8fC6', 0, NULL),
(14, 'arsh ', 'shirzad', 'arashshir37@gmail.com', '$2y$10$TGO70NNSw0U46eEVUYgcUuV6owbDtmKVy/pzsJQWh5MPf2ORadnP2', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `session_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`session_id`, `user_id`, `last_activity`) VALUES
('65bbec079b51c', 10, 1706814471),
('65bcf84a74482', 10, 1706883146);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`, `product_name`) VALUES
(3, 10, ''),
(4, 11, ''),
(5, 12, ''),
(6, 13, ''),
(7, 14, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lieferanten`
--
ALTER TABLE `lieferanten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indexes for table `products_details`
--
ALTER TABLE `products_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `shop_cart`
--
ALTER TABLE `shop_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users_details`
--
ALTER TABLE `users_details`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `fk_wishlist_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `lieferanten`
--
ALTER TABLE `lieferanten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_details`
--
ALTER TABLE `products_details`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `shop_cart`
--
ALTER TABLE `shop_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users_details`
--
ALTER TABLE `users_details`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users_details` (`user_id`);

--
-- Constraints for table `products_images`
--
ALTER TABLE `products_images`
  ADD CONSTRAINT `products_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products_details` (`product_id`);

--
-- Constraints for table `shop_cart`
--
ALTER TABLE `shop_cart`
  ADD CONSTRAINT `shop_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_details` (`user_id`);

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_details` (`user_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `users_details` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
