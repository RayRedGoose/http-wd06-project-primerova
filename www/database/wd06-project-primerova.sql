-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 03 2019 г., 21:01
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
  `dscrp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `about`
--

INSERT INTO `about` (`id`, `name`, `dscrp`) VALUES
(1, 'Антон Казаков', 'Web-developer');

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
(1, 'Путешествия'),
(3, 'Развлечения'),
(4, 'Сериалы'),
(6, 'Места');

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
  `cat` int(11) UNSIGNED DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `author_id`, `date_time`, `post_img`, `post_img_preview`, `cat`, `update_time`) VALUES
(5, 'Сюжет сериала Кости', '<p>Сериал посвящён раскрытию преступлений, которые расследует специальный агент ФБР Сили Бут с помощью команды антропологов из Джефферсоновского института (аллюзия на Смитсоновский институт) под руководством доктора Темперанс Бреннан. Доктор Бреннан и её команда, как правило, получают дела, где от тела убитого остались только кости либо же сгнившие останки. Но давно умершие жертвы не единственное, с чем придется столкнуться Бреннан, Буту и их команде, раскрывая преступления, они часто сталкиваются с взяточничеством, коррупцией и местной разрозненностью. Кроме преступлений, в сериале также раскрываются личные взаимоотношения между основными персонажами, включая роман, а также дальнейшие супружеские отношения между Бутом и Бреннан.</p>\r\n', 6, '2019-06-29 00:33:50', '559433619201.jfif', 'preview-559433619201.jfif', 4, '2019-06-30 02:23:56'),
(7, 'Выходные в Денвере необычно', '<p>1. Горнолыжные курорты в окрестностях Денвера</p>\r\n\r\n<p>Если Вы являетесь поклонником зимних видов спорта, то в холодный сезон года Вы можете посетить один из горнолыжных курортов, расположенных неподалеку от Денвера. Их много. Например, в Keystone 116 трасс, имеющих разный уровень сложности. Здесь Вы покатаетесь на лыжах ночью и займетесь сноубордингом. В Брекенртдже Вы тоже сможете прокатиться по склону на доске. Но самым популярным курортом Колорадо является Aspen. Выбрав его, Вы посетите 4 большие зоны катания, где оборудовано 320 лыжных трасс, а также увидите знаменитых людей, которые предпочитают отдыхать именно на этом курорте.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>2. Подняться на вершину горы Эванс</p>\r\n\r\n<p>В теплое время года в окрестностях Денвера Вы можете заняться хайкингом и покорить гору Эванс, находящуюся в 60 километрах от города и имеющую высоту 4348 метров. На ее вершине оборудована смотровая площадка, с которой открывается великолепный вид. Заплатив 10 долларов, Вы пойдете пешком по асфальтированной дороге, открытой с конца мая по ноябрь, любуясь горным пейзажем. Имейте в виду, что быстро идти или бежать нельзя, так как могут появиться одышка, головокружение либо обморок.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>3. Побывать на фестивале воздушных шаров</p>\r\n\r\n<p>В августе приезжайте в Chatfield State Park, который находится в пригороде Денывера. Здесь Вы посетите фестиваль воздушных шаров. Вы посмотрите, как в небо поднимаются 70 монгольфьеров и проходит автомобильное шествие. Но самое незабываемое впечатление Вы получите, когда станете пассажиром одного из воздушных шаров и с большой высоты увидите Скалистые горы.</p>\r\n', 6, '2019-06-29 17:20:06', '687898408595.jpg', 'preview-687898408595.jpg', 3, '2019-06-30 02:09:43');

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
(6, 'info@mail.com', '$2y$10$498mG2TOu.VEDHq3Na2beumTgw9E5qOqjFtP8GBz8AObB56R0L2bC', 'admin', 'Раиса', 'Примерова', 'Денвер', 'США', 'hL8nHBJG5Cgd2cN', 0, '141861051064.jpg', '48-141861051064.jpg'),
(7, 'mail@mail.com', '$2y$10$yYkBbezG87kOZAhLEpvdde.yQgMcUQowW2wbiTY88ZZpi9xFJkbZK', 'user', 'Андрей', 'Корягин', 'Майями', 'США', '39VYUS7oZzq8enP', 0, NULL, NULL),
(13, 'sdfsdfs', '$2y$10$WAdrdvsqwIOruPqWyiuid.XaebNest2rY6wm/0UeeHLJgpXxBg.w6', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'dfgdf', '$2y$10$0q1dIKI2n0W7qhx/vN2AmO3K2CyjUk3FoeVmwQqT9A6k.55in3osG', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'sdhfksj', '$2y$10$P6991WAzOJ8y1h41sFjnTevCqIZzA6BENJr6hhxdyzznL5efKbvxK', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_posts_author` (`author_id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
