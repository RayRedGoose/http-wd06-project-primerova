-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 10 2019 г., 01:45
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wd06-project-primerova`
--

-- --------------------------------------------------------

--
-- Структура таблицы `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `about`
--

INSERT INTO `about` (`id`, `name`, `description`, `avatar`) VALUES
(1, 'Раиса Примерова', '<p>Denver-based Web-developer</p>\r\n', '757400088643.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `cat_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `cat_title`) VALUES
(1, 'Без категории'),
(10, 'Места');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `text`, `date_time`) VALUES
(2, 5, 6, 'Отличный сериал!', '2019-07-05 05:14:11'),
(3, 5, 6, 'Это что-то!', '2019-07-05 07:45:59'),
(7, 11, 6, 'Круто!', '2019-07-09 03:19:45');

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` int(11) UNSIGNED DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `lastname` varchar(191) DEFAULT NULL,
  `skype` varchar(191) DEFAULT NULL,
  `vk` varchar(191) DEFAULT NULL,
  `fb` varchar(191) DEFAULT NULL,
  `github` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `email`, `phone`, `address`, `name`, `lastname`, `skype`, `vk`, `fb`, `github`, `twitter`) VALUES
(1, 'riyuhide@gmail.com', 1720701963, 'Denver, CO, USA', 'Раиса', 'Примерова', 'yukiko-chan_nya', 'https://vk.com/riyuki', 'https://www.facebook.com/fushichou.riyuki', 'RayRedGoose', '');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) UNSIGNED DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `post_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_img_preview` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `author_id`, `date_time`, `post_img`, `post_img_preview`, `cat`, `update_time`) VALUES
(5, 'Сюжет сериала Кости', '<p>Сериал посвящён раскрытию преступлений, которые расследует специальный агент ФБР Сили Бут с помощью команды антропологов из Джефферсоновского института (аллюзия на Смитсоновский институт) под руководством доктора Темперанс Бреннан. Доктор Бреннан и её команда, как правило, получают дела, где от тела убитого остались только кости либо же сгнившие останки. Но давно умершие жертвы не единственное, с чем придется столкнуться Бреннан, Буту и их команде, раскрывая преступления, они часто сталкиваются с взяточничеством, коррупцией и местной разрозненностью. Кроме преступлений, в сериале также раскрываются личные взаимоотношения между основными персонажами, включая роман, а также дальнейшие супружеские отношения между Бутом и Бреннан.</p>\r\n', 6, '2019-06-29 00:33:50', '559433619201.jfif', 'preview-559433619201.jfif', '1', '2019-06-30 02:23:56'),
(7, 'Выходные в Денвере необычно', '<p>1. Горнолыжные курорты в окрестностях Денвера</p>\r\n\r\n<p>Если Вы являетесь поклонником зимних видов спорта, то в холодный сезон года Вы можете посетить один из горнолыжных курортов, расположенных неподалеку от Денвера. Их много. Например, в Keystone 116 трасс, имеющих разный уровень сложности. Здесь Вы покатаетесь на лыжах ночью и займетесь сноубордингом. В Брекенртдже Вы тоже сможете прокатиться по склону на доске. Но самым популярным курортом Колорадо является Aspen. Выбрав его, Вы посетите 4 большие зоны катания, где оборудовано 320 лыжных трасс, а также увидите знаменитых людей, которые предпочитают отдыхать именно на этом курорте.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>2. Подняться на вершину горы Эванс</p>\r\n\r\n<p>В теплое время года в окрестностях Денвера Вы можете заняться хайкингом и покорить гору Эванс, находящуюся в 60 километрах от города и имеющую высоту 4348 метров. На ее вершине оборудована смотровая площадка, с которой открывается великолепный вид. Заплатив 10 долларов, Вы пойдете пешком по асфальтированной дороге, открытой с конца мая по ноябрь, любуясь горным пейзажем. Имейте в виду, что быстро идти или бежать нельзя, так как могут появиться одышка, головокружение либо обморок.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>3. Побывать на фестивале воздушных шаров</p>\r\n\r\n<p>В августе приезжайте в Chatfield State Park, который находится в пригороде Денывера. Здесь Вы посетите фестиваль воздушных шаров. Вы посмотрите, как в небо поднимаются 70 монгольфьеров и проходит автомобильное шествие. Но самое незабываемое впечатление Вы получите, когда станете пассажиром одного из воздушных шаров и с большой высоты увидите Скалистые горы.</p>\r\n', 6, '2019-06-29 17:20:06', '687898408595.jpg', 'preview-687898408595.jpg', '1', '2019-06-30 02:09:43'),
(11, 'Горы Колорадо', '<p>Колорадо - единственный штат США, вся территория которого имеет высоту над уровнем моря свыше одного километра (самая низкая точка штата Колорадо - 1 011 метров над уровнем моря). Самая высокая точка штата Колорадо - гора Элберт (4401 метр, самая высокая вершина&nbsp;Скалистых гор&nbsp;и вторая по высоте в континентальной части США, после горы Уитни в&nbsp;Калифорнии).</p>\r\n\r\n<p>По территории штата Колорадо с севера на юг протянулись многочисленные хребты Скалистых гор. В Колорадо пятьдесят четыре горных вершины, высота которых превышает четырнадцать тысяч футов (4 270 метров), альпинисты США называют их &quot;четырнадцатки&quot; (<em>fourteeners</em>).</p>\r\n\r\n<p>До высоты 3 200 - 3 600 метров над уровнем моря горы покрыты хвойными лесами, выше находятся альпийские луга, а еще выше - заснеженные вершины. Снег на вершинах Скалистых гор, как правило, тает в середине августа, за исключением нескольких ледников.</p>\r\n\r\n<p>По хребтам Скалистых гор проходит&nbsp;Континентальный водораздел, разделяющий бассейны рек Атлантического и Тихого океанов.</p>\r\n\r\n<p>Восточнее Скалистых гор расположена Восточная равнина Колорадо - обширная высокая (более тысячи метров над уровнем моря) равнина, входящая в регион&nbsp;Великих равнин&nbsp;США. Хотя штат Колорадо относится к&nbsp;Западным штатам США, район Восточной равнины часто относят к&nbsp;Среднему западу США.</p>\r\n\r\n<p>Здесь, на равнинах и в восточных предгорьях Скалистых гор, проживает большинство населения штата Колорадо. Здесь же расположены и большинство городов, крупнейший из которых - столица штата Колорадо город&nbsp;Денвер.</p>\r\n', 6, '2019-07-03 22:49:44', '551411560504.jpg', 'preview-551411560504.jpg', '7', '2019-07-03 22:49:44');

-- --------------------------------------------------------

--
-- Структура таблицы `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `html` int(11) UNSIGNED DEFAULT NULL,
  `css` int(11) UNSIGNED DEFAULT NULL,
  `js` int(11) UNSIGNED DEFAULT NULL,
  `jquery` int(11) UNSIGNED DEFAULT NULL,
  `php` int(11) UNSIGNED DEFAULT NULL,
  `mysql` int(11) UNSIGNED DEFAULT NULL,
  `git` int(11) UNSIGNED DEFAULT NULL,
  `gulp` int(11) UNSIGNED DEFAULT NULL,
  `npm` int(11) UNSIGNED DEFAULT NULL,
  `yarn` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `skills`
--

INSERT INTO `skills` (`id`, `html`, `css`, `js`, `jquery`, `php`, `mysql`, `git`, `gulp`, `npm`, `yarn`) VALUES
(1, 65, 50, 50, 50, 25, 50, 50, 50, 80, 50);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recovery_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recovery_code_times` int(11) UNSIGNED DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_small` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `lastname`, `city`, `country`, `recovery_code`, `recovery_code_times`, `avatar`, `avatar_small`) VALUES
(6, 'info@mail.com', '$2y$10$498mG2TOu.VEDHq3Na2beumTgw9E5qOqjFtP8GBz8AObB56R0L2bC', 'admin', 'Раиса', 'Примерова', 'Денвер', 'США', 'hL8nHBJG5Cgd2cN', 0, '636461444199.jpg', '48-636461444199.jpg'),
(7, 'mail@mail.com', '$2y$10$yYkBbezG87kOZAhLEpvdde.yQgMcUQowW2wbiTY88ZZpi9xFJkbZK', 'user', 'Андрей', 'Корягин', 'Майями', 'США', '39VYUS7oZzq8enP', 0, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_comments_post` (`post_id`),
  ADD KEY `index_foreignkey_comments_user` (`user_id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_posts_author` (`author_id`);

--
-- Индексы таблицы `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
