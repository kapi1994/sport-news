-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2021 at 02:37 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `naziv_kategorije` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `datum_kreiranja` timestamp NOT NULL DEFAULT current_timestamp(),
  `datum_azuriranja` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `naziv_kategorije`, `status`, `datum_kreiranja`, `datum_azuriranja`) VALUES
(1, 'Fudbal', 1, '2021-05-06 12:01:50', NULL),
(2, 'Kosarka', 1, '2021-05-06 12:02:04', NULL),
(3, 'Tenis', 1, '2021-05-06 12:02:11', NULL),
(4, 'Esport', 1, '2021-05-06 12:02:28', NULL),
(5, 'Automoto', 1, '2021-05-06 12:02:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tekst_komentara` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datum_kreiranja` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `tekst_komentara`, `datum_kreiranja`, `parent_id`) VALUES
(1, 2, 2, 'Real je igrao lose', '2021-05-06 13:29:32', NULL),
(2, 2, 2, 'Real je igrao lose', '2021-05-06 13:29:58', NULL),
(3, 1, 2, 'Klop je sjajan trener', '2021-05-06 13:57:33', NULL),
(4, 2, 2, 'Ja tako mislim', '2021-05-06 14:18:37', NULL),
(5, 2, 2, 'Ja tako mislim', '2021-05-06 14:19:01', NULL),
(6, 1, 2, 'Ima i boljih', '2021-05-06 14:24:38', 3);

-- --------------------------------------------------------

--
-- Table structure for table `headings`
--

CREATE TABLE `headings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `naziv_rubrike` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `datum_kreiranja` timestamp NOT NULL DEFAULT current_timestamp(),
  `datum_azuriranje` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `headings`
--

INSERT INTO `headings` (`id`, `naziv_rubrike`, `status`, `category_id`, `datum_kreiranja`, `datum_azuriranje`) VALUES
(1, 'Premier League', 1, 1, '2021-05-06 12:03:18', NULL),
(2, 'Primera', 1, 1, '2021-05-06 12:03:23', NULL),
(3, 'Bundnesliga', 1, 1, '2021-05-06 12:03:48', NULL),
(4, 'Champions League', 1, 1, '2021-05-06 12:04:03', NULL),
(5, 'Europa League', 1, 1, '2021-05-06 12:04:28', NULL),
(6, 'Euroleague', 1, 2, '2021-05-06 12:04:46', NULL),
(7, 'Aba', 1, 1, '2021-05-06 12:06:25', NULL),
(8, 'Nba', 1, 2, '2021-05-06 12:06:43', NULL),
(9, 'Atp Tour', 1, 3, '2021-05-06 12:08:46', NULL),
(10, 'Wta', 1, 3, '2021-05-06 12:08:53', '2021-05-06 12:10:30'),
(11, 'Formula 1', 1, 5, '2021-05-06 12:12:08', NULL),
(12, 'Moto GP', 1, 5, '2021-05-06 12:12:27', NULL),
(13, 'Dota', 1, 4, '2021-05-06 12:12:36', NULL),
(14, 'Lol', 1, 4, '2021-05-06 12:12:45', NULL),
(15, 'Cs Go', 1, 4, '2021-05-06 12:18:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `heading_tag`
--

CREATE TABLE `heading_tag` (
  `heading_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `heading_tag`
--

INSERT INTO `heading_tag` (`heading_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 13),
(1, 15),
(1, 22),
(2, 4),
(2, 5),
(2, 16),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 15),
(4, 20),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(5, 17),
(6, 30),
(6, 31),
(7, 21),
(7, 22),
(7, 23),
(7, 24),
(7, 25),
(7, 26),
(8, 9),
(8, 10),
(8, 18),
(8, 19),
(8, 27),
(8, 28),
(8, 29),
(8, 32),
(8, 33),
(9, 6),
(9, 7),
(12, 11),
(12, 12),
(14, 8);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `putanja_slike` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `putanja_slike`, `alt`) VALUES
(1, '6093e7c7a54a6_1620305863.jpg', 'Menadžer: Nije bilo pregovora o Klopovom odlasku'),
(2, '6093e9ad74c1e_1620306349.jpg', 'Mijatović: Zidan je sve pogrešno uradio'),
(3, '609407d3b2f27_1620314067.jpg', 'Zahuktao se: Rafa lako do četvrtfinala Madrida'),
(4, '6094085ed454a_1620314206.jpg', 'Laki luzer izbacio Krajinovića na startu Madrida'),
(5, '60940a4bc0a7b_1620314699.jpg', 'Karmine Corp doneo Francuskoj treću EU Masters titulu'),
(6, '60940ae233673_1620314850.jpg', 'Nezaustavljivi Jokić 24 za četvrtinu, Bogdan raspucan'),
(7, '60940b3bcda70_1620314939.jpg', 'Leteći Somborac: Zakucavao sam kao tigar!'),
(8, '60940c72b1620_1620315250.jpg', 'Markes posle testa u Heresu: Telo nije izdržalo'),
(9, '60940d01cc585_1620315393.jpg', 'Jokanović za SK: Čelsi dokazao da je bolji tim od Reala'),
(10, '60946968b4f02_1620339048.jpg', 'Bez engleskog finala: Junajted na Viljareal za trofej u LE!'),
(11, '60946a0ebf22a_1620339214.jpg', 'Arteta razočaran: Zaslužili smo finale'),
(12, '60946b3abbca2_1620339514.jpg', 'ŽESTOG SUKOB: Okršaj nekadašnjeg asa ABA lige i pomoćnog trenera Indijane'),
(13, '60946bb114bff_1620339633.jpg', 'Dva engleska velikana u borbi za titulu prvaka starog kontinenta!'),
(14, '60946e4b3b5c3_1620340299.jpg', 'Ronaldov dres na licitaciji na Limundu'),
(15, '60946f1020721_1620340496.jpg', '\"UŠATI\" SE VRAĆA U KOLEVKU FUDBALA'),
(16, '60946fc48b608_1620340676.jpg', 'RADONJIĆ PRED BORBU U LAKTAŠIMA: Sitnice će odlučiti pobednika'),
(17, '6094706abdf15_1620340842.jpg', 'MILOJEVIĆ PRED MORNAR: Odbrana vodi u finale, oni su sjajan tim'),
(18, '6094710179eaf_1620340993.jpg', 'JOKIĆ POVREĐEN! Denver bez najboljeg igrača u narednom periodu'),
(19, '609471863eda3_1620341126.jpg', 'Dončić i Hardavej srušili Majami, Adetokumbo bolji od Bruklinovog Drim tim'),
(20, '609471e01d4b7_1620341216.jpg', 'DONČIĆ RAZBIO SELTIKSE Vučević najbolji u porazu Čikaga'),
(21, '6094727b30bea_1620341371.jpg', 'Laso: Nisam srećan, ali sam ponosan na ekipu'),
(22, '6094735e2053c_1620341598.jpg', 'BOGDAN TROJKAMA UGASIO SUNCE'),
(23, '609474e9da756_1620341993.jpg', 'Garin izbacio Medvedeva');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_05_03_105228_create_categories_table', 1),
(2, '2021_05_03_145405_create_headings_table', 1),
(3, '2021_05_03_213728_create_tags_table', 1),
(4, '2021_05_03_224942_heading_tag', 1),
(5, '2021_05_03_234923_create_roles_table', 1),
(6, '2021_05_03_234955_create_users_table', 1),
(7, '2021_05_04_002230_create_images_table', 1),
(8, '2021_05_04_002250_create_posts_table', 1),
(9, '2021_05_04_002645_post_tag', 1),
(10, '2021_05_05_025303_role_user', 1),
(11, '2021_05_06_095152_create_requests_table', 1),
(12, '2021_05_06_133644_create_comments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `naziv_posta` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opis_posta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `heading_id` bigint(20) UNSIGNED NOT NULL,
  `image_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `datum_kreiranja` timestamp NOT NULL DEFAULT current_timestamp(),
  `datum_azuriranja` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `naziv_posta`, `opis_posta`, `status`, `category_id`, `heading_id`, `image_id`, `user_id`, `datum_kreiranja`, `datum_azuriranja`) VALUES
(1, 'Menadžer: Nije bilo pregovora o Klopovom odlasku', 'Mark Kosicke, agent Liverpulovog menadžera Jirgena Klopa, nema dilemu da li će nemački trener ostati na Enfildu.\r\n\r\nCrveni su prošle sezone prvi put u istoriji osvojili Premijer ligu, a ove su, pored rane eliminacije u Ligi šampiona, daleko od plasmana u elitno klupsko takmičenje Evrope.\r\n„Da li će Jirgen da nastavi posao u Liverpulu? Apsolutno. Nije bilo pregovora o njegovom odlasku,” istakao je Kosicke za Skaj Sport Nemačka.\r\n\r\nNa pitanje da li u Klopovom ugovoru postoji obeštećenje koje drugi klub mora da plati ako želi da ga angažuje, agent nije odgovorio.\r\n\r\nKlop je u Liverpulu od 2015. godine i sa engleskom ekipom osvojio je Premijer ligu, Ligu šampiona, Superkup Evrope i klupsko prvenstvo sveta.\r\n\r\nTim sa Enfilda trenutno je sedmi u prvenstvu sa 54 boda, a 8. maja u 35. kolu sastaje se sa Sautemptonom.', 1, 1, 1, 1, 2, '2021-05-06 12:57:43', NULL),
(2, 'Mijatović: Zidan je sve pogrešno uradio', 'Nekadašnji fudbaler i sportski direktor madridskog Reala Predrag Mijatović smatra da je Zinedin Zidan krivac za eliminaciju Kraljevskog kluba u polufinalu Lige šampiona.\r\n\r\nČelsi je u revanšu na Stamford Bridžu do nogu potukao Madriđane (2:0) i ukupnim rezultatom 3:1 obezbedio borbu za trofej i duel sa Mančester Sitijem 29. maja u Istanbulu.\r\n„Čelsi je bio superioran u svakom pogledu. Intenzitet, ritam, stvaranje šansi… Volimo Zidana, mnogo toga je uradio, ali u revanšu u Londonu je sve pogrešno učinio,“ rekao je Mijatović za beIN Sport i nastavio:\r\n\r\n„Ovo će naneti veliku štetu Zidanu. Tako je bilo i prošle godine, ali je osvajanje prvenstva Španije pokrilo neke stvari. Videli ste da Realovi igrači nisu hteli da promene sliku na terenu. Vinisijus je igrao na poziciji koja mu ne odgovara. Real praktično nije napravio ništa. Videćemo šta će biti u prvenstvu. Imam osećaj da Real nudi malo toga da pomislite da će sezona završiti dobro.“', 1, 1, 4, 2, 2, '2021-05-06 13:05:49', NULL),
(3, 'Zahuktao se: Rafa lako do četvrtfinala Madrida', 'Španski teniser Rafael Nadal plasirao se u četvrtfinale Mastersa u Madridu pošto je rezultatom 2:0 bio bolji od Australijanca Alekseja Popirina. Protivnik u borbi za polufinale za igrača sa Majorke biće bolji iz duela koji igraju Danijel Evans i Aleksandar Zverev.\r\n\r\nPo setovima bilo je 6:3, 6:3 za drugog igrača sveta posle 80 minuta tenisa.\r\n\r\nNadal je silno krenuo, napravio je dva brejka u drugom i trećem gemu u kojem je servirao Popirin, a potom je ispustio jedan gem na svoj servis. Ipak, pri rezultatu 5:3 sledi novi brejk koji pravi Španac i on koristi prvu-set loptu za vođstvo.\r\n\r\nU drugom setu Nadalu je bio dovoljan samo brejk u drugom gemu, a potom je lako sačuvao prednost do kraja meča.\r\n\r\nBio je ovo sedmi uzastopni trijumf za Nadala, koji je prethodno slavio i u Barseloni i u drugom kolu protiv Pabla Alkarasa. Na taj način osvajač 13 titula na Rolan Garosu diže formu pred drugi Gren slem turnir u sezoni.\r\n\r\nTurnir u Madridu igra se od 2002. godine, a aktuelni šampion je Novak Đoković, koji je slavio 2019. godine savladavši Stefanosa Cicipasa. Ovaj turnir koji se igra na šljaci nije održan 2020. godine zbog pandemije koronavirusa.\r\n\r\nĐoković u Madridu ove godine neće braniti trofej.', 1, 3, 9, 3, 3, '2021-05-06 15:14:27', NULL),
(4, 'Laki luzer izbacio Krajinovića na startu Madrida', 'Srpski teniser Filip Krajinović poražen je na startu mastersa u Madridu, pošto je bolji od njega bio Japanac Nišioka u dva seta 6:2, 6:4.\r\n\r\nPrvobitno je Krajinović trebalo da igra protiv Kamerona Norija, ali je Britanac odustao. Umesto njega je uleteo Nišioka kao laki luzer i u potpunosti iskoristio šansu.\r\n\r\nPobedio je 24 mesta bolje plasiranog Krajinovića za svega 79 minuta, a 36. reketu sveta nije dopustio nijedan brejk i samo jednu brejk loptu i to u završnici drugog seta. Sa druge strane iskoristio je tri od sedam brejk lopti.\r\n\r\nU narednom kolu Nišioka će igrati protiv boljeg iz duela Ože-Alijasim – Kasper Rud.', 1, 3, 9, 4, 3, '2021-05-06 15:16:46', NULL),
(5, 'Karmine Corp doneo Francuskoj treću EU Masters titulu', 'Glavni favorit 2021 prolećnog EU Mastersa Karmine Corp je uspeo da dođe do titule u svojoj debitantskoj sezoni u takmičenju savladavši šampiona Engleske BT Excel 3-1 u velikom finalu.\r\n\r\nOd kako su se prošle sezone pojavili na francuskoj LoL esport sceni, Karmine Corp ne prestaje da privlači ogromno interesovanje koje je na sreću po njihove navijače ispraćeno dobrim rezultatima. Nakon što su osvojili francusku LFL ligu Karmine Corp je nastavio sa nizanjem uspeha i odneo pehar na EU Mastersu.\r\n\r\nOvo je treći put za redom da jedan tim iz francuske osvaja prolećni EU Masters, a ako igrači Karmine Corp-a ostanu na okupu, pitanje je da li će iko moći da ih zaustavi u pohodu na letnju titulu.\r\n\r\nNjihovi mečevi su konstantno obarali rekorde gledanosti EU Mastersa, da bi na kraju samo finale pratilo preko 377.000 istovremenih gledalaca što je nadmašilo sva očekivanja. Karmine Corp je za manje od godinu dana prešao po popularnosti mnoge LEC timove, što je podiglo veliku prašinu i izazvalo mnoštvo diskusija u vezi toga da li i koliko se timovi u elitnoj evropskoj LoL ligi trude da izgrade fan bazu, i koliko je štetan sistem franšize kojim je sprečeno da novi timovi ulaze u takmičenje.\r\n\r\nPodsetimo, Karmine Corp je protutnjao kroz grupnu fazu EU Mastersa sa 6-0 skorom, da bi prvi poraz doživeli od EBL šampiona ŠAIM SE SuppUp u četvrtfinalu, ali i pored poraza u prvoj partiji uspeli su da spreče iznenađenje i preokrenu rezultat u nastavku.\r\n\r\nU polufinalu je pao prvak Španije UCAM Esports Club, dok je BT Excel do finala došao pobedom protiv mousesportsa.\r\n\r\nBT Excel je uspeo da zada prvi udarac u finalu, ali je Karmine Corp uspeo da prelomi sve tri naredne partije u svoju korist zahvaljući kako dobroj timskoj igri, tako i velikom individualnom kvalitetu koji su igrači demonstrirali, pogotovo francuski mid lejner Lucas „Saken“ Fayard koji je svojom igrom zasigurno zaslužio povratak u LEC.', 1, 4, 14, 5, 3, '2021-05-06 15:24:59', NULL),
(6, 'Nezaustavljivi Jokić 24 za četvrtinu, Bogdan raspucan', 'Odličan u domaćoj ekipi bio je novajlija Ostin Rivers sa 25 poena (6/9 za tri), Majkl Porter junior je dodao 17, a Fakundo Kampaco 16, uz 9 skokova, 4 asistencije, 5 ukradenih lopti i 2 blokade.\r\n\r\nKod Niksa najefikasniji je bio Imanuel Kvikli sa 18 poena, a Derik Rouz, Redži Bulok, Džulijus Rendl i Er Džej Beret su zabeležili po 14 poena.\r\n\r\nDenver se posle ubedljivog trijumfa vratio na treću poziciju na Zapadu pred paklen finiš ligaškog dela sezone. Nagetse, naime, od preostalih šest mečeva očekuje pet gostovanja – lideru konferencije Juti, Šarlotu, Mineosti, Detroitu i Portlandu, dok će na svom terenu igrati samo sa Bruklinom.\r\n\r\nAtlanta je u Džordžiji deklasirala Finiks rezultatom 135:103 i trećim uzastopnim trijumfom došli na korak do četvrte pozicije Istoka sa učinkom 37-30.\r\n\r\nHoksi su u poslednju četvrtinu ušli sa devet poena prednosti, ali su u četvrtom periodu ‘eksplodirali’ i naneli težak posaz odličnom timu iz Arizone. Koliko im je trijumf značajan potrđuje i izjava trenera Nejta Mekmilana da su „Sansi najbolji tim u ligi.“', 1, 2, 8, 6, 3, '2021-05-06 15:27:30', NULL),
(7, 'Leteći Somborac: Zakucavao sam kao tigar!', 'Centar Denver Nagetsa Nikola Jokić sigurno korača ka nagradi za najkorisnijeg igrača regularnog toka NBA sezone, a najzaslužniji za njegove fantastične partije nije atleticizam već su to briljantne košarkaške veštine. Međutim, u pobedi nad Njujork Niksima u noći između srede i četvrtka srpski reprezentativac oduševio je publiku sa nekoliko impresivnih zakucavanja.\r\n\r\nJokić je bio nadmoćan u prvoj četvrtini duela sa Nikerbokersima i ubacio je dvostruko više poena nego čitava protivnička ekipa u prvih 12 minuta (24:12). Jokić je imao četiri zakucavanja u pobedi, čime je izjednačio rekord karijere, a sva četiri je zabeležio u prvoj deonici.\r\nNe znam… Bila su to tigrovska zakucavanja. Skoro… Fakunod Kampaco me je dobro pronalazio na čeonoj liniji. Ostalih se ne sećam. Znam da sam napadao obruč i da sam bio agresivan, to je dobro“, izjavio je posle meča Nikola Jokić kroz šalu, pokazujući „kandže“ šakama kada je govorio o svojim „kucanjima“.\r\n\r\nJokić je duel završio sa 32 poena (10/16 iz igre, 0/2 za tri, 12/15 slobodna bacanja), uz 12 skokova, 6 asistencija, pod 2 ukradene lopte i blokade i četiri izgubljene lopte za svega 29 minuta na parketu u ubedljivoj pobedi.\r\n\r\nJokić je u sezoni 2020/2021. ukupno zakucao 45 puta, što mu je lični rekord, a to je čak triput više od broja zakucavanja iz prethodne sezone.\r\n\r\n„Nemam neko posebno objašnjenje – tim me pronalazi u dobrim pozicijama, a ja pogađam. Tako se ispostavilo“, rekla je prva zvezda tima iz Kolorada.\r\n\r\nJokić u tekućoj sezoni na 66 utakmica kao starter prosečno beleži 26,4 poena (56,5% iz igre, 40,5% za tri, 85,8% penali), 10,9 skokova i 8,4 asistencije za 35 minuta u igri.\r\n\r\nDenver je posle ove pobede na trećem mestu tabele Zapadne konferencije sa 44 pobede i 22 poraza, ali ih do kraja sezone čeka prilično težak raspored sa pet gostovanja u šest mečeva.', 1, 2, 8, 7, 3, '2021-05-06 15:28:59', '2021-05-06 15:29:03'),
(8, 'Markes posle testa u Heresu: Telo nije izdržalo', 'Posle trkačkog vikenda u Heresu, Mark Markes nije imao baš uspešno testiranje na stazi \"Anhel Nijeto\". Osmostruki svetski šampion je imao samo jedan izlazak na stazu jer i dalje oseća poseldice pada koji mu se desio na trećem slobodnom treningu pred Veliku nagradu Španije u subotu.\r\n\r\nMark Markes je za vikend vozio drugu trku ove sezone. Nije baš imao dobar rezultat u Heresu i definitivno on nije na nivou kada je osvajao titule. Španac i dalje oseća posledice povrede ruke, a novi udes u kom je povredio vrat mu sigurno nije pomogao. Testiranje u Heresu takođe nije bilo uspešno za Marka.„Nismo zaista testirali danas, samo jedan izlazak jer na drugom izlasku moje telo nije izdržalo. Vrat i desno rame su bili ukočeni, slično kao posle Portimaa ali nisam bio tako ukočen. Udes koji sam imao u subotu nije pomogao mom fizičkom stanju. Mislio sam da će mi telo biti bolje kada se zagreje i probao sam odmah ali nisam bio na nivou za vožnju„, kazao je Mark Markes posle testiranja u ponedeljak.\r\n\r\nOn dodaje da je neophodan postepeni napredak i da je sledeći cilj Le Man. Markes je bio sedmi u Portugalu i deveti u Španiji, a za liderom je u Heresu zaotsajao deset sekundi. To je napredak u odnosu na portugalski zaostatak od 13.', 1, 5, 12, 8, 3, '2021-05-06 15:34:10', NULL),
(9, 'Jokanović za SK: Čelsi dokazao da je bolji tim od Reala', 'Sinoćni polufinalni obračun Čelsija i Reala gledao se širom planete, razumljivo je, valjda, što ga ni Katar, domaćin predstojećeg Svetskog prvenstva u fudbalu, nije ignorisao, pa, među onima prikovanim za fotelju i TV ekran, od devet do 11 uveče, u tom svetu našao se i Slaviša Jokanović, bivši prvotimac londonskih „Plavaca“ (2000. do 2002), sad poznato, cenjeno trenersko ime (aktuelni šef struke u Al Garafi).\r\n\r\nDa li da postavimo pitanje za koga je navijao? Dilema je kratko trajala, otprilike kao i kasnija Jokanovićeva konstatacija na jedno od sledećih pitanja vezanih za kvalitet ekipa („Čelsi dokazao da je bolji tim od Reala!“).„Navijao? Ma, davno sam prestao da navijam, dogodilo se to onog trena kad sam obukao dres Vojvodine. Pre toga, dok sam igrao za Novi Sad, možda se negde i nekud provlačila moja navijačka strast, kasnije, rekoh, sve je nestalo. Što se simpatija tiče, takođe je kristalno jasno, uvek ih poklanjam timu čiji sam nekad bio deo, sad smo, verujem, i to odgonetnuli“, objasnio je Jokanović na početku intervjua za Sport Klub.\r\n\r\nPobedili ste?\r\n\r\n„Dobro, kad ste već navalili, pobedili smo“, uzvratio je „Jokan“ uz neizbrežni osmeh.\r\n\r\nMoglo je i ubedljivije, rezultatski, londonskih 2:0 ne predstavlja realnu sliku?\r\nOno osnovno, najvažnije, svodi se na nekoliko reči: Čelsi je ušao u finale Lige šampiona. I, posle svega, može da se sladi, kako plasmanom, tako i igrom„.\r\n\r\nOtresito, hrabro, napadački, nadmoćno u 180 i kusur minuta, sabrano sa madridskim okršajem?\r\n\r\n„Ne postoji ni najmanji argument da neko baci bilo kakvu senku, ogromna većina tih minuta pripala je londonskom sastavu, Čelsi je u oba meča bio jači, dokazavši da u ovom trenutku ima bolji, kvalitetniji tim. Šta je mislio Real? Da će predstavom u kojoj je jedva pobedio Osasunu u La Ligi, da saplete Čelsi i izbori završnicu u Evropi?! Nedeljama je van forme, spotiče se u domaćem šampionatu, bled je, jednostavno. A, pokušao da se adaptira na igru Čelsija?! Trojica pozadi? I kod kuće, i na gostovanju? Nikako nije išlo. Očekivao sam da se tu nešto promeni.“', 1, 1, 4, 9, 3, '2021-05-06 15:36:33', NULL),
(10, 'Bez engleskog finala: Junajted na Viljareal za trofej u LE!', 'Fudbaleri Mančester Junajteda i Viljareala igraće u finalu Lige Evrope! Crveni đavoli su u polufinalnom dvomeču bili bolji od Rome ukupnim rezultatom 8:5 (6:2, 2:3), dok je Žuta podmornica savladala Arsenal sa 2:1 (2:1, 0:0). U finalu Lige šampiona gledaćemo engleski okršaj između Mančester Sitija i Čelsija, ali to neće biti slučaj i sa drugim po kvalitetu evropskim takmičenjem. Posao Ostrvljanima pokvario je Viljareal, koji brani čast Španije i ostatka Evrope u borbi za trofej 26. maja u Gdanjsku.\r\n\r\nJunajted je već posle prve utakmice i trijumfa od 6:2 bio viđen u finalu, pa je duel u Rimu predstavljao odrađivanje posla za Crvene đavole.\r\n\r\nPoput okršaja na Old Trafordu, i duel na Olimpiku bio je izuzetno efikasan i zanimljiv. Gosti su vodili, zatim domaći preokrenuli, pa je Junajted došao do poravnanja, pre nego što je Roma u finišu uspela da slavi i pobedom se oprosti od takmičenja.\r\nEdinson Kavani je doveo Engleze u vođstvo u 39. minutu. Taj rezultat je bio aktuelan do 57. kada je Edin Džeko izjednačio. Samo tri minuta kasnije, Brajan Kristante je doneo Vučici prvo vođstvo na meču, ali je ono potrajalo svega osam minuta, pre nego što je Kavani još jednom pogodio sa 2:2.\r\n\r\nNi tu nije bio kraj. Ulazak Nikole Zalevskog u 76. minutu ispostavio se kao ključan, pošto je 19-godišnji Poljak u 83. doneo „jalov“ trijumf italijanskom klubu.', 1, 1, 5, 10, 3, '2021-05-06 22:10:48', NULL),
(11, 'Arteta razočaran: Zaslužili smo finale', 'Menadžer Arsenala Mikel Arteta ne krije razočaranje zbog ispadanja u polufinalu Lige Evrope, pošto veruje da je njegov tim zaslužio plasman u finale.\r\n\r\nTobdžije su remizirale bez golova protiv Viljareala u revanšu na Emirejtsu, čime nisu uspele da nadoknade poraz iz prvog duela (2:1).„Razočaran sam. Pokušali smo sve, mislim da smo zaslužili da prođemo u finale. Neki detalji su odlučili. Imali smo tri velike šanse, dok oni nisu stvorili nijednu, ali su ipak prošli„, rekao je Arteta.\r\n\r\nUsledio je osvrt na prvi meč u Španiji, koji je bio presudan.\r\n\r\n„Mnogo je stvari. U Viljarealu nismo dobro otvorili utakmicu. Nismo bili spremni na pravi način, a ni svi igrači nisu bili na nivou. Mnogi od njih su igrali svoje prvo polufinale, nemaju iskustvo u takvim mečevima„.\r\n\r\nArsenal je propustio šansu da se kroz potencijalno osvajanje Lige Evrope domogne Lige šampiona sledeće sezone.\r\n\r\n„Ostaje nam da se kroz Premijer ligu domognemo Evrope. Imamo četiri utakmice pred nama i pokušaćemo sve. Ipak, razočaranje je veliko„, zaključio je Španac.\r\n\r\nU finalu Lige Evrope 26. maja u Gdanjsku sastaće se Mančester Junajted i Viljareal', 1, 1, 5, 11, 3, '2021-05-06 22:13:34', NULL),
(12, 'ŽESTOG SUKOB: Okršaj nekadašnjeg asa ABA lige i pomoćnog trenera Indijane', 'Menadžment NBA ligaša Indijane suspendovao je na jedan meč pomoćnog trenera Grega Fostera i novčano kaznio košarkaša Gruzina Gogu Bitadzea, zbog verbalnog sukoba na utakmici sa Sakramentom.\r\n\r\nKingsi uspešno završili jedan napad, i to zakucavanjem preko Bitadzea, na šta je Foster glasno zamerio Bitadzeu što nije bolje reagovao u odbrani.\r\n\r\nBitadze je potom pogodio trojku na drugoj strani, a onda se okrenuo ka Fosteru i uz psovku mu rekao: \'\'Sedi, dole!\'\'', 1, 2, 8, 12, 3, '2021-05-06 22:18:34', NULL),
(13, 'Dva engleska velikana u borbi za titulu prvaka starog kontinenta!', 'Fudbaleri Čelsija plasirali su se u finale Lige šampiona pošto su u revanš meču u Londonu na svom stadionu savladali ekipu Real Madrida sa 2:0 (1:0).\r\n\r\nPrvi meč u Španiji okončan je nerešenim rezultatom, pa su ova dva pogotka u Engleskoj praktično rešila pitanje drugog finaliste. Strelci za domaćina bili su Verner u 28. i Maunt u 85. minutu meča. \r\n\r\nNastavlja se tradicija po kojoj Real nikada nije uspeo da eliminiše Čelsi iz Evrope. Takođe, \"Plavci\" će posle 9 godina ponovo igrati u finalu ovoga najelitnijeg fudbalskog takmičenja u Evropi nakon čuvenog meča sa Bejernom i pobede posle boljeg izvođenja penala. \r\n\r\nJuče je svoje mesto u finalu obezbedio Mančester siti koji je eliminisao francuski PSŽ. \"Građani\" su u oba meča bili bolji od velikana iz Pariza i praktično rutinski odradili posao u polufinalu. \r\n\r\nDa li će tako biti i u finalu saznaćemo 29. maja u Istanbulu.Trener fudbalera Čelsija Tomas Tuhel rekao je da će u revanšu sa Real Madridom sve biti moguće.\r\n\r\n\"Sve bi bilo moguće u revanšu, čak i da smo pobedili ovde\", rekao je Tuhel posle utakmice u Madridu.\r\n\r\nReal Madrid i Čelsi igrali su nerešeno 1:1 u prvoj utakmici polufinala Lige šampiona.\r\n\r\n\"Prošlo je tek poluvreme i moraćemo da se borimo za svaki centimetar i da steknemo prednost na svakom delu terena. Moramo da se borimo i zaslužimo prolaz\", kazao je Tuhel.\r\n\r\nKada je reč o prvoj utakmici, Tuhel je naveo da ima osećaj da je njegova ekipa trebalo da ima prednost na poluvremenu i da je već tada susret trebalo da bude rešen.\r\n\r\nTrener Real Madrida Zinedin Zidan rekao je da je zadovoljan, posebno izdanjem njegovog tima u drugom poluvremenu.\r\n\r\n\"Živi smo. Srećni smo time šta smo postigli u prvom duelu, generalno. Znamo da smo dobri, ali i rival je. Čelsi je sa razlogom u polufinalu\", rekao je Zidan.\r\n\r\nRevanš će se igrati u Londonu.', 1, 1, 4, 13, 3, '2021-05-06 22:20:33', NULL),
(14, 'Ronaldov dres na licitaciji na Limundu', 'Od Kristijana za Gavrila! Za njegovu pobedu! Posle humanitarne licitacije na kojoj je Mozzart kupio Ronaldovu kapitensku traku, Portugalac je rešio da pošalje svoj potpisan dres Juventusa sa porukom „para Gavrilo“! Zlata vredni crno-beli dres stigao je u Mozzartovo sedište pravo iz Torina, a ova kompanija nastavlja niz aukcija koje se u poslednje vreme organizuju u cilju prikupljanja sredstava za najskuplji lek na svetu. I ovaj komad opreme najveće fudbalske zvezde današnjice postavljen je na Limundu, sa početnom cenom od milion dinara!\r\n\r\nGavrilo Đurđević ima osam meseci i boluje od spinalne mišićne atrofije, a potrebno mu je još oko milion evra za lečenje. Mozzart je zahvaljujući fudbalskim menadžerima iz agencije LIAN Sports Nikoli Damjancu i Faljiju Ramadaniju uspeo da dođe do Ronalda i pozove ga da se priključi akcijama.\r\n\r\nKapiten evropskih šampiona čuo je da je slučaj „traka“ imao humanitarni odjek i da je tada u fond otišlo 64.000 evra. Bilo mu je drago da je od tog celog događaja na kraju ispalo nešto veoma lepo i odlučio je da pošalje svoj potpisan dres. Para Gavrilo! Pela vitoria de Gavrilo!\r\nKristijano je u revoltu bacio svoje kapitensko obeležje posle poništenog gola na meču Srbija – Portugal, ali se niko neće sećati rezultata 2:2, ni uklizavanja Mitrovića, ni besa Ronalda. Pamtiće se samo ona udarna priča iz svetskih medija - da je jedan vatrogasac uzeo traku i iskoristio je za pomoć osmomesečnoj bebi. Đorđe Vukićević je sa organizacijom „Zajedno za život“ Jovana Simića digao celu Srbiju na noge sa tom aukcijom, a Mozzart se nije zaustavio na kupovini trake i donaciji od 7,5 miliona dinara.\r\n\r\nGlavni cilj je bio da se probudi društveno-odgovorna svest i kod drugih pojedinaca, firmi, organizacija, a licitacije su se nastavile – Stefan Mitrović je dao svoje kopačke i dres sa čuvenog meča na Marakani, njegov prezimenjak Aleksandar takođe dres Srbije…\r\n\r\nOvaj Ronaldov nije sa grbom Portugala, nego Juventusa, ali asocira na ono što je Gavrilu neophodno u ovom trenutku - timska igra na humanost! U njoj se neće pamtiti individualni potezi, ali je Kristijanova asistencija za svaku pohvalu.', 1, 1, 4, 14, 4, '2021-05-06 22:31:39', NULL),
(15, '\"UŠATI\" SE VRAĆA U KOLEVKU FUDBALA', 'TREĆE englesko finale Lige šampiona u poslednjih 13 godina zakazali su Čelsi i Mančester Ako ne bude nekih promena, \"plavci\" i \"građani\" će 29. maja na olimpijskom stadionu \"Ataturk\" u Istanbulu imati priliku da vrate \"ušati\" trofej na Ostrvo, nakon Liverpula koji je 2019. takođe pobedio zemljački Totenhem.\r\n\r\nČelsi, samo što je tada sa druge strane bio tim iz crvenog dela Mančestera 2008, koji je slavio posle one čuvene penal serije u kojoj se DŽon Teri okliznuo.\r\n\r\nSada su u finalu ekipe koje su prethodnih 20 godina postale sinonim za rasipništvo i na ostrvskom i kopnenom delu Starog kontinenta važe za veće trošadžije. Dovoljno je reći da je Čelsi samo ovog leta, posle godinu dana zabrane UEFA, na pojačanja potrošio više od 250 miliona evra. Sa druge strane, Siti nakon što ga je preuzeo šeik Mansur bin Zajed, postao je evropska supersila, ali bez \"srebrnine\" iz evrokupova, svaki utrošeni petrol dolar je gubio svoj smisao. Ipak, ove godine \"građani\" dobili prvu priliku u svojoj istoriji da se bore za najvredniju amforu u evropskom fudbalu.siti pobedama nad Real Madridom i PSŽ u polufinalima.', 1, 1, 1, 15, 4, '2021-05-06 22:34:56', NULL),
(16, 'RADONJIĆ PRED BORBU U LAKTAŠIMA: Sitnice će odlučiti pobednika', 'KOŠARKAŠI Crvene zvezde igraju u petak 7. maja od 18.30 časova u Laktašima protiv Igokee, u drugom meču polufinala ABA lige.\r\nTrener košarkaša Crvene zvezde Dejan Radonjić izjavio je da očekuje fizički zahtevan meč.\r\n\r\n- Očekujem fizički zahtevan meč, a u takvoj utakmici moramo da odigramo vrlo čvrsto, skocentrisano svesni da u ovakvim duelima sitnice prave razliku. Tri dana nije veliki period, ali smo učinili sve da osvežimo ekipu i spremni dočekamo ovu utakmicu 65. zvaničnu u ovoj sezoni - rekao je Radonjić, a preneo je sajt kluba.', 1, 2, 7, 16, 4, '2021-05-06 22:37:56', NULL),
(17, 'MILOJEVIĆ PRED MORNAR: Odbrana vodi u finale, oni su sjajan tim', 'KOŠARKAŠI Budućnost pobedili su Mornar u prvom meču polufinalne serije sa 97:88, a uoči drugog meča koji je na programu 7. maja, sa početkom u 21 čas u Baru, odlučni su u nameri da iskoriste prvu meč loptu i stignu do finala.\r\nDejan Milojević, trener Budućnosti, i dalje je pri stavu koji je izneo pre početka doigravanja, da ključ uspeha u borbi za plasman u finale, odnosno u borbi za osvajanje trofeja, leži u odbrani.\r\n\r\n- Očekuje nas druga utakmica polufinalne serije. Mornar je sjajan tim, igraju dobro na svom parketu i u gostima. Posebno su opasni u Baru. Radi se o ofanzivno verovatno najjačoj ekipi u ABA ligi, a samim tim, nameće se zaključak da do ostvarenja cilja, a to je plasman u finale, ključ leži u odbrani. Rekao sam pre početka doigravanja da je odbrana ta koja donosi pobede koja vodi do osvajanja trofeja. Ukoliko defanzivne zadatke odradimo u skladu sa dogovorom i na nivou na kojem možemo, a verujem da hoćemo, imamo realne šanse da već u Baru izborimo plasman u finale - izjavio je trener Budućnosti.\r\n\r\nUtakmica između Mornara i Budućnosti igra se 7. maja sa početkom u 21 čas. Istog dana, sa početkom u 18 časova i 30 minuta, snage će odmeriti Igokea i Crvena zvezda. Budućnost i Crvena zvezda vode u polufinalnim serijama sa 1:0.', 1, 2, 7, 17, 4, '2021-05-06 22:40:42', NULL),
(18, 'JOKIĆ POVREĐEN! Denver bez najboljeg igrača u narednom periodu', 'NAGETSI su obezbedili plej-of, Nikola Jokić je glavni kandidat za MVP nagradu, Meloun je najbolji trener ba Zapadu, sve je idealno u Denveru. ili možda ipak nije?\r\nNikola Jokić je bez premca jedan od predvodnika Denvera, on je ove sezone upisao čak 54. dabl-dabl učinka. Takođe je na poslednjoj igranoj utakmici, kada su poraženi od Lejkersa, upisao neverovatnih 36. poena.  \r\n\r\nTakođe, Jokić je jedan od kandidata za prestižnu MVP nagradu. \r\n\r\n- Denver je sada na učinku 9-1, uz Top5 po koš-razlici otkako je DŽamal Marej povređen. To uključuje i učinak 7-1 otkako se Mareju \'priključio\' njegov naslednik u startnoj postavi, Monte Moris, a 5-0 otkako se njima pridružio član startne postave Vil Barton. U toj seriji, Jokić ima proseke od 27 poena, 11 skokova i sedam asistencija, uz nestvarnu preciznost šuta. Prilično jako MVP upinjanje - poručio je Divajn.', 1, 2, 8, 18, 4, '2021-05-06 22:43:13', NULL),
(19, 'Dončić i Hardavej srušili Majami, Adetokumbo bolji od Bruklinovog Drim tim', 'Prošle noći u NBA ligi odigrano je sedam utakmica. \"Srpski derbi\" između Dalasa i Majamija protekao je bez učinka naših reprezentativaca, pošto ni Marjanović ni Bjelica nisu ulazili u igru.Mevsi nose ceo plen sa Floride poštro su savladali hitse sa 127:113, a ako nije bilo okršaja reprezentativaca Srbije videli smo odlične role dva reprezentativca Slovenije.\r\n\r\nLuka Dončić je sa 23 poena, 12 skokova i osam asistencija blistao u ekipi Dalasa, dok je Goran Dragić sa druge strane upisao 19 poena uz pet skokova i tri asistencije.\r\n\r\nNajefikasniji na meču bio je Tim Hardavej mlađi sa 36 poen od čega čak deset trojki.', 1, 2, 8, 19, 4, '2021-05-06 22:45:26', NULL),
(20, 'DONČIĆ RAZBIO SELTIKSE Vučević najbolji u porazu Čikaga', 'LUKA Dončić se vratio na parket i košarkaši Dalasa zabeležili su pobedu nad Boston Seltiksima 113:108.Mladi Slovenac je ponovo bio dominantna figura sa 36 poena, 8 skokova i 5 dodavanja,a pratio ga je DŽejlen Brunson sa 21 poena te Kristaps Potzingins sa 19 koševaKošarkaši Oklahome savladali su Toronto na svom terenu sa 113:103, a Aleksej Pokuševski nije bio u sastavu jer je pozitivan na koronu. I Minesota je na svom terenu u dramatičnoj završnici nadigrala NJujork sa 102:101.\r\n\r\nSrpski internacionalac Alekseja Pokuševskog koji je pozitivan na koronu, nije bilo u sastavu Oklahome, ali je njegova ekipa izašla na kraj sa Torontom i sa 113:103 stigla do 20. slavlja u sezoni.\r\n\r\nNajefikasniji u timu Oklahome bio je Svjatoslav Mihaljuk sa 22 poena i devet skokova.\r\n\r\n\r\nNajefikasniji igrač meča bio je Geri Trent sa 31 postignutim poenom u poraženom timu Toronta ali im je to bila slaba uteha.\r\n\r\nMajami je pobedio Indijanu sa 92:87, a Nemanja Bjelica je dobio samo 5 minuta u igri i zabeležio je 1 skok, dok je Goran Dragić ubacio 12 poena, a Dankan Robinson 20.\r\n\r\nNikola Vučević je opet bio najbolji u Čikagu ali nije mogao da ih povuče do pobede nad Finiksom 121:116. Vučević je ubacio 24 poena uz 10 skokova, ali na drugoj strani u redovima Finiksa, Devin Buker je briljirao sa 45 koševa.\r\n\r\nBruklin je bio siguran na svom parketu protiv Hjustona sa 120:108, a tim su predvodili Kajri Irving i DŽo Heris.\r\n\r\nIrving je ostvario dabl-dabl učinak sa 31 poenom i 12 asistencija, dok je Haris postigao 28 poena uz šest skokova.', 1, 2, 8, 20, 4, '2021-05-06 22:46:56', NULL),
(21, 'Laso: Nisam srećan, ali sam ponosan na ekipu', 'Pablo Laso, trener Reala iz Madrida, nije bio preterano neraspoložen posle poraza od Efesa u odlućujućem petom„Nisam srećan, to je logično, jer smo ostali bez mesta na finalnom turniru, a bili smo veoma blizu. Međutim, moram da naglasim da sam ponosan na momke koje treniram, na kompletnu ekipu. Pokazali smo karakter, borili se od prvog kola Evrolige, pa sve do odlučujućeg petog meča četvrtfinalne serije. Dali smo sve od sebe, ali nismo uspeli da stignemo do same završnice. Nedostajalo je i malo sreće, ali…“, rekao je trener Reala, Pablo Laso, pa nastavio:\r\n\r\n„Protiv Efesa smo lako izgubili prva dva meča, a kada su nas svi otpisali, uspeli smo da se vratimo u Istanbul. Imali smo mnogo problema u utakmicama koje smo igrali na našem parketu, stizali smo veliku prednost rivala, uspevali da napravimo velike preokrete. U meču odluke, bili smo u igri sve do poslednjih sekundi, odlučila je jedna lopta, a na našu žalost ta jedna lopta je završila u rukama igrača Efesa, kojima želim sve najbolje na finalnom turniru koji sledi“.\r\n\r\n meču za mesto na finalnom turniru Evrolige u Kelnu.', 1, 2, 6, 21, 4, '2021-05-06 22:49:31', '2021-05-06 22:51:13'),
(22, 'BOGDAN TROJKAMA UGASIO SUNCE', 'KOŠARKAŠI Atlante razbili su Finiks sa 135:103 u utakmici u kojoj je čak sedam igrača Hoksa imalo dvocifren košgeterski učinak. Najbolji među njima Kapela sa 18, a odmah za njim Bogdan Bogdanović sa 16 poena, od čega četiri trojke.\r\nKod Sansa, Devin Buker je sa 30 poena bio ubedljivo najefikasniji, osim njega istakao se Mikal Bridžis sa 18 poena.\r\n\r\nHoksi su peti na Istoku sa skorom 37-30, istim brojem pobeda i jednim porazom više od trenutno četvrtih Niksa. Finiks je sa skorom 47-19 ostao drugi na Zapadu.', 1, 2, 8, 22, 4, '2021-05-06 22:53:18', NULL),
(23, 'Garin izbacio Medvedeva', 'Turnir u Madridu ostao je bez drugog nosioca. Čileanac Kristijan Garin je savladao Danila Medvedeva posle tri seta 6:4, 6:7 (2:7), 6:1.\r\n\r\nGarin je sjajno servirao i to je ono što mu je pomoglo da savlada finalistu Australijan opena. U prvom setu jedini brejk je viđen u trećem gemu. Čileanac je poveo 2:1 i do kraja seta bez mnogo poteškoća čuvao prednost početnog udaraca.\r\n\r\nU drugom delu jedinu šansu da oduzme servis rivalu imao je Čileanac u prvom gemu. Od tog trenutka sve je išlo ka taj-brejku. U njemu je Medvedev dominirao i sa 7:2 izjednačio rezultat.\r\n\r\nMeđutim, bio je to samo trenutni bljesak Rusa. Garin je od rezultata 1:1 vezao pet gemova i izborio mesto među osmoricom najboljih. Tamo ga čeka duel sa pobednikom meča Beretini (Italija) – Delbonis (Argentina).', 1, 3, 9, 23, 4, '2021-05-06 22:59:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(4, 7),
(5, 8),
(6, 9),
(6, 10),
(7, 9),
(7, 10),
(8, 11),
(8, 12),
(9, 3),
(10, 13),
(10, 14),
(10, 15),
(10, 16),
(11, 17),
(12, 18),
(12, 19),
(13, 3),
(13, 4),
(14, 20),
(15, 3),
(16, 21),
(16, 22),
(16, 23),
(17, 24),
(17, 25),
(17, 26),
(18, 9),
(18, 10),
(19, 27),
(19, 28),
(19, 29),
(20, 18),
(20, 27),
(20, 28),
(21, 30),
(21, 31),
(22, 18),
(22, 32),
(22, 33),
(23, 7);

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poruka` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datum_kreiranja` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `url`, `poruka`, `email`, `datum_kreiranja`) VALUES
(1, 'http://localhost:8000/categories', 'Korisnik sa emailom: perasuperadmin@gmail.com je kreirao novu kategoriju', 'perasuperadmin@gmail.com', '2021-05-06 12:01:50'),
(2, 'http://localhost:8000/categories', 'Korisnik sa emailom: perasuperadmin@gmail.com je kreirao novu kategoriju', 'perasuperadmin@gmail.com', '2021-05-06 12:02:04'),
(3, 'http://localhost:8000/categories', 'Korisnik sa emailom: perasuperadmin@gmail.com je kreirao novu kategoriju', 'perasuperadmin@gmail.com', '2021-05-06 12:02:11'),
(4, 'http://localhost:8000/categories', 'Korisnik sa emailom: perasuperadmin@gmail.com je kreirao novu kategoriju', 'perasuperadmin@gmail.com', '2021-05-06 12:02:28'),
(5, 'http://localhost:8000/categories', 'Korisnik sa emailom: perasuperadmin@gmail.com je kreirao novu kategoriju', 'perasuperadmin@gmail.com', '2021-05-06 12:02:42'),
(6, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:03:18'),
(7, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:03:23'),
(8, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:03:48'),
(9, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:04:03'),
(10, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:04:28'),
(11, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:04:46'),
(12, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:06:25'),
(13, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:06:43'),
(14, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:08:46'),
(15, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:08:53'),
(16, 'http://localhost:8000/headings/10', 'Korisnik sa emailom: perasuperadmin@gmail.com je azurirao rubrikuWta', 'perasuperadmin@gmail.com', '2021-05-06 12:10:30'),
(17, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:12:08'),
(18, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:12:27'),
(19, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:12:36'),
(20, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:12:45'),
(21, 'http://localhost:8000/headings', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novu rubriku:', 'perasuperadmin@gmail.com', '2021-05-06 12:18:38'),
(22, 'http://localhost:8000/tags', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novi tagPremier Liga', 'perasuperadmin@gmail.com', '2021-05-06 12:30:27'),
(23, 'http://localhost:8000/tags', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novi tagLiverpool FC', 'perasuperadmin@gmail.com', '2021-05-06 12:31:10'),
(24, 'http://localhost:8000/posts', 'Korisnik sa emailom: perasuperadmin@gmail.com je kreirao novi post', 'perasuperadmin@gmail.com', '2021-05-06 12:57:43'),
(25, 'http://localhost:8000/tags', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novi tagChelsea', 'perasuperadmin@gmail.com', '2021-05-06 13:00:36'),
(26, 'http://localhost:8000/tags', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novi tagReal Madrid', 'perasuperadmin@gmail.com', '2021-05-06 13:02:55'),
(27, 'http://localhost:8000/tags', 'Korisnik sa emailom: perasuperadmin@gmail.com je dodao novi tagZinedine Zidane', 'perasuperadmin@gmail.com', '2021-05-06 13:03:56'),
(28, 'http://localhost:8000/posts', 'Korisnik sa emailom: perasuperadmin@gmail.com je kreirao novi post', 'perasuperadmin@gmail.com', '2021-05-06 13:05:49'),
(29, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-06 13:24:20'),
(30, 'http://localhost:8000/comments', 'Korisnik sa emailom: superadminmika@gmail.com je kreirao novi post2', 'superadminmika@gmail.com', '2021-05-06 13:29:32'),
(31, 'http://localhost:8000/comments', 'Korisnik sa emailom: superadminmika@gmail.com je kreirao novi post2', 'superadminmika@gmail.com', '2021-05-06 13:29:58'),
(32, 'http://localhost:8000/comments', 'Korisnik sa emailom: superadminmika@gmail.com je kreirao novi post1', 'superadminmika@gmail.com', '2021-05-06 13:57:33'),
(33, 'http://localhost:8000/comments', 'Korisnik sa emailom: superadminmika@gmail.com je kreirao novi post2', 'superadminmika@gmail.com', '2021-05-06 14:18:37'),
(34, 'http://localhost:8000/comments', 'Korisnik sa emailom: superadminmika@gmail.com je kreirao novi post2', 'superadminmika@gmail.com', '2021-05-06 14:19:01'),
(35, 'http://localhost:8000/comments', 'Korisnik sa emailom: superadminmika@gmail.com je kreirao novi post1', 'superadminmika@gmail.com', '2021-05-06 14:24:38'),
(36, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-06 14:31:36'),
(37, 'http://localhost:8000/users', 'Kreiran je novi nalog sa: nemanja@admin.gmail.com', 'nemanja@admin.gmail.com', '2021-05-06 14:32:12'),
(38, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: nemanja@admin.gmail.com', 'nemanja@admin.gmail.com', '2021-05-06 14:35:39'),
(39, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagRafael Nadal', 'nemanja@admin.gmail.com', '2021-05-06 15:10:35'),
(40, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagMadrid Masters', 'nemanja@admin.gmail.com', '2021-05-06 15:10:58'),
(41, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 15:14:27'),
(42, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 15:16:46'),
(43, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagEu Masters', 'nemanja@admin.gmail.com', '2021-05-06 15:22:55'),
(44, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 15:24:59'),
(45, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagNikola Jokic', 'nemanja@admin.gmail.com', '2021-05-06 15:26:08'),
(46, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagDenver Nugets', 'nemanja@admin.gmail.com', '2021-05-06 15:26:16'),
(47, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 15:27:30'),
(48, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 15:28:59'),
(49, 'http://localhost:8000/posts/7', 'Korisnik sa emailom: nemanja@admin.gmail.com je promenuo status postaLeteći Somborac: Zakucavao sam kao tigar!', 'nemanja@admin.gmail.com', '2021-05-06 15:29:01'),
(50, 'http://localhost:8000/posts/7', 'Korisnik sa emailom: nemanja@admin.gmail.com je promenuo status postaLeteći Somborac: Zakucavao sam kao tigar!', 'nemanja@admin.gmail.com', '2021-05-06 15:29:03'),
(51, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagMarc Marqez', 'nemanja@admin.gmail.com', '2021-05-06 15:32:31'),
(52, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagHonda', 'nemanja@admin.gmail.com', '2021-05-06 15:32:38'),
(53, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 15:34:10'),
(54, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 15:36:33'),
(55, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: nemanja@admin.gmail.com', 'nemanja@admin.gmail.com', '2021-05-06 22:06:50'),
(56, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagArsenal FC', 'nemanja@admin.gmail.com', '2021-05-06 22:07:17'),
(57, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagRoma AS', 'nemanja@admin.gmail.com', '2021-05-06 22:08:28'),
(58, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagManchester United', 'nemanja@admin.gmail.com', '2021-05-06 22:08:51'),
(59, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagVillareal FC', 'nemanja@admin.gmail.com', '2021-05-06 22:09:07'),
(60, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 22:10:48'),
(61, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagMikael Arteta', 'nemanja@admin.gmail.com', '2021-05-06 22:12:28'),
(62, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 22:13:34'),
(63, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagNba', 'nemanja@admin.gmail.com', '2021-05-06 22:15:25'),
(64, 'http://localhost:8000/tags', 'Korisnik sa emailom: nemanja@admin.gmail.com je dodao novi tagIndijana', 'nemanja@admin.gmail.com', '2021-05-06 22:17:13'),
(65, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 22:18:34'),
(66, 'http://localhost:8000/posts', 'Korisnik sa emailom: nemanja@admin.gmail.com je kreirao novi post', 'nemanja@admin.gmail.com', '2021-05-06 22:20:33'),
(67, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-06 22:26:03'),
(68, 'http://localhost:8000/users', 'Kreiran je novi nalog sa: mikicaadmin@yahoo.com', 'mikicaadmin@yahoo.com', '2021-05-06 22:27:20'),
(69, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: mikicaadmin@yahoo.com', 'mikicaadmin@yahoo.com', '2021-05-06 22:27:39'),
(70, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: mikicaadmin@yahoo.com', 'mikicaadmin@yahoo.com', '2021-05-06 22:28:14'),
(71, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagKristijano Ronaldo', 'mikicaadmin@yahoo.com', '2021-05-06 22:29:57'),
(72, 'http://localhost:8000/posts', 'Korisnik sa emailom: mikicaadmin@yahoo.com je kreirao novi post', 'mikicaadmin@yahoo.com', '2021-05-06 22:31:39'),
(73, 'http://localhost:8000/posts', 'Korisnik sa emailom: mikicaadmin@yahoo.com je kreirao novi post', 'mikicaadmin@yahoo.com', '2021-05-06 22:34:56'),
(74, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagDejan Radonjic', 'mikicaadmin@yahoo.com', '2021-05-06 22:36:15'),
(75, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagCrvena Zvezda KK', 'mikicaadmin@yahoo.com', '2021-05-06 22:36:28'),
(76, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagIgokea KK', 'mikicaadmin@yahoo.com', '2021-05-06 22:36:49'),
(77, 'http://localhost:8000/posts', 'Korisnik sa emailom: mikicaadmin@yahoo.com je kreirao novi post', 'mikicaadmin@yahoo.com', '2021-05-06 22:37:56'),
(78, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagDejan Milojevic', 'mikicaadmin@yahoo.com', '2021-05-06 22:39:04'),
(79, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagBuducnost KK', 'mikicaadmin@yahoo.com', '2021-05-06 22:39:30'),
(80, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagMornar Bar KK', 'mikicaadmin@yahoo.com', '2021-05-06 22:39:41'),
(81, 'http://localhost:8000/posts', 'Korisnik sa emailom: mikicaadmin@yahoo.com je kreirao novi post', 'mikicaadmin@yahoo.com', '2021-05-06 22:40:42'),
(82, 'http://localhost:8000/posts', 'Korisnik sa emailom: mikicaadmin@yahoo.com je kreirao novi post', 'mikicaadmin@yahoo.com', '2021-05-06 22:43:13'),
(83, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagLuka Doncic', 'mikicaadmin@yahoo.com', '2021-05-06 22:43:49'),
(84, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagDalas Mavericks', 'mikicaadmin@yahoo.com', '2021-05-06 22:44:00'),
(85, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagMiami Heat', 'mikicaadmin@yahoo.com', '2021-05-06 22:44:21'),
(86, 'http://localhost:8000/posts', 'Korisnik sa emailom: mikicaadmin@yahoo.com je kreirao novi post', 'mikicaadmin@yahoo.com', '2021-05-06 22:45:26'),
(87, 'http://localhost:8000/posts', 'Korisnik sa emailom: mikicaadmin@yahoo.com je kreirao novi post', 'mikicaadmin@yahoo.com', '2021-05-06 22:46:56'),
(88, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagEurolague', 'mikicaadmin@yahoo.com', '2021-05-06 22:48:16'),
(89, 'http://localhost:8000/posts', 'Korisnik sa emailom: mikicaadmin@yahoo.com je kreirao novi post', 'mikicaadmin@yahoo.com', '2021-05-06 22:49:31'),
(90, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagReal Madrid KK', 'mikicaadmin@yahoo.com', '2021-05-06 22:50:03'),
(91, 'http://localhost:8000/posts/21', 'Korisnik sa emailom: mikicaadmin@yahoo.com je promenuo status postaLaso: Nisam srećan, ali sam ponosan na ekipu', 'mikicaadmin@yahoo.com', '2021-05-06 22:50:08'),
(92, 'http://localhost:8000/posts/21', 'Korisnik sa emailom: mikicaadmin@yahoo.com je promenuo status postaLaso: Nisam srećan, ali sam ponosan na ekipu', 'mikicaadmin@yahoo.com', '2021-05-06 22:50:14'),
(93, 'http://localhost:8000/posts/21', 'Korisnik sa emailom: mikicaadmin@yahoo.com je azurirao postaLaso: Nisam srećan, ali sam ponosan na ekipu', 'mikicaadmin@yahoo.com', '2021-05-06 22:51:13'),
(94, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagBogdan Bogdanovic', 'mikicaadmin@yahoo.com', '2021-05-06 22:51:56'),
(95, 'http://localhost:8000/tags', 'Korisnik sa emailom: mikicaadmin@yahoo.com je dodao novi tagAtlanta Hawks', 'mikicaadmin@yahoo.com', '2021-05-06 22:52:08'),
(96, 'http://localhost:8000/posts', 'Korisnik sa emailom: mikicaadmin@yahoo.com je kreirao novi post', 'mikicaadmin@yahoo.com', '2021-05-06 22:53:18'),
(97, 'http://localhost:8000/posts', 'Korisnik sa emailom: mikicaadmin@yahoo.com je kreirao novi post', 'mikicaadmin@yahoo.com', '2021-05-06 22:59:53'),
(98, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-06 23:01:35'),
(99, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: nemanja@admin.gmail.com', 'nemanja@admin.gmail.com', '2021-05-06 23:05:13'),
(100, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-06 23:06:32'),
(101, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-06 23:18:54'),
(102, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-06 23:35:32'),
(103, 'http://localhost:8000/logout', 'Korisnik sa email se: superadminmika@gmail.comis logovao.', 'superadminmika@gmail.com', '2021-05-06 23:35:42'),
(104, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-06 23:56:04'),
(105, 'http://localhost:8000/logout', 'Korisnik sa email se: superadminmika@gmail.comis logovao.', 'superadminmika@gmail.com', '2021-05-06 23:58:26'),
(106, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-06 23:59:42'),
(107, 'http://localhost:8000/users/3', 'Koririsniku su izvrsena azuriranja naloga: nemanja@admin.gmail.com', 'nemanja@admin.gmail.com', '2021-05-07 00:00:22'),
(108, 'http://localhost:8000/logout', 'Korisnik sa email se: superadminmika@gmail.comis logovao.', 'superadminmika@gmail.com', '2021-05-07 00:00:30'),
(109, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: nemanja@admin.gmail.com', 'nemanja@admin.gmail.com', '2021-05-07 00:00:40'),
(110, 'http://localhost:8000/logout', 'Korisnik sa email se: nemanja@admin.gmail.comis logovao.', 'nemanja@admin.gmail.com', '2021-05-07 00:01:08'),
(111, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-07 00:02:57'),
(112, 'http://localhost:8000/users/3', 'Koririsniku su izvrsena azuriranja naloga: nemanja@admin.gmail.com', 'nemanja@admin.gmail.com', '2021-05-07 00:03:21'),
(113, 'http://localhost:8000/logout', 'Korisnik sa email se: superadminmika@gmail.comis logovao.', 'superadminmika@gmail.com', '2021-05-07 00:03:24'),
(114, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: nemanja@admin.gmail.com', 'nemanja@admin.gmail.com', '2021-05-07 00:03:40'),
(115, 'http://localhost:8000/logout', 'Korisnik sa email se: nemanja@admin.gmail.comis logovao.', 'nemanja@admin.gmail.com', '2021-05-07 00:03:46'),
(116, 'http://localhost:8000/registracija', 'Novi korisnik se registrovao sa: pajapertovic13@yahoo.com', 'pajapertovic13@yahoo.com', '2021-05-07 00:04:54'),
(117, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: pajapertovic13@yahoo.com', 'pajapertovic13@yahoo.com', '2021-05-07 00:05:06'),
(118, 'http://localhost:8000/logout', 'Korisnik sa email se: pajapertovic13@yahoo.comis logovao.', 'pajapertovic13@yahoo.com', '2021-05-07 00:05:49'),
(119, 'http://localhost:8000/logovanje', 'Korisnikse  ulogovao sa: superadminmika@gmail.com', 'superadminmika@gmail.com', '2021-05-07 00:07:57'),
(120, 'http://localhost:8000/users/5', 'Koririsniku je promenjen status: pajapertovic13@yahoo.com', 'pajapertovic13@yahoo.com', '2021-05-07 00:24:24');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `naziv_uloge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `naziv_uloge`) VALUES
(2, 'Administrator'),
(1, 'Korisnik'),
(3, 'Superadministrator\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `naziv_taga` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `datum_kreiranja` timestamp NOT NULL DEFAULT current_timestamp(),
  `datum_azuriranja` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `naziv_taga`, `status`, `datum_kreiranja`, `datum_azuriranja`) VALUES
(1, 'Premier Liga', 1, '2021-05-06 12:30:27', NULL),
(2, 'Liverpool FC', 1, '2021-05-06 12:31:10', NULL),
(3, 'Chelsea', 1, '2021-05-06 13:00:36', NULL),
(4, 'Real Madrid', 1, '2021-05-06 13:02:55', NULL),
(5, 'Zinedine Zidane', 1, '2021-05-06 13:03:56', NULL),
(6, 'Rafael Nadal', 1, '2021-05-06 15:10:35', NULL),
(7, 'Madrid Masters', 1, '2021-05-06 15:10:58', NULL),
(8, 'Eu Masters', 1, '2021-05-06 15:22:55', NULL),
(9, 'Nikola Jokic', 1, '2021-05-06 15:26:08', NULL),
(10, 'Denver Nugets', 1, '2021-05-06 15:26:16', NULL),
(11, 'Marc Marqez', 1, '2021-05-06 15:32:31', NULL),
(12, 'Honda', 1, '2021-05-06 15:32:38', NULL),
(13, 'Arsenal FC', 1, '2021-05-06 22:07:17', NULL),
(14, 'Roma AS', 1, '2021-05-06 22:08:28', NULL),
(15, 'Manchester United', 1, '2021-05-06 22:08:51', NULL),
(16, 'Villareal FC', 1, '2021-05-06 22:09:07', NULL),
(17, 'Mikael Arteta', 1, '2021-05-06 22:12:28', NULL),
(18, 'Nba', 1, '2021-05-06 22:15:25', NULL),
(19, 'Indijana', 1, '2021-05-06 22:17:13', NULL),
(20, 'Kristijano Ronaldo', 1, '2021-05-06 22:29:57', NULL),
(21, 'Dejan Radonjic', 1, '2021-05-06 22:36:15', NULL),
(22, 'Crvena Zvezda KK', 1, '2021-05-06 22:36:28', NULL),
(23, 'Igokea KK', 1, '2021-05-06 22:36:49', NULL),
(24, 'Dejan Milojevic', 1, '2021-05-06 22:39:04', NULL),
(25, 'Buducnost KK', 1, '2021-05-06 22:39:30', NULL),
(26, 'Mornar Bar KK', 1, '2021-05-06 22:39:41', NULL),
(27, 'Luka Doncic', 1, '2021-05-06 22:43:49', NULL),
(28, 'Dalas Mavericks', 1, '2021-05-06 22:44:00', NULL),
(29, 'Miami Heat', 1, '2021-05-06 22:44:21', NULL),
(30, 'Eurolague', 1, '2021-05-06 22:48:16', NULL),
(31, 'Real Madrid KK', 1, '2021-05-06 22:50:03', NULL),
(32, 'Bogdan Bogdanovic', 1, '2021-05-06 22:51:56', NULL),
(33, 'Atlanta Hawks', 1, '2021-05-06 22:52:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ime` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prezime` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lozinka` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `datum_kreiranja` timestamp NOT NULL DEFAULT current_timestamp(),
  `datum_azuriranja` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ime`, `prezime`, `email`, `lozinka`, `status`, `datum_kreiranja`, `datum_azuriranja`) VALUES
(1, 'Petar', 'Strugonja', 'adminpetars@gmail.com', 'fcbacad299ccfb9acbe47de793c8594c', 1, '2021-05-06 11:59:41', NULL),
(2, 'Mika', 'Spremic', 'superadminmika@gmail.com', '6f5ce9ca6f575f334325fd3fd486c48a', 1, '2021-05-06 11:59:41', NULL),
(3, 'Nemanja', 'Jovicic', 'nemanja@admin.gmail.com', '5c48b7de82c90c70b34608f620656a02', 1, '2021-05-06 14:32:12', '2021-05-07 00:03:21'),
(4, 'Mikica', 'Mikic', 'mikicaadmin@yahoo.com', '13628355fb3b3369a64c25f8a898336f', 1, '2021-05-06 22:27:20', NULL),
(5, 'Paja', 'Petrovic', 'pajapertovic13@yahoo.com', '83ac5eb0bbe00cec90cb8a89bbabd433', 0, '2021-05-07 00:04:54', '2021-05-07 00:24:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_naziv_kategorije_unique` (`naziv_kategorije`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `headings`
--
ALTER TABLE `headings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `headings_naziv_rubrike_unique` (`naziv_rubrike`),
  ADD KEY `headings_category_id_foreign` (`category_id`);

--
-- Indexes for table `heading_tag`
--
ALTER TABLE `heading_tag`
  ADD UNIQUE KEY `heading_tag_heading_id_tag_id_unique` (`heading_id`,`tag_id`),
  ADD KEY `heading_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_heading_id_foreign` (`heading_id`),
  ADD KEY `posts_image_id_foreign` (`image_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_naziv_uloge_unique` (`naziv_uloge`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD UNIQUE KEY `role_user_role_id_user_id_unique` (`role_id`,`user_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_naziv_taga_unique` (`naziv_taga`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `headings`
--
ALTER TABLE `headings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `headings`
--
ALTER TABLE `headings`
  ADD CONSTRAINT `headings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `heading_tag`
--
ALTER TABLE `heading_tag`
  ADD CONSTRAINT `heading_tag_heading_id_foreign` FOREIGN KEY (`heading_id`) REFERENCES `headings` (`id`),
  ADD CONSTRAINT `heading_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `posts_heading_id_foreign` FOREIGN KEY (`heading_id`) REFERENCES `headings` (`id`),
  ADD CONSTRAINT `posts_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
