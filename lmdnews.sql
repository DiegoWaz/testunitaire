-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:8889
-- Généré le :  Sam 03 Février 2018 à 05:03
-- Version du serveur :  5.5.42
-- Version de PHP :  7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `lmdnews`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL,
  `type` int(11) NOT NULL,
  `rubrique` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `page_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Publié',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `comments`
--

INSERT INTO `comments` (`id`, `type`, `rubrique`, `title`, `image`, `page_id`, `status`, `content`, `isDelete`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 1, '', '', '', 2, 'Publié', 'test ça fonctionne', 0, 2, '2017-10-25 20:57:28', '2017-10-25 20:57:28'),
(2, 1, '', '', '', 3, 'Publié', 'test ça fonctionne', 0, 1, '2017-10-25 20:57:28', '2017-10-25 20:57:28');

-- --------------------------------------------------------

--
-- Structure de la table `conf`
--

CREATE TABLE `conf` (
  `id` int(10) unsigned NOT NULL,
  `wording` varchar(255) COLLATE utf8_bin NOT NULL,
  `value` text COLLATE utf8_bin,
  `isDelete` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `conf`
--

INSERT INTO `conf` (`id`, `wording`, `value`, `isDelete`) VALUES
(1, 'site_name', 'Le Meilleur du News', 0),
(2, 'site_desc', 'Le site le plus complet sur l''actualité ...', 0),
(3, 'site_link', 'lmdweb.com', 0);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL,
  `author_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Publié','Brouillon','Non publié') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Brouillon',
  `une` tinyint(1) NOT NULL DEFAULT '0',
  `section` tinyint(2) NOT NULL,
  `rubrique` int(11) NOT NULL,
  `resume` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `type_page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `story` tinyint(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'newsdefault.jpg',
  `id_players` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_teams` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_matchs` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_news` int(11) NOT NULL,
  `id_topic` int(11) NOT NULL,
  `id_com` int(11) NOT NULL,
  `notification` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `date` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isDelete` tinyint(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `title`, `slug`, `meta_description`, `meta_keywords`, `status`, `une`, `section`, `rubrique`, `resume`, `content`, `type_page`, `story`, `image`, `id_players`, `id_teams`, `id_matchs`, `id_news`, `id_topic`, `id_com`, `notification`, `views`, `date`, `created_at`, `updated_at`, `isDelete`) VALUES
(1, '0', 'Fais vraiment chier', 'Fais-vraiment-chier', '', '', 'Publié', 1, 4, 78, 'Déroute, Désastre, Naufrage, appelez comme vous voulez la défaite du PSG cette semaine en Ligue des Champions face au FC Barcelone (6-1), ma', 'Blaise Matuidi et Marco Verratti en boîte de nuit à deux jours du match à Barcelone ? C’est insulter leur professionnalisme et leur club. Une défaite n’autorisera jamais à répandre les rumeurs les plus malveillantes. Honte à ceux – souvent L''Équipe - qui les diffusent sans même vérifier leurs « informations ». Aucune crédibilité. Même constat navrant concernant une prétendue demande du Club à la Préfecture pour descendre les Champs-Élysées en cas de titre européen. Faux. Archi faux. Pourquoi publier des mensonges ? Quel est le but recherché par L’Équipe ?                                                                                                                                                ', 'Article', 3, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 0, 2, 1514163445, '2017-10-25 18:57:28', '0000-00-00 00:00:00', 1),
(2, '1', 'Arsène Wenger (Arsenal) : «Ma préférence est de rester»', 'Arsene-Wenger-Arsenal-Ma-preference-est-de-rester', '', '', 'Publié', 1, 4, 31, 'Arsène Wenger, l''entraîneur d''Arsenal, est revenu sur sa situation personnelle après la qualification de son équipe pour les demi-finales de', 'Arsène Wenger (entraîneur d''Arsenal, après la victoire face à Lincoln) : «Ma préférence est de rester ici. Ne parlons pas trop de moi, comme ça a été le cas dernièrement. Comme je l''ai toujours fait, j''essaie de servir de mon mieux ce club en m''engageant totalement. Et je le ferai aussi longtemps que je suis ici. Pour encore combien de temps? Je ne sais pas pour le moment. Mais j''ai toujours montré beaucoup de loyauté et ma préférence est de rester ici. Je me concentre sur mon travail comme je l''ai toujours fait. Je laisse d''autres personnes juger mes performances. Les gens parlent et parlent tout le temps, mais cela ne veut pas dire qu''ils ont raison. Nous devons aussi leur montrer sur le terrain ce pourquoi nous sommes payés.»', 'Commentaire', 2, '/ckfinder/userfiles/files/newdefault.jpg', '1, 2, 3, 4', '', '', 0, 0, 0, 0, 2, 1514161404, '2017-10-25 18:57:28', '0000-00-00 00:00:00', 1),
(3, '1', 'Antoine Kombouaré avait senti la victoire venir', 'Antoine-Kombouare-avait-senti-la-victoire-venir-3', '', '', 'Publié', 1, 2, 36, 'En dix jours, Guingamp s''est qualifié pour les quarts de la Coupe de France, a pris un point à Montpellier et a largement battu Bastia. L''EA', '<p>Antoine Kombouar&eacute; (entra&icirc;neur de Guingamp): &laquo;On a marqu&eacute; en seconde p&eacute;riode alors qu&#39;on s&#39;est cr&eacute;&eacute; davantage d&#39;occasions en premi&egrave;re. Le premier but a &eacute;teint les espoirs bastiais. Je suis fier de mes joueurs. Ils ont r&eacute;alis&eacute; un gros travail de sape. Leur boulot a pay&eacute;. On a r&eacute;alis&eacute; un match accompli. Le point pris &agrave; Montpellier augurait de quelque chose de bien. Les gar&ccedil;ons ont fait le match que j&#39;esp&eacute;rais&raquo;.</p>\r\n', 'Article', 6, '/ckfinder/userfiles/files/57123.jpg', '2, 3', '1, 2', '1, 2', 0, 0, 0, 0, 5, 1514764800, '2017-10-25 18:57:28', '2018-01-03 18:01:50', 0),
(4, '3', 'Pablo Correa dézingue l''arbitre, M.Delerue', 'pablo-correa', '', '', 'Publié', 0, 0, 36, 'Furieux après les décisions arbitrales lors de la défaite de Nancy contre Lille (1-2), Pablo Correa a critiqué M.Delerue.', 'Pablo Correa (entraîneur de Nancy): «(Je ressens) de la colère. Le résultat nous échappe pour des choses qu''on ne maîtrise pas. Dans l''ensemble, le match s''est passé assez bien. Mais on a manqué d''efficacité pour marquer le deuxième but car on a eu des occasions. On a vécu le pire scénario qu''on pouvait vivre. Il n''y a rien à dire sur le premier but mais le deuxième but est entaché d''une main. On a tiré beaucoup mais peu cadré. On n''a pas su cadrer et l''adversaire a su le faire. (Sur son exclusion) Je me suis approché car j''ai revu à la télé la faute sifflée à Pedretti. On prend deux cartons sur la même action... Il manque une bonne dose d''humilité à l''arbitre. Quand on est mauvais mais humble, on peut pardonner.» ', 'Contenu', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 0, 2, 0, '2017-10-25 18:57:28', '2017-10-25 18:57:28', 0),
(5, '4', 'Demichelis a plombé les débuts de Michel à Malaga', 'demichelis', '', '', 'Publié', 1, 0, 36, 'Bon pour la première de Michel sur le banc, Malaga a perdu à domicile contre Alavés en raison de deux erreurs de Demichelis.', 'Quinzième de la Liga, Malaga a confié son opération maintien à l''ancien manager de l''OM, Michel. Ce samedi soir, pour son premier match à la tête de sa nouvelle équipe, il a vu ses hommes bien jouer mais perdre à domicile contre Alavés (1-2). Les deux buts des visiteurs sont venus après deux erreurs de Martin Demichelis. Dixièmes, les Basques sont impressionnants à l''extérieur avec deux défaites seulement lors de leurs treize derniers déplacements (sept victoires et quatre nuls).', 'Article', 3, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 0, 2, 0, '2017-10-25 18:57:28', '2017-10-25 18:57:28', 0),
(35, '0', 'Paris est magique', 'Paris-est-magique', '', '', 'Publié', 1, 0, 36, 'on test                                                                                                                                     ', 'cervsrb  bbbgbt                                                                                                            ', 'Commentaire', 0, '/ckfinder/userfiles/files/newdefault.jpg', '1', '', '', 0, 0, 103, 0, 1, 1513962731, '2017-12-03 18:48:55', '0000-00-00 00:00:00', 1),
(38, '0', 'Un accord entre le PSG et Valence', 'Un-accord-entre-le-PSG-et-Valence', '', '', 'Publié', 1, 0, 36, 'fefefgrgefvref                                                                                                                              ', ' frvrvbrtbtr                                                                                                                                                                    ', 'Commentaire', 0, '/ckfinder/userfiles/files/newdefault.jpg', '2, 3', '', '', 0, 0, 104, 0, 2, 0, '2017-12-20 16:47:56', '0000-00-00 00:00:00', 0),
(39, '0', 'Unai vers un départ ?', 'Unai-vers-un-depart', '', '', 'Publié', 1, 0, 36, 'jamais                            ', 'ça va aller', 'Commentaire', 0, '/ckfinder/userfiles/files/newdefault.jpg', '4, 5', '', '', 0, 0, 103, 0, 1, 1513953505, '2017-12-21 17:42:44', '0000-00-00 00:00:00', 1),
(40, '0', 'Mbappé figure-t-il parmi les meilleurs joueurs du monde ?', 'Mbappe-figure-t-il-parmi-les-meilleurs-joueurs-du-monde', '', '', 'Publié', 1, 0, 36, '                                    ddvfvff', '                                    vvfdvfdf', 'Commentaire', 0, '/ckfinder/userfiles/files/newdefault.jpg', '1, 3', '', '', 0, 0, 108, 0, 5, 0, '2017-12-21 18:58:06', '0000-00-00 00:00:00', 0),
(41, '0', 'Je teste encore une fois', 'Je-teste-encore-une-fois', '', '', 'Publié', 1, 0, 36, '                                    fezfevs', '                                    dbfvfg', 'Commentaire', 0, '/ckfinder/userfiles/files/newdefault.jpg', '3, 5', '', '', 0, 0, 108, 0, 2, 0, '2017-12-21 18:59:14', '0000-00-00 00:00:00', 0),
(42, '0', 'Thiago Motta est de retour à l''entraînement ', 'Thiago-Motta-est-de-retour-a-lentrainement', '', '', 'Publié', 1, 0, 36, '                                    drferver', '                                    vffv', 'Commentaire', 0, '/ckfinder/userfiles/files/newdefault.jpg', '2, 4, 1', '', '', 0, 0, 0, 0, 6, 0, '2017-12-21 19:05:26', '0000-00-00 00:00:00', 0),
(43, '0', 'Ici c''est Paris !', 'Ici-cest-Paris', '', '', 'Publié', 1, 12, 31, 'vrfrdcd', 'vfvffvv', 'Commentaire', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 0, 1, 1514173136, '2017-12-21 19:06:40', '0000-00-00 00:00:00', 1),
(44, '0', 'Pastore vers l''Inter Milan ?', 'Pastore-vers-lInter-Milan', '', '', 'Publié', 1, 12, 33, 'Javier Pastore pourrait quitter le PSG', 'Pastore veut obtenir plus de temps de jeu en vue de la Coupe du Monde', 'Article', 3, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 0, 2, 1514236437, '2017-12-21 19:07:51', '0000-00-00 00:00:00', 0),
(45, '0', 'eug', 'eug', '', '', 'Publié', 1, 3, 31, 'rfvfvf', 'rfvrv', 'Article', 2, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 0, 1, 1514161423, '2017-12-21 19:08:17', '0000-00-00 00:00:00', 1),
(46, '1', 'Ben Arfa compte rester jusqu''à la fin de la saison', 'Ben-Arfa-compte-rester-jusqua-la-fin-de-la-saison-46', '', '', 'Publié', 1, 2, 33, 'efgbr ', '<p>vffbgfbg</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/butlucas.jpg', '3', '1', '1', 0, 0, 0, 0, 5, 1514374200, '2017-12-21 21:25:20', '2018-01-02 03:31:15', 0),
(47, '0', 'Testons encore une fois', 'Testons-encore-une-fois', '', '', 'Non publié', 1, 4, 37, 'qvfsdfsbvbt dxfg', 'dfbstbrdtbgdrbxfg', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 0, 1, 1514173623, '2017-12-25 02:47:03', '2017-12-25 02:47:03', 1),
(48, '0', 'Testons encore une fois', 'Testons-encore-une-fois', '', '', 'Publié', 1, 4, 37, 'qvfsdfsbvbt dxfg', 'dfbstbrdtbgdrbxfg', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 0, 1, 1514173901, '2017-12-25 02:47:46', '0000-00-00 00:00:00', 1),
(49, '0', 'Lourd le site est en passe de sortir !', 'Lourd-le-site-est-en-passe-de-sortir', '', '', 'Publié', 1, 5, 34, 'dfbvtsb nbnrebrttyny', 'dgsnyytejyrfnrty ysjjuyjut', 'Article', 3, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 0, 0, 1514173988, '2017-12-25 02:53:08', '2017-12-25 02:53:08', 1),
(52, '0', 'Sakho fait un tabac à la boutique de la FFF', 'sakho-fait-un-tabac-a-la-boutique-de-la-fff', '', '', 'Publié', 0, 0, 36, 'Homme du match contre l''Ukraine mardi soir en match retour des barrages,\r\nl''ancien défenseur du Paris Saint Germain, Mamadou Sakho est deven', '<p style="margin-bottom: 0cm; font-style: normal; text-align: center;">\r\n  <img alt="" src="/images/news/image/Sakho/sakho-edf-2014.jpg" style="width: 580px; height: 574px;" /></p>\r\n<p style="margin-bottom: 0cm; font-style: normal">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm; font-style: normal">\r\n  <span style="color:#800000;"><strong>Homme du match contre l&#39;Ukraine mardi soir en match retour des barrages,\r\nl&#39;ancien d&eacute;fenseur du Paris Saint Germain, Mamadou Sakho est devenu en un match le h&eacute;ros de la patrie.</strong></span></p>\r\n<p style="margin-bottom: 0cm; font-style: normal">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm; font-style: normal">\r\n  Une prestation digne d&#39;un guerrier,\r\nconclu par ses deux premiers buts en &eacute;quipe de France, il en fallait pas moins pour augmenter le nombre de maillot vendu avec son nom floqu&eacute; dessus.</p>\r\n<p style="margin-bottom: 0cm">\r\n <strong><span style="font-style: normal">C&#39;est RMC qui r&eacute;v&egrave;le que </span>la majorit&eacute; des maillots des Bleus vendus ce mercredi dans la boutique de la FFF sont floqu&eacute;s Mamadou Sakho,\r\nsuivi par Paul Pobga.</strong></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3654, 1384988450, NULL, '2017-12-25 16:30:06', 0),
(53, '2', 'Matuidi présente le nouveau maillot des bleus', 'Matuidi-presente-le-nouveau-maillot-des-bleus', '', '', 'Publié', 0, 2, 35, 'Juste après la victoire de l''équipe de France 3 à  0 mardi soir face à  l''Ukraine,l''équipementier Nike a organisé un shooting photo pour pré', '<p style="text-align:center"><img alt="" src="/images/news/image/EDF/maillot2014.jpg" style="height:381px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="color:#800000"><strong>Juste apr&egrave;s la victoire de l&#39;&eacute;quipe de France 3 &agrave; 0 mardi soir face &agrave; l&#39;Ukraine,l&#39;&eacute;quipementier Nike a organis&eacute; un shooting photo pour pr&eacute;senter le nouveau maillot des bleus.</strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style="text-align:center"><img alt="" src="/images/news/image/EDF/maillot-2014.jpg" style="height:500px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Une nouvelle tunique plus sombre avec un col blanc,qui sera accompagn&eacute;e d&#39;un short blanc et de chaussettes rouges qui seront utilis&eacute;s pour la coupe du monde au Br&eacute;sil.</strong></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '3', '1', '1', 0, 0, 0, 1, 3567, 1385033400, NULL, '2017-12-27 01:29:50', 0),
(54, '2', 'Cheyrou : « Le PSG est impressionnant »', 'Cheyrou-Le-PSG-est-impressionnant', '', '', 'Publié', 1, 2, 31, 'Interrogé en conférence de presse sur les concurrents de l''Olympique de Marseille pour le podium de la ligue 1,le milieu de terrain du club ', '<div class="videodetector"><iframe frameborder="0" src="https://www.youtube.com/embed/togOOkSswq4?autohide=1&amp;controls=1&amp;showinfo=0"></iframe></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>fvrvvffd</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/b4d20.jpg', '2', '2', '1', 0, 0, 0, 1, 3534, 1514442600, NULL, '2018-01-02 01:38:33', 0),
(55, '0', 'Sakho : « Paris ? C''est derrière moi »', 'sakho-paris-c-est-derriere-moi', '', '', 'Publié', 0, 0, 36, 'Invité hier de l''émission de radio « Luis Attaque » sur RMC,l''ancien défenseur du Paris Saint Germain,Mamadou Sakho a expliqué que sa page a', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Sakho/f676d.jpg" style="width: 600px; height: 302px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Invit&eacute; hier de l&#39;&eacute;mission de radio &laquo;&nbsp;Luis Attaque&nbsp;&raquo; sur RMC,l&#39;ancien d&eacute;fenseur du Paris Saint Germain,Mamadou Sakho a expliqu&eacute; que la page avec son club de c&oelig;ur &eacute;tait derri&egrave;re lui.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <i>&laquo;&nbsp;<em>Dans la vie comme dans le football,il faut savoir faire des choix et les assumer. J&rsquo;ai pris la d&eacute;cision de quitter le PSG. J&rsquo;ai atteint tous mes objectifs avec Paris. Aujourd&rsquo;hui,Paris,c&rsquo;est derri&egrave;re moi,assure-t-il. Je suis content d&rsquo;avoir fait ce choix d&rsquo;aller &agrave; Liverpool,dans un grand club anglais. Comme Laurent Blanc le disait auparavant,il a toujours fait ses choix de carri&egrave;re par rapport &agrave; la s&eacute;lection. C&rsquo;est pareil pour moi. Aujourd&rsquo;hui,&ccedil;a me sourit. Je vais continuer &agrave; travailler pour progresser.&nbsp;&raquo;</em> </i></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3362, 1385018434, NULL, '2017-12-25 16:30:06', 0),
(56, '0', 'Une offre de 60 M€ pour Pogba ?', 'une-offre-de-60-m-pour-pogba', '', '', 'Publié', 0, 0, 33, 'Alors que la presse Italienne évoquaient depuis quelques jours la possible arrivée de Paul Pogba au Paris Saint Germain pour 45 à  50 millio', '<p style="margin-bottom: 0cm; text-align: center;">\r\n <img alt="" src="/images/news/image/joueur_ou_entraineur_externe/pogba.jpg" style="width: 600px; height: 318px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Alors que la presse Italienne &eacute;voquaient depuis quelques jours la possible arriv&eacute;e de Paul Pogba au Paris Saint Germain pour 45 &agrave; 50 millions d&#39;euros,la presse Anglaise d&eacute;tiendrait quelques informations &agrave; ce sujet.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  En effet le m&eacute;dia Anglais,Sports Direct News croit savoir que les dirigeants du Paris Saint Germain pr&eacute;parerait une offre de 60 millions d&#39;euros d&egrave;s cet hiver pour s&#39;attacher les services de l&#39;international Fran&ccedil;ais de 20 ans.</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3376, 1385021434, NULL, '2017-12-25 16:30:06', 0),
(57, '0', 'La Suède ne veut pas là¢cher Ibrahimovic', 'la-suede-ne-veut-pas-lacher-ibrahimovic', '', '', 'Publié', 0, 0, 31, 'Capitaine de la Suède,l''attaquant de 32 ans du Paris Saint Germain,Zlatan Ibrahimovic a expliqué après l''élimination en barrage face au Port', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Ibrahimovic/ibra-conf-suede.jpg" style="width: 512px; height: 353px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Capitaine de la Su&egrave;de,l&#39;attaquant de 32 ans du Paris Saint Germain,Zlatan Ibrahimovic a expliqu&eacute; apr&egrave;s l&#39;&eacute;limination en barrage face au Portugal que c&#39;&eacute;tait sa derni&egrave;re chance de jouer une coupe du monde.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  Des d&eacute;clarations que le milieu de la Su&egrave;de,Jimmy Durmaz ne veut pas entendre :</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#000080;"><i>&laquo;&nbsp;Nous avons notre plus grande star Ibrahimovic qui sera avec nous pour le championnat d&rsquo;Europe et nous essayons de le convaincre pour qu&rsquo;il fasse la Coupe du Monde aussi. Nous appuyons sur les bons arguments&nbsp;&raquo;</i></span></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3396, 1385024434, NULL, '2017-12-25 16:30:06', 0),
(58, '6', 'Un départ de Pastore ? Oui mais en Juin', 'Un-depart-de-Pastore-Oui-mais-en-Juin', '', '', 'Publié', 1, 2, 33, 'Alors que les rumeurs d''un départ de Javier Pastore dès cet hiver prolifère sur le net,l''agent certifié FIFA,Fabrizio Ferrari,spécialisé sur', '<p>Alors que les rumeurs d&#39;un d&eacute;part de <strong>Javier Pastore </strong>d&egrave;s cet hiver prolif&egrave;re sur le net,l&#39;agent certifi&eacute; FIFA,Fabrizio Ferrari,sp&eacute;cialis&eacute; sur le march&eacute; italien et fran&ccedil;ais,croit savoir que Pastore ne quittera pas le PSG cet hiver. &nbsp;</p>\r\n\r\n<blockquote>\r\n<p>&laquo;&nbsp;Le probl&egrave;me de Javier Pastore est plus psychologique que technique,et je pense que Laurent Blanc peut g&eacute;rer la situation au PSG. S&rsquo;il peut venir &agrave; la Roma en janvier ? Il ne faut m&ecirc;me pas y penser ! Ce sera plus facile en juin.&nbsp;&raquo;bjb</p>\r\n</blockquote>\r\n\r\n<form action="../poll/meneur" enctype="multipart/form-data" id="az" method="post" name="je teste">Qui doit &ecirc;tre le meneur du PSG ?&nbsp;<input name="meneur" type="checkbox" value="Pastore" /><input name="meneur" type="checkbox" value="Sanchez" /><input name="meneur" type="checkbox" value="ozil" />&nbsp;<input name="valider" type="submit" />&nbsp;</form>\r\n\r\n<p>&nbsp;</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/62738.jpg', '2, 3', '0', '1, 2', 0, 0, 0, 1, 3375, 1514719500, NULL, '2018-01-02 02:35:49', 0),
(59, '0', 'Ménès : « Matuidi est monstrueux »', 'Menes-Matuidi-est-monstrueux', '', '', 'Publié', 1, 2, 31, 'Le journaliste sportif de Canal +,Pierre Ménès est revenu sur la prestation de Blaise Matuidi lors de la victoire 3 à  0 de l''équipe de Fran', '<p style="text-align:center"><img alt="" src="/images/news/image/Journalistes/00764218-photo-pierre-menes.jpg" style="height:400px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="color:#800000"><strong>Le journaliste sportif de Canal +,Pierre M&eacute;n&egrave;s est revenu sur la prestation de Blaise Matuidi lors de la victoire 3 &agrave; 0 de l&#39;&eacute;quipe de France mardi soir face &agrave; l&#39;Ukraine.</strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>&laquo;&nbsp;Il est monstrueux. Pour moi le symbole,c&#39;est quand il vient reprendre le ballon dans les pieds de l&#39;attaquant ukrainien. Avec Cabaye derri&egrave;re lui,il a pu jouer son r&ocirc;le de harceleur avec efficacit&eacute;. Egal &agrave; lui-m&ecirc;me,c&#39;est-&agrave;-dire formidable&nbsp;&raquo;</em></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '2', '1', '2', 0, 0, 0, 1, 3324, 1385030340, NULL, '0000-00-00 00:00:00', 0),
(60, '0', 'Larqué compare Sakho à  Thuram', 'larque-compare-sakho-a-thuram', '', '', 'Publié', 0, 0, 31, 'Alors que le joueur lui même avait déclaré a ses débuts que son idole était Lilian Thuram,le journaliste sportif de RMC,Jean Michel Larqué a', '<p style="margin-bottom: 0cm; font-style: normal; text-align: center;">\r\n  <img alt="" src="/images/news/image/Journalistes/larqu%C3%A9(2).jpg" style="width: 409px; height: 245px;" /></p>\r\n<p style="margin-bottom: 0cm; font-style: normal">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm; font-style: normal">\r\n  <span style="color:#800000;"><strong>Alors que le joueur lui m&ecirc;me avait d&eacute;clar&eacute; a ses d&eacute;buts que son idole &eacute;tait Lilian Thuram,le journaliste sportif de RMC,Jean Michel Larqu&eacute; a compar&eacute; Mamadou Sakho &agrave; Lilian Thuram apr&egrave;s son doubl&eacute; contre l&#39;Ukraine.</strong></span></p>\r\n<p style="margin-bottom: 0cm; font-style: normal">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <i>&laquo;&nbsp;Thuram n&#39;avait jamais marqu&eacute; avant la Croatie. Il en met deux en demi-finale de la Coupe du monde. Sakho n&#39;avait jamais marqu&eacute;. Il ne devait pas jouer si Koscielny n&#39;avait pas &eacute;t&eacute; exclu. Et il en met deux. C&#39;est compl&egrave;tement irrationnel !&nbsp;&raquo;</i></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3328, 1385032057, NULL, '2017-12-25 16:30:06', 0),
(61, '0', 'Ibrahimovic élu homme de l''année', 'ibrahimovic-elu-homme-de-l-annee', '', '', 'Publié', 0, 0, 31, 'Malgré une non participation à  la coupe du monde,l''attaquant du Paris Saint Germain,Zlatan Ibrahimovic a reà§u un nouveau trophée.', '<p style="margin-bottom: 0cm; text-align: center;">\r\n <img alt="" src="/images/news/image/Matuidi/matuidi-ibrahimovic.jpeg" style="width: 567px; height: 291px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Malgr&eacute; une non participation &agrave; la coupe du monde,l&#39;attaquant du Paris Saint Germain,Zlatan Ibrahimovic a re&ccedil;u un nouveau troph&eacute;e.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  En effet,le magazine GQ,un mensuel consacr&eacute; &agrave; la mode et &agrave; la culture a annonc&eacute; mercredi soir que Zlatan Ibrahimovic avait &eacute;t&eacute; d&eacute;sign&eacute; comme l&rsquo;homme de l&rsquo;ann&eacute;e en 2013.</p>\r\n<p style="margin-bottom: 0cm">\r\n Le milieu de terrain du Paris Saint Germain,Blaise Matuidi a quant &agrave; lui &eacute;t&eacute; &eacute;lu sportif de l&#39;ann&eacute;e 2013.</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3309, 1385034877, NULL, '2017-12-25 16:30:06', 0),
(62, '0', 'Ntep ciblé par le PSG', 'ntep-cible-par-le-psg', '', '', 'Publié', 0, 0, 33, 'A seulement 21 ans,le jeune attaquant Auxerrois serait sur les tablettes de l''Olympique de Marseille,mais également d''Arsenal et du Paris Sa', '<p style="text-align: center;">\r\n  <img alt="" src="/images/news/image/Cibles/afe1e.jpg" style="width: 600px; height: 302px;" /></p>\r\n<p style="text-align: center;">\r\n  &nbsp;</p>\r\n<p>\r\n <strong><span style="color:#b22222;">A seulement 21 ans,le jeune attaquant Auxerrois serait sur les tablettes de l&rsquo;Olympique de Marseille,mais &eacute;galement d&rsquo;Arsenal et du Paris Saint-Germain.</span></strong></p>\r\n<p>\r\n &nbsp;</p>\r\n<p>\r\n Si la rumeur se veut encore discr&egrave;te pour le moment,le jeune Fran&ccedil;ais d&rsquo;origine Camerounaise int&eacute;resserait de grosses &eacute;curies de premi&egrave;re division. Avec cinq buts inscrits et une passe d&eacute;cisive &agrave; son actif en L2,l&rsquo;attaquant de l&rsquo;&eacute;quipe de France espoir devrait monter en grade prochainement,reste &agrave; savoir o&ugrave;&hellip;</p>\r\n<p>\r\n &nbsp;</p>\r\n<p>\r\n Selon RMC,le club de la capitale aurait d&rsquo;ores et d&eacute;j&agrave; entam&eacute; les discussions et devrait d&eacute;voiler son offre dans les plus brefs d&eacute;lais.</p>\r\n<p>\r\n &nbsp;</p>\r\n<p>\r\n <strong>Nul doute que celle-ci saura ravir le club Auxerrois,bien que son jeune attaquant soit li&eacute; au club jusqu&rsquo;en 2015,et qu&rsquo;Arsenal semble d&eacute;cid&eacute; &agrave; s&rsquo;offrir les services du jeune attaquant au plus vite.&nbsp;</strong></p>\r\n', 'Commentaire', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3341, 1385076600, NULL, '2017-12-25 16:30:06', 0),
(63, '1', 'Weber : « Un évènement »', 'Weber-Un-evenement', '', '', 'Publié', 1, 4, 31, 'Le défenseur du Stade de Reims,Anthony Weber est revenu en conférence de presse sur la reception du Paris Saint Germain ce samedi à  17h.', '<p style="text-align:center"><img alt="" src="/images/news/image/joueur_ou_entraineur_externe/Reims/weber.jpg" style="height:300px; width:200px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="color:#800000"><strong>Le d&eacute;fenseur du Stade de Reims,Anthony Weber est revenu en conf&eacute;rence de presse sur la reception du Paris Saint Germain ce samedi &agrave; 17h.</strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>&laquo; C&#39;est un match forc&eacute;ment particulier car on re&ccedil;oit le grand Paris Saint-Germain,avec toutes ses stars.C&#39;est toujours un &eacute;v&egrave;nement pour nous,pour nos supporters et pour toute la ville de Reims. &raquo;</em></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '3', '2', '2', 0, 0, 0, 1, 3383, 1384993980, NULL, '0000-00-00 00:00:00', 0),
(64, '0', 'Sakho revient sur son match', 'sakho-revient-sur-son-match', '', '', 'Publié', 0, 12, 36, 'Invité hier de l''émission de radio « Luis Attaque » sur RMC,l''ancien défenseur du Paris Saint Germain,Mamadou Sakho est revenu sur sa presta', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Sakho/sakho-edf-2014.jpg" style="width: 580px; height: 574px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Invit&eacute; hier de l&#39;&eacute;mission de radio &laquo;&nbsp;Luis Attaque&nbsp;&raquo; sur RMC,l&#39;ancien d&eacute;fenseur du Paris Saint Germain,Mamadou Sakho est revenu sur sa prestation h&eacute;ro&iuml;que contre l&#39;Ukraine.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  &laquo;&nbsp;<i>Je reste d&eacute;fenseur,mais occasionnellement,si je peux marquer des buts&hellip; La derni&egrave;re fois que j&rsquo;ai marqu&eacute; un doubl&eacute;,&ccedil;a remonte &agrave; un match contre Caen avec le PSG,on avait gagn&eacute; 5-0. (...) J&rsquo;ai la chance d&rsquo;avoir eu ce retour par rapport &agrave; Thuram. C&rsquo;est flatteur,mais je ne pense qu&rsquo;&agrave; donner le maximum pour l&rsquo;&eacute;quipe. S&rsquo;il y a un enseignement &agrave; tirer apr&egrave;s ce match&nbsp;? La solidarit&eacute; collective,il faut avant tout retenir que quand on veut,on peut. Toute l&rsquo;&eacute;quipe &eacute;tait pr&ecirc;te,quand on joue tous ensemble,on peut faire quelque chose de grand</i>.&nbsp;&raquo;</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3395, 1385038959, NULL, '2017-12-25 16:55:25', 0),
(65, '0', 'Matuidi chambre les journalistes', 'Matuidi-chambre-les-journalistes', '', '', 'Publié', 1, 12, 31, 'Passé en zone mixte après la victoire 3 à  0 de l''équipe de France mardi soir contre l''Ukraine,le milieu de terrain du Paris Saint Germain,B', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Matuidi/981b2.jpg" style="width: 600px; height: 302px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n   </p>\r\n<p style="margin-bottom: 0cm">\r\n <span style="color:#800000;"><strong>Passé en zone mixte après la victoire 3 à 0 de l''équipe de France mardi soir contre l''Ukraine,le milieu de terrain du Paris Saint Germain,Blaise Matuidi a chambré avec le sourire les journalistes présent.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  </p>\r\n<p style="margin-bottom: 0cm">\r\n <i>« Vous y avez pas trop cru non ? Pas d’accord ? Vous aussi vous êtes contents ! C’est une victoire de tout le monde. Vous êtes soulagés de pouvoir faire votre métier au Brésil ! »</i></p>\r\n', 'Article', 3, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3352, 1514236468, NULL, '0000-00-00 00:00:00', 0),
(66, '0', 'Ronaldo remercie Ibrahimovic', 'ronaldo-remercie-ibrahimovic', '', '', 'Publié', 0, 12, 31, 'Mardi soir lors de la victoire 3 à  2 du Portugal contre la Suède grà¢ce à  un triplé de l''attaquant du Real Madrid,l''attaquant du Paris Sai', '<p style="margin-bottom: 0cm; text-align: center;">\r\n <img alt="" src="/images/news/image/Ibrahimovic/ibra-ronaldo.jpg" style="width: 600px; height: 338px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Mardi soir lors de la victoire 3 &agrave; 2 du Portugal contre la Su&egrave;de gr&acirc;ce &agrave; un tripl&eacute; de l&#39;attaquant du Real Madrid,l&#39;attaquant du Paris Saint Germain,Zlatan Ibrahimovic a applaudi Cristiano Ronaldo apr&egrave;s son troisi&egrave;me buts.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  Un geste que l&#39;attaquant Portugais a souhaiter souligner en zone mixte :</p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#000080;"><i>&laquo; Je me sens heureux des applaudissements d&rsquo;Ibra apr&egrave;s mon troisi&egrave;me but&nbsp;parce que Zlatan est un joueur fantastique.&nbsp;&raquo;</i></span></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3642, 1385044061, NULL, '2017-12-25 16:55:25', 0),
(67, '0', 'Guillaume Hoarau de retour ?', 'guillaume-hoarau-de-retour', '', '', 'Publié', 0, 12, 36, 'Après avoir quitté le Paris Saint-Germain pour le club chinois de Dalian Aerbin la saison dernière,le Réunionnais a mis fin à  son contrat e', '<p style="text-align: center;">\r\n  <img alt="" src="/images/news/image/Hoarau/43894.jpg" style="width: 600px; height: 305px;" /></p>\r\n<p style="text-align: center;">\r\n  &nbsp;</p>\r\n<p>\r\n <strong><span style="color:#b22222;">Apr&egrave;s avoir quitt&eacute; le Paris Saint-Germain pour le club chinois de Dalian Aerbin la saison derni&egrave;re,le R&eacute;unionnais a mis fin &agrave; son contrat et souhaiterait rejoindre l&rsquo;Europe.</span></strong></p>\r\n<p>\r\n  &nbsp;</p>\r\n<p>\r\n Parti &agrave; cause de sa rel&eacute;gation au rang de rempla&ccedil;ant de Zlatan,Guillaume Hoarau pensait que l&rsquo;Asie &nbsp;lui permettrait de relancer sa carri&egrave;re&hellip; Avec seulement 2 buts au compteur,l&rsquo;ex attaquant parisien n&rsquo;a visiblement pas rencontr&eacute; le succ&egrave;s escompt&eacute;,et envisagerait de rejouer sur le vieux continent.</p>\r\n<p>\r\n  &nbsp;</p>\r\n<p>\r\n <strong>Si un retour au PSG para&icirc;t tr&egrave;s peu probable,la destination du joueur reste encore inconnue,bien que certains clubs Fran&ccedil;ais se soient montr&eacute;s tr&egrave;s int&eacute;ress&eacute;s,&agrave; l&rsquo;image de Lens et Saint-Etienne et m&ecirc;me l&rsquo;OM&hellip;&nbsp;</strong></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3396, 1385074831, NULL, '2017-12-25 17:01:41', 0),
(68, '1', 'Ibra trouve « ridicule » les gens « qui se prétendent fashion »', 'Ibra-trouve-ridicule-les-gens-qui-se-pretendent-fashion', '', '', 'Publié', 0, 4, 32, 'Elu homme de l''année par le magazine GQ,l''attaquant parisien en a profité pour s''exprimer au sujet de certains footballeurs qui se prétenden', '<p><em><strong>Elu homme de l&#39;ann&eacute;e par le magazine GQ,l&#39;attaquant parisien en a profit&eacute; pour s&#39;exprimer au sujet de certains footballeurs qui se pr&eacute;tendent &ldquo;fashion&rdquo;</strong></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><span style="color:#000080">&laquo; La mode est une affaire de sp&eacute;cialistes. Je trouve ridicule ces gens qui ach&egrave;tent le look complet d&rsquo;un mannequin en vitrine et fanfaronnent ensuite en se pr&eacute;tendant &ldquo;fashion&rdquo;. C&rsquo;est le cas de beaucoup de footballeurs ! Mais je ne vous donnerai pas de noms !&nbsp; &raquo;</span></em></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '3', '2', '2', 0, 0, 0, 1, 3345, 1385119560, NULL, '2017-12-27 02:05:14', 0),
(69, '0', 'Digne : « Je progresse beaucoup avec Paris »', 'Digne-Je-progresse-beaucoup-avec-Paris', '', '', 'Publié', 1, 12, 31, 'Présent en conférence de presse hier, le latéral gauche du Paris Saint Germain, Lucas Digne est revenu sur les progrès qu''il faisait depuis ', '<p style="text-align:center"><img alt="" src="/images/news/image/Digne/Joueur_21_Fiche_Ban.jpg" style="height:288px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="color:#800000"><strong>Pr&eacute;sent en conf&eacute;rence de presse hier, le lat&eacute;ral gauche du Paris Saint Germain, Lucas Digne est revenu sur les progr&egrave;s qu&#39;il faisait depuis son arriv&eacute;e dans le club de la capitale.</strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>&laquo; Oui. Je suis plus d&eacute;cisif maintenant qu&rsquo;auparavant. Je centre mieux et d&eacute;fensivement je progresse chaque jour. L&rsquo;exigence ici est plus forte qu&rsquo;ailleurs donc je suis oblig&eacute; de hausser mon niveau pour r&eacute;pondre aux attentes. &raquo; </em></p>\r\n', 'Commentaire', 0, '/ckfinder/userfiles/files/newdefault.jpg', '0', '0', '1, 2', 0, 0, 0, 1, 3357, 1385078400, NULL, '0000-00-00 00:00:00', 0),
(70, '2', 'Jallet : « On ne change pas une équipe qui gagne »', 'Jallet-On-ne-change-pas-une-equipe-qui-gagne-70', '', '', 'Publié', 0, 12, 33, 'Invité de l''émission de radio Tribune 100% Ducrocq sur France Bleu 107.1, le latéral droit du Paris Saint Germain, Christophe Jallet est rev', '<p style="text-align:center"><img alt="" src="/images/news/image/Jallet/iconsport_noe_260812_14_131-658x306.jpg" style="height:279px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="color:#800000"><strong>Invit&eacute; de l&#39;&eacute;mission de radio Tribune 100% Ducrocq sur France Bleu 107.1, le lat&eacute;ral droit du Paris Saint Germain, Christophe Jallet est revenu sur la concurrence avec Gr&eacute;gory Van DerWiel.</strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><em>&laquo;&nbsp;La concurrence de Van der Wiel ? Je jouais au d&eacute;but de saison. Les r&eacute;sultats n&rsquo;&eacute;taient pas l&agrave;, le coach a fait des choix dont j&rsquo;ai fait partie, puis l&rsquo;&eacute;quipe a gagn&eacute;. Greg a pris le relais, pris confiance et l&rsquo;&eacute;quipe a gagn&eacute;. On ne change pas une &eacute;quipe qui gagne. Chaque jour &agrave; l&rsquo;entrainement j&rsquo;essaye de gagner ma place, mais Greg a l&rsquo;avantage car il joue. Je prends bien la concurrence. A partir du moment o&ugrave; je donne tout, on sera forc&eacute;ment r&eacute;compens&eacute;. C&rsquo;est par le travail qu&rsquo;arrivent les bonnes choses. L&rsquo;entraineur fait des choix. Tant que l&rsquo;&eacute;quipe marche, je ne peux rien dire.&nbsp;&raquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n</blockquote>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '1', '0', '1', 0, 0, 0, 1, 3343, 1516080600, NULL, '2018-01-17 15:19:22', 0),
(71, '0', 'Le PSG en mode Indonésie avec Anggun', 'le-psg-en-mode-indonesie-avec-anggun', '', '', 'Publié', 0, 12, 31, 'Après avoir traduit le site officiel du Paris Saint Germain en Anglais, Arabe, Japonais, Chinois, Espagnol et Portugais, le club de la capit', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Divers/blanc-angun.jpg" style="width: 600px; height: 400px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Apr&egrave;s avoir traduit le site officiel du Paris Saint Germain en Anglais, Arabe, Japonais, Chinois, Espagnol et Portugais, le club de la capitale vient d&#39;ouvrir son site internet &agrave; l&#39;Indon&eacute;sie.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  Le Directeur G&eacute;n&eacute;ral D&eacute;l&eacute;gu&eacute; du Paris Saint-Germain., Jean-Claude Blanc a expliqu&eacute; l&#39;int&eacute;r&ecirc;t du club de la capitale de traduire le site en plusieurs langues :</p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#000080;"><i><em>&laquo; Notre volont&eacute; est d&rsquo;aller &agrave; la rencontre de tous ceux qui partagent l&rsquo;ambition et les valeurs du Paris Saint Germain. En d&eacute;veloppant notre site en langue indon&eacute;sienne nous serons plus proches de nouveaux fans pour leur permettre de participer &agrave; la vie du club &raquo;</em></i></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  Pour marquer son lancement, Anggun, la chanteuse indon&eacute;sienne naturalis&eacute;e fran&ccedil;aise a post&eacute; aujourd&rsquo;hui le premier tweet&nbsp; lors d&rsquo;une c&eacute;r&eacute;monie &agrave; l&rsquo;Ambassade d&rsquo;Indon&eacute;sie &agrave; Paris : <span style="color:#000080;"><em>&laquo; Fi&egrave;re de contribuer au rayonnement de Paris dans mon pays l&rsquo;Indon&eacute;sie, avec le Paris Saint-Germain @PSGIndonesia. &raquo;</em></span></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3306, 1385101225, NULL, '2017-12-25 17:07:03', 0),
(72, '0', 'Coach Vahid qui chante « one,  two,  three,  viva Algérie ! »', 'Coach-Vahid-qui-chante-one-two-three-viva-Algerie', '', '', 'Publié', 1, 12, 33, 'L''ancien entraîneur et joueur du PSG Vahid Halilhodzic qui est actuellement le sélectionneur national de l''Algérie s''est laissé aller à  une', '<p style="text-align: center;">\r\n <img alt="" src="/images/news/image/anciens/vahid_halilhodzic.jpg" /></p>\r\n<p style="text-align: center;">\r\n   </p>\r\n<p>\r\n  <span style="color:#800000;"><strong><em>L''ancien entraîneur et joueur du PSG Vahid Halilhodzic qui est actuellement le sélectionneur national de l''Algérie s''est laissé aller à une danse lors d''un repas en l''honneur de la qualification de l''équipe d''Algérie pour le mondial 2014.</em></strong></span></p>\r\n<p>\r\n   </p>\r\n<p>\r\n   </p>\r\n<p style="text-align: center;">\r\n  <iframe frameborder="0" height="270" src="http://www.dailymotion.com/embed/video/x17ggb3" width="480"></iframe><br />\r\n <a href="http://www.dailymotion.com/video/x17ggb3_quand-vahid-halilhodzic-improvise-une-danse-endiablee_sport" target="_blank">Quand Vahid Halilhodzic improvise une danse...</a> <i>par <a href="http://www.dailymotion.com/evidenceprod" target="_blank">evidenceprod</a></i></p>\r\n', 'Article', 3, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3314, 1514236455, NULL, '0000-00-00 00:00:00', 1),
(73, '0', 'Katia trouve « ridicule » les gens « qui se prétendent fashion »', 'Katia-trouve-ridicule-les-gens-qui-se-pretendent-fashion', '', '', 'Publié', 1, 2, 33, 'Elu homme de l''année par le magazine GQ,l''attaquant parisien en a profité pour s''exprimer au sujet de certains footballeurs qui se prétenden', '<p style="text-align:center"><img alt="" src="/images/news/image/Ibrahimovic/ibra_golden_foot_award.jpg" style="height:431px; width:595px" /></p>\r\n\r\n<p style="text-align:center">&nbsp;</p>\r\n\r\n<p><em><strong>Elu homme de l&#39;ann&eacute;e par le magazine GQ,l&#39;attaquant parisien en a profit&eacute; pour s&#39;exprimer au sujet de certains footballeurs qui se pr&eacute;tendent &ldquo;fashion&rdquo;</strong></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><span style="color:#000080">&laquo; La mode est une affaire de sp&eacute;cialistes. Je trouve ridicule ces gens qui ach&egrave;tent le look complet d&rsquo;un mannequin en vitrine et fanfaronnent ensuite en se pr&eacute;tendant &ldquo;fashion&rdquo;. C&rsquo;est le cas de beaucoup de footballeurs ! Mais je ne vous donnerai pas de noms !&nbsp; &raquo;</span></em></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '0', '0', '0', 0, 0, 0, 1, 3346, 1385119560, NULL, '0000-00-00 00:00:00', 0);
INSERT INTO `posts` (`id`, `author_id`, `title`, `slug`, `meta_description`, `meta_keywords`, `status`, `une`, `section`, `rubrique`, `resume`, `content`, `type_page`, `story`, `image`, `id_players`, `id_teams`, `id_matchs`, `id_news`, `id_topic`, `id_com`, `notification`, `views`, `date`, `created_at`, `updated_at`, `isDelete`) VALUES
(74, '0', 'David Ginola,El Magnifico', 'David-GinolaEl-Magnifico', '', '', 'Publié', 1, 12, 50, 'LMDPSG (re)lance la rubrique Joueur de Légende. Chaque semaine, découvrez le portrait d''un ancien joueur du PSG qui a marqué l''histoire du c', '<p style="text-align: center;">\r\n  <img alt="" src="/images/news/image/ginola_vs_barca_95.jpg" style="width: 534px; height: 301px;" /></p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n <strong>LMDPSG (re)lance la rubrique <em>Joueur de Légende</em>. Chaque semaine, découvrez le portrait d''un ancien joueur du PSG qui a marqué l''histoire du club.</strong></p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n<p style="text-align: justify;">\r\n Acteur majeur des grandes années parisiennes entre 1992 et 1995, <em>El Magnifico</em> reste aujourd’hui encore l’un des « chouchous » historiques du Parc, et mérite son statut de joueur de légende du PSG.</p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n <strong>Début de carrière :</strong></p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n<p style="text-align: justify;">\r\n Varois d’origine, il n’est pas retenu par le centre de formation de l’OGC Nice à cause de son petit gabarit. C’est sous les couleurs du club phare de son département, le Sporting de Toulon, qu’il effectue ses premiers pas dans l’élite, à seulement 18 ans. Il est ensuite titularisé pour la première fois par son entraîneur Christian Dalger en Décembre 1985 à Bordeaux, face aux Giresse, Tigana ou Battiston, stars de l’équipe de France de l’époque. Il enchaîne par la suite les bonnes performances malgré son jeune âge. Il gagne la confiance de son club, qui le fait jouer la quasi totalité des matchs retour de la saison. L’exercice suivant est sa première saison pleine. Malgré une année compliquée pour le club, il est sélectionné en équipe de France espoirs en fin de saison lors du tournoi de Toulon. Devenu incontournable dans l’équipe dorénavant entraînée par Rolland Courbis, il est l’un des grands artisans de la 5<sup>ème</sup> place en championnat des Varois en 1988.</p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n<p style="text-align: justify;">\r\n Trois ans après ses grands débuts en D1, il signe pour la première fois dans un club parisien : le Matra Racing. L’équipe entraînée par Artur Jorge est ambitieuse, avec notamment les internationaux Luis Fernandez et Maxime Bossis, mais aussi la star uruguayenne Enzo Francescoli. Mais la saison s’avère plus compliquée que prévu, et l’actionnaire principal se désengage en 1989. Toutes les vedettes du club plient alors bagage, et Ginola devient tête d’affiche d’un Racing fortement rajeuni. En 1990, malgré une finale de Coupe de France (perdue face à Montpellier), le club est relégué sportivement en D2, et administrativement en D3.</p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n Ginola est alors transféré à Brest, dans un effectif alliant jeunesse et expérience. Il parvient à se mettre en valeur, et est appelé pour la première fois en équipe de France A par Michel Platini. Si le club breton fait une saison correcte, terminant à une honorable 11<sup>ème</sup> place en championnat, ses graves difficultés financières l’amènent à être relégué en D2. Ginola reste au club jusqu’à la mi-saison suivante, le temps d’être recruté au mercato d’hiver par… le Paris Saint-Germain !</p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n<p style="text-align: center;">\r\n  <img alt="" height="304" src="/images/news/image/ginola_matra.jpg" width="214" /></p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n <strong>L''aventure parisienne :</strong></p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n Ginola débarque en Janvier 1992 au PSG avec le statut de grand espoir du football français. Il retrouve dans la capitale son ancien coach au Matra, le Portugais Artur Jorge. Le club parisien, fraichement, racheté par Canal +, termine à une très bonne 3<sup>ème</sup> place en D1, se qualifiant pour la Coupe UEFA.</p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n La saison suivante, il est rejoint par de vieilles connaissances que sont Bernard Lama (ex Brest) et Vincent Guérin (ex Matra). Il est également rappelé en Bleus par le nouveau sélectionneur Gérard Houllier, en vue des qualifications pour la Coupe du Monde 1994. Paris réalise une grande saison, en terminant dauphin de l’OM, mais décroche la Coupe de France face à Nantes. Ginola remporte alors son premier titre en club. En Europe, les Franciliens atteignent les demi-finales, en s’inclinant face à la Juventus, après avoir sorti le grand Real, notamment lors d’un match retour d’anthologie au Parc, où Ginola marque un but somptueux. Il s’impose alors comme l’un des leaders techniques et physiques sur le terrain, et ne tarde pas à se faire adopter par les supporters.</p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n<p style="text-align: justify;">\r\n Lors de l’exercice suivant, le PSG semble imbattable. Leader en D1 dès le mois d’octobre, il ne lâchera plus jamais sa première place. Sur la scène continentale, le club parvient une nouvelle fois jusqu’en demi-finale, cette fois-ci en C2. Arsenal en sera son bourreau. Ginola est même sacré meilleur joueur de D1, mais il ne connaît pas la même réussite en équipe de France. Rarement titulaire malgré son statut d’intouchable en club, il clame haut et fort son mal être en Bleu, notamment à quelques jours du match décisif pour la qualification en Coupe du Monde, face à la Bulgarie. Mis sur le banc par Gérard Houllier, il rentre à 20 minutes de la fin du match, alors que le score de 1-1 est favorable à la France. Durant les arrêts de jeu, Ginola rate un centre, qui amène le second but bulgare suite à un contre fulgurant. La France est éliminée. Le coupable est tout désigné par le sélectionneur, ce sera Ginola ! Et même s’il continue d’être appelé par la suite de façon sporadique par Aimé Jacquet, la carrière internationale du Varois ne se remettra jamais vraiment de cet épisode douloureux.</p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n En 1994, le titre en poche, Paris fait donc son grand retour en Ligue des Champions. Les joueurs de Luis Fernandez, fraichement nommé, sont intraitables en phase de groupes, signant 6 victoires en autant de rencontres. En Quart de finale, c’est l’ogre barcelonais qui se dresse sur la route des Rouges et Bleus. Ginola et Weah sont étincelants, et le PSG passe en Demi-finales, où il se fera éliminer par le grand Milan. C’est à cette époque que le Varois y glane le surnom d<em>’El Magnifico</em>, en référence à ses performances impressionnantes contre les formations ibériques. En France, Ginola réalise une saison moins aboutie que la précédente sur un plan personnel, mais parvient tout de même à décrocher un doublé Coupe de France/Coupe de la Ligue. Ce sont les derniers titres de l’attaquant sous le maillot parisien, puisqu’il s’engage contre toute attente durant l’intersaison pour le club anglais de Newcastle, bien qu’annoncé chez des cadors, tels que le Barça et le Bayern.</p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n<p style="text-align: center;">\r\n  <img alt="" src="/images/news/image/ginola_coupe_joie.jpg" style="width: 400px; height: 250px;" /></p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n<p style="text-align: justify;">\r\n <strong>Sa carrière à l’étranger :</strong></p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n La première saison de Ginola chez les Magpies est remarquable. Agé de 28 ans, le Varois semble en pleine possession de ses moyens. Il enchaîne les performances de haut vol, et Newcastle est en passe de remporter la Premier League. Mais le club du nord de l’Angleterre s’écroule en fin d’exercice, et se fait doubler par le Manchester de Cantona. La saison suivante, Ginola ne s’entend pas avec son nouvel entraîneur, Kenny Dalglish. Il demande d’ailleurs lui-même à être placé sur la liste des transferts dès le mois de Mars 1997, alors que le club se porte bien en championnat.</p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n<p style="text-align: justify;">\r\n Il quitte durant l’été Newcastle, pour rejoindre le club de Tottenham, à Londres. L’équipe est moins huppée, mais l’attaquant y retrouve à l’âge de 30 ans une seconde jeunesse. N’empêchant pas les Spurs de végéter en milieu de tableau, il est tout de même l’auteur de bonnes prestations et de buts spectaculaires, le couronnant meilleur joueur du championnat en 1999. </p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n<p style="text-align: justify;">\r\n Durant l’été 2000, il se fâche une nouvelle fois avec son entraîneur, et quitte Londres pour rejoindre Birmingham et Aston Villa. Il est alors de moins en moins utilisé, et ne trouve que trop rarement le chemin des filets. Il tente alors de relancer tant bien que mal sa carrière sur le déclin, en s’engageant pour quelques mois à Everton, début 2002. Son bilan est maigre : 5 matchs joués, pour aucun but inscrit. Sans club à la fin de son contrat, à plus de 35 ans, David Ginola décide de mettre un terme à sa carrière, après 17 ans au plus haut niveau.</p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: center;">\r\n  <img alt="" src="/images/news/image/ginola_newcastle.jpeg" style="width: 400px; height: 272px;" /></p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n<p style="text-align: justify;">\r\n Après son retrait des terrains, David Ginola se dirige vers une carrière d’acteur. Il est aujourd’hui dans le milieu du journalisme sportif, ayant rejoint le service des sports de Canal + en Novembre 2013.</p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n <strong>Palmarès & récompenses personnelles :</strong></p>\r\n<p style="text-align: justify;">\r\n  <br />\r\n  <strong>Avec le Matra Racing:</strong></p>\r\n<p style="text-align: justify;">\r\n  â–º Finaliste de la Coupe de France en 1990</p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n  <strong>Avec le PSG :</strong><br />\r\n <br />\r\n  â–º Champion de France D1 en 1994<br />\r\n â–º Vice-champion de France D1 en 1993<br />\r\n  â–º Vainqueur de la Coupe de France en 1993 et 1995<br />\r\n â–º Vainqueur de la Coupe de la Ligue en 1995<br />\r\n â–º Joueur français de l’année 1993 (France Football)<br />\r\n   </p>\r\n<p style="text-align: justify;">\r\n  <strong>Avec Tottenham :</strong></p>\r\n<p style="text-align: justify;">\r\n â–º Vainqueur de la League Cup en 1999<br />\r\n  â–º Meilleur joueur de Premier League en 1999</p>\r\n<p style="text-align: justify;">\r\n <br />\r\n   <br />\r\n <strong>En Sélection :</strong><br />\r\n <br />\r\n  â–º 17 sélections (3 buts) en équipe de France entre 1990 et 1995<br />\r\n â–º Vainqueur et meilleur buteur de la Coupe Kirin en 1994<br />\r\n   </p>\r\n<p style="text-align: justify;">\r\n  </p>\r\n<p style="text-align: justify;">\r\n Adulé pour son élégance et sa technique dans tous les clubs dans lesquels il est passé, mais incompris, voire détesté sous le maillot des Bleus. Telle est la synthèse que l’on pourrait faire de la carrière de David Ginola. Quoi qu’il arrive, plus de 10 ans après la fin de sa carrière, il reste l’un des symboles de cette génération parisienne dorée, championne de France en 1994, et compétitive chaque saison sur la scène européenne.</p>\r\n<p style="text-align: justify;">\r\n   </p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 4290, 1514233004, NULL, '0000-00-00 00:00:00', 0),
(75, '0', 'Sans Silva et Alex', 'sans-silva-et-alex', '', '', 'Publié', 0, 12, 34, 'Laurent Blanc a convoqué un groupe de 19 joueurs pour la réception de Toulouse ce samedi à  17h.', '<p style="margin-bottom: 0cm; text-align: center;">\r\n <img alt="" src="/images/news/image/logopsg/Logo_PSG.jpg" style="width: 360px; height: 304px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Laurent Blanc a convoqu&eacute; un groupe de 19 joueurs pour la r&eacute;ception de Toulouse ce samedi &agrave; 17h.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p>\r\n CAMARA Zoumana<br />\r\n  CAVANI Edinson<br />\r\n  DIGNE Lucas<br />\r\n DOUCHEZ Nicolas<br />\r\n IBRAHIMOVIC Zlatan<br />\r\n  JALLET Christophe<br />\r\n LAVEZZI Ezequiel<br />\r\n  LUCAS<br />\r\n MARQUINHOS<br />\r\n  MATUIDI Blaise<br />\r\n  MAXWELL<br />\r\n MENEZ J&eacute;r&eacute;my<br />\r\n  ONGENDA Hervin<br />\r\n  PASTORE Javier<br />\r\n  RABIOT Adrien<br />\r\n SIRIGU Salvatore<br />\r\n  THIAGO MOTTA<br />\r\n  VAN DER WIEL Gregory<br />\r\n  VERRATTI Marco</p>\r\n<p>\r\n <strong>Absents :</strong><br />\r\n  ALEX (blessure)<br />\r\n COMAN Kingsley (choix)<br />\r\n  MAIGNAN Mike (choix)<br />\r\n  THIAGO SILVA (blessure)</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3334, 1380340800, NULL, '2017-12-25 17:24:46', 0),
(76, '0', 'Blanc revient sur l''état de forme du PSG', 'blanc-revient-sur-l-etat-de-forme-du-psg', '', '', 'Publié', 0, 12, 31, 'Avec le championnat et la Ligue des champions,le Paris Saint Germain enchaîne depuis deux semaines un match tout les trois jours.', '<p style="margin-bottom: 0cm; text-align: center;">\r\n <img alt="" src="/images/news/image/Blanc/blanc-entrainement.jpg" style="width: 600px; height: 400px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Avec le championnat et la Ligue des champions,le Paris Saint Germain encha&icirc;ne depuis deux semaines un match tout les trois jours.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  Un rythme infernal qui laisse des traces,comme la expliqu&eacute; le coach du club de la capitale,Laurent Blanc en conf&eacute;rence de presse :</p>\r\n<p style="margin-bottom: 0cm">\r\n  <br />\r\n  <span style="color:#000080;"><em>&laquo;&nbsp;On a un calendrier charg&eacute;,avec la Champions League. On a effectu&eacute; un d&eacute;placement p&eacute;rilleux &agrave; Ath&egrave;nes la semaine derni&egrave;re avant de recevoir Monaco. C&#39;est vrai que l&#39;on a souffert &agrave; Valenciennes et que l&#39;on a fait un mauvais match,on en est conscient. Cependant on a gagn&eacute; et si on continue &agrave; prendre 3 points m&ecirc;me en jouant mal,ce sera bon pour la suite championnat. On r&eacute;cup&egrave;re bien et l&#39;effectif est assez fourni pour faire face au rythme des matches.&nbsp;</em></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  <br />\r\n  <span style="color:#000080;"><em>&nbsp;Le probl&egrave;me c&#39;est surtout que nous avons des bless&eacute;s dans un m&ecirc;me secteur de jeu. En ce moment ce sont les d&eacute;fenseurs qui sont touch&eacute;s. On fait avec,mais on esp&egrave;re que cela ne va pas durer. Alex est forfait face &agrave; Toulouse. On a bien g&eacute;r&eacute; son cas,car il est sorti &agrave; la mi-temps face &agrave; Monaco et on lui laisse encore quelques jours pour pouvoir compter sur lui face au Benfica. De son c&ocirc;t&eacute;,Thiago Silva poursuit ses soins.&nbsp;&raquo;</em></span></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3344, 1380343500, NULL, '2017-12-25 17:24:46', 0),
(77, '0', 'Alain Roche : « Marquinhos n''a rien d''impressionnant »', 'alain-roche-marquinhos-n-a-rien-d-impressionnant', '', '', 'Publié', 0, 12, 31, 'Ancien joueur puis membre du staff du Paris Saint Germain,Alain Roche est revenu dans les colonnes du « Parisien » sur les débuts du jeune M', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/staff_technique/Allain_roche.jpg" style="width: 480px; height: 310px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Ancien joueur puis membre du staff du Paris Saint Germain,Alain Roche est revenu dans les colonnes du &laquo;&nbsp;Parisien&nbsp;&raquo; sur les d&eacute;buts du jeune Marquinhos en d&eacute;fense central.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  &laquo; <em>Le prix de son transfert est vraiment affolant,mais il ne faut pas se fixer des- sus. Pour l&rsquo;instant,il faut attendre. Il a &eacute;t&eacute;Ì plut&ocirc;t bon contre Monaco dimanche,mais il &eacute;tait plus en difficult&eacute; contre l&rsquo;Olympiakos ou &agrave; Valenciennes. Il n&rsquo;y a rien d&rsquo;impressionnant pour l&rsquo;instant,alors qu&rsquo;il est pr&eacute;sent&eacute;Ì comme un futur crack. Je le trouve moins fort que Rapha&euml;l Varane,qui a presque le m&ecirc;me &acirc;ge. Mais je suis plut&ocirc;t indulgent,car il n&rsquo;a que&nbsp;19 ans,il doit encore s&rsquo;adapter &agrave; un nouveau club,un nouveau pays,une nouvelle langue. Il faut &ecirc;tre tr&egrave;s patient. Pour l&rsquo;instant,je le trouve intelligent dans ses interventions. Il n&rsquo;est ni grand ni costaud mais poss&egrave;de un excellent timing</em> &raquo;</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3435, 1380346320, NULL, '2017-12-25 17:27:26', 0),
(78, '0', 'Jallet-VDW : Blanc dans l''impasse', 'jallet-vdw-blanc-dans-l-impasse', '', '', 'Publié', 0, 12, 31, 'En concurrence pour le poste de latéral droit,Christophe Jallet et Grégory Van der Wiel n''ont toujours pas réussi à  faire la différence sel', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Blanc/blanc-graz.jpg" style="width: 600px; height: 400px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>En concurrence pour le poste de lat&eacute;ral droit,Christophe Jallet et Gr&eacute;gory Van der Wiel n&#39;ont toujours pas r&eacute;ussi &agrave; faire la diff&eacute;rence selon Laurent Blanc.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <i>&laquo;&nbsp;Un lat&eacute;ral doit savoir d&eacute;fendre et attaquer. Pour l&rsquo;instant,on a surtout vu Gregory bien attaquer. Il doit mieux d&eacute;fendre. Pour l&rsquo;instant,&ccedil;a a beaucoup chang&eacute;. Christophe a d&eacute;but&eacute;. Gregory a pris la place. Christophe a rejou&eacute; &agrave; Valenciennes. Personne ne se d&eacute;tache vraiment&nbsp;&raquo;</i></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3329, 1380349320, NULL, '2017-12-25 17:28:06', 0),
(79, '0', 'Les Ultras Toulousain ne viendront pas', 'les-ultras-toulousain-ne-viendront-pas', '', '', 'Publié', 0, 12, 31, 'Après avoir augmenté le prix des places pour les supporters parisiens,la direction du Paris Saint Germain a aussi augmenté le prix des place', '<p style="margin-bottom: 0cm; text-align: center;">\r\n <img alt="" src="/images/news/image/Logo_club_L1/logo_toulouse.jpg" style="width: 400px; height: 227px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Apr&egrave;s avoir augment&eacute; le prix des places pour les supporters parisiens,la direction du Paris Saint Germain a aussi augment&eacute; le prix des places pour la tribune r&eacute;serv&eacute; aux visiteurs.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  Une augmentation qui explique en partie le non d&eacute;placement des supporters Toulousain ce samedi au Parc des Princes comme l&#39;explique le co-pr&eacute;sident de l&rsquo;un des principaux groupes du club,les Indians.&nbsp;<br />\r\n <br />\r\n  <span style="color:#000080;">&laquo; <em>On ne peut pas supporter notre &eacute;quipe comme on le souhaite. Nous n&rsquo;avons pas le droit d&rsquo;entrer dans le stade avec un m&eacute;gaphone ou des tambours. Les drapeaux,eux,ne doivent pas faire plus d&rsquo;un m&egrave;tre. La semaine derni&egrave;re &agrave; Saint-Etienne,la place &eacute;tait &agrave; 10 euros. L&agrave;,on nous propose 38 euros. Et en plus,ils veulent qu&rsquo;on y aille en tant que simples spectateurs ? </em>&raquo;</span></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3347, 1380352080, NULL, '2017-12-25 17:28:06', 0),
(80, '0', 'Blanc : « Verratti c''est un super joueur »', 'blanc-verratti-c-est-un-super-joueur', '', '', 'Publié', 0, 12, 31, 'L''entraîneur du Paris Saint Germain,Laurent Blanc a profité de la conférence de presse d''avant match pour revenir sur le jeu du jeune milieu', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Blanc/blanc-paris.jpg" style="width: 600px; height: 400px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>L&#39;entra&icirc;neur du Paris Saint Germain,Laurent Blanc a profit&eacute; de la conf&eacute;rence de presse d&#39;avant match pour revenir sur le jeu du jeune milieu de terrain d&eacute;fensif,Marco Verratti.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  &laquo; <em>Il s&rsquo;&eacute;panouit et il prend de la maturit&eacute;. Il est encore tr&egrave;s jeune. Il faut un peu le canaliser ce gar&ccedil;on et le discipliner. Je le trouve un peu indisciplin&eacute; dans son jeu. A vouloir trop en faire,&ccedil;a le d&eacute;favorise dans sa performance individuelle. On y arrive petit &agrave; petit et c&rsquo;est un super joueur </em>&raquo;</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3362, 1380354840, NULL, '2017-12-25 17:31:05', 0),
(81, '0', 'Quel rà´le pour Ménez ?', 'quel-role-pour-menez', '', '', 'Publié', 0, 12, 31, 'L''entraîneur du Paris Saint Germain, Laurent Blanc est revenu en conférence de presse sur le retour de Jeremy Ménez dans le groupe, et sur c', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Blanc/menez-blanc.jpg" style="width: 600px; height: 400px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>L&#39;entra&icirc;neur du Paris Saint Germain, Laurent Blanc est revenu en conf&eacute;rence de presse sur le retour de Jeremy M&eacute;nez dans le groupe, et sur comment il per&ccedil;oit le joueur.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  <br />\r\n  <em>&laquo;&nbsp;J&eacute;r&eacute;my est de retour dans le groupe. On esp&egrave;re qu&#39;il en a fini avec les p&eacute;pins physiques et va venir grappiller du temps de jeu. Pour moi, c&#39;est un attaquant. Maintenant, les attaquants ne sont pas oblig&eacute;s d&#39;&eacute;voluer dans l&#39;axe. Dans un 4-3-3, il peut tr&egrave;s bien jouer sur le c&ocirc;t&eacute;.&nbsp;&raquo;</em></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3323, 1380356100, NULL, '2017-12-25 17:31:05', 0),
(82, '0', 'Blanc et le mystère Pastore', 'blanc-et-le-mystere-pastore', '', '', 'Publié', 0, 12, 31, 'Très performant à  l''entraînement mais décevant en match comme le disait si bien Laurent Blanc il y a quelques semaines, le cas Javier Pasto', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Blanc/blanc-psg.jpeg" style="width: 600px; height: 378px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Tr&egrave;s performant &agrave; l&#39;entra&icirc;nement mais d&eacute;cevant en match comme le disait si bien Laurent Blanc il y a quelques semaines, le cas Javier Pastore fait beaucoup parler.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  Le coach du Paris Saint Germain est revenu (une fois de plus) sur le myst&egrave;re Pastore en conf&eacute;rence de presse :</p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p>\r\n <span style="color:#000080;"><i>&laquo;&nbsp;On l&rsquo;aide le gar&ccedil;on. On l&rsquo;aide depuis le d&eacute;but. On l&rsquo;aime tous. On l&rsquo;adore. Je l&rsquo;adore. On va tout faire pour le mettre dans les meilleures dispositions pour qu&rsquo;il brille. Mais je ne peux pas faire de cas particulier, je ne peux pas me concentrer sur un seul joueur au d&eacute;triment de l&rsquo;&eacute;quipe enti&egrave;re&nbsp;&raquo;</i> <i>&laquo;&nbsp;Il a besoin de confiance. Il n&rsquo;en a pas suffisamment en ce moment. &Agrave; nous de l&rsquo;aider. &Agrave; vous aussi (s&rsquo;adressant aux journalistes pr&eacute;sents&nbsp;&raquo;</i></span></p>\r\n<p>\r\n <span style="color:#000080;"><i>&laquo;&nbsp;Le PSG peut jouer avec Javier en num&eacute;ro 10 ou un Javier en faux milieu gauche ou droit, qui rentre dans l&rsquo;axe quand nous avons le ballon. Je l&rsquo;ai vu faire de tr&egrave;s bon matches dans cette position l&rsquo;an pass&eacute;&nbsp;&raquo;</i></span></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3360, 1380357960, NULL, '2017-12-25 17:33:28', 0),
(83, '0', 'Verratti est tombé amoureux du PSG', 'verratti-est-tombe-amoureux-du-psg', '', '', 'Publié', 0, 12, 31, 'Après avoir fait céder le Paris Saint Germain pour une revalorisation de salaire, le jeune milieu de terrain, Marco Verratti avoue aimer bea', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Verratti/verratti(3).jpg" style="width: 600px; height: 400px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Apr&egrave;s avoir fait c&eacute;der le Paris Saint Germain pour une revalorisation de salaire, le jeune milieu de terrain, Marco Verratti avoue aimer beaucoup le club &hellip;</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  &laquo;&nbsp;<em>J&rsquo;habite &agrave; Neuilly-sur-Seine, en dehors de Paris, mais &agrave; proximit&eacute;. Je sors avec Ezequiel Lavezzi, Thiago Motta, Javier Pastore, Salvatore Sirigu&hellip; Bref, ceux qui ont jou&eacute; en Italie. La diff&eacute;rence entre la France et l&rsquo;Italie dans le football ? Pour les gar&ccedil;ons de mon &acirc;ge, qui veulent s&rsquo;affirmer, peu importe l&rsquo;endroit. Si vous trouvez un club qui vous propose un projet de travail et de vie si important, vous avez le principal. Il faut &ecirc;tre patient. Je suis arriv&eacute; &agrave; Paris &agrave; 19 ans et j&rsquo;ai r&eacute;alis&eacute; que je pouvais grandir en tous sens. Mais cela vaut &eacute;galement pour un jeune m&eacute;decin ou chercheur, aussi</em>&nbsp;&raquo;</p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3340, 1380359820, NULL, '2017-12-25 17:33:28', 0),
(84, '0', 'Jackpot pour Cavani', 'jackpot-pour-cavani', '', '', 'Publié', 0, 12, 31, 'Arrivé au Paris Saint Germain cet été pour près de 64 millions d''euros et un salaire avoisinant les 9, 5 millions d''euros par an, Edinson Ca', 'rest', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3311, 1380361260, NULL, '2017-12-25 17:36:19', 0),
(85, '0', 'Pastore sur les tablettes de Liverpool', 'pastore-sur-les-tablettes-de-liverpool', '', '', 'Publié', 0, 12, 33, 'Après avoir enrà´lé les services de Mamadou Sakho, les Reds de Liverpool aurait des vues sur un autre joueur du Paris Saint Germain.', '<p style="margin-bottom: 0cm; text-align: center;">\r\n <img alt="" src="/images/news/image/Pastore/Joueur_27_Fiche_Ban.jpg" style="width: 600px; height: 288px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Apr&egrave;s avoir enr&ocirc;l&eacute; les services de Mamadou Sakho, les Reds de Liverpool aurait des vues sur un autre joueur du Paris Saint Germain.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  En effet selon le journal Anglais &laquo;&nbsp;Metro&nbsp;&raquo;, Liverpool serait tr&egrave;s int&eacute;ress&eacute; par le profil de Javier Pastore et serait m&ecirc;me pr&egrave;s &agrave; d&eacute;bourser 17 millions d&rsquo;euros.</p>\r\n<p style="margin-bottom: 0cm">\r\n <strong>Pas sur que les dirigeants Qataris aient envie de laisser partir &agrave; 17M&euro; un joueur qu&#39;ils ont achet&eacute; quasiment 3 fois plus ch&egrave;re il y a 2 ans.</strong></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3348, 1380362400, NULL, '2017-12-25 17:37:00', 0),
(86, '0', 'Carvalho : « Benfica sera comme chez lui à  Paris »', 'carvalho-benfica-sera-comme-chez-lui-a-paris', '', '', 'Publié', 0, 12, 31, 'Le défenseur central Portugais de l''AS Monaco est revenu en conférence de presse sur le prochain match du Paris Saint Germain en ligue des c', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/joueur_ou_entraineur_externe/AS_Monaco/carvalho_monaco_signature.jpg" style="width: 600px; height: 432px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Le d&eacute;fenseur central Portugais de l&#39;AS Monaco est revenu en conf&eacute;rence de presse sur le prochain match du Paris Saint Germain en ligue des champions face &agrave; Benfica.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  &laquo;&nbsp;<em>J&rsquo;ai l&rsquo;impression que Benfica va mieux, comme le PSG qui n&rsquo;a pas tr&egrave;s bien commenc&eacute; son championnat. Je pense que ce sera un match &eacute;quilibr&eacute; entre deux &eacute;quipes qui comptent d&rsquo;excellents joueurs. Avec sa forme du moment, je pense que Benfica peut faire un r&eacute;sultat &agrave; Paris. Et puis avec l&rsquo;appui des Portugais sur place, ce sera comme un match &agrave; la maison&nbsp;</em>&raquo;</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3297, 1380364800, NULL, '2017-12-25 17:37:47', 0),
(87, '0', 'Gameiro veut marquer 20 buts', 'gameiro-veut-marquer-20-buts', '', '', 'Publié', 0, 12, 36, 'Parti du Paris Saint Germain cet été pour rejoindre le FC Séville, Kevin Gameiro qui a déjà  marqué cinq buts en huit matchs disputé est rev', '<p style="margin-bottom: 0cm; text-align: center;">\r\n <img alt="" src="/images/news/image/Gameiro/presentangameiro.jpg" style="width: 600px; height: 320px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Parti du Paris Saint Germain cet &eacute;t&eacute; pour rejoindre le FC S&eacute;ville, Kevin Gameiro qui a d&eacute;j&agrave; marqu&eacute; cinq buts en huit matchs disput&eacute;, il est revenu dans les colonnes de &laquo;&nbsp;l&#39;&eacute;quipe&nbsp;&raquo; sur son d&eacute;but de saison en Espagne.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  &laquo;&nbsp;<em>Mentalement, je me sens bien et, physiquement, je suis au top. Je ne pensais pas qu&rsquo;on faisait de la musculation comme &ccedil;a en Espagne ! Cela m&rsquo;aide pour les contacts, les acc&eacute;l&eacute;rations, je me sens beaucoup plus r&eacute;sistant. Mon objectif ? Vingt buts, ce serait pas mal pour commencer, mais si je peux aller plus loin, je ne m&rsquo;arr&ecirc;terai pas l&agrave;&nbsp;</em>&raquo;</p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3307, 1380366600, NULL, '2017-12-25 17:38:51', 0),
(88, '0', 'Gameiro veut marquer 20 buts', 'gameiro-veut-marquer-20-buts', '', '', 'Publié', 0, 12, 36, 'Parti du Paris Saint Germain cet été pour rejoindre le FC Séville, Kevin Gameiro qui a déjà  marqué cinq buts en huit matchs disputé est rev', '<p style="margin-bottom: 0cm; text-align: center;">\r\n <img alt="" src="/images/news/image/Gameiro/presentangameiro.jpg" style="width: 600px; height: 320px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Parti du Paris Saint Germain cet &eacute;t&eacute; pour rejoindre le FC S&eacute;ville, Kevin Gameiro qui a d&eacute;j&agrave; marqu&eacute; cinq buts en huit matchs disput&eacute;, il est revenu dans les colonnes de &laquo;&nbsp;l&#39;&eacute;quipe&nbsp;&raquo; sur son d&eacute;but de saison en Espagne.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  &laquo;&nbsp;<em>Mentalement, je me sens bien et, physiquement, je suis au top. Je ne pensais pas qu&rsquo;on faisait de la musculation comme &ccedil;a en Espagne ! Cela m&rsquo;aide pour les contacts, les acc&eacute;l&eacute;rations, je me sens beaucoup plus r&eacute;sistant. Mon objectif ? Vingt buts, ce serait pas mal pour commencer, mais si je peux aller plus loin, je ne m&rsquo;arr&ecirc;terai pas l&agrave;&nbsp;</em>&raquo;</p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3307, 1380366600, NULL, '2017-12-25 17:41:08', 0),
(89, '0', 'Les mots d''adieu de Sakho en vidéo', 'les-mots-d-adieu-de-sakho-en-video', '', '', 'Publié', 0, 12, 38, 'Voici en vidéo les mots d''adieu qu''a adressé Mamadou Sakho au Parc des Princes.', '<p style="text-align: center;">\r\n <img alt="" height="335" src="/images/news/image/Sakho/mamd.jpg" width="596" /></p>\r\n<p>\r\n  &nbsp;</p>\r\n<p>\r\n <strong><em><span style="color:#800000;">Voici en vid&eacute;o les mots d&#39;adieu qu&#39;a adress&eacute; Mamadou Sakho au Parc des Princes.</span></em></strong></p>\r\n<p>\r\n  &nbsp;</p>\r\n<p>\r\n &nbsp;</p>\r\n<p style="text-align: center;">\r\n <iframe frameborder="0" height="271" src="http://www.dailymotion.com/embed/video/x1593qu?autoplay=1&amp;logo=1&amp;hideInfos=0&amp;start=0&amp;syndication=+120344&amp;foreground=&amp;highlight=&amp;background=" width="480"></iframe></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3415, 1380358095, NULL, '2017-12-25 17:41:08', 0),
(90, '0', 'Focus sur Blaise Matuidi par le TFC', 'focus-sur-blaise-matuidi-par-le-tfc', '', '', 'Publié', 0, 12, 38, 'Voici une petite analyse du style de jeu de Blaise Matuidi.', '<p style="text-align: center;">\r\n  <img alt="" height="399" src="/images/news/image/Matuidi/blaise.jpg" width="599" /></p>\r\n<p>\r\n  &nbsp;</p>\r\n<p>\r\n <strong><em><span style="color:#800000;">Voici une petite analyse du style de jeu de Blaise Matuidi.</span></em></strong></p>\r\n<p>\r\n  &nbsp;</p>\r\n<p>\r\n &nbsp;</p>\r\n<p style="text-align: center;">\r\n <iframe frameborder="0" height="270" src="http://www.dailymotion.com/embed/video/x158umm?autoplay=1&amp;logo=1&amp;hideInfos=0&amp;start=0&amp;syndication=120344&amp;foreground=&amp;highlight=&amp;background=" width="480"></iframe></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3422, 1380362767, NULL, '2017-12-25 17:41:08', 0),
(91, '0', 'Le reportage sur le Zlatan Burger', 'le-reportage-sur-le-zlatan-burger', '', '', 'Publié', 0, 12, 38, 'Voici un petit reportage de Le Monde sur le Zlatan Burger, le burger du géant Suédois du Paris Saint Germain, Zlatan Ibrahimovic.', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="http://www.lemeilleurdupsg.com/images/news/image/Ibrahimovic/zlatan-burger.jpg" style="width: 600px; height: 337px;" /></p>\r\n<p>\r\n &nbsp;</p>\r\n<p>\r\n <span style="color:#800000;"><em><strong>Voici un petit reportage de Le Monde sur le Zlatan Burger, le burger du g&eacute;ant Su&eacute;dois du Paris Saint Germain, Zlatan Ibrahimovic.</strong></em></span></p>\r\n<p>\r\n  &nbsp;</p>\r\n<p style="text-align: center;">\r\n <a href="http://www.lemeilleurdupsg.com/article-27346-le-zlatan-burger-est-arrive.html"><strong>Voir l&#39;article, Insolite : Le Zlatan Burger est arriv&eacute;</strong></a></p>\r\n<p>\r\n &nbsp;</p>\r\n<p>\r\n &nbsp;</p>\r\n<p style="text-align: center;">\r\n <iframe frameborder="0" height="270" src="http://www.dailymotion.com/embed/video/x158wbk?autoplay=1&amp;logo=1&amp;hideInfos=0&amp;start=0&amp;syndication=120344&amp;foreground=&amp;highlight=&amp;background=" width="480"></iframe></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3421, 1380369628, NULL, '2017-12-25 17:41:47', 0),
(92, '0', 'Chantà´me espère « ne pas se faire siffler »', 'chantome-espere-ne-pas-se-faire-siffler', '', '', 'Publié', 0, 12, 38, 'Voici en vidéo Clément Chantà´me qui en conférence de presse d''avant match donne son ressentie avant la rencontre entre le PSG et le TFC.', '<p style="text-align: center;">\r\n  <img alt="" height="335" src="/images/news/image/Chantome/chantome-au-tfc.jpg" width="596" /></p>\r\n<p>\r\n  &nbsp;</p>\r\n<p>\r\n <span style="color:#800000;"><em><strong>Voici en vid&eacute;o Cl&eacute;ment Chant&ocirc;me qui en conf&eacute;rence de presse d&#39;avant match donne son ressentie avant la rencontre entre le PSG et le TFC.</strong></em></span></p>\r\n<p>\r\n  &nbsp;</p>\r\n<p>\r\n &nbsp;</p>\r\n<p style="text-align: center;">\r\n <iframe frameborder="0" height="270" src="http://www.dailymotion.com/embed/video/x1598eb?autoplay=1&amp;logo=1&amp;hideInfos=0&amp;start=0&amp;syndication=120344&amp;foreground=&amp;highlight=&amp;background=" width="480"></iframe></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3363, 1380355551, NULL, '2017-12-25 17:41:47', 0),
(93, '0', 'Raiola : « Van der Wiel,  meilleur latéral droit d''Europe » ', 'raiola-van-der-wiel-meilleur-lateral-droit-d-europe', '', '', 'Publié', 0, 12, 31, 'De nombreuses fois critiqué depuis son arrivée dans la capitale l''an dernier, Grégory Van der Wiel commence à  se faire une place dans l''eff', '<p style="text-align: center;">\r\n  <img alt="" height="283" src="/images/news/image/Van_der_Wiel/vdw-tfc.jpg" width="425" /></p>\r\n<p style="text-align: justify;">\r\n &nbsp;</p>\r\n<p style="text-align: justify;">\r\n  <strong>De nombreuses fois critiqu&eacute; depuis son arriv&eacute;e dans la capitale l&#39;an dernier, Gr&eacute;gory Van der Wiel commence &agrave; se faire une place dans l&#39;effectif parisien sous l&#39;&egrave;re Blanc.</strong></p>\r\n<p style="text-align: justify;">\r\n &nbsp;</p>\r\n<p style="text-align: justify;">\r\n  Son agent, Mino Raiola, en a d&#39;ailleurs profit&eacute; pour vanter les qualit&eacute;s de son client, qui reste selon lui ce qui se fait de mieux au poste de lat&eacute;ral droit sur le continent :<span style="color:#0000cd;"> </span></p>\r\n<p style="text-align: justify;">\r\n  &nbsp;</p>\r\n<p style="text-align: justify;">\r\n  <span style="color:#0000cd;"><em>&laquo; Pour la premi&egrave;re fois, en 2012, il quittait sa ville natale et son club de toujours. Il lui fallait un temps d&rsquo;adaptation, jouer plus r&eacute;guli&egrave;rement et afficher la bonne condition physique qu&rsquo;il a en ce moment. En plus, alors qu&rsquo;il aurait pu partir &agrave; l&rsquo;Inter Milan cet &eacute;t&eacute;, il a senti la confiance de Laurent Blanc, mais aussi des dirigeants. Gregory est le meilleur lat&eacute;ral droit d&rsquo;Europe. &raquo; </em></span>a t-il d&eacute;clar&eacute; pour<em> l&#39;Equipe.</em></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3423, 1380359787, NULL, '2017-12-25 17:41:47', 0),
(94, '0', 'PSG-Toulouse : les compos officielles', 'psg-toulouse-les-compos-officielles', '', '', 'Publié', 0, 12, 31, 'Voici le onze de départ du PSG et celui du TFC pour la rencontre qui débutera à  17h.', '<p style="text-align: center;">\r\n  <img alt="" src="/images/news/image/logopsg/psg-logo-2013.jpg" style="width: 220px; height: 220px;" /></p>\r\n<p style="text-align: justify;">\r\n  &nbsp;</p>\r\n<p style="text-align: justify;">\r\n  <strong>Voici le onze de d&eacute;part du PSG et celui du TFC pour la rencontre qui d&eacute;butera &agrave; 17h.</strong></p>\r\n<p style="text-align: justify;">\r\n  &nbsp;</p>\r\n<p style="text-align: justify;">\r\n  Sirigu - Van Der Wiel, Camara, Marquinhos, Maxwell, Motta, Verratti, Rabiot, Menez, Ibrahimovic, Lucas. Rempla&ccedil;ants : <span class="null">Douchez- Digne, Jallet, Matuidi, Ongenda, Cavani, Lavezzi</span></p>\r\n<p style="text-align: justify;">\r\n  &nbsp;</p>\r\n<p style="text-align: justify;">\r\n  Le onze de d&eacute;part toulousain : Ahamada - Yago, Spajic, Abdennour - Aurier, Didot, Aguilar, Chant&ocirc;me, Sylla - Braithwaite, Trejo. Rempla&ccedil;ants : BLONDEL, ZEBINA, NINKOV, SIRIEIX, REGATTIN, BEN BASAT, BEN YEDDER</p>\r\n<p style="text-align: justify;">\r\n  &nbsp;</p>\r\n<p style="text-align: justify;">\r\n  A noter que Pastore n&#39;est m&ecirc;me pas sur la feuille de match.</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3353, 1380379351, NULL, '2017-12-25 17:41:47', 0),
(95, '0', 'Blanc : « on a maitrisé le match »', 'blanc-on-a-maitrise-le-match', '', '', 'Publié', 0, 12, 53, 'L''entraîneur du Paris Saint Germain, Laurent Blanc est revenu sur le site officiel du club de la capitale sur la victoire de son équipe hier', '<p style="margin-bottom: 0cm; font-style: normal; text-align: center;">\r\n  <img alt="" src="/images/news/image/Blanc/blanc-psg.jpeg" style="width: 600px; height: 378px;" /></p>\r\n<p style="margin-bottom: 0cm; font-style: normal">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm; font-style: normal">\r\n  <span style="color:#800000;"><strong>L&#39;entra&icirc;neur du Paris Saint Germain, Laurent Blanc est revenu sur le site officiel du club de la capitale sur la victoire de son &eacute;quipe hier apr&egrave;s midi 2-0 face &agrave; Toulouse</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n <br />\r\n  <em>&laquo;&nbsp;On s&#39;attendait &agrave; rencontrer une &eacute;quipe bien regroup&eacute;e et bien organis&eacute;e. C&#39;est ce qui s&#39;est pass&eacute;. Comme souvent quand on marque cela d&eacute;bloque le match. L&#39;&eacute;quipe adverse prend plus de risques. On a mis du temps &agrave; marquer ce deuxi&egrave;me but, mais on y est parvenu. On a propos&eacute; du jeu et on a maitris&eacute; le match assez correctement, donc on est satisfait ce soir.&nbsp;&raquo;</em></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3341, 1380409119, NULL, '2017-12-25 17:41:47', 0),
(96, '0', 'Rabiot : « On a déroulé notre jeu »', 'rabiot-on-a-deroule-notre-jeu', '', '', 'Publié', 0, 12, 53, 'Le milieu de terrain défensif formé au Paris Saint Germain, Adrien Rabiot est revenu sur la victoire du club de la capitale au micro de PSG.', '<p style="margin-bottom: 0cm; text-align: center;">\r\n  <img alt="" src="/images/news/image/Rabiot/Joueur_25_Fiche_Ban.jpg" style="width: 600px; height: 288px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>Le milieu de terrain d&eacute;fensif form&eacute; au Paris Saint Germain, Adrien Rabiot est revenu sur la victoire du club de la capitale au micro de PSG.tv.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <em>&laquo;&nbsp;On a eu du mal en premi&egrave;re p&eacute;riode. Toulouse a bien attaqu&eacute; et nous a pos&eacute; des probl&egrave;mes au milieu de terrain. En deuxi&egrave;me p&eacute;riode, on est revenus avec d&#39;autres intentions. On a d&eacute;roul&eacute; notre jeu et on prend trois points donc c&#39;est le principal. Maintenant on se concentre sur Benfica mercredi.&nbsp;C&#39;&eacute;tait sympa de retrouver les Toulousains avec qui j&#39;ai jou&eacute; six mois la saison pass&eacute;e. &raquo;</em></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3346, 1380409196, NULL, '2017-12-25 17:41:47', 0),
(97, '0', 'Casanova rempli de regret', 'casanova-rempli-de-regret', '', '', 'Publié', 0, 12, 53, 'L''entraîneur du Toulouse Football Club, Alain Casanova est revenu sur la défaite de son équipe 2 à  0 hier face au Paris Saint Germain.', '<p style="margin-bottom: 0cm; text-align: center;">\r\n <img alt="" src="/images/news/image/Entraineurs/alain-casanova.jpg" style="width: 600px; height: 338px;" /></p>\r\n<p style="margin-bottom: 0cm">\r\n &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <span style="color:#800000;"><strong>L&#39;entra&icirc;neur du Toulouse Football Club, Alain Casanova est revenu sur la d&eacute;faite de son &eacute;quipe 2 &agrave; 0 hier face au Paris Saint Germain.</strong></span></p>\r\n<p style="margin-bottom: 0cm">\r\n  &nbsp;</p>\r\n<p style="margin-bottom: 0cm">\r\n  <i>&laquo;&nbsp;On avait la possibilit&eacute; de mieux faire, mais leur deuxi&egrave;me but nous a fait mal. On voulait leur poser des probl&egrave;mes dans certaines zones, on a bien respect&eacute; le plan de jeu, mais il y a eu trop de timidit&eacute;, notamment en premi&egrave;re p&eacute;riode. Le but (de Marquinhos, ndlr) nous a r&eacute;veill&eacute;s, on a ensuite bien d&eacute;marr&eacute; la seconde p&eacute;riode, mais on n&rsquo;a pas pu revenir au score, alors qu&rsquo;on le m&eacute;ritait&nbsp;&raquo;</i></p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '', '', '', 0, 0, 0, 1, 3308, 1380409296, NULL, '2017-12-25 17:41:47', 0),
(98, '1', 'Bilan de la semaine internationale', 'Bilan-de-la-semaine-internatiile', '', '', 'Publié', 1, 2, 31, 'freg(y §rhjè ejèerdjjtnt', '<p>bsnyyju ktruu,it&egrave;ktig</p>\r\n', 'Article', 2, '/ckfinder/userfiles/files/newdefault.jpg', '1', '2', '2', 0, 0, 0, 0, 3, 1514335020, '2017-12-26 23:38:27', '0000-00-00 00:00:00', 1),
(99, '0', 'Bilan de la semaine internationale', 'Bilan-de-la-semaine-internationale', '', '', 'Publié', 1, 4, 31, 'fve zhrebytbtyyb', '<p>bdsbdth jer &sect;dytjyu,urnf tehrd</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '1', '1', '1', 0, 0, 0, 0, 4, 1514336640, '2017-12-27 00:04:48', '2017-12-27 00:04:48', 1),
(100, '0', 'Le 10 plus gros flops de l''histoire du club', 'Le-10-plus-gros-flops-de-lhistoire-du-club', '', '', 'Publié', 1, 2, 31, 'vovgvolbhb', '<p>vgvpbhbhb m hbibyub</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '2', '2', '2', 0, 0, 0, 0, 1, 1514336760, '2017-12-27 00:07:13', '2017-12-27 00:07:13', 0),
(101, '0', 'Bilan de la semaine internationale', 'Bilan-de-la-semaine-internationale', '', '', 'Publié', 1, 2, 31, 'fqbbtst', '<p>vdfsbths nyrd dt</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '1', '1', '1', 0, 0, 0, 0, 4, 1514338140, '2017-12-27 00:29:49', '2017-12-27 00:29:49', 0),
(102, '0', 'J Respect R', 'J-Respect-R', '', '', 'Publié', 1, 2, 31, ' sfqbtbsrh§ hthhery j', '<p>erfthh&sect; &sect;t j&sect;yhdjnudty</p>\r\n', 'Commentaire', 3, '/ckfinder/userfiles/files/newdefault.jpg', '1, 2, 3, 4', '1', '2', 0, 0, 103, 0, 3, 1514338260, '2017-12-27 00:31:38', '2017-12-27 00:31:38', 1),
(103, '2', 'J Respect R', 'J-Respect-R2', '', '', 'Publié', 1, 2, 31, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad mini', '<p>Lorem ipsum dolor sit amet, <span><a class="tweetabletext" href="http://twitter.com/intent/tweet?text=Ah%20ah%20quel%20con">Je teste</a></span> consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/54535.jpg', '1, 2, 3, 4', '2', '2', 0, 0, 0, 0, 5, 1514426280, '2017-12-27 00:58:33', '2018-01-02 02:06:18', 0);
INSERT INTO `posts` (`id`, `author_id`, `title`, `slug`, `meta_description`, `meta_keywords`, `status`, `une`, `section`, `rubrique`, `resume`, `content`, `type_page`, `story`, `image`, `id_players`, `id_teams`, `id_matchs`, `id_news`, `id_topic`, `id_com`, `notification`, `views`, `date`, `created_at`, `updated_at`, `isDelete`) VALUES
(104, '0', 'Bilan de la semaine internationale', 'Bilan-de-la-semaine-internationale', '', '', 'Publié', 1, 2, 31, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad mini', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'Article', 2, '/ckfinder/userfiles/files/newdefault.jpg', '1', '2', '1', 0, 0, 0, 0, 4, 1514339940, '2017-12-27 01:00:51', '2017-12-27 01:00:51', 0),
(105, '0', 'Reprise de l''entraînement', 'Reprise-de-lentrainement-105', '', '', 'Publié', 1, 2, 33, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad mini', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/5700937_2016-04-09t165502z-1800227045-gf10000376854-rtrmadp-3-soccer-france_1000x625.jpg', '1', '1', '2', 103, 0, 0, 0, 3, 1514340120, '2017-12-27 01:03:25', '2018-01-02 03:30:37', 0),
(106, '0', 'Rabiot vers une prolongation', 'Rabiot-vers-une-prolongation', '', '', 'Publié', 1, 2, 31, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad mini', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/newdefault.jpg', '1', '1', '1', 0, 0, 0, 0, 2, 1514343900, '2017-12-27 02:06:52', '2017-12-27 02:06:52', 0),
(107, '3', 'Rabiot vers une prolongation', 'Rabiot-vers-une-prolongation', '', '', 'Publié', 0, 2, 31, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad mini', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'Commentaire', 0, '/ckfinder/userfiles/files/newdefault.jpg', '1', '2', '2', 103, 0, 103, 0, 2, 1514344080, '2017-12-27 02:09:01', '2017-12-27 02:10:02', 0),
(108, '2', 'Bilan de la semaine ', 'Bilan-de-la-semaine', '', '', 'Publié', 1, 2, 33, 'k,km,m', '<p>bugyguybh hv</p>\r\n', 'Article', 0, '/ckfinder/userfiles/files/62749.jpg', '2', '1', '2', 0, 0, 0, 0, 1, 1514764800, '2017-12-28 02:59:20', '2018-01-02 02:00:30', 0);

-- --------------------------------------------------------

--
-- Structure de la table `replycomments`
--

CREATE TABLE `replycomments` (
  `id` int(10) unsigned NOT NULL,
  `id_comment` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `replycomments`
--

INSERT INTO `replycomments` (`id`, `id_comment`, `type`, `page_id`, `status`, `content`, `isDelete`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 3, 'Publié', 'c''est good ça', 0, 3, '2017-10-25 20:57:28', '2017-10-25 20:57:28'),
(2, 2, 4, 4, 'Publié', 'parfait ça fonctionne', 0, 3, '2017-10-25 20:57:28', '2017-10-25 20:57:28');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rubrique_news`
--

CREATE TABLE `rubrique_news` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `isDelete` tinyint(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rubrique_news`
--

INSERT INTO `rubrique_news` (`id`, `name`, `slug`, `isDelete`) VALUES
(31, 'Actu', 'actu', 0),
(32, 'Une', 'une', 0),
(33, 'Transferts', 'transferts', 0),
(34, 'Euro 2016', 'euro-2016', 0),
(35, 'EDF', 'edf', 0),
(36, 'Anciens', 'anciens', 0),
(37, 'Site', 'site', 0),
(38, 'Vidéos', 'videos', 0),
(39, 'Disparition', 'disparition', 0),
(40, 'Féminines', 'feminines', 0),
(41, 'Infirmerie', 'infirmerie', 0),
(42, 'UEFA', 'uefa', 0),
(43, 'CDF', 'cdf', 0),
(44, 'ITW', 'itw', 0),
(45, 'Ligue 1', 'ligue1', 0),
(46, 'LDC', 'ldc', 0),
(47, 'Amical', 'amical', 0),
(48, 'Stats ', 'stats', 0),
(49, 'Jeunes', 'jeunes', 0),
(50, 'Dossiers', 'dossiers', 0),
(51, 'Classico', '', 0),
(52, 'Sondage', '', 0),
(53, 'Réactions', 'reactions', 0),
(54, 'Insolite', '', 0),
(55, 'Edito', '', 0),
(56, 'Communiqué', 'communique', 0),
(57, 'Ballon d''Or', '', 0),
(58, 'Mi-temps', '', 0),
(59, 'Gambardella', '', 0),
(60, 'Joueur de Légende', 'joueur-de-legende', 0),
(61, 'Officiel', '', 0),
(62, 'CDL', '', 0),
(63, 'Archives', '', 0),
(64, 'CDM 2018', 'cdm-2018', 0),
(65, 'Prêt', 'pret', 0),
(66, 'Partenaires-Sponsors', '', 0),
(67, 'Sélection', 'selection', 0),
(68, 'Supporters', '', 0),
(69, 'Facebook', '', 0),
(70, 'CDM 2022', 'cdm-2022', 0),
(71, 'TdC', '', 0),
(72, 'Liberté-abonnés', 'liberte-abonnes', 0),
(73, 'Trophée-LMDPSG', 'trophee-lmdpsg', 0),
(74, 'CFA', '', 0),
(75, 'FIFA 16', 'fifa-16', 0),
(76, 'Réseaux sociaux', 'reseaux-sociaux', 0),
(77, 'Trophée-UNFP', 'trophee-unfp', 0),
(78, 'Groupe', '', 0),
(79, 'Live', '', 1),
(80, 'Historique', '', 1),
(81, 'Compte-rendu', '', 0),
(82, 'Hommage', '', 0),
(83, 'Onze de Légende', 'onze-de-legende', 0),
(84, 'Sanction', '', 0),
(85, 'Exclu LMDPSG ', 'exclu-lmdpsg', 0),
(86, 'Fair-play financier', '', 0),
(87, 'FIFA', '', 0),
(88, 'Journalistes-Opinion', '', 0),
(89, 'Conf', '', 0),
(90, 'Images', '', 0),
(91, 'Handball', '', 0),
(92, 'Votes', '', 0),
(93, 'Top 10', '', 1),
(94, 'Match de Légende', 'match-de-legende', 0),
(95, 'Tournoi FIFA', 'tournoi-fifa', 0),
(96, 'Billet d''humeur', '', 0),
(97, 'Les notes', '', 0),
(98, 'Top-buts', '', 1),
(99, 'Paris-Champion', '', 0),
(100, 'Damso', 'damso', 1),
(101, 'La Macarena', 'la-macarena', 1),
(102, 'Coupe du Monde en Russie ', 'cdm-russie', 1),
(103, 'alé lès bleu', 'ale-les-bleu', 1),
(104, 'Mosaique Solitaire', 'mosaique-solitaire', 1),
(105, 'jj gesg', 'jj-gesg', 1),
(106, 'warrrrin', 'warrrrin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `todoListNews`
--

CREATE TABLE `todoListNews` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `link` text NOT NULL,
  `comment` text NOT NULL,
  `id_pseudo` int(11) NOT NULL,
  `id_pseudo_write` int(11) NOT NULL,
  `important` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `todoListNews`
--

INSERT INTO `todoListNews` (`id`, `title`, `status`, `link`, `comment`, `id_pseudo`, `id_pseudo_write`, `important`, `created_at`, `updated_at`) VALUES
(13, 'Trapp veut discuter avec Paris', 1, 'http://www.leparisien.fr/sports/football/psg/psg-trapp-veut-discuter-avec-paris-15-11-2017-7393107.php', 'Je m''occupe de cette article :)', 2, 2, 0, '2017-11-15 21:28:26', '2017-12-01 01:19:58'),
(10, 'Le PSG sur Federico Chiesa', 0, 'http://www.footmercato.net/serie-a/le-psg-fond-pour-federico-chiesa_214305', 'Article à rédiger rapidement', 2, 2, 0, '2017-11-15 19:28:52', '2017-12-01 01:27:09'),
(14, 'Bilan de la semaine internatio', 2, 'https://www.psg.fr/pro/article/bilan-de-la-semaine-internationale-2', '18 joueurs du Paris Saint-Germain ont rejoint leur sélection respective durant cette semaine internationale. Bilan.', 2, 2, 0, '2017-11-16 01:07:09', '2017-12-27 02:00:51'),
(15, 'Hatem Ben Arfa s''est réconcili', 1, 'http://www.eurosport.fr/football/ligue-1/2017-2018/hatem-ben-arfa-s-est-reconcilie-avec-le-psg-et-espere-meme-y-rejouer_sto6410678/story.shtml', 'Hatem Ben Arfa s''est réconcilié avec le PSG et espère même y rejouer', 2, 2, 1, '2017-11-16 01:08:58', '2017-12-28 03:58:57'),
(16, 'Adrien Rabiot fait languir le ', 2, 'http://www.footmercato.net/ligue-1/transferts/adrien-rabiot-fait-languir-le-psg_214336', 'Lié au Paris Saint-germain jusqu''en 2019, Adrien Rabiot n''a toujours pas prolongé son contrat. Le milieu de terrain francilien prend son temps.', 2, 2, 0, '2017-11-16 09:50:42', '2017-12-27 03:06:52'),
(17, 'Unai Emery : « Jouer avec patience »', 0, 'https://www.psg.fr/pro/article/unai-emery-jouer-avec-patience', 'À deux jours de la rencontre de la 13e journée de Ligue 1 face à Nantes, ce samedi 18 novembre à 17h au Parc des Princes, l’entraîneur du Paris Saint-Germain s’est présenté devant les médias. Extraits.', 2, 2, 0, '2017-11-16 15:37:13', '2017-12-01 01:23:15'),
(18, 'OPÉRATION DU GENOU «ENVISAGÉE» POUR THIAGO MOTTA', 1, 'http://sport24.lefigaro.fr/football/ligue-1/actualites/psg-operation-du-genou-envisagee-pour-thiago-motta-885016', 'Victime de douleurs récurrentes au genou droit, le milieu de terrain italien pourrait bien passer sur le billard et être absent plusieurs mois.', 2, 2, 1, '2017-11-16 15:52:48', '2017-12-28 04:01:31'),
(19, 'les joueurs du Celtic n’ont pas digéré le match aller', 2, 'http://www.leparisien.fr/sports/psg-les-joueurs-du-celtic-n-ont-pas-digere-le-match-aller-20-11-2017-7403895.php', 'Écrasé 5-0 sur leur pelouse par les Parisiens mi-septembre, le Celtic Glasgow semble toujours traumatisé par la défaite.\r\n\r\n', 2, 2, 0, '2017-11-20 23:57:26', '2017-12-27 03:09:01'),
(26, 'Layvin Kurzawa annoncé partant', 1, 'https://www.eurosport.fr/football/le-mercato-hivernal-est-lance-au-psg-layvin-kurzawa-annonce-partant-marouane-fellaini-vise_sto6455141/story.shtml', 'Je m''occupe de cet article', 2, 2, 1, '2017-12-27 14:24:53', '2017-12-27 15:48:08'),
(20, 'Unai Emery : « Ce n’était pas notre jour »', 0, 'https://www.psg.fr/pro/article/unai-emery-ce-n-etait-pas-notre-jour', 'Je m''occupe de cet article', 2, 2, 1, '2017-12-03 18:01:10', '2017-12-21 20:07:51'),
(21, 'Guedes vers Valence', 0, 'https://www.eurosport.fr/football/ligue-1/2017-2018/en-quete-de-liquidites-le-psg-aurait-deja-boucle-la-vente-de-goncalo-guedes-pour-35-millions_sto6450295/story.shtml', 'article à rédiger', 2, 2, 0, '2017-12-20 17:46:58', '2017-12-20 17:47:56'),
(22, 'Allez', 2, 'jjef$rgrbtr', 'Je m''occupe de cette article', 2, 2, 0, '2017-12-26 23:28:10', '2017-12-27 02:03:25'),
(23, 'frfrgttr', 2, 'fegtgtrthbtyh', 'ghythhtyyhnny', 2, 2, 0, '2017-12-26 23:29:40', '2017-12-27 01:29:49'),
(24, 'regertggt', 2, 'fbtbttr', 'tgbbbgbybbyby', 2, 2, 0, '2017-12-26 23:31:10', '2017-12-27 01:07:13'),
(25, 'fvfebtbbrgbg', 2, 'bgbbggbbggb', 'bgfhgbfhhnnhfgnjng', 2, 2, 0, '2017-12-26 23:32:48', '2017-12-27 01:58:33'),
(27, 'cdsrfr', 1, 'dvreger', 'brtb', 2, 2, 0, '2018-02-03 02:51:50', '2018-02-03 02:52:06');

-- --------------------------------------------------------

--
-- Structure de la table `todoListNews_reply`
--

CREATE TABLE `todoListNews_reply` (
  `id` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `replycomment` text NOT NULL,
  `id_pseudo` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `isDelete` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `todoListNews_reply`
--

INSERT INTO `todoListNews_reply` (`id`, `id_comment`, `replycomment`, `id_pseudo`, `date`, `created_at`, `updated_at`, `isDelete`) VALUES
(10, 0, 'est', 2, 0, '2017-11-15 18:35:02', '0000-00-00 00:00:00', 0),
(11, 1, 'Hello ! Comment tu vas ?', 2, 0, '2017-11-15 18:37:07', '0000-00-00 00:00:00', 0),
(12, 1, 'Hellllo everybody', 2, 0, '2017-11-15 18:41:41', '0000-00-00 00:00:00', 0),
(13, 3, 'test', 2, 0, '2017-11-15 20:15:57', '0000-00-00 00:00:00', 0),
(14, 3, 'je retest à nouveau', 2, 0, '2017-11-15 20:16:13', '0000-00-00 00:00:00', 0),
(15, 10, 'tewt', 2, 0, '2017-11-16 20:07:02', '0000-00-00 00:00:00', 0),
(16, 18, 'test', 2, 0, '2017-11-16 20:13:17', '0000-00-00 00:00:00', 0),
(17, 13, 'ALlez Trapp, il faut aller à la Coupe du Monde', 2, 0, '2017-11-16 20:21:34', '0000-00-00 00:00:00', 0),
(18, 10, 'Qui est ce joueur ?', 2, 0, '2017-11-16 20:21:48', '0000-00-00 00:00:00', 0),
(19, 26, 'Cool', 2, 12336788, '2017-12-27 14:25:01', '0000-00-00 00:00:00', 0),
(20, 26, 'C''est quoi ce délire ? T''es sérieux ? ', 2, 1514387825, '2017-12-27 15:17:05', '2017-12-27 16:17:05', 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `pseudo` varchar(100) NOT NULL,
  `nbtotalpoint` int(11) NOT NULL,
  `nbtotaljaimecommentaire` int(11) NOT NULL,
  `nbtotalcommentaire` int(11) NOT NULL,
  `nbtotallecture` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `iduser`, `pseudo`, `nbtotalpoint`, `nbtotaljaimecommentaire`, `nbtotalcommentaire`, `nbtotallecture`) VALUES
(47, 11562, 'krn2mlf', 8775, 25, 3000, 5750),
(46, 11556, 'Harusame', 5850, 0, 0, 5850),
(45, 5522, 'pat_68', 6700, 0, 0, 6700),
(44, 11574, 'tofd', 1550, 0, 100, 1450),
(43, 10936, 'PSG 972', 450, 0, 0, 450),
(42, 11117, 'zupzup', 75050, 0, 0, 75050),
(41, 11540, 'LORENZO92', 1150, 0, 0, 1150),
(40, 11572, 'sef40', 4350, 0, 300, 4050),
(39, 4900, 'Infuz', 176850, 900, 18100, 157850),
(38, 11060, 'kioups93', 80025, 175, 6200, 73650),
(37, 3687, 'nikoinho', 61625, 275, 13800, 47550),
(36, 8839, 'gjrfks', 16850, 0, 600, 16250),
(35, 3505, 'Mikael', 22825, 25, 3700, 19100),
(34, 11405, 'ti weich', 1600, 0, 0, 1600),
(33, 5812, 'Ggermany', 13700, 0, 0, 13700),
(32, 8877, 'papas', 1425, 25, 300, 1100),
(31, 11489, 'Joydel64', 6150, 0, 100, 6050),
(30, 183, 'Diegowaz75', 34225, 175, 2400, 31650),
(27, 3, 'Pas93', 79725, 2425, 19600, 57700),
(48, 11532, 'Tony11', 6200, 0, 0, 6200),
(49, 11301, 'nico91psg', 11150, 0, 0, 11150),
(50, 5219, 'jebay007', 6700, 0, 2900, 3800),
(51, 11558, 'Jen.P', 1150, 0, 0, 1150),
(52, 11238, 'Hitonaabz', 5250, 0, 100, 5150),
(53, 10952, 'Thom91', 600, 0, 0, 600),
(54, 5469, 'The-Special-One', 400, 0, 0, 400),
(55, 11577, 'xavgwada971', 200, 0, 100, 100),
(56, 11553, 'labtouf', 2100, 0, 100, 2000),
(57, 10958, 'vickmackey1', 10550, 0, 400, 10150),
(58, 11581, 'speedy gonzales', 30025, 25, 3800, 26200),
(59, 3644, 'J2PGraphismePSG', 3525, 25, 100, 3400),
(60, 11398, 'homarco', 1900, 0, 0, 1900),
(61, 11565, 'xX_IbRa08_xX', 150, 0, 0, 150),
(62, 4512, 'JamaiquA', 650, 0, 0, 650),
(63, 11518, 'Sterling', 13000, 0, 200, 12800),
(64, 5600, 'PSG-FOR-LIFE', 22950, 0, 800, 22150),
(65, 11486, 'MaxWyd', 500, 0, 0, 500),
(66, 11584, 'Yankizi', 1650, 0, 200, 1450),
(67, 11587, 'Pascal', 50, 0, 0, 50),
(68, 11590, 'BMLC', 400, 0, 200, 200),
(69, 11290, 'laurentjas', 700, 0, 100, 600),
(70, 11593, 'ParisNord', 24300, 0, 200, 24100),
(71, 11417, 'Voza', 300, 0, 100, 200),
(72, 8831, 'terry94', 650, 0, 100, 550),
(73, 11598, 'dronflex', 200, 0, 0, 200),
(74, 5234, 'bingo49ros', 300, 0, 0, 300),
(75, 684, 'Dypaak', 850, 0, 300, 550),
(76, 11602, 'guiom-9', 8700, 0, 0, 8700),
(77, 10874, 'fla75', 400, 0, 100, 300),
(78, 11603, 'ZizouFouPSG', 2250, 100, 500, 1650),
(79, 11157, 'Nielda', 3800, 0, 2200, 1600),
(80, 11600, 'James', 50, 0, 0, 50),
(81, 11607, 'loriere', 50, 0, 0, 50),
(82, 11608, 'Finavenko', 50, 0, 0, 50),
(83, 3784, 'mikl35', 800, 0, 100, 700),
(84, 11610, 'Malika', 2700, 0, 100, 2600),
(85, 11611, 'k-soce team', 38000, 0, 500, 37500),
(86, 6502, 'K-A-M', 600, 0, 0, 600),
(87, 11612, 'titi68', 1050, 0, 100, 950),
(88, 10816, 'vladimir', 150, 0, 100, 50),
(89, 11618, 'Valdo93', 4600, 0, 200, 4400),
(90, 11621, 'fabulous89', 22625, 75, 2000, 20550),
(91, 11622, 'michel du60', 200, 0, 100, 100),
(92, 1283, 'billycactus', 1350, 0, 100, 1250),
(93, 11623, 'LJPSG', 100, 0, 0, 100),
(94, 11625, 'mega95', 150, 0, 100, 50),
(95, 3649, 'garno92', 50, 0, 0, 50),
(96, 6534, 'tonyparis', 1400, 0, 0, 1400),
(97, 11627, 'cendar91', 2600, 0, 0, 2600),
(98, 11634, 'bazookaquartey', 1550, 0, 1000, 550),
(99, 11633, 'Arthur M.', 12425, 25, 0, 12400),
(100, 11635, 'Lakad', 550, 0, 0, 550),
(101, 11637, 'Benlal75', 600, 0, 0, 600),
(102, 11640, 'dyranimovic', 33775, 75, 5000, 28700),
(103, 11536, 'Kev63', 6150, 0, 800, 5350),
(104, 11648, 'Masterr972', 1350, 0, 0, 1350),
(105, 11650, 'MyChris', 200, 0, 0, 200),
(106, 58, 'seb74', 14000, 0, 100, 13900),
(107, 11653, 'Dyrem', 250, 0, 100, 150),
(108, 10190, 'MadMike', 13700, 0, 3100, 10600),
(109, 11654, 'Polynesia', 2250, 0, 1200, 1050),
(110, 11657, 'ERICHOT', 350, 0, 0, 350),
(111, 11658, 'Lonyants', 200, 0, 100, 100),
(112, 11656, 'anakin', 2950, 0, 0, 2950),
(113, 11659, 'abdominos', 650, 0, 200, 450),
(114, 11649, 'zouga36', 26650, 0, 0, 26650),
(115, 11663, 'Natsu14', 1400, 0, 0, 1400),
(116, 11130, 'KolÃ©okouÃ¯', 6800, 0, 0, 6800),
(117, 11665, 'celiak74', 1600, 0, 0, 1600),
(118, 11098, 'willpsg', 3025, 25, 1200, 1800),
(119, 11359, 'spaiin-91', 3650, 0, 400, 3250),
(120, 11121, 'Mizarte', 14750, 50, 400, 14300),
(121, 10968, 'n_luc', 6400, 0, 200, 6200),
(122, 11204, 'Steph s2', 50, 0, 0, 50),
(123, 457, 'erb92', 850, 0, 300, 550),
(124, 11667, 'julien-atks', 6150, 0, 0, 6150),
(125, 3752, 'phu_luc', 4050, 0, 100, 3950),
(126, 10361, 'pastaga', 3900, 0, 0, 3900),
(127, 11673, 'ericdr', 200, 0, 0, 200),
(128, 11677, 'Touillettes', 1500, 0, 100, 1400),
(129, 11680, 'Leonardini', 200, 0, 100, 100),
(130, 11619, 'PatPSGlevrai', 6950, 0, 500, 6450),
(131, 11687, 'panamezack', 550, 0, 100, 450),
(132, 11688, 'HervÃ©', 150, 0, 100, 50),
(133, 11696, 'Tgss97', 1250, 0, 0, 1250),
(134, 11697, 'FloK07', 3600, 0, 0, 3600),
(135, 11700, 'sandrine', 200, 0, 100, 100),
(136, 5631, 'AndyPsg', 450, 0, 0, 450),
(137, 1891, 'laulaupsg', 74250, 0, 100, 74150),
(138, 11706, '007', 50, 0, 0, 50),
(139, 11035, 'TomMtl19', 200, 0, 0, 200),
(140, 11710, 'ai1', 500, 0, 100, 400),
(141, 11713, 'Szax', 250, 0, 200, 50),
(142, 11715, 'Aiko', 2150, 0, 0, 2150),
(143, 11115, 'psgthanpsg', 9600, 0, 200, 9400),
(144, 11630, 'fredo57', 150, 0, 100, 50),
(145, 11719, 'yeman971', 450, 0, 0, 450),
(146, 11720, 'Deschamps53', 50, 0, 0, 50),
(147, 11723, 'icicestparis95', 350, 0, 0, 350),
(148, 10873, 'jadema17', 150, 0, 100, 50),
(149, 11732, 'ggjevm', 150, 0, 100, 50),
(150, 8809, 'Ahma34', 2200, 0, 0, 2200),
(151, 11734, 'Ti nou', 200, 0, 100, 100),
(152, 11735, 'Issam979', 16050, 0, 100, 15950),
(153, 11746, 'guandi', 10500, 0, 400, 10100),
(154, 11749, 'Tom.Simo', 1150, 0, 0, 1150),
(155, 11752, 'Titi1975', 300, 0, 0, 300),
(156, 11748, 'dubamax', 2700, 0, 0, 2700),
(157, 11754, 'BenPanam25', 450, 0, 0, 450),
(158, 11756, 'jeanwillydorique', 150, 0, 100, 50),
(159, 11758, 'CorneliusMub', 1300, 0, 0, 1300),
(160, 6210, 'Pastore26', 50, 0, 0, 50),
(161, 11760, 'luka', 200, 0, 0, 200),
(162, 11764, 'Vlad 64', 2000, 0, 100, 1900),
(163, 11772, 'inÃ©slouisa', 2500, 0, 0, 2500),
(164, 11774, 'Dag062', 100, 0, 0, 100),
(165, 11776, 'MisterFUT', 2050, 0, 0, 2050),
(166, 11775, 'Martin.B', 150, 0, 0, 150),
(167, 11779, 'Hadek91', 1050, 0, 0, 1050),
(168, 11780, 'Pierre', 550, 0, 0, 550),
(169, 9235, 'LePrinceduParc', 1250, 0, 100, 1150),
(170, 11781, 'rdm92', 900, 0, 100, 800),
(171, 5447, 'Lionheart', 14450, 0, 200, 14250),
(172, 11785, 'widlo', 2100, 0, 100, 2000),
(173, 11786, 'Skarkal', 950, 0, 400, 550),
(174, 11787, 'psgboom', 200, 0, 100, 100),
(175, 11798, 'momo92', 300, 0, 0, 300),
(176, 11799, 'Bosky', 550, 0, 0, 550),
(177, 11809, 'nathanpsg75', 4750, 0, 0, 4750),
(178, 11808, 'xc94', 3600, 0, 0, 3600),
(179, 11811, 'Jonathan.A', 2300, 0, 0, 2300),
(180, 11816, 'Hamdy', 150, 0, 0, 150),
(181, 11818, 'eazy', 175, 25, 100, 50),
(182, 11820, 'Zzneoderek59zZ', 50, 0, 0, 50),
(183, 11821, 'Aroun Sass', 900, 0, 0, 900),
(184, 11822, 'Bouhedli.Mohamed', 150, 0, 100, 50),
(185, 11829, 'adriano75', 250, 0, 200, 50),
(186, 3648, 'lechti38', 50, 0, 0, 50),
(187, 11834, 'QSIntentions', 50, 0, 0, 50),
(188, 11320, 'titipsg', 1600, 0, 0, 1600),
(189, 4879, 'nrik94', 50, 0, 0, 50),
(190, 5383, 'Terry', 300, 0, 200, 100),
(191, 11852, 'Vincent', 1300, 0, 0, 1300),
(192, 11855, 'tomas@mcujoo.tv', 50, 0, 0, 50),
(193, 11858, 'Paulo', 8550, 0, 0, 8550),
(194, 1745, 'PSGstar', 50, 0, 0, 50),
(195, 11862, 'Proouv', 2600, 0, 0, 2600);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `replycomments`
--
ALTER TABLE `replycomments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `rubrique_news`
--
ALTER TABLE `rubrique_news`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `todoListNews`
--
ALTER TABLE `todoListNews`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `todoListNews_reply`
--
ALTER TABLE `todoListNews_reply`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT pour la table `replycomments`
--
ALTER TABLE `replycomments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rubrique_news`
--
ALTER TABLE `rubrique_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT pour la table `todoListNews`
--
ALTER TABLE `todoListNews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `todoListNews_reply`
--
ALTER TABLE `todoListNews_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;