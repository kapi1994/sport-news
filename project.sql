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
(1, '6093e7c7a54a6_1620305863.jpg', 'Menad??er: Nije bilo pregovora o Klopovom odlasku'),
(2, '6093e9ad74c1e_1620306349.jpg', 'Mijatovi??: Zidan je sve pogre??no uradio'),
(3, '609407d3b2f27_1620314067.jpg', 'Zahuktao se: Rafa lako do ??etvrtfinala Madrida'),
(4, '6094085ed454a_1620314206.jpg', 'Laki luzer izbacio Krajinovi??a na startu Madrida'),
(5, '60940a4bc0a7b_1620314699.jpg', 'Karmine Corp doneo Francuskoj tre??u EU Masters titulu'),
(6, '60940ae233673_1620314850.jpg', 'Nezaustavljivi Joki?? 24 za ??etvrtinu, Bogdan raspucan'),
(7, '60940b3bcda70_1620314939.jpg', 'Lete??i Somborac: Zakucavao sam kao tigar!'),
(8, '60940c72b1620_1620315250.jpg', 'Markes posle testa u Heresu: Telo nije izdr??alo'),
(9, '60940d01cc585_1620315393.jpg', 'Jokanovi?? za SK: ??elsi dokazao da je bolji tim od Reala'),
(10, '60946968b4f02_1620339048.jpg', 'Bez engleskog finala: Junajted na Viljareal za trofej u LE!'),
(11, '60946a0ebf22a_1620339214.jpg', 'Arteta razo??aran: Zaslu??ili smo finale'),
(12, '60946b3abbca2_1620339514.jpg', '??ESTOG SUKOB: Okr??aj nekada??njeg asa ABA lige i pomo??nog trenera Indijane'),
(13, '60946bb114bff_1620339633.jpg', 'Dva engleska velikana u borbi za titulu prvaka starog kontinenta!'),
(14, '60946e4b3b5c3_1620340299.jpg', 'Ronaldov dres na licitaciji na Limundu'),
(15, '60946f1020721_1620340496.jpg', '\"U??ATI\" SE VRA??A U KOLEVKU FUDBALA'),
(16, '60946fc48b608_1620340676.jpg', 'RADONJI?? PRED BORBU U LAKTA??IMA: Sitnice ??e odlu??iti pobednika'),
(17, '6094706abdf15_1620340842.jpg', 'MILOJEVI?? PRED MORNAR: Odbrana vodi u finale, oni su sjajan tim'),
(18, '6094710179eaf_1620340993.jpg', 'JOKI?? POVRE??EN! Denver bez najboljeg igra??a u narednom periodu'),
(19, '609471863eda3_1620341126.jpg', 'Don??i?? i Hardavej sru??ili Majami, Adetokumbo bolji od Bruklinovog Drim tim'),
(20, '609471e01d4b7_1620341216.jpg', 'DON??I?? RAZBIO SELTIKSE Vu??evi?? najbolji u porazu ??ikaga'),
(21, '6094727b30bea_1620341371.jpg', 'Laso: Nisam sre??an, ali sam ponosan na ekipu'),
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
(1, 'Menad??er: Nije bilo pregovora o Klopovom odlasku', 'Mark Kosicke, agent Liverpulovog menad??era Jirgena Klopa, nema dilemu da li ??e nema??ki trener ostati na Enfildu.\r\n\r\nCrveni su pro??le sezone prvi put u istoriji osvojili Premijer ligu, a ove su, pored rane eliminacije u Ligi ??ampiona, daleko od plasmana u elitno klupsko takmi??enje Evrope.\r\n???Da li ??e Jirgen da nastavi posao u Liverpulu? Apsolutno. Nije bilo pregovora o njegovom odlasku,??? istakao je Kosicke za Skaj Sport Nema??ka.\r\n\r\nNa pitanje da li u Klopovom ugovoru postoji obe??te??enje koje drugi klub mora da plati ako ??eli da ga anga??uje, agent nije odgovorio.\r\n\r\nKlop je u Liverpulu od 2015. godine i sa engleskom ekipom osvojio je Premijer ligu, Ligu ??ampiona, Superkup Evrope i klupsko prvenstvo sveta.\r\n\r\nTim sa Enfilda trenutno je sedmi u prvenstvu sa 54 boda, a 8. maja u 35. kolu sastaje se sa Sautemptonom.', 1, 1, 1, 1, 2, '2021-05-06 12:57:43', NULL),
(2, 'Mijatovi??: Zidan je sve pogre??no uradio', 'Nekada??nji fudbaler i sportski direktor madridskog Reala Predrag Mijatovi?? smatra da je Zinedin Zidan krivac za eliminaciju Kraljevskog kluba u polufinalu Lige ??ampiona.\r\n\r\n??elsi je u revan??u na Stamford Brid??u do nogu potukao Madri??ane (2:0) i ukupnim rezultatom 3:1 obezbedio borbu za trofej i duel sa Man??ester Sitijem 29. maja u Istanbulu.\r\n?????elsi je bio superioran u svakom pogledu. Intenzitet, ritam, stvaranje ??ansi??? Volimo Zidana, mnogo toga je uradio, ali u revan??u u Londonu je sve pogre??no u??inio,??? rekao je Mijatovi?? za beIN Sport i nastavio:\r\n\r\n???Ovo ??e naneti veliku ??tetu Zidanu. Tako je bilo i pro??le godine, ali je osvajanje prvenstva ??panije pokrilo neke stvari. Videli ste da Realovi igra??i nisu hteli da promene sliku na terenu. Vinisijus je igrao na poziciji koja mu ne odgovara. Real prakti??no nije napravio ni??ta. Vide??emo ??ta ??e biti u prvenstvu. Imam ose??aj da Real nudi malo toga da pomislite da ??e sezona zavr??iti dobro.???', 1, 1, 4, 2, 2, '2021-05-06 13:05:49', NULL),
(3, 'Zahuktao se: Rafa lako do ??etvrtfinala Madrida', '??panski teniser Rafael Nadal plasirao se u ??etvrtfinale Mastersa u Madridu po??to je rezultatom 2:0 bio bolji od Australijanca Alekseja Popirina. Protivnik u borbi za polufinale za igra??a sa Majorke bi??e bolji iz duela koji igraju Danijel Evans i Aleksandar Zverev.\r\n\r\nPo setovima bilo je 6:3, 6:3 za drugog igra??a sveta posle 80 minuta tenisa.\r\n\r\nNadal je silno krenuo, napravio je dva brejka u drugom i tre??em gemu u kojem je servirao Popirin, a potom je ispustio jedan gem na svoj servis. Ipak, pri rezultatu 5:3 sledi novi brejk koji pravi ??panac i on koristi prvu-set loptu za vo??stvo.\r\n\r\nU drugom setu Nadalu je bio dovoljan samo brejk u drugom gemu, a potom je lako sa??uvao prednost do kraja me??a.\r\n\r\nBio je ovo sedmi uzastopni trijumf za Nadala, koji je prethodno slavio i u Barseloni i u drugom kolu protiv Pabla Alkarasa. Na taj na??in osvaja?? 13 titula na Rolan Garosu di??e formu pred drugi Gren slem turnir u sezoni.\r\n\r\nTurnir u Madridu igra se od 2002. godine, a aktuelni ??ampion je Novak ??okovi??, koji je slavio 2019. godine savladav??i Stefanosa Cicipasa. Ovaj turnir koji se igra na ??ljaci nije odr??an 2020. godine zbog pandemije koronavirusa.\r\n\r\n??okovi?? u Madridu ove godine ne??e braniti trofej.', 1, 3, 9, 3, 3, '2021-05-06 15:14:27', NULL),
(4, 'Laki luzer izbacio Krajinovi??a na startu Madrida', 'Srpski teniser Filip Krajinovi?? pora??en je na startu mastersa u Madridu, po??to je bolji od njega bio Japanac Ni??ioka u dva seta 6:2, 6:4.\r\n\r\nPrvobitno je Krajinovi?? trebalo da igra protiv Kamerona Norija, ali je Britanac odustao. Umesto njega je uleteo Ni??ioka kao laki luzer i u potpunosti iskoristio ??ansu.\r\n\r\nPobedio je 24 mesta bolje plasiranog Krajinovi??a za svega 79 minuta, a 36. reketu sveta nije dopustio nijedan brejk i samo jednu brejk loptu i to u zavr??nici drugog seta. Sa druge strane iskoristio je tri od sedam brejk lopti.\r\n\r\nU narednom kolu Ni??ioka ??e igrati protiv boljeg iz duela O??e-Alijasim ??? Kasper Rud.', 1, 3, 9, 4, 3, '2021-05-06 15:16:46', NULL),
(5, 'Karmine Corp doneo Francuskoj tre??u EU Masters titulu', 'Glavni favorit 2021 prole??nog EU Mastersa Karmine Corp je uspeo da do??e do titule u svojoj debitantskoj sezoni u takmi??enju savladav??i ??ampiona Engleske BT Excel 3-1 u velikom finalu.\r\n\r\nOd kako su se pro??le sezone pojavili na francuskoj LoL esport sceni, Karmine Corp ne prestaje da privla??i ogromno interesovanje koje je na sre??u po njihove navija??e ispra??eno dobrim rezultatima. Nakon ??to su osvojili francusku LFL ligu Karmine Corp je nastavio sa nizanjem uspeha i odneo pehar na EU Mastersu.\r\n\r\nOvo je tre??i put za redom da jedan tim iz francuske osvaja prole??ni EU Masters, a ako igra??i Karmine Corp-a ostanu na okupu, pitanje je da li ??e iko mo??i da ih zaustavi u pohodu na letnju titulu.\r\n\r\nNjihovi me??evi su konstantno obarali rekorde gledanosti EU Mastersa, da bi na kraju samo finale pratilo preko 377.000 istovremenih gledalaca ??to je nadma??ilo sva o??ekivanja. Karmine Corp je za manje od godinu dana pre??ao po popularnosti mnoge LEC timove, ??to je podiglo veliku pra??inu i izazvalo mno??tvo diskusija u vezi toga da li i koliko se timovi u elitnoj evropskoj LoL ligi trude da izgrade fan bazu, i koliko je ??tetan sistem fran??ize kojim je spre??eno da novi timovi ulaze u takmi??enje.\r\n\r\nPodsetimo, Karmine Corp je protutnjao kroz grupnu fazu EU Mastersa sa 6-0 skorom, da bi prvi poraz do??iveli od EBL ??ampiona ??AIM SE SuppUp u ??etvrtfinalu, ali i pored poraza u prvoj partiji uspeli su da spre??e iznena??enje i preokrenu rezultat u nastavku.\r\n\r\nU polufinalu je pao prvak ??panije UCAM Esports Club, dok je BT Excel do finala do??ao pobedom protiv mousesportsa.\r\n\r\nBT Excel je uspeo da zada prvi udarac u finalu, ali je Karmine Corp uspeo da prelomi sve tri naredne partije u svoju korist zahvalju??i kako dobroj timskoj igri, tako i velikom individualnom kvalitetu koji su igra??i demonstrirali, pogotovo francuski mid lejner Lucas ???Saken??? Fayard koji je svojom igrom zasigurno zaslu??io povratak u LEC.', 1, 4, 14, 5, 3, '2021-05-06 15:24:59', NULL),
(6, 'Nezaustavljivi Joki?? 24 za ??etvrtinu, Bogdan raspucan', 'Odli??an u doma??oj ekipi bio je novajlija Ostin Rivers sa 25 poena (6/9 za tri), Majkl Porter junior je dodao 17, a Fakundo Kampaco 16, uz 9 skokova, 4 asistencije, 5 ukradenih lopti i 2 blokade.\r\n\r\nKod Niksa najefikasniji je bio Imanuel Kvikli sa 18 poena, a Derik Rouz, Red??i Bulok, D??ulijus Rendl i Er D??ej Beret su zabele??ili po 14 poena.\r\n\r\nDenver se posle ubedljivog trijumfa vratio na tre??u poziciju na Zapadu pred paklen fini?? liga??kog dela sezone. Nagetse, naime, od preostalih ??est me??eva o??ekuje pet gostovanja ??? lideru konferencije Juti, ??arlotu, Mineosti, Detroitu i Portlandu, dok ??e na svom terenu igrati samo sa Bruklinom.\r\n\r\nAtlanta je u D??ord??iji deklasirala Finiks rezultatom 135:103 i tre??im uzastopnim trijumfom do??li na korak do ??etvrte pozicije Istoka sa u??inkom 37-30.\r\n\r\nHoksi su u poslednju ??etvrtinu u??li sa devet poena prednosti, ali su u ??etvrtom periodu ???eksplodirali??? i naneli te??ak posaz odli??nom timu iz Arizone. Koliko im je trijumf zna??ajan potr??uje i izjava trenera Nejta Mekmilana da su ???Sansi najbolji tim u ligi.???', 1, 2, 8, 6, 3, '2021-05-06 15:27:30', NULL),
(7, 'Lete??i Somborac: Zakucavao sam kao tigar!', 'Centar Denver Nagetsa Nikola Joki?? sigurno kora??a ka nagradi za najkorisnijeg igra??a regularnog toka NBA sezone, a najzaslu??niji za njegove fantasti??ne partije nije atleticizam ve?? su to briljantne ko??arka??ke ve??tine. Me??utim, u pobedi nad Njujork Niksima u no??i izme??u srede i ??etvrtka srpski reprezentativac odu??evio je publiku sa nekoliko impresivnih zakucavanja.\r\n\r\nJoki?? je bio nadmo??an u prvoj ??etvrtini duela sa Nikerbokersima i ubacio je dvostruko vi??e poena nego ??itava protivni??ka ekipa u prvih 12 minuta (24:12). Joki?? je imao ??etiri zakucavanja u pobedi, ??ime je izjedna??io rekord karijere, a sva ??etiri je zabele??io u prvoj deonici.\r\nNe znam??? Bila su to tigrovska zakucavanja. Skoro??? Fakunod Kampaco me je dobro pronalazio na ??eonoj liniji. Ostalih se ne se??am. Znam da sam napadao obru?? i da sam bio agresivan, to je dobro???, izjavio je posle me??a Nikola Joki?? kroz ??alu, pokazuju??i ???kand??e??? ??akama kada je govorio o svojim ???kucanjima???.\r\n\r\nJoki?? je duel zavr??io sa 32 poena (10/16 iz igre, 0/2 za tri, 12/15 slobodna bacanja), uz 12 skokova, 6 asistencija, pod 2 ukradene lopte i blokade i ??etiri izgubljene lopte za svega 29 minuta na parketu u ubedljivoj pobedi.\r\n\r\nJoki?? je u sezoni 2020/2021. ukupno zakucao 45 puta, ??to mu je li??ni rekord, a to je ??ak triput vi??e od broja zakucavanja iz prethodne sezone.\r\n\r\n???Nemam neko posebno obja??njenje ??? tim me pronalazi u dobrim pozicijama, a ja poga??am. Tako se ispostavilo???, rekla je prva zvezda tima iz Kolorada.\r\n\r\nJoki?? u teku??oj sezoni na 66 utakmica kao starter prose??no bele??i 26,4 poena (56,5% iz igre, 40,5% za tri, 85,8% penali), 10,9 skokova i 8,4 asistencije za 35 minuta u igri.\r\n\r\nDenver je posle ove pobede na tre??em mestu tabele Zapadne konferencije sa 44 pobede i 22 poraza, ali ih do kraja sezone ??eka prili??no te??ak raspored sa pet gostovanja u ??est me??eva.', 1, 2, 8, 7, 3, '2021-05-06 15:28:59', '2021-05-06 15:29:03'),
(8, 'Markes posle testa u Heresu: Telo nije izdr??alo', 'Posle trka??kog vikenda u Heresu, Mark Markes nije imao ba?? uspe??no testiranje na stazi \"Anhel Nijeto\". Osmostruki svetski ??ampion je imao samo jedan izlazak na stazu jer i dalje ose??a poseldice pada koji mu se desio na tre??em slobodnom treningu pred Veliku nagradu ??panije u subotu.\r\n\r\nMark Markes je za vikend vozio drugu trku ove sezone. Nije ba?? imao dobar rezultat u Heresu i definitivno on nije na nivou kada je osvajao titule. ??panac i dalje ose??a posledice povrede ruke, a novi udes u kom je povredio vrat mu sigurno nije pomogao. Testiranje u Heresu tako??e nije bilo uspe??no za Marka.???Nismo zaista testirali danas, samo jedan izlazak jer na drugom izlasku moje telo nije izdr??alo. Vrat i desno rame su bili uko??eni, sli??no kao posle Portimaa ali nisam bio tako uko??en. Udes koji sam imao u subotu nije pomogao mom fizi??kom stanju. Mislio sam da ??e mi telo biti bolje kada se zagreje i probao sam odmah ali nisam bio na nivou za vo??nju???, kazao je Mark Markes posle testiranja u ponedeljak.\r\n\r\nOn dodaje da je neophodan postepeni napredak i da je slede??i cilj Le Man. Markes je bio sedmi u Portugalu i deveti u ??paniji, a za liderom je u Heresu zaotsajao deset sekundi. To je napredak u odnosu na portugalski zaostatak od 13.', 1, 5, 12, 8, 3, '2021-05-06 15:34:10', NULL),
(9, 'Jokanovi?? za SK: ??elsi dokazao da je bolji tim od Reala', 'Sino??ni polufinalni obra??un ??elsija i Reala gledao se ??irom planete, razumljivo je, valjda, ??to ga ni Katar, doma??in predstoje??eg Svetskog prvenstva u fudbalu, nije ignorisao, pa, me??u onima prikovanim za fotelju i TV ekran, od devet do 11 uve??e, u tom svetu na??ao se i Slavi??a Jokanovi??, biv??i prvotimac londonskih ???Plavaca??? (2000. do 2002), sad poznato, cenjeno trenersko ime (aktuelni ??ef struke u Al Garafi).\r\n\r\nDa li da postavimo pitanje za koga je navijao? Dilema je kratko trajala, otprilike kao i kasnija Jokanovi??eva konstatacija na jedno od slede??ih pitanja vezanih za kvalitet ekipa (?????elsi dokazao da je bolji tim od Reala!???).???Navijao? Ma, davno sam prestao da navijam, dogodilo se to onog trena kad sam obukao dres Vojvodine. Pre toga, dok sam igrao za Novi Sad, mo??da se negde i nekud provla??ila moja navija??ka strast, kasnije, rekoh, sve je nestalo. ??to se simpatija ti??e, tako??e je kristalno jasno, uvek ih poklanjam timu ??iji sam nekad bio deo, sad smo, verujem, i to odgonetnuli???, objasnio je Jokanovi?? na po??etku intervjua za Sport Klub.\r\n\r\nPobedili ste?\r\n\r\n???Dobro, kad ste ve?? navalili, pobedili smo???, uzvratio je ???Jokan??? uz neizbre??ni osmeh.\r\n\r\nMoglo je i ubedljivije, rezultatski, londonskih 2:0 ne predstavlja realnu sliku?\r\nOno osnovno, najva??nije, svodi se na nekoliko re??i: ??elsi je u??ao u finale Lige ??ampiona. I, posle svega, mo??e da se sladi, kako plasmanom, tako i igrom???.\r\n\r\nOtresito, hrabro, napada??ki, nadmo??no u 180 i kusur minuta, sabrano sa madridskim okr??ajem?\r\n\r\n???Ne postoji ni najmanji argument da neko baci bilo kakvu senku, ogromna ve??ina tih minuta pripala je londonskom sastavu, ??elsi je u oba me??a bio ja??i, dokazav??i da u ovom trenutku ima bolji, kvalitetniji tim. ??ta je mislio Real? Da ??e predstavom u kojoj je jedva pobedio Osasunu u La Ligi, da saplete ??elsi i izbori zavr??nicu u Evropi?! Nedeljama je van forme, spoti??e se u doma??em ??ampionatu, bled je, jednostavno. A, poku??ao da se adaptira na igru ??elsija?! Trojica pozadi? I kod ku??e, i na gostovanju? Nikako nije i??lo. O??ekivao sam da se tu ne??to promeni.???', 1, 1, 4, 9, 3, '2021-05-06 15:36:33', NULL),
(10, 'Bez engleskog finala: Junajted na Viljareal za trofej u LE!', 'Fudbaleri Man??ester Junajteda i Viljareala igra??e u finalu Lige Evrope! Crveni ??avoli su u polufinalnom dvome??u bili bolji od Rome ukupnim rezultatom 8:5 (6:2, 2:3), dok je ??uta podmornica savladala Arsenal sa 2:1 (2:1, 0:0). U finalu Lige ??ampiona gleda??emo engleski okr??aj izme??u Man??ester Sitija i ??elsija, ali to ne??e biti slu??aj i sa drugim po kvalitetu evropskim takmi??enjem. Posao Ostrvljanima pokvario je Viljareal, koji brani ??ast ??panije i ostatka Evrope u borbi za trofej 26. maja u Gdanjsku.\r\n\r\nJunajted je ve?? posle prve utakmice i trijumfa od 6:2 bio vi??en u finalu, pa je duel u Rimu predstavljao odra??ivanje posla za Crvene ??avole.\r\n\r\nPoput okr??aja na Old Trafordu, i duel na Olimpiku bio je izuzetno efikasan i zanimljiv. Gosti su vodili, zatim doma??i preokrenuli, pa je Junajted do??ao do poravnanja, pre nego ??to je Roma u fini??u uspela da slavi i pobedom se oprosti od takmi??enja.\r\nEdinson Kavani je doveo Engleze u vo??stvo u 39. minutu. Taj rezultat je bio aktuelan do 57. kada je Edin D??eko izjedna??io. Samo tri minuta kasnije, Brajan Kristante je doneo Vu??ici prvo vo??stvo na me??u, ali je ono potrajalo svega osam minuta, pre nego ??to je Kavani jo?? jednom pogodio sa 2:2.\r\n\r\nNi tu nije bio kraj. Ulazak Nikole Zalevskog u 76. minutu ispostavio se kao klju??an, po??to je 19-godi??nji Poljak u 83. doneo ???jalov??? trijumf italijanskom klubu.', 1, 1, 5, 10, 3, '2021-05-06 22:10:48', NULL),
(11, 'Arteta razo??aran: Zaslu??ili smo finale', 'Menad??er Arsenala Mikel Arteta ne krije razo??aranje zbog ispadanja u polufinalu Lige Evrope, po??to veruje da je njegov tim zaslu??io plasman u finale.\r\n\r\nTobd??ije su remizirale bez golova protiv Viljareala u revan??u na Emirejtsu, ??ime nisu uspele da nadoknade poraz iz prvog duela (2:1).???Razo??aran sam. Poku??ali smo sve, mislim da smo zaslu??ili da pro??emo u finale. Neki detalji su odlu??ili. Imali smo tri velike ??anse, dok oni nisu stvorili nijednu, ali su ipak pro??li???, rekao je Arteta.\r\n\r\nUsledio je osvrt na prvi me?? u ??paniji, koji je bio presudan.\r\n\r\n???Mnogo je stvari. U Viljarealu nismo dobro otvorili utakmicu. Nismo bili spremni na pravi na??in, a ni svi igra??i nisu bili na nivou. Mnogi od njih su igrali svoje prvo polufinale, nemaju iskustvo u takvim me??evima???.\r\n\r\nArsenal je propustio ??ansu da se kroz potencijalno osvajanje Lige Evrope domogne Lige ??ampiona slede??e sezone.\r\n\r\n???Ostaje nam da se kroz Premijer ligu domognemo Evrope. Imamo ??etiri utakmice pred nama i poku??a??emo sve. Ipak, razo??aranje je veliko???, zaklju??io je ??panac.\r\n\r\nU finalu Lige Evrope 26. maja u Gdanjsku sasta??e se Man??ester Junajted i Viljareal', 1, 1, 5, 11, 3, '2021-05-06 22:13:34', NULL),
(12, '??ESTOG SUKOB: Okr??aj nekada??njeg asa ABA lige i pomo??nog trenera Indijane', 'Menad??ment NBA liga??a Indijane suspendovao je na jedan me?? pomo??nog trenera Grega Fostera i nov??ano kaznio ko??arka??a Gruzina Gogu Bitadzea, zbog verbalnog sukoba na utakmici sa Sakramentom.\r\n\r\nKingsi uspe??no zavr??ili jedan napad, i to zakucavanjem preko Bitadzea, na ??ta je Foster glasno zamerio Bitadzeu ??to nije bolje reagovao u odbrani.\r\n\r\nBitadze je potom pogodio trojku na drugoj strani, a onda se okrenuo ka Fosteru i uz psovku mu rekao: \'\'Sedi, dole!\'\'', 1, 2, 8, 12, 3, '2021-05-06 22:18:34', NULL),
(13, 'Dva engleska velikana u borbi za titulu prvaka starog kontinenta!', 'Fudbaleri ??elsija plasirali su se u finale Lige ??ampiona po??to su u revan?? me??u u Londonu na svom stadionu savladali ekipu Real Madrida sa 2:0 (1:0).\r\n\r\nPrvi me?? u ??paniji okon??an je nere??enim rezultatom, pa su ova dva pogotka u Engleskoj prakti??no re??ila pitanje drugog finaliste. Strelci za doma??ina bili su Verner u 28. i Maunt u 85. minutu me??a. \r\n\r\nNastavlja se tradicija po kojoj Real nikada nije uspeo da elimini??e ??elsi iz Evrope. Tako??e, \"Plavci\" ??e posle 9 godina ponovo igrati u finalu ovoga najelitnijeg fudbalskog takmi??enja u Evropi nakon ??uvenog me??a sa Bejernom i pobede posle boljeg izvo??enja penala. \r\n\r\nJu??e je svoje mesto u finalu obezbedio Man??ester siti koji je eliminisao francuski PS??. \"Gra??ani\" su u oba me??a bili bolji od velikana iz Pariza i prakti??no rutinski odradili posao u polufinalu. \r\n\r\nDa li ??e tako biti i u finalu sazna??emo 29. maja u Istanbulu.Trener fudbalera ??elsija Tomas Tuhel rekao je da ??e u revan??u sa Real Madridom sve biti mogu??e.\r\n\r\n\"Sve bi bilo mogu??e u revan??u, ??ak i da smo pobedili ovde\", rekao je Tuhel posle utakmice u Madridu.\r\n\r\nReal Madrid i ??elsi igrali su nere??eno 1:1 u prvoj utakmici polufinala Lige ??ampiona.\r\n\r\n\"Pro??lo je tek poluvreme i mora??emo da se borimo za svaki centimetar i da steknemo prednost na svakom delu terena. Moramo da se borimo i zaslu??imo prolaz\", kazao je Tuhel.\r\n\r\nKada je re?? o prvoj utakmici, Tuhel je naveo da ima ose??aj da je njegova ekipa trebalo da ima prednost na poluvremenu i da je ve?? tada susret trebalo da bude re??en.\r\n\r\nTrener Real Madrida Zinedin Zidan rekao je da je zadovoljan, posebno izdanjem njegovog tima u drugom poluvremenu.\r\n\r\n\"??ivi smo. Sre??ni smo time ??ta smo postigli u prvom duelu, generalno. Znamo da smo dobri, ali i rival je. ??elsi je sa razlogom u polufinalu\", rekao je Zidan.\r\n\r\nRevan?? ??e se igrati u Londonu.', 1, 1, 4, 13, 3, '2021-05-06 22:20:33', NULL),
(14, 'Ronaldov dres na licitaciji na Limundu', 'Od Kristijana za Gavrila! Za njegovu pobedu! Posle humanitarne licitacije na kojoj je Mozzart kupio Ronaldovu kapitensku traku, Portugalac je re??io da po??alje svoj potpisan dres Juventusa sa porukom ???para Gavrilo???! Zlata vredni crno-beli dres stigao je u Mozzartovo sedi??te pravo iz Torina, a ova kompanija nastavlja niz aukcija koje se u poslednje vreme organizuju u cilju prikupljanja sredstava za najskuplji lek na svetu. I ovaj komad opreme najve??e fudbalske zvezde dana??njice postavljen je na Limundu, sa po??etnom cenom od milion dinara!\r\n\r\nGavrilo ??ur??evi?? ima osam meseci i boluje od spinalne mi??i??ne atrofije, a potrebno mu je jo?? oko milion evra za le??enje. Mozzart je zahvaljuju??i fudbalskim menad??erima iz agencije LIAN Sports Nikoli Damjancu i Faljiju Ramadaniju uspeo da do??e do Ronalda i pozove ga da se priklju??i akcijama.\r\n\r\nKapiten evropskih ??ampiona ??uo je da je slu??aj ???traka??? imao humanitarni odjek i da je tada u fond oti??lo 64.000 evra. Bilo mu je drago da je od tog celog doga??aja na kraju ispalo ne??to veoma lepo i odlu??io je da po??alje svoj potpisan dres. Para Gavrilo! Pela vitoria de Gavrilo!\r\nKristijano je u revoltu bacio svoje kapitensko obele??je posle poni??tenog gola na me??u Srbija ??? Portugal, ali se niko ne??e se??ati rezultata 2:2, ni uklizavanja Mitrovi??a, ni besa Ronalda. Pamti??e se samo ona udarna pri??a iz svetskih medija - da je jedan vatrogasac uzeo traku i iskoristio je za pomo?? osmomese??noj bebi. ??or??e Vuki??evi?? je sa organizacijom ???Zajedno za ??ivot??? Jovana Simi??a digao celu Srbiju na noge sa tom aukcijom, a Mozzart se nije zaustavio na kupovini trake i donaciji od 7,5 miliona dinara.\r\n\r\nGlavni cilj je bio da se probudi dru??tveno-odgovorna svest i kod drugih pojedinaca, firmi, organizacija, a licitacije su se nastavile ??? Stefan Mitrovi?? je dao svoje kopa??ke i dres sa ??uvenog me??a na Marakani, njegov prezimenjak Aleksandar tako??e dres Srbije???\r\n\r\nOvaj Ronaldov nije sa grbom Portugala, nego Juventusa, ali asocira na ono ??to je Gavrilu neophodno u ovom trenutku - timska igra na humanost! U njoj se ne??e pamtiti individualni potezi, ali je Kristijanova asistencija za svaku pohvalu.', 1, 1, 4, 14, 4, '2021-05-06 22:31:39', NULL),
(15, '\"U??ATI\" SE VRA??A U KOLEVKU FUDBALA', 'TRE??E englesko finale Lige ??ampiona u poslednjih 13 godina zakazali su ??elsi i Man??ester Ako ne bude nekih promena, \"plavci\" i \"gra??ani\" ??e 29. maja na olimpijskom stadionu \"Ataturk\" u Istanbulu imati priliku da vrate \"u??ati\" trofej na Ostrvo, nakon Liverpula koji je 2019. tako??e pobedio zemlja??ki Totenhem.\r\n\r\n??elsi, samo ??to je tada sa druge strane bio tim iz crvenog dela Man??estera 2008, koji je slavio posle one ??uvene penal serije u kojoj se D??on Teri okliznuo.\r\n\r\nSada su u finalu ekipe koje su prethodnih 20 godina postale sinonim za rasipni??tvo i na ostrvskom i kopnenom delu Starog kontinenta va??e za ve??e tro??ad??ije. Dovoljno je re??i da je ??elsi samo ovog leta, posle godinu dana zabrane UEFA, na poja??anja potro??io vi??e od 250 miliona evra. Sa druge strane, Siti nakon ??to ga je preuzeo ??eik Mansur bin Zajed, postao je evropska supersila, ali bez \"srebrnine\" iz evrokupova, svaki utro??eni petrol dolar je gubio svoj smisao. Ipak, ove godine \"gra??ani\" dobili prvu priliku u svojoj istoriji da se bore za najvredniju amforu u evropskom fudbalu.siti pobedama nad Real Madridom i PS?? u polufinalima.', 1, 1, 1, 15, 4, '2021-05-06 22:34:56', NULL),
(16, 'RADONJI?? PRED BORBU U LAKTA??IMA: Sitnice ??e odlu??iti pobednika', 'KO??ARKA??I Crvene zvezde igraju u petak 7. maja od 18.30 ??asova u Lakta??ima protiv Igokee, u drugom me??u polufinala ABA lige.\r\nTrener ko??arka??a Crvene zvezde Dejan Radonji?? izjavio je da o??ekuje fizi??ki zahtevan me??.\r\n\r\n- O??ekujem fizi??ki zahtevan me??, a u takvoj utakmici moramo da odigramo vrlo ??vrsto, skocentrisano svesni da u ovakvim duelima sitnice prave razliku. Tri dana nije veliki period, ali smo u??inili sve da osve??imo ekipu i spremni do??ekamo ovu utakmicu 65. zvani??nu u ovoj sezoni - rekao je Radonji??, a preneo je sajt kluba.', 1, 2, 7, 16, 4, '2021-05-06 22:37:56', NULL),
(17, 'MILOJEVI?? PRED MORNAR: Odbrana vodi u finale, oni su sjajan tim', 'KO??ARKA??I Budu??nost pobedili su Mornar u prvom me??u polufinalne serije sa 97:88, a uo??i drugog me??a koji je na programu 7. maja, sa po??etkom u 21 ??as u Baru, odlu??ni su u nameri da iskoriste prvu me?? loptu i stignu do finala.\r\nDejan Milojevi??, trener Budu??nosti, i dalje je pri stavu koji je izneo pre po??etka doigravanja, da klju?? uspeha u borbi za plasman u finale, odnosno u borbi za osvajanje trofeja, le??i u odbrani.\r\n\r\n- O??ekuje nas druga utakmica polufinalne serije. Mornar je sjajan tim, igraju dobro na svom parketu i u gostima. Posebno su opasni u Baru. Radi se o ofanzivno verovatno najja??oj ekipi u ABA ligi, a samim tim, name??e se zaklju??ak da do ostvarenja cilja, a to je plasman u finale, klju?? le??i u odbrani. Rekao sam pre po??etka doigravanja da je odbrana ta koja donosi pobede koja vodi do osvajanja trofeja. Ukoliko defanzivne zadatke odradimo u skladu sa dogovorom i na nivou na kojem mo??emo, a verujem da ho??emo, imamo realne ??anse da ve?? u Baru izborimo plasman u finale - izjavio je trener Budu??nosti.\r\n\r\nUtakmica izme??u Mornara i Budu??nosti igra se 7. maja sa po??etkom u 21 ??as. Istog dana, sa po??etkom u 18 ??asova i 30 minuta, snage ??e odmeriti Igokea i Crvena zvezda. Budu??nost i Crvena zvezda vode u polufinalnim serijama sa 1:0.', 1, 2, 7, 17, 4, '2021-05-06 22:40:42', NULL),
(18, 'JOKI?? POVRE??EN! Denver bez najboljeg igra??a u narednom periodu', 'NAGETSI su obezbedili plej-of, Nikola Joki?? je glavni kandidat za MVP nagradu, Meloun je najbolji trener ba Zapadu, sve je idealno u Denveru. ili mo??da ipak nije?\r\nNikola Joki?? je bez premca jedan od predvodnika Denvera, on je ove sezone upisao ??ak 54. dabl-dabl u??inka. Tako??e je na poslednjoj igranoj utakmici, kada su pora??eni od Lejkersa, upisao neverovatnih 36. poena.  \r\n\r\nTako??e, Joki?? je jedan od kandidata za presti??nu MVP nagradu. \r\n\r\n- Denver je sada na u??inku 9-1, uz Top5 po ko??-razlici otkako je D??amal Marej povre??en. To uklju??uje i u??inak 7-1 otkako se Mareju \'priklju??io\' njegov naslednik u startnoj postavi, Monte Moris, a 5-0 otkako se njima pridru??io ??lan startne postave Vil Barton. U toj seriji, Joki?? ima proseke od 27 poena, 11 skokova i sedam asistencija, uz nestvarnu preciznost ??uta. Prili??no jako MVP upinjanje - poru??io je Divajn.', 1, 2, 8, 18, 4, '2021-05-06 22:43:13', NULL),
(19, 'Don??i?? i Hardavej sru??ili Majami, Adetokumbo bolji od Bruklinovog Drim tim', 'Pro??le no??i u NBA ligi odigrano je sedam utakmica. \"Srpski derbi\" izme??u Dalasa i Majamija protekao je bez u??inka na??ih reprezentativaca, po??to ni Marjanovi?? ni Bjelica nisu ulazili u igru.Mevsi nose ceo plen sa Floride po??tro su savladali hitse sa 127:113, a ako nije bilo okr??aja reprezentativaca Srbije videli smo odli??ne role dva reprezentativca Slovenije.\r\n\r\nLuka Don??i?? je sa 23 poena, 12 skokova i osam asistencija blistao u ekipi Dalasa, dok je Goran Dragi?? sa druge strane upisao 19 poena uz pet skokova i tri asistencije.\r\n\r\nNajefikasniji na me??u bio je Tim Hardavej mla??i sa 36 poen od ??ega ??ak deset trojki.', 1, 2, 8, 19, 4, '2021-05-06 22:45:26', NULL),
(20, 'DON??I?? RAZBIO SELTIKSE Vu??evi?? najbolji u porazu ??ikaga', 'LUKA Don??i?? se vratio na parket i ko??arka??i Dalasa zabele??ili su pobedu nad Boston Seltiksima 113:108.Mladi Slovenac je ponovo bio dominantna figura sa 36 poena, 8 skokova i 5 dodavanja,a pratio ga je D??ejlen Brunson sa 21 poena te Kristaps Potzingins sa 19 ko??evaKo??arka??i Oklahome savladali su Toronto na svom terenu sa 113:103, a Aleksej Poku??evski nije bio u sastavu jer je pozitivan na koronu. I Minesota je na svom terenu u dramati??noj zavr??nici nadigrala NJujork sa 102:101.\r\n\r\nSrpski internacionalac Alekseja Poku??evskog koji je pozitivan na koronu, nije bilo u sastavu Oklahome, ali je njegova ekipa iza??la na kraj sa Torontom i sa 113:103 stigla do 20. slavlja u sezoni.\r\n\r\nNajefikasniji u timu Oklahome bio je Svjatoslav Mihaljuk sa 22 poena i devet skokova.\r\n\r\n\r\nNajefikasniji igra?? me??a bio je Geri Trent sa 31 postignutim poenom u pora??enom timu Toronta ali im je to bila slaba uteha.\r\n\r\nMajami je pobedio Indijanu sa 92:87, a Nemanja Bjelica je dobio samo 5 minuta u igri i zabele??io je 1 skok, dok je Goran Dragi?? ubacio 12 poena, a Dankan Robinson 20.\r\n\r\nNikola Vu??evi?? je opet bio najbolji u ??ikagu ali nije mogao da ih povu??e do pobede nad Finiksom 121:116. Vu??evi?? je ubacio 24 poena uz 10 skokova, ali na drugoj strani u redovima Finiksa, Devin Buker je briljirao sa 45 ko??eva.\r\n\r\nBruklin je bio siguran na svom parketu protiv Hjustona sa 120:108, a tim su predvodili Kajri Irving i D??o Heris.\r\n\r\nIrving je ostvario dabl-dabl u??inak sa 31 poenom i 12 asistencija, dok je Haris postigao 28 poena uz ??est skokova.', 1, 2, 8, 20, 4, '2021-05-06 22:46:56', NULL),
(21, 'Laso: Nisam sre??an, ali sam ponosan na ekipu', 'Pablo Laso, trener Reala iz Madrida, nije bio preterano neraspolo??en posle poraza od Efesa u odlu??uju??em petom???Nisam sre??an, to je logi??no, jer smo ostali bez mesta na finalnom turniru, a bili smo veoma blizu. Me??utim, moram da naglasim da sam ponosan na momke koje treniram, na kompletnu ekipu. Pokazali smo karakter, borili se od prvog kola Evrolige, pa sve do odlu??uju??eg petog me??a ??etvrtfinalne serije. Dali smo sve od sebe, ali nismo uspeli da stignemo do same zavr??nice. Nedostajalo je i malo sre??e, ali??????, rekao je trener Reala, Pablo Laso, pa nastavio:\r\n\r\n???Protiv Efesa smo lako izgubili prva dva me??a, a kada su nas svi otpisali, uspeli smo da se vratimo u Istanbul. Imali smo mnogo problema u utakmicama koje smo igrali na na??em parketu, stizali smo veliku prednost rivala, uspevali da napravimo velike preokrete. U me??u odluke, bili smo u igri sve do poslednjih sekundi, odlu??ila je jedna lopta, a na na??u ??alost ta jedna lopta je zavr??ila u rukama igra??a Efesa, kojima ??elim sve najbolje na finalnom turniru koji sledi???.\r\n\r\n me??u za mesto na finalnom turniru Evrolige u Kelnu.', 1, 2, 6, 21, 4, '2021-05-06 22:49:31', '2021-05-06 22:51:13'),
(22, 'BOGDAN TROJKAMA UGASIO SUNCE', 'KO??ARKA??I Atlante razbili su Finiks sa 135:103 u utakmici u kojoj je ??ak sedam igra??a Hoksa imalo dvocifren ko??geterski u??inak. Najbolji me??u njima Kapela sa 18, a odmah za njim Bogdan Bogdanovi?? sa 16 poena, od ??ega ??etiri trojke.\r\nKod Sansa, Devin Buker je sa 30 poena bio ubedljivo najefikasniji, osim njega istakao se Mikal Brid??is sa 18 poena.\r\n\r\nHoksi su peti na Istoku sa skorom 37-30, istim brojem pobeda i jednim porazom vi??e od trenutno ??etvrtih Niksa. Finiks je sa skorom 47-19 ostao drugi na Zapadu.', 1, 2, 8, 22, 4, '2021-05-06 22:53:18', NULL),
(23, 'Garin izbacio Medvedeva', 'Turnir u Madridu ostao je bez drugog nosioca. ??ileanac Kristijan Garin je savladao Danila Medvedeva posle tri seta 6:4, 6:7 (2:7), 6:1.\r\n\r\nGarin je sjajno servirao i to je ono ??to mu je pomoglo da savlada finalistu Australijan opena. U prvom setu jedini brejk je vi??en u tre??em gemu. ??ileanac je poveo 2:1 i do kraja seta bez mnogo pote??ko??a ??uvao prednost po??etnog udaraca.\r\n\r\nU drugom delu jedinu ??ansu da oduzme servis rivalu imao je ??ileanac u prvom gemu. Od tog trenutka sve je i??lo ka taj-brejku. U njemu je Medvedev dominirao i sa 7:2 izjedna??io rezultat.\r\n\r\nMe??utim, bio je to samo trenutni bljesak Rusa. Garin je od rezultata 1:1 vezao pet gemova i izborio mesto me??u osmoricom najboljih. Tamo ga ??eka duel sa pobednikom me??a Beretini (Italija) ??? Delbonis (Argentina).', 1, 3, 9, 23, 4, '2021-05-06 22:59:53', NULL);

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
(49, 'http://localhost:8000/posts/7', 'Korisnik sa emailom: nemanja@admin.gmail.com je promenuo status postaLete??i Somborac: Zakucavao sam kao tigar!', 'nemanja@admin.gmail.com', '2021-05-06 15:29:01'),
(50, 'http://localhost:8000/posts/7', 'Korisnik sa emailom: nemanja@admin.gmail.com je promenuo status postaLete??i Somborac: Zakucavao sam kao tigar!', 'nemanja@admin.gmail.com', '2021-05-06 15:29:03'),
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
(91, 'http://localhost:8000/posts/21', 'Korisnik sa emailom: mikicaadmin@yahoo.com je promenuo status postaLaso: Nisam sre??an, ali sam ponosan na ekipu', 'mikicaadmin@yahoo.com', '2021-05-06 22:50:08'),
(92, 'http://localhost:8000/posts/21', 'Korisnik sa emailom: mikicaadmin@yahoo.com je promenuo status postaLaso: Nisam sre??an, ali sam ponosan na ekipu', 'mikicaadmin@yahoo.com', '2021-05-06 22:50:14'),
(93, 'http://localhost:8000/posts/21', 'Korisnik sa emailom: mikicaadmin@yahoo.com je azurirao postaLaso: Nisam sre??an, ali sam ponosan na ekipu', 'mikicaadmin@yahoo.com', '2021-05-06 22:51:13'),
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
