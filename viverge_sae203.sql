-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 29 mai 2023 à 20:53
-- Version du serveur : 10.3.38-MariaDB-0+deb10u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `viverge_sae203`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `id_acteur` bigint(20) UNSIGNED NOT NULL,
  `prenom_acteur` text NOT NULL,
  `nom_acteur` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`id_acteur`, `prenom_acteur`, `nom_acteur`) VALUES
(1, 'Ryūnosuke', 'Kamiki'),
(2, 'Takuya', 'Kimura'),
(3, 'Rumi', 'Hiiragi'),
(4, 'Tomoko', 'Yamaguchi'),
(5, 'Steve', 'Albert'),
(6, 'Chizuru', 'Ikewaki'),
(7, 'Masami', 'Nagasawa'),
(8, 'Gillian ', 'Anderson\r\n'),
(9, 'Lévanah', 'Solomon'),
(10, 'Natsuki', 'Hanae'),
(11, 'Somegoro', 'Ichikawa'),
(12, 'Moises', 'Arias'),
(13, 'Youko', 'Honna'),
(14, 'Timothy', 'Dalton'),
(15, 'Chika', 'Sakamoto'),
(16, 'Gorô', 'Naya'),
(17, 'Michael', 'Keaton'),
(18, 'Hana', 'Sugisaki'),
(19, 'Kasumi', 'Arimura'),
(20, 'Kotaro', 'Daigo'),
(21, 'Miyu', 'Irino'),
(22, 'Hidetaka', 'Yoshioka'),
(23, 'Minami', 'Takayama'),
(24, 'Mayumi', 'Tanaka'),
(25, 'Nobuo', 'Tobita'),
(26, 'Makoto', 'Nonomura'),
(27, 'Ayano', 'Shiraishi'),
(28, 'Daiki', 'Yamashita'),
(29, 'Jun', 'Shison');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id_film` int(11) NOT NULL,
  `pseudo` text NOT NULL,
  `commentaire` text NOT NULL,
  `id_comm` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id_film`, `pseudo`, `commentaire`, `id_comm`) VALUES
(4, 'bob', 'il est nul', 1),
(3, 'lulu', 'Je ne connais pas ce film', 11),
(4, 'jean', 'ce film est super bien!', 12),
(3, 'test', '\r\n\r\n  alert(\"Hello les MMI !\");\r\n\r\n', 16),
(2, 'Leo', 'j\'adore le perso de hauru', 17);

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

CREATE TABLE `favoris` (
  `id_favoris` int(20) NOT NULL,
  `id_film` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `favoris`
--

INSERT INTO `favoris` (`id_favoris`, `id_film`) VALUES
(214, 1),
(193, 2),
(202, 4),
(217, 8),
(249, 14);

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id_film` int(20) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `resume` text NOT NULL,
  `id_realisateur` int(20) NOT NULL,
  `id_genre` int(20) NOT NULL,
  `duree` int(11) NOT NULL,
  `date` date NOT NULL,
  `image` varchar(100) NOT NULL,
  `id_acteur` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id_film`, `titre`, `resume`, `id_realisateur`, `id_genre`, `duree`, `date`, `image`, `id_acteur`) VALUES
(1, 'Your Name', 'Mitsuha, adolescente coincée dans une famille traditionnelle, rêve de quitter ses montagnes natales pour découvrir la vie trépidante de Tokyo. Elle est loin d\'imaginer pouvoir vivre l\'aventure urbaine dans la peau de... Taki, un jeune lycéen vivant à Tokyo. À travers ses rêves, Mitsuha se voit littéralement propulsée dans la vie du jeune garçon. Quel mystère se cache derrière ces rêves étranges qui unissent deux destinées que tout oppose et qui ne se sont jamais rencontrées ?', 1, 4, 110, '2016-12-28', './images/your_name.jpg', 1),
(2, 'Le Château ambulant', 'La jeune Sophie, 18 ans, travaille inlassablement dans la chapellerie autrefois tenue par son père, malheureusement décédé. Résignée à son sort, c’est lors de l’une de ses rares sorties en ville qu’elle fait la connaissance du beau Hauru, un magicien. Mais la sorcière des Landes, jalouse de cette rencontre, jette un sort à Sophie, la transformant en vieille dame. Accablée par sa nouvelle apparence, Sophie s’enfuit dans les montagnes et tombe sur la demeure de Hauru : son Château Ambulant. Et si tout ceci n’était que le commencement d’une merveilleuse histoire ?', 2, 1, 119, '2005-01-12', './images/chateau_amb.jpg', 2),
(3, 'Le Voyage de Chihiro', 'Chihiro, une fillette de 10 ans, est en route vers sa nouvelle demeure en compagnie de ses parents. Au cours du voyage, la famille fait une halte dans un parc à thème qui leur paraît délabré. Lors de la visite, les parents s’arrêtent dans un des bâtiments pour déguster quelques mets très appétissants, apparus comme par enchantement. Hélas cette nourriture les transforme en porcs. Prise de panique, Chihiro s’enfuit et se retrouve seule dans cet univers fantasmagorique ; elle rencontre alors l’énigmatique Haku, son seul allié dans cette terrible épreuve...', 2, 1, 125, '2002-04-10', './images/chihiro.jpg', 3),
(4, 'Ponyo sur la falaise', 'Alors qu’il joue sur la plage, le petit Sosuke découvre une petite fille poisson rouge nommée Ponyo, piégée dans un pot de confiture. Sosuke la sauve et décide de la garder avec lui. Le petit garçon lui promet de la protéger et de s’occuper d’elle, mais le père de Ponyo, Fujimoto – un sorcier autrefois humain qui vit tout au fond de la mer – la force à revenir avec lui dans les profondeurs. Bien décidée à devenir humaine, Ponyo s’échappe pour retrouver Sosuke. Mais avant, elle répand l’élixir magique de Fujimoto dans l’océan qui va provoquer des vagues gigantesques et engloutir le village.', 2, 2, 101, '2009-04-08', './images/ponyo.jpg', 4),
(5, 'L\'Enfant du mois de Kamiari', 'Un an après le décès de sa mère, une jeune fille apprend qu\'elle doit traverser le Japon pour se rendre à une réunion annuelle de dieux sur les terres sacrées d\'Izumo. Elle a l\'espoir de revoir sa mère une fois arrivée sur place.', 11, 1, 99, '2021-10-08', './images/kaminari.jpg', 21),
(6, 'Bubble', 'L\'histoire se déroule à Tokyo, dans un monde inondé de bulles ayant modifié les lois de la gravité. Coupée du reste du monde, Tokyo est devenue le terrain de jeu d\'un groupe de jeunes adeptes de parkour privés de leurs familles, dont les équipes s\'affrontent d\'immeuble en immeuble. Un jour, après une figure périlleuse, Hibiki, jeune prodige connu pour son style de jeu risqué, est propulsé vers l\'océan dénué de gravité qui entoure la ville. Il est sauvé par l\'intervention soudaine d\'Uta, jeune fille aux pouvoirs mystérieux. Tous deux vont alors entendre un son qu\'eux seuls peuvent percevoir. Pourquoi Uta a-t-elle ainsi rejoint Hibiki ? Leur rencontre les mènera à une révélation qui va changer le monde.', 12, 1, 100, '2022-05-13', './images/bubble.jpg', 29),
(7, 'Le Vent se lève', 'Inspiré par le fameux concepteur d’avions Giovanni Caproni, Jiro rêve de voler et de dessiner de magnifiques avions. Mais sa mauvaise vue l’empêche de devenir pilote, et il se fait engager dans le département aéronautique d’une importante entreprise d’ingénierie en 1927. Son génie l’impose rapidement comme l’un des plus grands ingénieurs du monde.\r\nLe Vent se lève raconte une grande partie de sa vie et dépeint les événements historiques clés qui ont profondément influencé le cours de son existence, dont le séisme de Kanto en 1923, la Grande Dépression, l’épidémie de tuberculose et l’entrée en guerre du Japon. Jiro connaîtra l’amour avec Nahoko et l’amitié avec son collègue Honjo. Inventeur extraordinaire, il fera entrer l’aviation dans une ère nouvelle.', 2, 3, 127, '2014-01-22', './images/le_vent_se_leve.jpg', 5),
(8, 'Le Royaume des chats', 'Haru est une jeune lycéenne pleine de doutes qui ne trouve pas sa place parmi les autres. Sa vie bascule le jour où, sur le chemin du retour du lycée, elle sauve la vie d’un chat qui manque d’être écrasé par un camion. Mais il ne s’agit pas de n’importe quel chat, celui-ci parle, se tient debout sur ses pattes arrière et se prénomme Loon : il est le prince du royaume des chats. Désormais les félins ont une dette envers Haru. Dès le lendemain ils la comblent de cadeaux et leur roi en personne l’invite dans son château pour la remercier. Le monarque souhaite qu’elle épouse son héritier…', 3, 1, 74, '2003-07-04', './images/roy_chats.jpg', 6),
(9, 'La Colline aux Coquelicots', 'Umi est une jeune lycéenne qui vit dans une vieille bâtisse perchée au sommet d’une colline surplombant le port de Yokohama. Chaque matin, depuis que son père a disparu en mer, elle hisse face à la baie deux pavillons, comme un message lancé à l’horizon. Au lycée, quelqu’un a même écrit un article sur cet émouvant signal dans le journal du campus. C’est peut-être l’intrépide Shun, le séduisant jeune homme qu’Umi n’a pas manqué de remarquer. Attirés l’un par l’autre, les deux jeunes gens vont partager de plus en plus d’activités, de la sauvegarde du vieux foyer jusqu’à la rédaction du journal. Pourtant, leur relation va prendre un tour inattendu avec la découverte d’un secret qui entoure leur naissance et semble les lier…', 4, 4, 92, '2012-01-12', './images/colline.jpg', 7),
(10, 'Princesse Mononoké', 'Japon, XVe siècle. Jadis protégée par des animaux géants, la forêt se dépeuple à cause de l\'homme. Blessé par un sanglier rendu fou par les démons, le jeune guerrier Ashitaka quitte les siens et part à la recherche du dieu-cerf qui seul pourra défaire le sortilège qui lui gangrène le bras. Au cours de son voyage, Ashitaka rencontre Lady Eboshi, à la tête d’une communauté de forgerons, qui doit se défendre contre ceux qui lui reprochent de détruire la forêt pour alimenter ses forges. Parmi ses pires ennemis se trouve San, une jeune fille sauvage élevée par des loups, aussi appelée \"Princesse Mononoké\", la princesse des spectres...', 2, 1, 135, '2000-01-12', './images/mononoke.jpg', 8),
(11, 'Suzume', 'Dans une petite ville paisible de Kyushu, une jeune fille de 17 ans, Suzume, rencontre un homme qui dit voyager à la recherche d’une porte. Décidant de le suivre dans les montagnes, elle découvre une porte délabrée trônant au milieu des ruines, seul vestige ayant survécu au passage du temps. Cédant à une inexplicable impulsion, Suzume tourne la poignée, et d’autres portes s’ouvrent alors aux quatre coins du Japon, laissant passer toutes les catastrophes qu’elles renfermaient. L’homme est formel : toute porte ouverte doit être refermée. Suzume s’est égarée où se trouvent les étoiles, le crépuscule et l’aube, une voûte céleste où tous les temps se confondent. Guidée par des portes nimbées de mystère, elle entame un périple afin de toutes les refermer.', 1, 2, 122, '2023-04-12', './images/suzume.jpg', 9),
(12, 'Loin de moi, près de toi', 'L\'histoire prend place dans la ville de Tokoname située dans la préfecture d\'Aichi. Nous y suivons le quotidien de Miyo Sasaki, une collégienne amoureuse de son camarade de classe nommé Kento Hinode. Malgré tous les efforts de Sasaki pour se faire remarquer, Hinode ne fait pas attention à elle. Un jour, elle découvre un étrange masque lui permettant de se transformer en un chat nommé Tarō. Grâce à cet objet, elle peut se rapprocher de celui qu\'elle aime. Cependant, à force de l\'utiliser, elle pourrait bien ne plus retrouver sa forme originelle...', 5, 4, 104, '2020-06-18', './images/loin_de_moi.jpg', 10),
(13, 'Nos mots comme des bulles', 'Cherry est un lycéen qui n\'arrive à exprimer ses sentiments qu\'au travers des haïkus qu\'il compose. Un jour, il rencontre Smile, une streameuse populaire qui complexe sur ses dents. Ensemble, ils vont aider M. Fujiyama, un vieil homme, à retrouver un vinyle chargé de souvenirs et qu\'il a égaré.', 6, 4, 86, '2021-07-22', './images/mots_bulles.jpg', 11),
(14, 'Arrietty : Le Petit Monde des Chapardeurs', 'Dans la banlieue de Tokyo, sous le plancher d’une vieille maison perdue au cœur d’un grand jardin, la minuscule Arrietty vit en secret avec sa famille. Ce sont des Chapardeurs. Arrietty connaît les règles : on n’emprunte que ce dont on a besoin, en si petite quantité que les habitants de la maison ne s’en aperçoivent pas. Plus important encore, on se méfie du chat, des rats, et interdiction absolue d’être vus par les humains sous peine d’être obligés de déménager. Arrietty sait tout cela. Pourtant, lorsqu’un jeune garçon, Sho, arrive à la maison pour se reposer avant une grave opération, elle sent que tout sera différent. Entre la jeune fille et celui qu’elle voit comme un géant, se noue une amitié que personne ne pourra oublier…', 7, 1, 94, '2011-01-12', './images/arrietty.jpg', 12),
(15, 'Si tu tends l\'oreille', 'Shizuku Tsukichima, une collégienne de 14 ans, est une jeune fille rêveuse qui adore les romans et les contes. Elle emprunte souvent des livres à sa bibliothèque. Mais un jour, sur les fiches d’emprunt des romans, elle remarque qu’un mystérieux Seiji Amasawa lit exactement les mêmes ouvrages avant elle. Shizuku décide alors d’en savoir plus sur cet inconnu et fait par hasard la connaissance d’un jeune garçon qu’elle trouve tout d’abord très exaspérant… Quelle n’est pas surprise lorsqu’elle découvre qu’il s’agit de Seiji Amasawa...', 2, 4, 111, '2016-02-01', './images/oreille.jpg', 13),
(16, 'Les Contes de Terremer', 'Terremer est une contrée magique dominée par les mers et peuplée de dragons. Depuis peu, l’ordre naturel est rompu par un sorcier maléfique. Arren, jeune prince du royaume d’Enlad, va allier ses forces à celles du grand magicien Epervier pour rétablir l’équilibre du monde. Dans le combat qui s’annonce, Arren et Epervier croiseront la route de Therru, une mystérieuse jeune fille. Ensemble, ils dépasseront leurs peurs et uniront leurs destins pour mener le plus fascinant des voyages, à travers les ténèbres et sur le chemin de la paix et de la rédemption.…', 4, 2, 115, '2007-04-04', './images/terremer.jpg', 14),
(17, 'Mon voisin Totoro', 'Deux petites filles, Mei et Satsuki, viennent s\'installer avec leur père dans une grande maison à la campagne afin de se rapprocher de l\'hôpital où séjourne leur mère. Elles vont découvrir l\'existence de leurs nouveaux voisins, invisible aux yeux des autres humains, des créatures merveilleuses, mais très discrètes : Grand Totoro, Moyen Totoro (Chū-Totoro) et Petit Totoro (Chibi-Totoro). Avec son ventre rebondi, Totoro est un être rare et fascinant, un esprit de la forêt... Il se nourrit de glands et de noix. Il peut voler, se déplacer en « Chat-Bus ». Il dort le jour, mais les nuits de pleine lune, il aime jouer avec des ocarinas magiques...', 2, 1, 97, '1999-12-08', './images/totoro.jpg', 15),
(18, 'Nausicaä de la Vallée du Vent', 'Sur une Terre ravagée par la folie des hommes durant les « sept jours de feu », une poignée d’humains a réussi à survivre dans une vallée protégée par le vent. Ce peuple agricole est pourtant menacé par une forêt toxique qui ne cesse de prendre de l’ampleur, forêt où seuls survivent des insectes géants et mutants. Ces quelques survivants voient un jour leur roi bien-aimé assassiné et leur princesse Nausicaä faite prisonnière. Or cette dernière, sensible à la nature et à l’écosystème, est seule capable de communiquer avec les mutants…', 2, 2, 97, '2006-08-23', './images/nausicaa.jpg', 16),
(19, 'Porco Rosso', 'Dans l’entre-deux-guerres, en pleine montée du fascisme, quelque part en Italie, Marco Pagot, pilote hors-pair épris de liberté, est victime d’un sortilège. Il devient chasseur de prime, et établit son repaire sur une île déserte de l’Adriatique. Surnommé Porco Rosso par ses ennemis, les pirates de l’air et brigands de tout poil, il affronte les meilleurs aviateurs en duel aérien à bord de son splendide hydravion rouge. Guidé par le souvenir de ses compagnons d’armes et par son esprit de solidarité, il vole au secours des faibles et un jour rencontre l’amour. Mais qui percera le secret de sa métamorphose ?', 2, 2, 89, '1995-06-21', './images/porco_rosso.jpg', 17),
(20, 'Mary et la Fleur de la sorcière', 'C\'est l\'été. Mary vient d’emménager chez sa grand-tante dans le village de Manoir Rouge. Dans la forêt voisine, elle découvre une fleur mystérieuse qui ne fleurit qu\'une fois tous les 7 ans. On l\'appelle la \"fleur de la sorcière\". Pour une nuit seulement, grâce à la fleur, Mary possèdera des pouvoirs magiques et pourra entrer à Endor, l’école la plus renommée dans le monde de la magie, qui s\'élève au-dessus du ciel, au-delà des nuages.\r\nLe secret de la fleur de la sorcière se révèlera à elle petit à petit…', 7, 1, 104, '2018-02-21', './images/mary.jpg', 18),
(21, 'Souvenirs de Marnie', 'Adolescente solitaire, Anna a perdu ses parents très jeune et vit en ville avec ses parents adoptifs. Lorsque son asthme s’aggrave, sa mère adoptive l’envoie chez des parents, les Oiwa, qui vivent près de la mer dans un petit village au nord d’Hokkaïdo. Pour Anna, c’est le début d’un été d’aventures qui commence par sa découverte d’une grande demeure construite au cœur des marais, non loin du village. Même si elle semble avoir quelque chose de familier pour elle, \"La Maison des Marais\", comme l’appellent les villageois, est inhabitée depuis bien longtemps. Et c’est là-bas qu’elle va faire la rencontre d’une étrange et mystérieuse fille : Marnie…', 7, 3, 104, '2015-01-14', './images/marnie.jpg', 19),
(22, 'Les Enfants du temps', 'Jeune lycéen, Hodaka fuit son île pour rejoindre Tokyo. Sans argent ni emploi, il tente de survivre dans la jungle urbaine et trouve un poste dans une revue dédiée au paranormal. Un phénomène météorologique extrême touche alors le Japon, exposé à de constantes pluies. Hodaka est dépêché pour enquêter sur l\'existence de prêtresses du temps. Peu convaincu par cette légende, il change soudainement d\'avis lorsqu\'il croise la jeune Hina...', 1, 4, 114, '2020-01-08', './images/temps.jpg', 20),
(23, 'The Garden of Words', 'Takao, qui est en apprentissage pour devenir cordonnier, sèche les cours et dessine des chaussures dans un jardin de style japonais. Il y rencontre une mystérieuse femme, Yukino, qui est plus âgée que lui. Par la suite, et sans se donner rendez-vous, ils commencent à se voir encore et encore mais seulement les jours de pluie. Ils finissent par discuter ensemble et s\'ouvrent l\'un à l\'autre. Mais la fin de la saison des pluies approche...', 1, 4, 46, '2014-01-08', './images/garden.jpg', 21),
(24, 'La Tour au delà des nuages', 'Après la Seconde Guerre mondiale, le Japon se retrouve divisé et occupé par deux forces rivales. Alors que l\'Hokkaido est annexé par l\'Union, les autres îles sont gouvernées par des forces américaines. Trois amis de la zone américaine, fascinés par une énigmatique tour érigée par l\'Union, se sont fait la promesse de construire un avion et de lever le voile sur le mystère entourant la tour. Ce projet échoue lorsque l\'un d\'eux disparaît...', 1, 1, 91, '2016-11-30', './images/tour.jpg', 22),
(25, 'Kiki la petite sorcière', 'Chez Kiki, treize ans, on est sorcière de mère en fille. Mais pour avoir droit à ce titre, Kiki doit faire son apprentissage : elle doit quitter les siens pendant un an et leur prouver qu’elle peut vivre en toute indépendance dans une ville de son choix. Un beau soir, accompagnée de son chat Jiji, après avoir embrassé ses parents et sa grand-mère, elle enfourche son balai et met le cap vers le sud « pour voir la mer »… Le lendemain, elle atterrit dans une sympathique ville côtière. C’est là qu’elle va apprendre aux côtés d’Osono, une gentille boulangère qui lui propose un emploi de livreuse…', 2, 2, 102, '2004-03-31', './images/kiki.jpg', 23),
(26, 'Le Château dans le ciel', 'Qui est vraiment Sheeta, la petite fille porteuse d’une pierre en pendentif aux pouvoirs magiques qui suscite bien des convoitises ? Retenue prisonnière à bord d’un dirigeable, l’enfant affronte une bande de pirates de l’air menée par la très pittoresque Dora, puis une armée de militaires à la solde de Muska, un gentleman machiavélique trop poli pour être honnête. Sauvée par le jeune Pazu, Sheeta se réfugie dans un village de mineurs. Là, elle tentera avec le garçon de percer le secret de ses origines pour prouver que l’histoire de Laputa, l’île merveilleuse flottant dans les airs, n’est pas une légende…', 2, 1, 124, '2002-11-01', './images/chateau_ciel.jpg', 24),
(27, 'Je peux entendre l\'océan', 'Rikako Muto est une lycéenne de Tokyo qui vient s\'établir à Kochi avec sa mère en cours d\'année scolaire. Kochi est une ville sur l\'île de Shikoku, au sud du Japon, très différente de Tokyo. Bien que bonne élève et charmante, Rikoku s\'habitue mal à son nouvel environnement et ne s\'intègre pas parmi les élèves. Ses parents sont séparés et a suivi avec regret sa mère à Kochi. Elle est remarquée par Yutaka Matsuno qui la présente à son meilleur ami, Taku Morisaki, le narrateur du téléfilm. Au cours d\'un voyage à Hawaï, le hasard fait qu\'elle emprunte de l\'argent à Taku. Quelques mois plus tard, elle est sensée partir pour Osaka en avion avec Yumi Kohama, sa meilleure amie. Arrivée à l\'aéroport, elle achète des billets pour Tokyo. Affolée, Yumi appelle Taku à l\'aide pour la raisonner. Finalement Taku est contraint d\'accompagner Rikako chez son père jusqu\'à Tokyo tandis que Yumi rentre sagement chez elle. Au cours de cette escapade, Taku fera plus ample connaissance avec Rikako.', 8, 3, 72, '1993-12-25', './images/ocean.jpg', 25),
(28, 'Pompoko', 'Espèce mi-raton laveur mi-blaireau, les Tanukis partageaient aisément leur espace vital avec les paysans. Entrecoupée de batailles entre tribus, leur vie insouciante leur faisait ignorer la présence toujours plus proche des hommes… Jusqu’au jour où ces derniers décident de s’approprier leur territoire et de faire de la montagne une ville. Capables de se métamorphoser à volonté, les Tanukis vont tenter d’effrayer les humains grâce à leurs pouvoirs extraordinaires. Cependant, il en faudra plus pour que les hommes renoncent à la destruction de la forêt. Face à la menace expansionniste, la riposte des Tanukis s’organise mais les animaux ne sont pas au bout de leurs peines !', 9, 1, 114, '2006-01-18', './images/pompoko.jpg', 26),
(29, 'Le Tombeau des lucioles', 'Japon, été 1945. Après le bombardement de Kobé, Seita, un adolescent de quatorze ans et sa petite soeur de quatre ans, Setsuko, orphelins, vont s\'installer chez leur tante à quelques dizaines de kilomètres de chez eux. Celle-ci leur fait comprendre qu\'ils sont une gêne pour la famille et doivent mériter leur riz quotidien. Seita décide de partir avec sa petite soeur. Ils se réfugient dans un bunker désaffecté en pleine campagne et vivent des jours heureux illuminés par la présence de milliers de lucioles. Mais bientôt la nourriture commence cruellement à manquer.', 9, 3, 90, '1996-06-19', './images/tombeau.jpg', 27),
(30, 'Les Murs vagabonds', 'Durant un jour d\'été, Kosuke et Natsume découvrent un immeuble sur le point d\'être démoli. Ce bâtiment est l\'endroit où ils vivaient autrefois. Soudainement, ils se retrouvent pris dans un phénomène des plus étranges : l\'immeuble qui abritait tellement de souvenirs dérive désormais sur la mer. Le groupe d\'enfant doit trouver un moyen de retrouver leur ville depuis ce bâtiment à la dérive.', 10, 2, 120, '2022-09-16', './images/vagabonds.jpg', 28);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(20) NOT NULL,
  `genre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id_genre`, `genre`) VALUES
(1, 'Fantastique'),
(2, 'Aventure'),
(3, 'Drame'),
(4, 'Romance');

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `id_realisateur` int(20) NOT NULL,
  `prenom_realisateur` text NOT NULL,
  `nom_realisateur` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`id_realisateur`, `prenom_realisateur`, `nom_realisateur`) VALUES
(1, 'Makoto', 'Shinkai'),
(2, 'Hayao', 'Miyazaki'),
(3, 'Hiroyuki', 'Morita'),
(4, 'Goro', 'Miyazaki'),
(5, 'Jun\'ichi', 'Sato'),
(6, 'Kyohei', 'Ishiguro'),
(7, 'Hiromasa', 'Yonebayashi'),
(8, 'Tomomi', 'Mochizuki'),
(9, 'Isao', 'Takahata'),
(10, 'Hiroyasu', 'Ishida'),
(11, 'Takana', 'Shirai'),
(12, 'Tetsurô', 'Araki');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`id_acteur`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id_comm`),
  ADD KEY `id_film` (`id_film`);

--
-- Index pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD PRIMARY KEY (`id_favoris`),
  ADD KEY `id_film` (`id_film`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`),
  ADD KEY `id_realisateur` (`id_realisateur`,`id_genre`),
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_realisateur_2` (`id_realisateur`,`id_genre`),
  ADD KEY `id_realisateur_3` (`id_realisateur`,`id_genre`),
  ADD KEY `id_acteur` (`id_acteur`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Index pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD PRIMARY KEY (`id_realisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acteur`
--
ALTER TABLE `acteur`
  MODIFY `id_acteur` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id_comm` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `favoris`
--
ALTER TABLE `favoris`
  MODIFY `id_favoris` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `realisateur`
--
ALTER TABLE `realisateur`
  MODIFY `id_realisateur` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`);

--
-- Contraintes pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD CONSTRAINT `favoris_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`);

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`),
  ADD CONSTRAINT `film_ibfk_2` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`),
  ADD CONSTRAINT `film_ibfk_3` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`),
  ADD CONSTRAINT `film_ibfk_4` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
